# === Document Model ===
#  Document './test/28-type.frt'
#      Type definition ('Gender')
#          Body ('type' scope)
#              Instruction
#                  Symbol :male
#              Instruction
#                  Symbol :female
#      Function 'announce'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$name'
#                      Bareword 'Str'
#              Instruction
#                  Need
#                      Lexical variable '$gender'
#                      Bareword 'Gender'
#              Instruction
#                  Assignment (lexical variable '$what')
#                      Call
#                          Property 'trimPrefix'
#                              Call
#                                  Bareword 'Str'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Lexical variable '$gender'
#                          Argument list [1 items]
#                              Item 0
#                                  String ':'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  Lexical variable '$name'
#                                  Addition operator (+)
#                                  String ' is '
#                                  Addition operator (+)
#                                  Lexical variable '$what'
#      Instruction
#          Call
#              Bareword 'announce'
#              Argument list [2 items]
#                  Item 0
#                      String 'Robert'
#                  Item 1
#                      Symbol :male
#      Instruction
#          Call
#              Bareword 'announce'
#              Argument list [2 items]
#                  Item 0
#                      String 'Kris'
#                  Item 1
#                      Symbol :female
#      Instruction
#          Call
#              Bareword 'announce'
#              Argument list [2 items]
#                  Item 0
#                      String 'Kylie'
#                  Item 1
#                      Symbol :female
#      Instruction
#          Call
#              Bareword 'announce'
#              Argument list [2 items]
#                  Item 0
#                      String 'Caitlyn'
#                  Item 1
#                      Symbol :other
#      Include (Gender, Str)
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

FF::before_content('28-type.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'announce' definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'announce',
        [
            { name => 'name', type => 'Str', optional => undef, more => undef },
            {
                name     => 'gender',
                type     => 'Gender',
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'name',   7.1 ) or return;
            FF::need( $scope, $args, 'gender', 7.3 ) or return;
            $scope->set_property_ow(
                $context,
                what => $scope->property_u('Str')
                  ->call_u( [ $scope->property_u('gender') ],
                    $scope, undef, 8.2 )->property_u('trimPrefix')
                  ->call_u( [ str( $f, ":" ) ], $scope, undef, 8.4 ),
                8.1
            );
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, $scope->property_u('name'),
                        str( $f, " is " ), $scope->property_u('what')
                    )
                ],
                $scope, undef, 9.1
            );
            return $ret->return;
        }
    );
    $func_0->inside_scope( announce => $scope, $scope, undef, undef, undef );
    FF::load_namespaces( $context, qw(Gender Str) );
    FF::typedef( $scope, 'Gender',
        [ FF::get_symbol( $f, 'male' ), FF::get_symbol( $f, 'female' ) ] );
    $scope->property_u('announce')
      ->call_u( [ str( $f, "Robert" ), FF::get_symbol( $f, 'male' ) ],
        $scope, undef, 12.2 );
    $scope->property_u('announce')
      ->call_u( [ str( $f, "Kris" ), FF::get_symbol( $f, 'female' ) ],
        $scope, undef, 13.2 );
    $scope->property_u('announce')
      ->call_u( [ str( $f, "Kylie" ), FF::get_symbol( $f, 'female' ) ],
        $scope, undef, 14.2 );
    $scope->property_u('announce')
      ->call_u( [ str( $f, "Caitlyn" ), FF::get_symbol( $f, 'other' ) ],
        $scope, undef, 15.2 );
};

FF::after_content();