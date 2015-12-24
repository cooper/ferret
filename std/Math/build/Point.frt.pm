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

FF::before_content('Point.frt');

use Ferret::Core::Operations qw(_sub add div num pow str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'Math');
    FF::load_core('Math');

    
    # Class 'Point'
    {
        my ($class, $self, $proto, $scope) = FF::get_class($f, $context, 'Point', undef);
        # Method event '_init_' definition
        my $method_0 = FF::method_event_def($f, $scope, '_init_', [ { name => 'x', type => 'Num', optional => undef, more => undef }, { name => 'y', type => 'Num', optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($self, $arguments, 'x') or return;
            FF::need($self, $arguments, 'y') or return;
            return $return;
        });
        # Method event 'distanceTo' definition
        my $method_1 = FF::method_event_def($f, $scope, 'distanceTo', [ { name => 'pt2', type => 'Point', optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($scope, $arguments, 'pt2', 9.2) or return;
            $scope->set_property_ow($context, dx => _sub($scope, $self->property_u('x'), $scope->property_u('pt2')->property_u('x')), 10.2);
            $scope->set_property_ow($context, dy => _sub($scope, $self->property_u('y'), $scope->property_u('pt2')->property_u('y')), 11.2);
            return $scope->property_u('sqrt')->call_u([ add($scope, pow($scope, $scope->property_u('dx'), num($f, 2)), pow($scope, $scope->property_u('dy'), num($f, 2))) ], $scope, undef, 12.15);
            return $return;
        });
        # Method event 'distanceFromOrigin' definition
        my $method_2 = FF::method_event_def($f, $scope, 'distanceFromOrigin', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return $self->property_u('distanceTo')->call_u([ $scope->{special}->property_u('class')->call_u([ num($f, 0), num($f, 0) ], $scope, undef, 16.25) ], $scope, undef, 16.15);
            return $return;
        });
        # Method event 'pretty' definition
        my $method_3 = FF::method_event_def($f, $scope, 'pretty', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return add($scope, str($f, "("), $self->property_u('x'), str($f, ", "), $self->property_u('y'), str($f, ")"));
            return $return;
        });
        # Method event 'toString' definition
        my $method_4 = FF::method_event_def($f, $scope, 'toString', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return $self->property_u('pretty');
            return $return;
        });
        # Method event 'description' definition
        my $method_5 = FF::method_event_def($f, $scope, 'description', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return add($scope, str($f, "Point"), $self->property_u('pretty'));
            return $return;
        });
        # Method event 'midpoint' definition
        my $method_6 = FF::method_event_def($f, $scope, 'midpoint', [ { name => 'pt1', type => 'Point', optional => undef, more => undef }, { name => 'pt2', type => 'Point', optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($scope, $arguments, 'pt1', 32.1) or return;
            FF::need($scope, $arguments, 'pt2', 32.3) or return;
            return $scope->{special}->property_u('class')->call_u({ x => div($scope, add($scope, $scope->property_u('pt1')->property_u('x'), $scope->property_u('pt2')->property_u('x')), num($f, 2)), y => div($scope, add($scope, $scope->property_u('pt1')->property_u('y'), $scope->property_u('pt2')->property_u('y')), num($f, 2)) }, $scope, undef, 33.3);
            return $return;
        });
        # Method event 'distanceBetween' definition
        my $method_7 = FF::method_event_def($f, $scope, 'distanceBetween', [ { name => 'pt1', type => 'Point', optional => undef, more => undef }, { name => 'pt2', type => 'Point', optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($scope, $arguments, 'pt1', 40.1) or return;
            FF::need($scope, $arguments, 'pt2', 40.3) or return;
            return $scope->property_u('pt1')->property_u('distanceTo')->call_u([ $scope->property_u('pt2') ], $scope, undef, 41.4);
            return $return;
        });
        $method_0->inside_scope(_init_ => $scope, $class, $class, undef, undef);
        $method_1->inside_scope(distanceTo => $scope, $proto, $class, undef, undef);
        $method_2->inside_scope(distanceFromOrigin => $scope, $proto, $class, 1, undef);
        $method_3->inside_scope(pretty => $scope, $proto, $class, 1, undef);
        $method_4->inside_scope(toString => $scope, $proto, $class, undef, undef);
        $method_5->inside_scope(description => $scope, $proto, $class, undef, undef);
        $method_6->inside_scope(midpoint => $scope, $class, $class, undef, undef);
        $method_7->inside_scope(distanceBetween => $scope, $class, $class, undef, undef);
    }
    FF::load_namespaces($context, qw(Num Point));
};

FF::after_content();