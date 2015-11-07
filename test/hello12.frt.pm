# === Document Model ===
#  Document './test/hello12.frt'
#      Instruction
#          Assignment (lexical variable '$sock')
#              Call
#                  Bareword 'Socket::TCP'
#                  Hash [2 items]
#                      Item 0
#                          Pair 'address'
#                              String 'k.notroll.net'
#                      Item 1
#                          Pair 'port'
#                              Number '6667'
#      Instruction
#          Call
#              Bareword 'inspect'
#              Single value [1 items]
#                  Item 0
#                      Lexical variable '$sock'
#      On
#          Expression ('on' parameter)
#              Property 'gotLine'
#                  Lexical variable '$sock'
#          Anonymous function
#              Instruction
#                  Need
#                      Lexical variable '$data'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Single value [1 items]
#                          Item 0
#                              Operation
#                                  String 'recv: '
#                                  Addition operator (+)
#                                  Lexical variable '$data'
#      On
#          Expression ('on' parameter)
#              Property 'println'
#                  Lexical variable '$sock'
#          Anonymous function
#              Instruction
#                  Need
#                      Lexical variable '$data'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Single value [1 items]
#                          Item 0
#                              Operation
#                                  String 'send: '
#                                  Addition operator (+)
#                                  Lexical variable '$data'
#      On
#          Expression ('on' parameter)
#              Property 'connected'
#                  Lexical variable '$sock'
#          Anonymous function
#              Instruction
#                  Call
#                      Property 'println'
#                          Lexical variable '$sock'
#                      Single value [1 items]
#                          Item 0
#                              String 'NICK k'
#              Instruction
#                  Call
#                      Property 'println'
#                          Lexical variable '$sock'
#                      Single value [1 items]
#                          Item 0
#                              Operation
#                                  String 'USER k '
#                                  Addition operator (+)
#                                  String '*'
#                                  Addition operator (+)
#                                  String ' '
#                                  Addition operator (+)
#                                  String '*'
#                                  Addition operator (+)
#                                  String ' :k'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$sock'
#              Structural list [0 items]
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Call
#                              Bareword 'Timer'
#                              Single value [1 items]
#                                  Item 0
#                                      Number '5'
#          Anonymous function
#              Instruction
#                  Call
#                      Property 'println'
#                          Lexical variable '$sock'
#                      Single value [1 items]
#                          Item 0
#                              String 'JOIN #k'
#      Include (Socket, Socket::TCP, Timer)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('hello12.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my @funcs;
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, anonymous => 1 );
        $func->add_argument( name => 'data', type => '', more => undef );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'data' ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "recv: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Anonymous function definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, anonymous => 1 );
        $func->add_argument( name => 'data', type => '', more => undef );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'data' ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "send: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Anonymous function definition
    {
        my $func = $funcs[2] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('sock')->property_u('println')
              ->call_u( [ str( $f, "NICK k" ) ], $scope );
            $scope->property_u('sock')->property_u('println')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "USER k " ),
                        str( $f, "*" ),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " :k" )
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Anonymous function definition
    {
        my $func = $funcs[3] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('sock')->property_u('println')
              ->call_u( [ str( $f, "JOIN #k" ) ], $scope );
            return $return;
        };
    }
    FF::load_namespaces( $context, qw(Socket Socket::TCP Timer) );
    $scope->set_property_ow(
        $context,
        sock => $scope->property_u('Socket::TCP')->call_u(
            { address => str( $f, "k.notroll.net" ), port => num( $f, 6667 ) },
            $scope
        )
    );
    $scope->property_u('inspect')
      ->call_u( [ $scope->property_u('sock') ], $scope );
    FF::on( $scope->property_u('sock'), 'gotLine', $self, $scope,
        $funcs[0]
          ->inside_scope( (undef) => $scope, $scope, undef, undef, undef ) );
    FF::on( $scope->property_u('sock'), 'println', $self, $scope,
        $funcs[1]
          ->inside_scope( (undef) => $scope, $scope, undef, undef, undef ) );
    FF::on( $scope->property_u('sock'), 'connected', $self, $scope,
        $funcs[2]
          ->inside_scope( (undef) => $scope, $scope, undef, undef, undef ) );
    $scope->property_u('sock')->property_u('connect')->call_u( {}, $scope );
    FF::on(
        $scope->property_u('Timer')->call_u( [ num( $f, 5 ) ], $scope )
          ->property_u('once')->call_u( {}, $scope ),
        'expire',
        $self,
        $scope,
        $funcs[3]
          ->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
};

FF::after_content();
