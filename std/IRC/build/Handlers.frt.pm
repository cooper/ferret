# === Document Model ===
#  Document './std/IRC/Handlers.frt'
#      Package 'IRC::Handlers'
#      Instruction
#          Shared variable declaration
#              Assignment
#                  Lexical variable '$handlers'
#                  Object [3 items]
#                      Item 0
#                          Pair 'PING'
#                              Bareword 'ping'
#                      Item 1
#                          Pair '376'
#                              Bareword 'endOfMOTD'
#                      Item 2
#                          Pair '422'
#                              Bareword 'endOfMOTD'
#      Function 'ping'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#                      Argument type
#                          Bareword 'Massage'
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
#      Include (Massage)
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

use Ferret::Core::Operations qw(_not _sub add bool num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC::Handlers' );
    my $scope = $file_scope;
    FF::load_core('IRC::Handlers');

    # Function event 'ping' definition
    my $func_0 = FF::function_event_def(
        $f, $context, 'ping', undef,
        [
            {
                name     => 'msg',
                type     => 'Massage',
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 10.2 ) or return;
            $$self->{'send'}->(
                [
                    add(
                        $scope,
                        str( $f, "PONG :" ),
                        ${ $$scope->{'msg'} }->{'params'}->get_index_value(
                            [ _sub( $scope, $f->zero, num( $f, "1" ) ) ],
                            $scope, 11.35
                        )
                    )
                ],
                $scope, undef, 11.1
            );
            return $ret;
        }
    );

    # Function event 'endOfMOTD' definition
    my $func_1 = FF::function_event_def(
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
                $scope, undef, 17.2
            );
            return $ret;
        }
    );
    $func_0->inside_scope( ping      => $scope, $context, undef, undef, undef );
    $func_1->inside_scope( endOfMOTD => $scope, $context, undef, undef, undef );
    FF::load_namespaces( $context, qw(Massage) );

    FF::lex_assign(
        $context,
        handlers => FF::create_object(
            $f,
            {
                PING => $$scope->{'ping'},
                376  => $$scope->{'endOfMOTD'},
                422  => $$scope->{'endOfMOTD'}
            }
        ),
        undef,
        3.3
    );
};

FF::after_content();
