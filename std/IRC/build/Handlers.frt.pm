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
#                          Pair
#                              String '001'
#                              Bareword 'welcome'
#                      Item 2
#                          Pair
#                              String '004'
#                              Bareword 'myInfo'
#                      Item 3
#                          Pair
#                              String '376'
#                              Bareword 'endOfMOTD'
#                      Item 4
#                          Pair
#                              String '396'
#                              Bareword 'hiddenHost'
#                      Item 5
#                          Pair
#                              String '422'
#                              Bareword 'endOfMOTD'
#                      Item 6
#                          Pair
#                              String '433'
#                              Bareword 'nickInUse'
#      Function 'ping' { $msg }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Call
#                      This variable '%send'
#                      Argument list [1 item]
#                          Item 0
#                              Operation
#                                  String 'PONG :'
#                                  Addition operator (+)
#                                  Index
#                                      Property 'params'
#                                          Lexical variable '$msg'
#                                      Index list [1 item]
#                                          Item 0
#                                              Operation
#                                                  Constant zero
#                                                  Negation operator (-)
#                                                  Number '1'
#      Function 'welcome' { $msg }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Assignment
#                      This variable '%registered'
#                      Boolean true
#              Instruction
#                  Assignment
#                      Property 'nick'
#                          This variable '%me'
#                      Index
#                          Property 'params'
#                              Lexical variable '$msg'
#                          Index list [1 item]
#                              Item 0
#                                  Number '0'
#              If
#                  Expression ('if' parameter)
#                      Operation
#                          Index
#                              Property 'params'
#                                  Lexical variable '$msg'
#                              Index list [1 item]
#                                  Item 0
#                                      Operation
#                                          Constant zero
#                                          Negation operator (-)
#                                          Number '1'
#                          Similarity operator (=~)
#                          Regex /^(.+)!(.+).../
#                  If body
#                      Instruction
#                          Assignment
#                              Property 'nick'
#                                  This variable '%me'
#                              Lexical variable '$1'
#                      Instruction
#                          Assignment
#                              Property 'user'
#                                  This variable '%me'
#                              Lexical variable '$2'
#                      Instruction
#                          Assignment
#                              Property 'host'
#                                  This variable '%me'
#                              Lexical variable '$3'
#                      Instruction
#                          Assignment
#                              Property 'realHost'
#                                  This variable '%me'
#                              Lexical variable '$3'
#      Function 'myInfo' { $msg }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Assignment
#                      Property 'name'
#                          This variable '%server'
#                      Index
#                          Property 'params'
#                              Lexical variable '$msg'
#                          Index list [1 item]
#                              Item 0
#                                  Number '1'
#              Instruction
#                  Assignment
#                      Property 'version'
#                          This variable '%server'
#                      Index
#                          Property 'params'
#                              Lexical variable '$msg'
#                          Index list [1 item]
#                              Item 0
#                                  Number '2'
#      Function 'endOfMOTD' { -> $result }
#          Function body
#              If
#                  Expression ('if' parameter)
#                      Operation
#                          Negation
#                              This variable '%autojoin'
#                          Logical or operator (||)
#                          This variable '%_didAutojoin'
#                  If body
#                      Instruction
#                          Return
#              Instruction
#                  Call
#                      This variable '%sendJoin'
#                      Named argument list [1 item]
#                          Item 0
#                              Pair 'channelNames'
#                                  This variable '%autojoin'
#              Instruction
#                  Assignment
#                      This variable '%_didAutojoin'
#                      Boolean true
#      Function 'hiddenHost' { $msg }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Assignment
#                      Property 'host'
#                          This variable '%me'
#                      Index
#                          Property 'params'
#                              Lexical variable '$msg'
#                          Index list [1 item]
#                              Item 0
#                                  Number '1'
#      Function 'nickInUse' { -> $result }
#          Function body
#              If
#                  Expression ('if' parameter)
#                      This variable '%registered'
#                  If body
#                      Instruction
#                          Return
#              Instruction
#                  Addition assignment
#                      Property 'nick'
#                          This variable '%me'
#                      String '_'
#              Instruction
#                  Call
#                      This variable '%sendNick'
#                      Argument list [1 item]
#                          Item 0
#                              Property 'nick'
#                                  This variable '%me'
package FF;

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

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $pos = before_content( 'Handlers.frt', './std/IRC/Handlers.frt' );

use Ferret::Core::Operations qw(_not _sub add any_true bool num rgx sim str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRC::Handlers' );
    my $scope = $file_scope;
    load_core('IRC::Handlers');

    # Function event 'ping' definition
    my $func_0 = function_event_def(
        $f, $context, 'ping', undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 14.2 ) || return $ret_func->();
            $$this->{'send'}->(
                [
                    add(
                        $scope,
                        $pos->(15.2),
                        str( $f, "PONG :" ),
                        $$scope->{'msg'}->property_u( 'params', $pos->(15.3) )
                          ->get_index_value(
                            [
                                _sub(
                                    $scope, $pos->(15.4),
                                    $f->zero, num( $f, "1" )
                                )
                            ],
                            $scope,
                            $pos->(15.35)
                          )
                    )
                ],
                $scope, undef,
                $pos->(15.1)
            );
            return $ret;
        }
    );

    # Function event 'welcome' definition
    my $func_1 = function_event_def(
        $f, $context,
        'welcome',
        undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 19.2 ) || return $ret_func->();
            $this->set_property( registered => $true, $pos->(20.2) );
            $$this->{'me'}->set_property(
                nick => $$scope->{'msg'}->property_u( 'params', $pos->(21.25) )
                  ->get_index_value( [ num( $f, "0" ) ], $scope, $pos->(21.3) ),
                $pos->(21.15)
            );
            if (
                bool(
                    sim(
                        $scope,
                        $pos->(26.4),
                        $$scope->{'msg'}->property_u( 'params', $pos->(26.15) )
                          ->get_index_value(
                            [
                                _sub(
                                    $scope, $pos->(26.25),
                                    $f->zero, num( $f, "1" )
                                )
                            ],
                            $scope,
                            $pos->(26.2)
                          ),
                        rgx( $f, undef, "^(.+)!(.+)\\\@(.+)\$", undef )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$this->{'me'}
                  ->set_property( nick => $$scope->{'1'}, $pos->(27.3) );
                $$this->{'me'}
                  ->set_property( user => $$scope->{'2'}, $pos->(28.3) );
                $$this->{'me'}
                  ->set_property( host => $$scope->{'3'}, $pos->(29.3) );
                $$this->{'me'}
                  ->set_property( realHost => $$scope->{'3'}, $pos->(30.3) );
            }
            return $ret;
        }
    );

    # Function event 'myInfo' definition
    my $func_2 = function_event_def(
        $f, $context, 'myInfo', undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 35.2 ) || return $ret_func->();
            $$this->{'server'}->set_property(
                name => $$scope->{'msg'}->property_u( 'params', $pos->(36.25) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(36.3) ),
                $pos->(36.15)
            );
            $$this->{'server'}->set_property(
                version =>
                  $$scope->{'msg'}->property_u( 'params', $pos->(37.25) )
                  ->get_index_value( [ num( $f, "2" ) ], $scope, $pos->(37.3) ),
                $pos->(37.15)
            );
            return $ret;
        }
    );

    # Function event 'endOfMOTD' definition
    my $func_3 = function_event_def(
        $f, $context,
        'endOfMOTD',
        undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            if (
                bool(
                    any_true(
                        $scope,
                        $pos->(41.4),
                        sub { _not( $$this->{'autojoin'} ) },
                        sub { $$this->{'_didAutojoin'} }
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            $$this->{'sendJoin'}->(
                [ undef, [ channelNames => $$this->{'autojoin'} ] ],
                $scope, undef, $pos->(43.2)
            );
            $this->set_property( _didAutojoin => $true, $pos->(44.2) );
            return $ret;
        }
    );

    # Function event 'hiddenHost' definition
    my $func_4 = function_event_def(
        $f, $context,
        'hiddenHost',
        undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'msg', 49.2 ) || return $ret_func->();
            $$this->{'me'}->set_property(
                host => $$scope->{'msg'}->property_u( 'params', $pos->(50.25) )
                  ->get_index_value( [ num( $f, "1" ) ], $scope, $pos->(50.3) ),
                $pos->(50.15)
            );
            return $ret;
        }
    );

    # Function event 'nickInUse' definition
    my $func_5 = function_event_def(
        $f, $context,
        'nickInUse',
        undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            if ( bool( $$this->{'registered'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            $$this->{'me'}->set_property(
                nick => add(
                    $scope, $pos->(57.3),
                    $$this->{'me'}->property_u( 'nick', $pos->(57.2) ),
                    str( $f, "_" )
                ),
                $pos->(57.3)
            );
            $$this->{'sendNick'}->(
                [ $$this->{'me'}->property_u( 'nick', $pos->(58.4) ) ],
                $scope, undef, $pos->(58.2)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        ping => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_1->inside_scope(
        welcome => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_2->inside_scope(
        myInfo => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_3->inside_scope(
        endOfMOTD => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_4->inside_scope(
        hiddenHost => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_5->inside_scope(
        nickInUse => $scope,
        $context, undef, $ins, undef, undef
    );

    var(
        $context,
        handlers => create_object(
            $f,
            [
                PING => $$scope->{'ping'},
                str( $f, "001" ) => $$scope->{'welcome'},
                str( $f, "004" ) => $$scope->{'myInfo'},
                str( $f, "376" ) => $$scope->{'endOfMOTD'},
                str( $f, "396" ) => $$scope->{'hiddenHost'},
                str( $f, "422" ) => $$scope->{'endOfMOTD'},
                str( $f, "433" ) => $$scope->{'nickInUse'}
            ]
        ),
        undef,
        $pos->(3.3)
    );
};

after_content();
