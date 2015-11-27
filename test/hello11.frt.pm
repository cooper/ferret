# === Document Model ===
#  Document './test/hello11.frt'
#      Instruction
#          Assignment (lexical variable '$point')
#              Call
#                  Bareword 'Math::Point'
#                  Argument list [2 items]
#                      Item 0
#                          Number '0'
#                      Item 1
#                          Number '0'
#      If
#          Expression ('if' parameter)
#              Lexical variable '$point'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 items]
#                      Item 0
#                          String 'The point ...'
#          Instruction
#              Call
#                  Bareword 'inspect'
#                  Argument list [1 items]
#                      Item 0
#                          Lexical variable '$point'
#      Inside
#          Expression ('inside' parameter)
#              Lexical variable '$point'
#          Instruction
#              Assignment (lexical variable '$x')
#                  Number '5'
#          Instruction
#              Assignment (lexical variable '$y')
#                  Number '10'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Point: '
#                          Addition operator (+)
#                          Lexical variable '$point'
#      On
#          Expression ('on' parameter)
#              Bareword 'say'
#          Anonymous function
#              Instruction
#                  Need
#                      Lexical variable '$twice'
#              Instruction
#                  Need
#                      Lexical variable '$message'
#              If
#                  Expression ('if' parameter)
#                      Lexical variable '$twice'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      Lexical variable '$message'
#                                      Addition operator (+)
#                                      String ' again'
#              Instruction
#                  Return pair 'didTwice'
#                      Lexical variable '$twice'
#      Instruction
#          Assignment (lexical variable '$r')
#              Call
#                  Bareword 'say'
#                  Named argument list [2 items]
#                      Item 0
#                          Pair 'message'
#                              String 'It was said'
#                      Item 1
#                          Pair 'twice'
#                              Boolean true
#      If
#          Expression ('if' parameter)
#              Property 'didTwice'
#                  Lexical variable '$r'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 items]
#                      Item 0
#                          String 'Did the fi...'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [2 items]
#                  Item 0
#                      String 'this shoul...'
#                  Item 1
#                      Boolean true
#      Include (Math, Math::Point)
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

FF::before_content('hello11.frt');

use Ferret::Core::Operations qw(add bool num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
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
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'twice' )   or return;
            FF::need( $scope, $arguments, 'message' ) or return;
            if ( bool( $scope->property_u('twice') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope,
                            $scope->property_u('message'),
                            str( $f, " again" )
                        )
                    ],
                    $scope, undef, 18
                );
            }
            $return->set_property( didTwice => $scope->property_u('twice') );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Math Math::Point) );
    $scope->set_property_ow( $context,
        point => $scope->property_u('Math::Point')
          ->call_u( [ num( $f, 0 ), num( $f, 0 ) ], $scope, undef, 1 ) );
    if ( bool( $scope->property_u('point') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property_u('say')
          ->call_u( [ str( $f, "The point exists!" ) ], $scope, undef, 4 );
        $scope->property_u('inspect')
          ->call_u( [ $scope->property_u('point') ], $scope, undef, 5 );
    }

    # Inside
    FF::inside(
        $f, $scope,
        $scope->property_u('point'),
        sub {
            my $scope = shift;
            $scope->set_property_ow( $context, x => num( $f, 5 ) );
            $scope->set_property_ow( $context, y => num( $f, 10 ) );
        }
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Point: " ), $scope->property_u('point') ) ],
        $scope, undef, 13 );
    FF::on( $scope, 'say', $self, $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    $scope->set_property_ow(
        $context,
        r => $scope->property_u('say')->call_u(
            { message => str( $f, "It was said" ), twice => Ferret::true },
            $scope, undef, 22
        )
    );
    if ( bool( $scope->property_u('r')->property_u('didTwice') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property_u('say')
          ->call_u( [ str( $f, "Did the first one twice!" ) ],
            $scope, undef, 25 );
    }
    $scope->property_u('say')->call_u(
        [ str( $f, "this should ignore the second parameter" ), Ferret::true ],
        $scope, undef, 27
    );
};

FF::after_content();
