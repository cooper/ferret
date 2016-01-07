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
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('4-collections.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event 'makePoint' definition
    my $func_0 = FF::function_event_def(
        $f, $context,
        'makePoint',
        [
            { name => 'x', type => undef, optional => undef, more => undef },
            { name => 'y', type => undef, optional => undef, more => undef },
            { name => 'z', type => undef, optional => 1,     more => undef }
        ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'x', 2.2 ) or return;
            FF::need( $scope, $args, 'y', 2.4 ) or return;
            FF::want( $scope, $args, 'z', 3.2 );
            FF::lex_assign(
                $scope,
                point => FF::create_object(
                    $f, { x => $$scope->{'x'}, y => $$scope->{'y'} }
                ),
                $file_scope,
                4.2
            );
            $ret->set_property( point => $$scope->{'point'}, 8.2 );
            return $ret;
        }
    );
    $func_0->inside_scope( makePoint => $scope, $context, undef, undef, undef );
    FF::lex_assign(
        $scope,
        pt => ${
            $$scope->{'makePoint'}
              ->( [ num( $f, "5" ), num( $f, "3" ) ], $scope, undef, 11.2 )
          }->{'point'},
        undef,
        11.1
    );
    $$scope->{'say'}->(
        [
            add(
                $scope,
                str( $f, "Point(" ),
                ${ $$scope->{'pt'} }->{'x'},
                str( $f, ", " ),
                ${ $$scope->{'pt'} }->{'y'},
                str( $f, ")" )
            )
        ],
        $scope, undef, 12.1
    );
    FF::lex_assign(
        $scope,
        numbers => FF::create_list(
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
        14.1
    );
    FF::lex_assign(
        $scope,
        emptyArray => FF::create_list( $f, [] ),
        undef, 16.2
    );
    FF::lex_assign(
        $scope,
        emptyHash => FF::create_hash( $f, {} ),
        undef, 17.2
    );
};

FF::after_content();
