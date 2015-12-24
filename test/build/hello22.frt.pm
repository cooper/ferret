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

FF::before_content('hello22.frt');

use Ferret::Core::Operations qw(bool str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    
    # Class 'Cow'
    {
        my ($class, $self, $proto, $scope) = FF::get_class($f, $context, 'Cow', undef);
        # Method event '_init_' definition
        my $method_0 = FF::method_event_def($f, $scope, '_init_', [ { name => 'moos', type => undef, optional => 1, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::want($self, $arguments, 'moos', 6.2, $true);
            return $return;
        });
        # Method event 'moo' definition
        my $method_1 = FF::method_event_def($f, $scope, 'moo', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            if (bool($self->property_u('moos'))) {
                my $scope = Ferret::Scope->new($f, parent => $scope);
            
                return str($f, "moo");
            }
            return str($f, "I am a nonverbal cow");
            return $return;
        });
        $method_0->inside_scope(_init_ => $scope, $class, $class, undef, undef);
        $method_1->inside_scope(moo => $scope, $proto, $class, undef, undef);
    }
    # Class 'Dog'
    {
        my ($class, $self, $proto, $scope) = FF::get_class($f, $context, 'Dog', undef);
        # Method event '_init_' definition
        my $method_0 = FF::method_event_def($f, $scope, '_init_', [ { name => 'barks', type => undef, optional => 1, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::want($self, $arguments, 'barks', 18.2, $false);
            return $return;
        });
        # Method event 'bark' definition
        my $method_1 = FF::method_event_def($f, $scope, 'bark', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            if (bool($self->property_u('barks'))) {
                my $scope = Ferret::Scope->new($f, parent => $scope);
            
                return str($f, "bark");
            }
            return str($f, "I had my bark box bred out of me");
            return $return;
        });
        $method_0->inside_scope(_init_ => $scope, $class, $class, undef, undef);
        $method_1->inside_scope(bark => $scope, $proto, $class, undef, undef);
    }
    # Class 'Cat'
    {
        my ($class, $self, $proto, $scope) = FF::get_class($f, $context, 'Cat', undef);
        # Method event '_init_' definition
        my $method_0 = FF::method_event_def($f, $scope, '_init_', [ { name => 'mean', type => undef, optional => 1, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::want($self, $arguments, 'mean', 30.2, $false);
            return $return;
        });
        # Method event 'meow' definition
        my $method_1 = FF::method_event_def($f, $scope, 'meow', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return str($f, "meow");
            return $return;
        });
        # Method event 'fight' definition
        my $method_2 = FF::method_event_def($f, $scope, 'fight', [ { name => 'cat1', type => 'Cat', optional => undef, more => undef }, { name => 'cat2', type => 'Cat', optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($scope, $arguments, 'cat1', 39.1) or return;
            FF::need($scope, $arguments, 'cat2', 39.3) or return;
            if (bool($scope->property_u('cat1')->property_u('mean'))) {
                my $scope = Ferret::Scope->new($f, parent => $scope);
            
                return str($f, "Cat 1 started a catfight!");
            }
            if (bool($scope->property_u('cat2')->property_u('mean'))) {
                my $scope = Ferret::Scope->new($f, parent => $scope);
            
                return str($f, "Cat 2 started a catfight!");
            }
            return str($f, "nice cats don't fight");
            return $return;
        });
        $method_0->inside_scope(_init_ => $scope, $class, $class, undef, undef);
        $method_1->inside_scope(meow => $scope, $proto, $class, undef, undef);
        $method_2->inside_scope(fight => $scope, $class, $class, undef, undef);
    }
    FF::load_namespaces($context, qw(Cat Cow Dog));
    $scope->set_property_ow($context, animal => $scope->property_u('Cow')->call_u({  }, $scope, undef, 50.4), 50.2);
    $scope->property_u('Dog')->property_u('init')->call_u([ $scope->property_u('animal') ], $scope, undef, 53.3)->call_u({  }, $scope, undef, 53.6);
    $scope->property_u('say')->call_u([ $scope->property_u('animal')->property_u('moo')->call_u({  }, $scope, undef, 56.5) ], $scope, undef, 56.2);
    $scope->property_u('say')->call_u([ $scope->property_u('animal')->property_u('bark')->call_u({  }, $scope, undef, 57.5) ], $scope, undef, 57.2);
    $scope->property_u('Cat')->property_u('init')->call_u([ $scope->property_u('animal') ], $scope, undef, 60.15)->call_u({ mean => $true }, $scope, undef, 60.3);
    $scope->property_u('inspect')->call_u([ $scope->property_u('animal') ], $scope, undef, 62.2);
    $scope->set_property_ow($context, cat => $scope->property_u('Cat')->call_u({  }, $scope, undef, 65.4), 65.2);
    $scope->set_property_ow($context, aftermath => FF::create_set($scope, $scope->property_u('animal'), $scope->property_u('cat'))->property_u('fight')->call_u({  }, $scope, undef, 71.45), 71.1);
    $scope->property_u('say')->call_u([ $scope->property_u('aftermath') ], $scope, undef, 72.2);
};

FF::after_content();