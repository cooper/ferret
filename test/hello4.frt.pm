# === Document Model ===
#  Document './test/hello4.frt'
#      Function 'makePoint'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$x'
#              Instruction
#                  Need
#                      Lexical variable '$y'
#              Instruction
#                  Want
#                      Lexical variable '$z'
#              Instruction
#                  Assignment (lexical variable '$point')
#                      Object [2 items]
#                          Item 0
#                              Pair 'x'
#                                  Lexical variable '$x'
#                          Item 1
#                              Pair 'y'
#                                  Lexical variable '$y'
#              Instruction
#                  Return pair 'point'
#                      Lexical variable '$point'
#      Instruction
#          Assignment (lexical variable '$pt')
#              Property 'point'
#                  Call
#                      Bareword 'makePoint'
#                      Argument list [2 items]
#                          Item 0
#                              Number '5'
#                          Item 1
#                              Number '3'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Point('
#                          Addition operator (+)
#                          Property 'x'
#                              Lexical variable '$pt'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Property 'y'
#                              Lexical variable '$pt'
#                          Addition operator (+)
#                          String ')'
#      Instruction
#          Assignment (lexical variable '$numbers')
#              Value list [5 items]
#                  Item 0
#                      Number '1'
#                  Item 1
#                      Number '2'
#                  Item 2
#                      Number '3'
#                  Item 3
#                      Number '4'
#                  Item 4
#                      Operation
#                          Number '4'
#                          Addition operator (+)
#                          Number '1'
#      Instruction
#          Assignment (lexical variable '$emptyArray')
#              Value list [0 items]
#      Instruction
#          Assignment (lexical variable '$emptyHash')
#              Hash [0 items]
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

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

FF::before_content('hello4.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'makePoint' callback definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'makePoint',
        [
            { name => 'x', type => undef, optional => undef, more => undef },
            { name => 'y', type => undef, optional => undef, more => undef },
            { name => 'z', type => undef, optional => 1,     more => undef }
        ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'x' ) or return;
            FF::need( $scope, $arguments, 'y' ) or return;
            $scope->set_property( z => $arguments->{z}, 12.0909090909091 );
            $scope->set_property_ow(
                $context,
                point => FF::create_object(
                    $f,
                    {
                        x => $scope->property_u('x'),
                        y => $scope->property_u('y')
                    }
                ),
                17.1428571428571
            );
            $return->set_property(
                point => $scope->property_u('point'),
                31.2727272727273
            );
            return $return;
        }
    );
    $func_0->inside_scope( makePoint => $scope, $scope, undef, undef, undef );
    $scope->set_property_ow(
        $context,
        pt => $scope->property_u('makePoint')
          ->call_u( [ num( $f, 5 ), num( $f, 3 ) ],
            $scope, undef, 41.3636363636364 )->property_u('point'),
        39.3376623376623
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Point(" ),
                $scope->property_u('pt')->property_u('x'),
                str( $f, ", " ),
                $scope->property_u('pt')->property_u('y'),
                str( $f, ")" )
            )
        ],
        $scope, undef,
        50.4675324675325
    );
    $scope->set_property_ow(
        $context,
        numbers => FF::create_list(
            $f,
            [
                num( $f, 1 ),
                num( $f, 2 ),
                num( $f, 3 ),
                num( $f, 4 ),
                add( $scope, num( $f, 4 ), num( $f, 1 ) )
            ]
        ),
        67.6623376623377
    );
    $scope->set_property_ow(
        $context,
        emptyArray => FF::create_list( $f, [] ),
        85.8701298701299
    );
    $scope->set_property_ow(
        $context,
        emptyHash => FF::create_hash( $f, {} ),
        91.9350649350649
    );
};

FF::after_content();
