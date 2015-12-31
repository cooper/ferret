# === Document Model ===
#  Document './std/CORE.frt'
#      Package 'CORE'
#      Instruction
#          Load
#              Bareword 'Signal'
#      Instruction
#          Load
#              Bareword 'Extension::Number'
#      Instruction
#          Load
#              Bareword 'Extension::String'
#      Type definition ('Any')
#          Body ('type' scope)
#      Type definition ('Obj')
#          Body ('type' scope)
#      Type definition ('Object')
#          Body ('type' scope)
#      Type definition ('Hashable')
#          Body ('type' scope)
#              Instruction
#                  Can
#                      Method requirement
#                          Property variable '.hashValue'
#                          Argument list [0 items]
#              Instruction
#                  Transform
#                      Property variable '.hashValue'
#      Type definition ('Indexed')
#          Body ('type' scope)
#              Instruction
#                  Can
#                      Method requirement
#                          Property variable '.getValue'
#                          Named argument list [1 items]
#                              Item 0
#                                  Pair 'index'
#                                      Bareword 'Hashable'
#              Instruction
#                  Can
#                      Method requirement
#                          Property variable '.setValue'
#                          Named argument list [2 items]
#                              Item 0
#                                  Pair 'value'
#                                      Bareword 'Obj'
#                              Item 1
#                                  Pair 'index'
#                                      Bareword 'Hashable'
#      Include (Extension, Extension::Number, Extension::String, Hashable, Obj, Signal)
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

FF::before_content('CORE.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'CORE' );
    FF::load_core('CORE');

    FF::load_namespaces( $context,
        qw(Extension Extension::Number Extension::String Hashable Obj Signal) );

    FF::typedef(
        $scope, $scope, 'Any',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            FF::typedef_check(
                $scope, $scope, $ins,
                conditions => undef,
                equal_to   => undef
            ) ? $ins : undef;
        }
    );
    FF::typedef(
        $scope, $scope, 'Obj',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            FF::typedef_check(
                $scope, $scope, $ins,
                conditions => undef,
                equal_to   => undef
            ) ? $ins : undef;
        }
    );
    FF::typedef(
        $scope, $scope, 'Object',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            FF::typedef_check(
                $scope, $scope, $ins,
                conditions => undef,
                equal_to   => undef
            ) ? $ins : undef;
        }
    );
    FF::typedef(
        $scope, $scope,
        'Hashable',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            FF::typedef_check(
                $scope, $scope, $ins,
                conditions => [
                    $create_can->( 'hashValue', $ins )
                      ->call_u( {}, $scope, undef, 13.3 ),
                    do {
                        $ins =
                          $transform->( $ins->property_u('hashValue'), $ins );
                      }
                ],
                equal_to => undef
            ) ? $ins : undef;
        }
    );
    FF::typedef(
        $scope, $scope,
        'Indexed',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            FF::typedef_check(
                $scope, $scope, $ins,
                conditions => [
                    $create_can->( 'getValue', $ins )->call_u(
                        { index => $scope->property_u('Hashable') }, $scope,
                        undef, 18.3
                    ),
                    $create_can->( 'setValue', $ins )->call_u(
                        {
                            value => $scope->property_u('Obj'),
                            index => $scope->property_u('Hashable')
                        },
                        $scope, undef, 19.15
                    )
                ],
                equal_to => undef
            ) ? $ins : undef;
        }
    );
};

FF::after_content();
