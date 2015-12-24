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

FF::before_content('Bot.frt');

use Ferret::Core::Operations qw(_not add bool num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'IRC');
    FF::load_core('IRC');

    # Anonymous function definition
    my $func_0 = FF::function_def($f, $scope, 'sendRegistration', [  ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        $self->property_u('send')->call_u([ add($scope, str($f, "USER "), $self->property_u('user'), str($f, " "), str($f, "*"), str($f, " "), str($f, "*"), str($f, " :"), $self->property_u('real')) ], $scope, undef, 30.2);
        $self->property_u('send')->call_u([ add($scope, str($f, "NICK "), $self->property_u('nick')) ], $scope, undef, 31.2);
        return $return;
    });
    # Anonymous function definition
    my $func_1 = FF::function_def($f, $scope, 'handleLine', [ { name => 'data', type => undef, optional => undef, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        FF::need($scope, $arguments, 'data', 36.2) or return;
        $self->property_u('handleLine')->call_u([ $scope->property_u('data') ], $scope, undef, 37.2);
        return $return;
    });
    # Function event '_joinChannels' definition
    my $func_2 = FF::function_event_def($f, $scope, '_joinChannels', [  ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        if (bool($self->property_u('_joinedChannels'))) {
            my $scope = Ferret::Scope->new($f, parent => $scope);
        
            return $return;
        }
        $self->set_property(_joinedChannels => $true, 96.2);
        if (bool($self->property_u('autojoin'))) {
            my $scope = Ferret::Scope->new($f, parent => $scope);
        
            FF::iterate($f, $scope, $self->property_u('autojoin'), 'chan', sub {
                my $scope = shift;
                $self->property_u('send')->call_u([ add($scope, str($f, "JOIN "), $scope->property_u('chan')) ], $scope, undef, 100.2);
            });
        }
        return $return;
    });
    # Function event '_pong' definition
    my $func_3 = FF::function_event_def($f, $scope, '_pong', [ { name => 's', type => undef, optional => undef, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        FF::need($scope, $arguments, 's', 108.2) or return;
        $self->property_u('send')->call_u([ add($scope, str($f, "PONG "), $scope->property_u('s')->get_index_value([ num($f, 1) ], $scope)) ], $scope, undef, 109.1);
        return $return;
    });
    # Function event '_handleMessage' definition
    my $func_4 = FF::function_event_def($f, $scope, '_handleMessage', [ { name => 'line', type => undef, optional => undef, more => undef }, { name => 's', type => undef, optional => undef, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        FF::need($scope, $arguments, 'line', 113.2) or return;
        FF::need($scope, $arguments, 's', 113.4) or return;
        $scope->set_property_ow($context, msg => $scope->property_u('IRC::Message')->call_u([ $scope->property_u('line') ], $scope, undef, 116.3), 116.1);
        $return->set_property(msg => $scope->property_u('msg'), 117.2);
        if (bool($scope->property_u('msg')->property_u('command'))) {
            my $scope = Ferret::Scope->new($f, parent => $scope);
        
            {
                my $maybe_0 = $self->property_u('commands')->get_index_value([ $scope->property_u('msg')->property_u('command') ], $scope);
                if (bool($maybe_0)) {
                    $maybe_0->call_u({ _self => $scope->{special}->property_u('self'), line => $scope->property_u('line'), s => $scope->property_u('s'), msg => $scope->property_u('msg') }, $scope, undef, 120.55);
                }
            }
        }
        return $return;
    });
    # Function event '_commandHello' definition
    my $func_5 = FF::function_event_def($f, $scope, '_commandHello', [ { name => 'msg', type => undef, optional => undef, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        FF::need($scope, $arguments, 'msg', 130.2) or return;
        $scope->set_property_ow($context, nickname => $scope->property_u('msg')->property_u('nickname'), 131.2);
        $self->property_u('privmsg')->call_u([ $scope->property_u('msg')->property_u('channel'), add($scope, str($f, "Hi "), $scope->property_u('nickname'), str($f, "!")) ], $scope, undef, 132.2);
        return $return;
    });
    # Function event '_commandAdd' definition
    my $func_6 = FF::function_event_def($f, $scope, '_commandAdd', [ { name => 'msg', type => undef, optional => undef, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        FF::need($scope, $arguments, 'msg', 136.2) or return;
        $scope->property_u('inspect')->call_u([ $scope->property_u('msg') ], $scope, undef, 137.2);
        $scope->set_property_ow($context, trigger => $scope->property_u('msg')->property_u('parts')->get_index_value([ num($f, 1) ], $scope), 140.2);
        $scope->set_property_ow($context, response => $scope->property_u('msg')->property_u('fromWord')->call_u([ num($f, 2) ], $scope, undef, 141.5), 141.2);
        $self->property_u('factoids')->set_index_value([ $scope->property_u('trigger') ], $scope->property_u('response'), $scope);
        $self->property_u('commands')->set_index_value([ $scope->property_u('trigger') ], $scope->property_u('_commandFactoid'), $scope);
        $self->property_u('privmsg')->call_u([ $scope->property_u('msg')->property_u('channel'), add($scope, str($f, "alright, associating ."), $scope->property_u('trigger'), str($f, " with '"), $scope->property_u('response'), str($f, "'")) ], $scope, undef, 147.2);
        return $return;
    });
    # Function event '_commandFactoid' definition
    my $func_7 = FF::function_event_def($f, $scope, '_commandFactoid', [ { name => 'msg', type => undef, optional => undef, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        FF::need($scope, $arguments, 'msg', 151.2) or return;
        $scope->set_property_ow($context, response => $self->property_u('factoids')->get_index_value([ $scope->property_u('msg')->property_u('command') ], $scope), 152.2);
        $self->property_u('privmsg')->call_u([ $scope->property_u('msg')->property_u('channel'), $scope->property_u('response') ], $scope, undef, 153.2);
        return $return;
    });
    # Class 'Bot'
    {
        my ($class, $self, $proto, $scope) = FF::get_class($f, $context, 'Bot', undef);
        # Method event '_init_' definition
        my $method_0 = FF::method_event_def($f, $scope, '_init_', [ { name => 'addr', type => 'Str', optional => undef, more => undef }, { name => 'nick', type => 'Str', optional => undef, more => undef }, { name => 'port', type => 'Num', optional => 1, more => undef }, { name => 'user', type => 'Str', optional => 1, more => undef }, { name => 'real', type => 'Str', optional => 1, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($self, $arguments, 'addr') or return;
            FF::need($self, $arguments, 'nick') or return;
            FF::want($self, $arguments, 'port', 18.2, num($f, 6667));
            FF::want($self, $arguments, 'user', 19.2, str($f, "ferret"));
            FF::want($self, $arguments, 'real', 20.2, str($f, "Ferret IRC"));
            $self->set_property(commands => $scope->property_u('initialCommands'), 22.2);
            $self->set_property(factoids => FF::create_hash($f, {  }), 23.2);
            $self->set_property(sock => $scope->property_u('Socket::TCP')->call_u({ address => $self->property_u('addr'), port => $self->property_u('port'), readMode => FF::get_symbol($f, 'line') }, $scope, undef, 26.3), 26.1);
            FF::on($self->property_u('sock'), 'connected', $self, $scope, $func_0->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
            FF::on($self->property_u('sock'), 'gotLine', $self, $scope, $func_1->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
            return $return;
        });
        # Method event 'addCommand' definition
        my $method_1 = FF::method_event_def($f, $scope, 'addCommand', [ { name => 'command', type => 'Str', optional => undef, more => undef }, { name => 'callback', type => undef, optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($scope, $arguments, 'command', 43.2) or return;
            FF::need($scope, $arguments, 'callback', 43.6) or return;
            if (bool($self->property_u('commands')->get_index_value([ $scope->property_u('command') ], $scope))) {
                my $scope = Ferret::Scope->new($f, parent => $scope);
            
                $return->set_property(overwrote => $true, 45.2);
            }
            $self->property_u('commands')->set_index_value([ $scope->property_u('command') ], $scope->property_u('callback'), $scope);
            $return->set_property(added => $true, 47.2);
            return $return;
        });
        # Method event 'connect' definition
        my $method_2 = FF::method_event_def($f, $scope, 'connect', [  ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            $self->property_u('sock')->property_u('connect')->call_u({  }, $scope, undef, 51.3);
            return $return;
        });
        # Method event 'send' definition
        my $method_3 = FF::method_event_def($f, $scope, 'send', [ { name => 'line', type => undef, optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($scope, $arguments, 'line', 55.2) or return;
            $scope->property_u('say')->call_u([ add($scope, str($f, "send: "), $scope->property_u('line')) ], $scope, undef, 56.2);
            $self->property_u('sock')->property_u('println')->call_u([ $scope->property_u('line') ], $scope, undef, 57.3);
            return $return;
        });
        # Method event 'handleLine' definition
        my $method_4 = FF::method_event_def($f, $scope, 'handleLine', [ { name => 'line', type => undef, optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($scope, $arguments, 'line', 61.2) or return;
            $scope->set_property_ow($context, s => $scope->property_u('line')->property_u('split')->call_u([ str($f, " ") ], $scope, undef, 64.5), 64.2);
            $scope->set_property_ow($context, command => $scope->property_u('s')->get_index_value([ num($f, 1) ], $scope), 65.2);
            if (bool($scope->property_u('s')->get_index_value([ num($f, 0) ], $scope)->equal_to(str($f, "PING"), $scope))) {
                my $scope = Ferret::Scope->new($f, parent => $scope);
            
                $scope->set_property_ow($context, command => $scope->property_u('s')->get_index_value([ num($f, 0) ], $scope), 69.2);
            }
            $scope->property_u('say')->call_u([ add($scope, str($f, "recv["), $scope->property_u('command'), str($f, "]: "), $scope->property_u('line')) ], $scope, undef, 71.2);
            {
                my $maybe_0 = $scope->property_u('handlers')->get_index_value([ $scope->property_u('command') ], $scope);
                if (bool($maybe_0)) {
                    $maybe_0->call_u({ _self => $scope->{special}->property_u('self'), line => $scope->property_u('line'), command => $scope->property_u('command'), s => $scope->property_u('s') }, $scope, undef, 74.6);
                }
            }
            return $return;
        });
        # Method event 'privmsg' definition
        my $method_5 = FF::method_event_def($f, $scope, 'privmsg', [ { name => 'channel', type => 'Str', optional => undef, more => undef }, { name => 'message', type => 'Str', optional => undef, more => undef } ], sub {
            my ($self, $arguments, $call_scope, $scope, $return) = @_;
            FF::need($scope, $arguments, 'channel', 84.1) or return;
            FF::need($scope, $arguments, 'message', 84.3) or return;
            FF::iterate($f, $scope, $scope->property_u('message')->property_u('split')->call_u([ str($f, "\n") ], $scope, undef, 85.3), 'line', sub {
                my $scope = shift;
                if (bool(_not($scope->property_u('line')->property_u('length')->equal_to(num($f, 0), $scope)))) {
                    my $scope = Ferret::Scope->new($f, parent => $scope);
                
                    $self->property_u('send')->call_u([ add($scope, str($f, "PRIVMSG "), $scope->property_u('channel'), str($f, " :"), $scope->property_u('line')) ], $scope, undef, 87.2);
                }
            });
            return $return;
        });
        $method_0->inside_scope(_init_ => $scope, $class, $class, undef, undef);
        $method_1->inside_scope(addCommand => $scope, $proto, $class, undef, undef);
        $method_2->inside_scope(connect => $scope, $proto, $class, undef, undef);
        $method_3->inside_scope(send => $scope, $proto, $class, undef, undef);
        $method_4->inside_scope(handleLine => $scope, $proto, $class, undef, undef);
        $method_5->inside_scope(privmsg => $scope, $proto, $class, undef, undef);
        $func_2->inside_scope(_joinChannels => $scope, $scope, undef, undef, undef);
        $func_3->inside_scope(_pong => $scope, $scope, undef, undef, undef);
        $func_4->inside_scope(_handleMessage => $scope, $scope, undef, undef, undef);
        $func_5->inside_scope(_commandHello => $scope, $scope, undef, undef, undef);
        $func_6->inside_scope(_commandAdd => $scope, $scope, undef, undef, undef);
        $func_7->inside_scope(_commandFactoid => $scope, $scope, undef, undef, undef);
        $class->set_property_ow($context, handlers => FF::create_hash($f, { MODE => $scope->property_u('_joinChannels'), PING => $scope->property_u('_pong'), PRIVMSG => $scope->property_u('_handleMessage') }), 4.2);
        $class->set_property_ow($context, initialCommands => FF::create_hash($f, { hello => $scope->property_u('_commandHello'), hi => $scope->property_u('_commandHello'), add => $scope->property_u('_commandAdd') }), 10.2);
    }
    FF::load_namespaces($context, qw(IRC IRC::Message Num Socket Socket::TCP Str));
};

FF::after_content();