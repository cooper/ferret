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

FF::before_content('Line.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'Math');
    FF::load_core('Math');

    
    # Class 'Line'
    {
        my ($class, $self, $proto, $scope) = FF::get_class($f, $context, 'Line', undef);
        # Method event '_init_' definition
        my $method_0 = FF::method_event_def($f, $scope, '_init_', [ { name => 'pt1', type => 'Point', optional => undef, more => undef }, { name => 'pt2', type => 'Point', optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($self, $arguments, 'pt1') or return;
            FF::need($self, $arguments, 'pt2') or return;
            return $return;
        });
        # Method event 'endpoints' definition
        my $method_1 = FF::method_event_def($f, $scope, 'endpoints', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return FF::create_list($f, [ $self->property_u('pt1'), $self->property_u('pt2') ]);
            return $return;
        });
        # Method event 'pretty' definition
        my $method_2 = FF::method_event_def($f, $scope, 'pretty', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            $scope->set_property_ow($context, mp => $self->property_u('midpoint'), 13.2);
            $scope->set_property_ow($context, pox => $self->property_u('pt1')->property_u('x'), 14.1);
            $scope->set_property_ow($context, poy => $self->property_u('pt1')->property_u('y'), 14.35);
            $scope->set_property_ow($context, ptx => $self->property_u('pt2')->property_u('x'), 15.1);
            $scope->set_property_ow($context, pty => $self->property_u('pt2')->property_u('y'), 15.35);
            $scope->set_property_ow($context, mx => $scope->property_u('mp')->property_u('x'), 16.1);
            $scope->set_property_ow($context, my => $scope->property_u('mp')->property_u('y'), 16.35);
            return add($scope, str($f, "Segment( |("), $scope->property_u('pox'), str($f, ", "), $scope->property_u('poy'), str($f, ")---("), $scope->property_u('mx'), str($f, ", "), $scope->property_u('my'), str($f, ")---("), $scope->property_u('ptx'), str($f, ", "), $scope->property_u('pty'), str($f, ")| Length = "), $self->property_u('length'), str($f, " )"));
            return $return;
        });
        # Method event 'description' definition
        my $method_3 = FF::method_event_def($f, $scope, 'description', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return $self->property_u('pretty');
            return $return;
        });
        # Method event 'midpoint' definition
        my $method_4 = FF::method_event_def($f, $scope, 'midpoint', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return FF::create_set($scope, $self->property_u('pt1'), $self->property_u('pt2'))->property_u('midpoint')->call_u({  }, $scope, undef, 25.4);
            return $return;
        });
        # Method event 'length' definition
        my $method_5 = FF::method_event_def($f, $scope, 'length', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return $self->property_u('pt1')->property_u('distanceTo')->call_u([ $self->property_u('pt2') ], $scope, undef, 29.4);
            return $return;
        });
        $method_0->inside_scope(_init_ => $scope, $class, $class, undef, undef);
        $method_1->inside_scope(endpoints => $scope, $proto, $class, 1, undef);
        $method_2->inside_scope(pretty => $scope, $proto, $class, 1, undef);
        $method_3->inside_scope(description => $scope, $proto, $class, undef, undef);
        $method_4->inside_scope(midpoint => $scope, $proto, $class, 1, undef);
        $method_5->inside_scope(length => $scope, $proto, $class, 1, undef);
    }
    FF::load_namespaces($context, qw(Point));
};

FF::after_content();