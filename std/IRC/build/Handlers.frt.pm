# === Document Model ===
#  Document './std/IRC/Handlers.frt'
#      Package 'IRC::Handlers'
#      Instruction
#          Shared variable declaration
#              Assignment
#                  Lexical variable '$handlers'
#                  Object [7 items]
#                      Item 0
#                          Pair 'PING'
#                              Bareword 'ping'
#                      Item 1
#                          Pair '001'
#                              Bareword 'welcome'
#                      Item 2
#                          Pair '004'
#                              Bareword 'myInfo'
#                      Item 3
#                          Pair '376'
#                              Bareword 'endOfMOTD'
#                      Item 4
#                          Pair '396'
#                              Bareword 'hiddenHost'
#                      Item 5
#                          Pair '422'
#                              Bareword 'endOfMOTD'
#                      Item 6
#                          Pair '433'
#                              Bareword 'nickInUse'
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
#      Function 'welcome'
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
#                      Instruction
#                          Assignment
#                              Property 'realHost'
#                                  Instance variable '@me'
#                              Lexical variable '$3'
#      Function 'myInfo'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Assignment
#                      Property 'name'
#                          Instance variable '@server'
#                      Index
#                          Property 'params'
#                              Lexical variable '$msg'
#                          Index list [1 items]
#                              Item 0
#                                  Number '1'
#              Instruction
#                  Assignment
#                      Property 'version'
#                          Instance variable '@server'
#                      Index
#                          Property 'params'
#                              Lexical variable '$msg'
#                          Index list [1 items]
#                              Item 0
#                                  Number '2'
#      Function 'endOfMOTD'
#          Body ('function' scope)
#              If
#                  Expression ('if' parameter)
#                      Operation
#                          Negation
#                              Instance variable '@autojoin'
#                          Logical or operator (||)
#                          Instance variable '@_didAutojoin'
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
#              Instruction
#                  Assignment
#                      Instance variable '@_didAutojoin'
#                      Boolean true
#      Function 'hiddenHost'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Assignment
#                      Property 'host'
#                          Instance variable '@me'
#                      Index
#                          Property 'params'
#                              Lexical variable '$msg'
#                          Index list [1 items]
#                              Item 0
#                                  Number '1'
#      Function 'nickInUse'
#          Body ('function' scope)
#              If
#                  Expression ('if' parameter)
#                      Instance variable '@registered'
#                  Body ('if' scope)
#                      Instruction
#                          Return
#              Instruction
#                  Assignment
#                      Property 'nick'
#                          Instance variable '@me'
#                      Operation
#                          Property 'nick'
#                              Instance variable '@me'
#                          Addition operator (+)
#                          String '_'
#              Instruction
#                  Call
#                      Instance variable '@requestNick'
#                      Argument list [1 items]
#                          Item 0
#                              Property 'nick'
#                                  Instance variable '@me'
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

use Ferret::Core::Operations qw(_not _sub add any_true bool num rgx sim str);
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
            FF::need( $scope, $args, 'msg', 14.2 ) or return;
            $$self->{'send'}->(
                [
                    add(
                        $scope,
                        str( $f, "PONG :" ),
                        ${ $$scope->{'msg'} }->{'params'}->get_index_value(
                            [ _sub( $scope, $f->zero, num( $f, "1" ) ) ],
                            $scope, 15.35
                        )
                    )
                ],
                $scope, undef, 15.1
            );
            return $ret;
        }
    );

    # Function event 'welcome' definition
    my $func_1 = FF::function_event_def(
        $f, $context,
        'welcome',
        undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 19.2 ) or return;
            $self->set_property( registered => $true, 20.2 );
            $$self->{'me'}->set_property(
                nick => ${ $$scope->{'msg'} }->{'params'}
                  ->get_index_value( [ num( $f, "0" ) ], $scope, 21.3 ),
                21.15
            );
            if (
                bool(
                    sim(
                        $scope,
                        ${ $$scope->{'msg'} }->{'params'}->get_index_value(
                            [ _sub( $scope, $f->zero, num( $f, "1" ) ) ],
                            $scope, 26.2
                        ),
                        rgx( $f, undef, "^(.+)!(.+)\\\@(.+)\$", undef )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$self->{'me'}->set_property( nick => $$scope->{'1'}, 27.3 );
                $$self->{'me'}->set_property( user => $$scope->{'2'}, 28.3 );
                $$self->{'me'}->set_property( host => $$scope->{'3'}, 29.3 );
                $$self->{'me'}
                  ->set_property( realHost => $$scope->{'3'}, 30.3 );
            }
            return $ret;
        }
    );

    # Function event 'myInfo' definition
    my $func_2 = FF::function_event_def(
        $f, $context, 'myInfo', undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 35.2 ) or return;
            $$self->{'server'}->set_property(
                name => ${ $$scope->{'msg'} }->{'params'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, 36.3 ),
                36.15
            );
            $$self->{'server'}->set_property(
                version => ${ $$scope->{'msg'} }->{'params'}
                  ->get_index_value( [ num( $f, "2" ) ], $scope, 37.3 ),
                37.15
            );
            return $ret;
        }
    );

    # Function event 'endOfMOTD' definition
    my $func_3 = FF::function_event_def(
        $f, $context,
        'endOfMOTD',
        undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            if (
                bool(
                    any_true(
                        $scope,
                        sub { _not( $$self->{'autojoin'} ) },
                        sub { $$self->{'_didAutojoin'} }
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            $$self->{'join'}->(
                { channelNames => $$self->{'autojoin'} },
                $scope, undef, 43.2
            );
            $self->set_property( _didAutojoin => $true, 44.2 );
            return $ret;
        }
    );

    # Function event 'hiddenHost' definition
    my $func_4 = FF::function_event_def(
        $f, $context,
        'hiddenHost',
        undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 49.2 ) or return;
            $$self->{'me'}->set_property(
                host => ${ $$scope->{'msg'} }->{'params'}
                  ->get_index_value( [ num( $f, "1" ) ], $scope, 50.3 ),
                50.15
            );
            return $ret;
        }
    );

    # Function event 'nickInUse' definition
    my $func_5 = FF::function_event_def(
        $f, $context,
        'nickInUse',
        undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            if ( bool( $$self->{'registered'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            $$self->{'me'}->set_property(
                nick =>
                  add( $scope, ${ $$self->{'me'} }->{'nick'}, str( $f, "_" ) ),
                57.3
            );
            $$self->{'requestNick'}
              ->( [ ${ $$self->{'me'} }->{'nick'} ], $scope, undef, 58.2 );
            return $ret;
        }
    );
    $func_0->inside_scope( ping      => $scope, $context, undef, undef, undef );
    $func_1->inside_scope( welcome   => $scope, $context, undef, undef, undef );
    $func_2->inside_scope( myInfo    => $scope, $context, undef, undef, undef );
    $func_3->inside_scope( endOfMOTD => $scope, $context, undef, undef, undef );
    $func_4->inside_scope(
        hiddenHost => $scope,
        $context, undef, undef, undef
    );
    $func_5->inside_scope( nickInUse => $scope, $context, undef, undef, undef );

    FF::lex_assign(
        $context,
        handlers => FF::create_object(
            $f,
            {
                PING  => $$scope->{'ping'},
                '001' => $$scope->{'welcome'},
                '004' => $$scope->{'myInfo'},
                '376' => $$scope->{'endOfMOTD'},
                '396' => $$scope->{'hiddenHost'},
                '422' => $$scope->{'endOfMOTD'},
                '433' => $$scope->{'nickInUse'}
            }
        ),
        undef,
        3.3
    );
};

FF::after_content();
