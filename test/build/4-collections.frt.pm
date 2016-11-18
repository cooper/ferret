# === Document Model ===
#  Document './test/4-collections.frt'
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
#                  Assignment
#                      Lexical variable '$point'
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
#          Assignment
#              Lexical variable '$pt'
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
#              Argument list [1 item]
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
#          Assignment
#              Lexical variable '$numbers'
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
#          Assignment
#              Lexical variable '$emptyArray'
#              Value list [0 items]
#      Instruction
#          Assignment
#              Lexical variable '$emptyHash'
#              Hash [0 items]
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

my $pos = before_content( '4-collections.frt', './test/4-collections.frt' );

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Function event 'makePoint' definition
    my $func_0 = function_event_def(
        $f, $context,
        'makePoint',
        undef,
        [
            { name => 'x', type => undef, optional => undef, more => undef },
            { name => 'y', type => undef, optional => undef, more => undef },
            { name => 'z', type => undef, optional => 1,     more => undef }
        ],
        [ { name => 'point', type => '(none)' } ],
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'x', 2.2 ) or return;
            need( $scope, $args, 'y', 2.4 ) or return;
            want( $scope, $args, 'z', 3.2 );
            var(
                $scope,
                point => create_object(
                    $f, [ x => $$scope->{'x'}, y => $$scope->{'y'} ]
                ),
                $file_scope,
                $pos->(4.2)
            );
            $ret->set_property( point => $$scope->{'point'}, $pos->(8.2) );
            return $ret;
        }
    );
    $func_0->inside_scope(
        makePoint => $scope,
        $context, undef, $ins, undef, undef
    );
    var(
        $scope,
        pt => $$scope->{'makePoint'}
          ->( [ num( $f, "5" ), num( $f, "3" ) ], $scope, undef, $pos->(11.2) )
          ->property_u( 'point', $pos->(11.45) ),
        undef, $pos->(11.1)
    );
    $$scope->{'say'}->(
        [
            add(
                $scope,
                str( $f, "Point(" ),
                $$scope->{'pt'}->property_u( 'x', $pos->(12.3) ),
                str( $f, ", " ),
                $$scope->{'pt'}->property_u( 'y', $pos->(12.55) ),
                str( $f, ")" )
            )
        ],
        $scope, undef,
        $pos->(12.1)
    );
    var(
        $scope,
        numbers => create_list(
            $f,
            [
                num( $f, "1" ),
                num( $f, "2" ),
                num( $f, "3" ),
                num( $f, "4" ),
                add( $scope, num( $f, "4" ), num( $f, "1" ) )
            ]
        ),
        undef,
        $pos->(14.1)
    );
    var( $scope, emptyArray => create_list( $f, [] ), undef, $pos->(16.2) );
    var( $scope, emptyHash  => create_hash( $f, [] ), undef, $pos->(17.2) );
};

after_content();
