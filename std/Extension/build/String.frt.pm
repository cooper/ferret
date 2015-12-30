# === Document Model ===
#  Document './std/Extension/String.frt'
#      Class 'String'
#          Type definition ('UC')
#              Body ('type' scope)
#                  Instruction
#                      Isa
#                          Bareword 'String'
#                  Instruction
#                      Transform
#                          Property variable '.uppercase'
#          Type definition ('LC')
#              Body ('type' scope)
#                  Instruction
#                      Isa
#                          Bareword 'String'
#                  Instruction
#                      Transform
#                          Property variable '.lowercase'
#      Include (String)
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

FF::before_content('String.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'String'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'String', undef );

        FF::typedef(
            $scope, $class, 'UC',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
                    $scope, $class, $ins,
                    conditions => [
                        $ins->instance_of_u( $scope->property_u('String') ),
                        do {
                            $ins = $transform->(
                                $ins->property_u('uppercase'), $ins
                            );
                          }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            }
        );
        FF::typedef(
            $scope, $class, 'LC',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
                    $scope, $class, $ins,
                    conditions => [
                        $ins->instance_of_u( $scope->property_u('String') ),
                        do {
                            $ins = $transform->(
                                $ins->property_u('lowercase'), $ins
                            );
                          }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            }
        );
    }
    FF::load_namespaces( $context, qw(String) );
};

FF::after_content();
