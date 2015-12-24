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

FF::before_content('Rect.frt');

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'Math');
    FF::load_core('Math');

    
    # Class 'Rect'
    {
        my ($class, $self, $proto, $scope) = FF::get_class($f, $context, 'Rect', undef);
        # Method event '_init_' definition
        my $method_0 = FF::method_event_def($f, $scope, '_init_', [ { name => 'x', type => 'Num', optional => undef, more => undef }, { name => 'y', type => 'Num', optional => undef, more => undef }, { name => 'width', type => 'Num', optional => undef, more => undef }, { name => 'height', type => 'Num', optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($scope, $arguments, 'x', 5.1) or return;
            FF::need($scope, $arguments, 'y', 5.3) or return;
            FF::need($self, $arguments, 'width') or return;
            FF::need($self, $arguments, 'height') or return;
            $self->set_property(origin => $scope->property_u('Point')->call_u([ $scope->property_u('x'), $scope->property_u('y') ], $scope, undef, 6.2), 6.1);
            return $return;
        });
        # Method event 'vertices' definition
        my $method_1 = FF::method_event_def($f, $scope, 'vertices', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return FF::create_list($f, [ $self->property_u('topLeft'), $self->property_u('topRight'), $self->property_u('bottomLeft'), $self->property_u('bottomRight') ]);
            return $return;
        });
        # Method event 'bottomLeft' definition
        my $method_2 = FF::method_event_def($f, $scope, 'bottomLeft', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return $self->property_u('origin');
            return $return;
        });
        # Method event 'bottomRight' definition
        my $method_3 = FF::method_event_def($f, $scope, 'bottomRight', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return $scope->property_u('Point')->call_u([ add($scope, $self->property_u('origin')->property_u('x'), $self->property_u('width')), $self->property_u('origin')->property_u('y') ], $scope, undef, 23.15);
            return $return;
        });
        # Method event 'topLeft' definition
        my $method_4 = FF::method_event_def($f, $scope, 'topLeft', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return $scope->property_u('Point')->call_u([ $self->property_u('origin')->property_u('x'), add($scope, $self->property_u('origin')->property_u('y'), $self->property_u('height')) ], $scope, undef, 27.15);
            return $return;
        });
        # Method event 'topRight' definition
        my $method_5 = FF::method_event_def($f, $scope, 'topRight', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return $scope->property_u('Point')->call_u([ add($scope, $self->property_u('origin')->property_u('x'), $self->property_u('width')), add($scope, $self->property_u('origin')->property_u('y'), $self->property_u('height')) ], $scope, undef, 31.15);
            return $return;
        });
        # Method event 'bottomLine' definition
        my $method_6 = FF::method_event_def($f, $scope, 'bottomLine', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return $scope->property_u('Line')->call_u([ $self->property_u('bottomLeft'), $self->property_u('bottomRight') ], $scope, undef, 35.3);
            return $return;
        });
        # Method event 'topLine' definition
        my $method_7 = FF::method_event_def($f, $scope, 'topLine', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return $scope->property_u('Line')->call_u([ $self->property_u('topLeft'), $self->property_u('topRight') ], $scope, undef, 39.3);
            return $return;
        });
        # Method event 'center' definition
        my $method_8 = FF::method_event_def($f, $scope, 'center', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            $scope->set_property_ow($context, x => add($scope, $self->property_u('origin')->property_u('x'), mul($scope, $self->property_u('width'), num($f, 0.5))), 43.1);
            $scope->set_property_ow($context, y => add($scope, $self->property_u('origin')->property_u('y'), mul($scope, $self->property_u('height'), num($f, 0.5))), 44.1);
            return $scope->property_u('Point')->call_u([ $scope->property_u('x'), $scope->property_u('y') ], $scope, undef, 45.3);
            return $return;
        });
        # Method event 'description' definition
        my $method_9 = FF::method_event_def($f, $scope, 'description', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            $scope->set_property_ow($context, o => $self->property_u('origin'), 49.2);
            $scope->set_property_ow($context, c => $self->property_u('center'), 50.2);
            return add($scope, str($f, "Rect( Origin("), $scope->property_u('o')->property_u('x'), str($f, ", "), $scope->property_u('o')->property_u('y'), str($f, ") Center("), $scope->property_u('c')->property_u('x'), str($f, ", "), $scope->property_u('c')->property_u('y'), str($f, ") Width = "), $self->property_u('width'), str($f, " Height = "), $self->property_u('height'), str($f, " )"));
            return $return;
        });
        $method_0->inside_scope(_init_ => $scope, $class, $class, undef, undef);
        $method_1->inside_scope(vertices => $scope, $proto, $class, 1, undef);
        $method_2->inside_scope(bottomLeft => $scope, $proto, $class, 1, undef);
        $method_3->inside_scope(bottomRight => $scope, $proto, $class, 1, undef);
        $method_4->inside_scope(topLeft => $scope, $proto, $class, 1, undef);
        $method_5->inside_scope(topRight => $scope, $proto, $class, 1, undef);
        $method_6->inside_scope(bottomLine => $scope, $proto, $class, 1, undef);
        $method_7->inside_scope(topLine => $scope, $proto, $class, 1, undef);
        $method_8->inside_scope(center => $scope, $proto, $class, 1, undef);
        $method_9->inside_scope(description => $scope, $proto, $class, undef, undef);
    }
    FF::load_namespaces($context, qw(Line Num Point));
};

FF::after_content();