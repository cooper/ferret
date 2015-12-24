use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: ".($@ || $!);
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ($true, $false, $undefined) = FF::get_constant_objects($f);

FF::before_content('Bot1.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def($f, $scope, undef, [  ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        $self->property_u('send')->call_u([ add($scope, str($f, "USER "), $self->property_u('user'), str($f, " "), str($f, "*"), str($f, " "), str($f, "*"), str($f, " :"), $self->property_u('real')) ], $scope, undef, 12.2);
        $self->property_u('send')->call_u([ add($scope, str($f, "NICK "), $self->property_u('nick')) ], $scope, undef, 13.2);
        return $return;
    });
    # Anonymous function definition
    my $func_1 = FF::function_def($f, $scope, undef, [ { name => 'data', type => undef, optional => undef, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        FF::need($scope, $arguments, 'data', 18.2) or return;
        $scope->property_u('say')->call_u([ add($scope, str($f, "recv: "), $scope->property_u('data')) ], $scope, undef, 19.2);
        return $return;
    });
    # Class 'Bot1'
    {
        my ($class, $self, $proto, $scope) = FF::get_class($f, $context, 'Bot1', undef);
        # Method event '_init_' definition
        my $method_0 = FF::method_event_def($f, $scope, '_init_', [ { name => 'addr', type => 'Str', optional => undef, more => undef }, { name => 'nick', type => 'Str', optional => undef, more => undef }, { name => 'user', type => 'Str', optional => undef, more => undef }, { name => 'port', type => 'Num', optional => 1, more => undef }, { name => 'real', type => 'Str', optional => 1, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($self, $arguments, 'addr') or return;
            FF::need($self, $arguments, 'nick') or return;
            FF::need($self, $arguments, 'user') or return;
            FF::want($self, $arguments, 'port', 5.1, num($f, 6667));
            FF::want($self, $arguments, 'real', 5.4, str($f, "Ferret IRC"));
            $self->set_property(sock => $scope->property_u('Socket::TCP')->call_u({ address => $self->property_u('addr'), port => $self->property_u('port'), readMode => FF::get_symbol($f, 'line') }, $scope, undef, 8.3), 8.1);
            FF::on($self->property_u('sock'), 'connected', $self, $scope, $func_0->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
            FF::on($self->property_u('sock'), 'gotLine', $self, $scope, $func_1->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
            return $return;
        });
        # Method event 'connect' definition
        my $method_1 = FF::method_event_def($f, $scope, 'connect', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            $self->property_u('sock')->property_u('connect')->call_u({  }, $scope, undef, 25.3);
            return $return;
        });
        # Method event 'send' definition
        my $method_2 = FF::method_event_def($f, $scope, 'send', [ { name => 'line', type => undef, optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($scope, $arguments, 'line', 29.2) or return;
            $scope->property_u('say')->call_u([ add($scope, str($f, "send: "), $scope->property_u('line')) ], $scope, undef, 30.2);
            $self->property_u('sock')->property_u('println')->call_u([ $scope->property_u('line') ], $scope, undef, 31.3);
            return $return;
        });
        $method_0->inside_scope(_init_ => $scope, $class, $class, undef, undef);
        $method_1->inside_scope(connect => $scope, $proto, $class, undef, undef);
        $method_2->inside_scope(send => $scope, $proto, $class, undef, undef);
    }
    FF::load_namespaces($context, qw(Num Socket Socket::TCP Str));
};

FF::after_content();