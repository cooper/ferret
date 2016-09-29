# === Document Model ===
#  Document './std/IRC/Handlers.frt'
#      Package 'IRC::Handlers'
#      Instruction
#          Shared variable declaration
#              Assignment
#                  Lexical variable '$handlers'
#                  Object [4 items]
#                      Item 0
#                          Pair 'PING'
#                              Bareword 'ping'
#                      Item 1
#                          Pair '001'
#                              Bareword 'myInfo'
#                      Item 2
#                          Pair '376'
#                              Bareword 'endOfMOTD'
#                      Item 3
#                          Pair '422'
#                              Bareword 'endOfMOTD'
#      Function 'ping'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Call
#                      Instance variable '@send'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  String 'PONG :'
#                                  Addition operator (+)
#                                  Index
#                                      Property 'params'
#                                          Lexical variable '$msg'
#                                      Index list [1 items]
#                                          Item 0
#                                              Operation
#                                                  Constant zero
#                                                  Negation operator (-)
#                                                  Number '1'
#      Function 'myInfo'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Assignment
#                      Instance variable '@registered'
#                      Boolean true
#              Instruction
#                  Assignment
#                      Property 'nick'
#                          Instance variable '@me'
#                      Index
#                          Property 'params'
#                              Lexical variable '$msg'
#                          Index list [1 items]
#                              Item 0
#                                  Number '0'
#              If
#                  Expression ('if' parameter)
#                      Operation
#                          Index
#                              Property 'params'
#                                  Lexical variable '$msg'
#                              Index list [1 items]
#                                  Item 0
#                                      Operation
#                                          Constant zero
#                                          Negation operator (-)
#                                          Number '1'
#                          Similarity operator (=~)
#                          Regex /^(.+)!(.+).../
#                  Body ('if' scope)
#                      Instruction
#                          Assignment
#                              Property 'nick'
#                                  Instance variable '@me'
#                              Lexical variable '$1'
#                      Instruction
#                          Assignment
#                              Property 'user'
#                                  Instance variable '@me'
#                              Lexical variable '$2'
#                      Instruction
#                          Assignment
#                              Property 'host'
#                                  Instance variable '@me'
#                              Lexical variable '$3'
#      Function 'endOfMOTD'
#          Body ('function' scope)
#              If
#                  Expression ('if' parameter)
#                      Negation
#                          Instance variable '@autojoin'
#                  Body ('if' scope)
#                      Instruction
#                          Return
#              Instruction
#                  Call
#                      Instance variable '@join'
#                      Named argument list [1 items]
#                          Item 0
#                              Pair 'channelNames'
#                                  Instance variable '@autojoin'
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

FF::before_content('Handlers.frt');

use Ferret::Core::Operations qw(_not _sub add bool num rgx sim str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC::Handlers' );
    my $scope = $file_scope;
    FF::load_core('IRC::Handlers');

    # Function event 'ping' definition
    my $func_0 = FF::function_event_def(
        $f, $context, 'ping', undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 11.2 ) or return;
            $$self->{'send'}->(
                [
                    add(
                        $scope,
                        str( $f, "PONG :" ),
                        ${ $$scope->{'msg'} }->{'params'}->get_index_value(
                            [ _sub( $scope, $f->zero, num( $f, "1" ) ) ],
                            $scope, 12.35
                        )
                    )
                ],
                $scope, undef, 12.1
            );
            return $ret;
        }
    );

    # Function event 'myInfo' definition
    my $func_1 = FF::function_event_def(
        $f, $context, 'myInfo', undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 16.2 ) or return;
            $self->set_property( registered => $true, 17.2 );
            $$self->{'me'}->set_property(
                nick => ${ $$scope->{'msg'} }->{'params'}
                  ->get_index_value( [ num( $f, "0" ) ], $scope, 18.3 ),
                18.15
            );
            if (
                bool(
                    sim(
                        $scope,
                        ${ $$scope->{'msg'} }->{'params'}->get_index_value(
                            [ _sub( $scope, $f->zero, num( $f, "1" ) ) ],
                            $scope, 23.2
                        ),
                        rgx( $f, undef, "^(.+)!(.+)\\\@(.+)\$", undef )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$self->{'me'}->set_property( nick => $$scope->{'1'}, 24.3 );
                $$self->{'me'}->set_property( user => $$scope->{'2'}, 25.3 );
                $$self->{'me'}->set_property( host => $$scope->{'3'}, 26.3 );
            }
            return $ret;
        }
    );

    # Function event 'endOfMOTD' definition
    my $func_2 = FF::function_event_def(
        $f, $context,
        'endOfMOTD',
        undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            if ( bool( _not( $$self->{'autojoin'} ) ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            $$self->{'join'}->(
                { channelNames => $$self->{'autojoin'} },
                $scope, undef, 33.2
            );
            return $ret;
        }
    );
    $func_0->inside_scope( ping      => $scope, $context, undef, undef, undef );
    $func_1->inside_scope( myInfo    => $scope, $context, undef, undef, undef );
    $func_2->inside_scope( endOfMOTD => $scope, $context, undef, undef, undef );

    FF::lex_assign(
        $context,
        handlers => FF::create_object(
            $f,
            {
                PING  => $$scope->{'ping'},
                '001' => $$scope->{'myInfo'},
                '376' => $$scope->{'endOfMOTD'},
                '422' => $$scope->{'endOfMOTD'}
            }
        ),
        undef,
        3.3
    );
};

FF::after_content();
