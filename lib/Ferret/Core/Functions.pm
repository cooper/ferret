# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Functions;

use warnings;
use strict;
use utf8;
use 5.010;

use Scalar::Util qw(blessed);

use Ferret::Core::Conversion qw(
    pstring         fstring
    pbool           fbool
    pnumber         fnumber
    pdescription    ferror
    FUNC_ARGS       FUNC_RET
    FUNC_CSCOPE     flist
);

our %functions = (
    findCycle => {
        need => '$obj',
        code => \&_find_cycle
    },
    say => {
        need => '$message',
        code => \&_say
    },
    dump => {
        need => '$value',
        code => \&_dump
    },
    inspect => {
        need => '$value',
        want => '$detailed:Bool $ownOnly:Bool $compute:Bool $quiet:Bool',
        code => \&_inspect
    },
    require => {
        need => '$test',
        code => \&_require
    },
    delay => {
        need => '$timeout:Num $callback',
        code => \&_delay
    },
    timeout => {
        need => '$timeout:Num $callback',
        code => \&_timeout
    },
    fetchObject => {
        need => '$address:Num',
        code => \&_fetchObject
    },
    activeObjectCount => {
        want => '$perlType $classType',
        code => \&_activeObjectCount
    },
    _exit => {
        want => '$status:Num',
        code => \&_exit
    },
);

sub _say {
    my ($self, $args, $call_scope, $scope, $ret) = @_;
    say $args->pstring('message');
    return $ret;
}

sub _dump {
    my ($self, $args, $call_scope, $scope, $ret) = @_;
    my $obj = $args->{value};
    Ferret::dump($obj);
    return $ret;
}

sub _inspect {
    my ($self, $args, $call_scope, $scope, $ret) = @_;
    my $obj = $args->{value};

    # options
    my %opts;
    $opts{no_method}++  if $args->pbool('detailed');
    $opts{own_only}++   if $args->pbool('ownOnly');
    $opts{compute}++    if $args->pbool('compute');

    # call Object's description
    my $str = $obj->Ferret::Object::description(%opts);

    # print the results
    say $str unless $args->pbool('quiet');

    $ret->set_property(string => fstring($str));
    return $ret;
}

sub _require {
    my (undef, $args) = @_;
    return Ferret::true if $args->pbool('test');
    die '_require'; # FIXME: throw
}

sub _delay {
    my (undef, $args, $call_scope, $scope, $ret) = @_;
    my ($num, $func) = @$args{'timeout', 'callback'};

    # load Timer and create a timer.
    my $timer_class = $ret->f->get_class('Timer');
    my $timer = $timer_class->call({ delay => $num });

    # attach the callback.
    # the undef is $self, so it will fallback to $_self.
    FF::on($timer, 'expire', undef, $call_scope, $func);

    # start the timer.
    $timer->call_prop(once => undef, $call_scope);

    $ret->set_property(timer => $timer);
    return $ret;
}

sub _timeout {
    my ($args, $ret, $call_scope) = @_[FUNC_ARGS, FUNC_RET, FUNC_CSCOPE];
    my $result;
    eval {
        # catch timeouts
        local $SIG{ALRM} = sub { die "alarm\n" };

        # call the function
        alarm $args->pnumber('timeout');
        $result = $args->{callback}->call(undef, $call_scope);
        alarm 0;
    };
    if ($@) {
        $ret->throw(ferror('Operation timed out', 'TimeoutError'))
            if $@ eq "alarm\n";
        die $@;
    }
    return $result;
}

sub _fetchObject {
    my (undef, $args, $call_scope) = @_;
    my $f = $call_scope->f;
    my $addr = $args->pnumber('address');
    return $f->{objects}{$addr} || Ferret::undefined;
}

sub _activeObjectCount {
    my ($args, $call_scope, $ret) = @_[FUNC_ARGS, FUNC_CSCOPE, FUNC_RET];
    my $f = $call_scope->f;
    my @objects;
    if (my $str = $args->pstring('perlType')) {
        @objects = grep $_->isa($str), values %{ $f->{objects} };
    }
    elsif (my $class = $args->{classType}) {
        return fnumber(0) if !$class->isa('Ferret::Class');
        @objects = grep $_->instance_of($class), values %{ $f->{objects} };
    }
    else {
        @objects = values %{ $f->{objects} };
    }

    # my $d = {};
    # for my $obj (values %{ $f->{objects} }) {
    #     next if !blessed $obj;
    #     Ferret::inspect($obj) if ($obj->parent_names)[0] eq 'Scope';
    #     $d->{$_}++ for ($obj->parent_names)[0];
    # }
    #
    # use Data::Dumper;
    # print Data::Dumper::Dumper([
    #     map { [ $_ => $d->{$_} ] }
    #     sort { $d->{$b} <=> $d->{$a} } keys %$d
    # ]), "\n";
    my %classes;
    $classes{ blessed $_ }++ for @objects;
    my @sorted = sort { $classes{$b} <=> $classes{$a} } keys %classes;
    $ret->set_property(classes => flist(map { "$_ ($classes{$_})" } @sorted));

    return fnumber(scalar @objects);
}

# this is temporary, until *process.exit() exists
sub _exit {
    my (undef, $args) = @_;
    my $status = $args->pnumber('status', 0);
    exit $status;
}

sub _find_cycle {
    my (undef, $args) = @_;
    my $obj = $args->{obj};
    require Devel::Cycle;
    Devel::Cycle::find_cycle($obj);
}

1
