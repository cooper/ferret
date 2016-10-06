# === Document Model ===
#  Document './std/CORE.frt'
#      Package 'CORE'
#      Instruction
#          Load
#              Bareword 'Error'
#      Instruction
#          Load
#              Bareword 'Signal'
#      Instruction
#          Load
#              Bareword 'Extension::Number'
#      Instruction
#          Load
#              Bareword 'Extension::String'
#      Instruction
#          Load
#              Bareword 'Extension::List'
#      Instruction
#          Load
#              Bareword 'Extension::Hash'
#      Type definition ('Any')
#          Body ('type' scope)
#      Instruction
#          Alias
#              Assignment
#                  Bareword 'Obj'
#                  Bareword 'Any'
#      Instruction
#          Alias
#              Assignment
#                  Bareword 'Object'
#                  Bareword 'Any'
#      Type definition ('Code')
#          Body ('type' scope)
#              Instruction
#                  Satisfies
#                      Property variable '.name'
#              Instruction
#                  Satisfies
#                      Property variable '.signature'
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
#      Include (Any, Error, Extension, Extension::Hash, Extension::List, Extension::Number, Extension::String, Hashable, Obj, Object, Signal)
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

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

my $pos = FF::before_content( 'CORE.frt', './std/CORE.frt' );

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'CORE' );
    my $scope = $file_scope;
    FF::load_core('CORE');

    FF::load_namespaces( $context,
        qw(Any Error Extension Extension::Hash Extension::List Extension::Number Extension::String Hashable Obj Object Signal)
    );

    FF::typedef(
        $scope, $context, 'Any',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            FF::typedef_check(
                $scope, $scope, $ins,
                conditions => undef,
                equal_to   => undef
            ) ? $ins : undef;
        },
        undef
    );
    $context->set_property( Obj    => $$scope->{'Any'}, $pos->(13.3) );
    $context->set_property( Object => $$scope->{'Any'}, $pos->(14.3) );
    FF::typedef(
        $scope, $context, 'Code',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            FF::typedef_check(
                $scope, $scope, $ins,
                conditions => [ $$ins->{'name'}, $$ins->{'signature'} ],
                equal_to   => undef
            ) ? $ins : undef;
        },
        undef
    );
    FF::typedef(
        $scope, $context,
        'Hashable',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            FF::typedef_check(
                $scope, $scope, $ins,
                conditions => [
                    $create_can->( 'hashValue', $ins )
                      ->( [ undef, [] ], $scope, undef, $pos->(23.3) ),
                    do { $ins = $transform->( $$ins->{'hashValue'}, $ins ) }
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
    FF::typedef(
        $scope, $context,
        'Indexed',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            FF::typedef_check(
                $scope, $scope, $ins,
                conditions => [
                    $create_can->( 'getValue', $ins )->(
                        [ undef, [ index => $$scope->{'Hashable'} ] ],
                        $scope, undef, $pos->(28.3)
                    ),
                    $create_can->( 'setValue', $ins )->(
                        [
                            undef,
                            [
                                value => $$scope->{'Obj'},
                                index => $$scope->{'Hashable'}
                            ]
                        ],
                        $scope, undef,
                        $pos->(29.15)
                    )
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
};

FF::after_content();
