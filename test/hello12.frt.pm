# --- DOM ---
#  Document './test/hello12.frt'
#      Instruction
#          Assignment
#              Lexical variable '$sock'
#              Call
#                  Bareword 'Socket::TCP'
#                  Hash [2 items]
#                      Item 0
#                          Pair 'address'
#                              String 'k.notroll.net'
#                      Item 1
#                          Pair 'port'
#                              Number '6667'
#      On
#          Expression ('on' parameter)
#              Property 'gotLine'
#                  Lexical variable '$sock'
#          Function 'callback'
#              Instruction
#                  Need
#                      Lexical variable '$data'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              Mathematical operation
#                                  String 'got data: '
#                                  Addition operator (+)
#                                  Lexical variable '$data'
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
#                              Structural list [1 items]
#                                  Item 0
#                                      Number '5'
#          Function 'callback'
#              Instruction
#                  Call
#                      Property 'println'
#                          Lexical variable '$sock'
#                      Structural list [1 items]
#                          Item 0
#                              String 'NICK k'
#              Instruction
#                  Call
#                      Property 'println'
#                          Lexical variable '$sock'
#                      Structural list [1 items]
#                          Item 0
#                              Mathematical operation
#                                  String 'USER k '
#                                  Addition operator (+)
#                                  Addition operator (+)
#                                  String ' '
#                                  Addition operator (+)
#                                  Addition operator (+)
#                                  String ' :k'
#      Include (Socket, Socket::TCP, Timer)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    my $libs = do '/etc/ferret.conf';
    ref $libs eq 'ARRAY' or die "config error";
    unshift @INC, @$libs;
}

use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello12.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    # Function '+undef' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => '+undef' );
        $func->add_argument( name => 'data' );
        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            do {
                return if not defined $arguments->{data};
                $scope->set_property( data => $arguments->{data} );
            };
            $scope->property('say')->call(
                [
                    add(
                        $scope, str( $f, "got data: " ),
                        $scope->property('data')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Function '+undef' definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, name => '+undef' );

        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            $scope->property('sock')->property('println')
              ->call( [ str( $f, "NICK k" ) ], $scope );
            $scope->property('sock')->property('println')
              ->call( [ add( $scope, str( $f, "USER k " ), ) ], $scope );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(Socket Socket::TCP Timer);
    $scope->set_property(
        sock => $scope->property('Socket::TCP')->call(
            { address => str( $f, "k.notroll.net" ), port => num( $f, 6667 ) },
            $scope
        )
    );

    # On
    {
        my $on_func =
          do { $funcs[0]->inside_scope( +undef => $scope, $scope ); };

        $scope->property('sock')->property('gotLine')->add_function($on_func);
    }
    $scope->property('sock')->property('connect')->call( [], $scope );

    # On
    {
        my $on_func =
          do { $funcs[1]->inside_scope( +undef => $scope, $scope ); };

        $scope->property('Timer')->call( [ num( $f, 5 ) ], $scope )
          ->property('once')->call( [], $scope )->property('expire')
          ->add_function($on_func);
    }
}

Ferret::runtime();
