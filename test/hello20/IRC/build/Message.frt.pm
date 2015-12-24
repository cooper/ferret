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

FF::before_content('Message.frt');

use Ferret::Core::Operations qw(_not add bool num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'IRC');
    FF::load_core('IRC');

    
    # Class 'Message'
    {
        my ($class, $self, $proto, $scope) = FF::get_class($f, $context, 'Message', undef);
        # Method event '_init_' definition
        my $method_0 = FF::method_event_def($f, $scope, '_init_', [ { name => 'line', type => 'Str', optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($self, $arguments, 'line') or return;
            $scope->set_property_ow($context, lineSplit => $self->property_u('line')->property_u('split')->call_u({ separator => str($f, " "), limit => num($f, 4) }, $scope, undef, 6.25), 6.1);
            $self->set_property(channel => $scope->property_u('lineSplit')->get_index_value([ num($f, 2) ], $scope), 7.2);
            $self->set_property(nickname => $scope->property_u('lineSplit')->get_index_value([ num($f, 0) ], $scope)->property_u('split')->call_u({ separator => str($f, "!"), limit => num($f, 2) }, $scope, undef, 10.4)->get_index_value([ num($f, 0) ], $scope), 10.1);
            $self->set_property(nickname => $self->property_u('nickname')->property_u('trimPrefix')->call_u([ str($f, ":") ], $scope, undef, 11.5), 11.2);
            $self->set_property(message => $scope->property_u('lineSplit')->get_index_value([ num($f, 3) ], $scope), 14.2);
            $self->set_property(message => $self->property_u('message')->property_u('trimPrefix')->call_u([ str($f, ":") ], $scope, undef, 15.5), 15.2);
            $self->set_property(parts => $self->property_u('message')->property_u('split')->call_u([ str($f, " ") ], $scope, undef, 18.5), 18.2);
            return $return;
        });
        # Method event 'command' definition
        my $method_1 = FF::method_event_def($f, $scope, 'command', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            if (bool($self->property_u('parts')->get_index_value([ num($f, 0) ], $scope)->property_u('hasPrefix')->call_u([ str($f, ".") ], $scope, undef, 26.35))) {
                my $scope = Ferret::Scope->new($f, parent => $scope);
            
                $scope->set_property_ow($context, cmd => $self->property_u('parts')->get_index_value([ num($f, 0) ], $scope)->property_u('trimPrefix')->call_u([ str($f, ".") ], $scope, undef, 27.4), 27.1);
                if (bool($scope->property_u('cmd')->property_u('length'))) {
                    my $scope = Ferret::Scope->new($f, parent => $scope);
                
                    return $scope->property_u('cmd');
                }
            }
            return $false;
            return $return;
        });
        # Method event 'commandHasParameters' definition
        my $method_2 = FF::method_event_def($f, $scope, 'commandHasParameters', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            return _not($self->property_u('parts')->property_u('length')->equal_to(num($f, 1), $scope));
            return $return;
        });
        # Method event 'fromWord' definition
        my $method_3 = FF::method_event_def($f, $scope, 'fromWord', [ { name => 'wordN', type => 'Num', optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($scope, $arguments, 'wordN', 41.2) or return;
            return $self->property_u('message')->property_u('split')->call_u({ separator => str($f, " "), limit => add($scope, $scope->property_u('wordN'), num($f, 1)) }, $scope, undef, 42.2)->get_index_value([ $scope->property_u('wordN') ], $scope);
            return $return;
        });
        $method_0->inside_scope(_init_ => $scope, $class, $class, undef, undef);
        $method_1->inside_scope(command => $scope, $proto, $class, 1, 1);
        $method_2->inside_scope(commandHasParameters => $scope, $proto, $class, 1, 1);
        $method_3->inside_scope(fromWord => $scope, $proto, $class, undef, undef);
    }
    FF::load_namespaces($context, qw(Num Str));
};

FF::after_content();