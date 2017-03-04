# === Document Model ===
#  File './test/11-external-inside-on.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$point'
#                  Call
#                      Bareword 'Math::Point'
#                      Argument list [2 items]
#                          Item 0
#                              Number '0'
#                          Item 1
#                              Number '0'
#          If
#              Expression ('if' parameter)
#                  Lexical variable '$point'
#              If body
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 item]
#                              Item 0
#                                  String 'The point ...'
#                  Instruction
#                      Call
#                          Bareword 'inspect'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$point'
#          Inside
#              Expression ('inside' parameter)
#                  Lexical variable '$point'
#              Inside body
#                  Instruction
#                      Assignment
#                          Lexical variable '$x'
#                          Number '5'
#                  Instruction
#                      Assignment
#                          Lexical variable '$y'
#                          Number '10'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          Operation
#                              String 'Point: '
#                              Addition operator (+)
#                              Lexical variable '$point'
#          On
#              Expression ('on' parameter)
#                  Bareword 'say'
#              Anonymous function { $twice $message -> $didTwice }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$twice'
#                      Instruction
#                          Need
#                              Lexical variable '$message'
#                      If
#                          Expression ('if' parameter)
#                              Lexical variable '$twice'
#                          If body
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Operation
#                                                  Lexical variable '$message'
#                                                  Addition operator (+)
#                                                  String ' again'
#                      Instruction
#                          Return pair 'didTwice'
#                              Lexical variable '$twice'
#          Instruction
#              Assignment
#                  Lexical variable '$r'
#                  Call
#                      Bareword 'say'
#                      Mixed argument list [2 items]
#                          Item 0
#                              String 'It was said'
#                          Item 1
#                              Pair 'twice'
#                                  Boolean true
#          If
#              Expression ('if' parameter)
#                  Property 'didTwice'
#                      Lexical variable '$r'
#              If body
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 item]
#                              Item 0
#                                  String 'Did the fi...'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [2 items]
#                      Item 0
#                          String 'this shoul...'
#                      Item 1
#                          Boolean true
#          Include (Math::Point)
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
use Ferret::Core::Operations qw(add bool num str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) = before_content( '11-external-inside-on.frt',
    './test/11-external-inside-on.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main', 1.05 );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition
    my $func_0 = function_def(
        $f, undef, undef,
        [
            {
                name     => 'twice',
                type     => undef,
                optional => undef,
                more     => undef
            },
            {
                name     => 'message',
                type     => undef,
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'twice',   16.2 ) || return $ret_func->();
            need( $scope, $args, 'message', 16.4 ) || return $ret_func->();
            if ( bool( $$scope->{'twice'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'say'}->(
                    [
                        add(
                            $scope, $pos->(18.4),
                            $$scope->{'message'}, str( $f, " again" )
                        )
                    ],
                    $scope, undef,
                    $pos->(18.2)
                );
            }
            $ret->set_property( didTwice => $$scope->{'twice'}, $pos->(19.2) );
            return $ret;
        }
    );
    provides_namespaces( $context, $file_name, $pos->(28.7), qw() );
    load_namespaces( $context, $file_name, $pos->(28.7), qw(Math::Point) );
    var(
        $scope,
        point => $$scope->{'Math::Point'}
          ->( [ num( $f, "0" ), num( $f, "0" ) ], $scope, undef, $pos->(1.3) ),
        undef, $pos->(1.1)
    );
    if ( bool( $$scope->{'point'} ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $$scope->{'say'}
          ->( [ str( $f, "The point exists!" ) ], $scope, undef, $pos->(4.2) );
        $$scope->{'inspect'}
          ->( [ $$scope->{'point'} ], $scope, undef, $pos->(5.2) );
    }

    # Inside
    {
        my ( $inside_status, $inside_return ) = inside(
            $f, $scope,
            $$scope->{'point'},
            sub {
                my ( $scope, $ins, $ret_func ) = @_;
                var( $scope, x => num( $f, "5" ),  $file_scope, $pos->(9.2) );
                var( $scope, y => num( $f, "10" ), $file_scope, $pos->(10.2) );
            }
        );
        return $ret_func->($inside_return) if $inside_status eq 'return';
    }
    $$scope->{'say'}->(
        [
            add(
                $scope, $pos->(13.4),
                str( $f, "Point: " ), $$scope->{'point'}
            )
        ],
        $scope, undef,
        $pos->(13.2)
    );
    on(
        $scope, 'say', $self, $scope,
        $func_0->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    var(
        $scope,
        r => $$scope->{'say'}->(
            [ str( $f, "It was said" ), [ twice => $true ] ], $scope,
            undef, $pos->(23.2)
        ),
        undef,
        $pos->(23.1)
    );
    if ( bool( $$scope->{'r'}->property_u( 'didTwice', $pos->(25.3) ) ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $$scope->{'say'}->(
            [ str( $f, "Did the first one twice!" ) ],
            $scope, undef, $pos->(26.2)
        );
    }
    $$scope->{'say'}->(
        [ str( $f, "this should ignore the second parameter" ), $true ],
        $scope, undef, $pos->(28.2)
    );
};

after_content($file_name);
