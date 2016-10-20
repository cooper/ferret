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
#              Bareword 'Iterator'
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
#      Type definition ('Char')
#          Body ('type' scope)
#              Instruction
#                  Isa
#                      Bareword 'Str'
#              Instruction
#                  Satisfies
#                      Operation
#                          Property variable '.length'
#                          Equality operator (==)
#                          Number '1'
#      Type definition ('Hashable')
#          Body ('type' scope)
#              Instruction
#                  Can
#                      Property variable '.hashValue'
#              Instruction
#                  Transform
#                      Property variable '.hashValue'
#      Type definition ('Indexed')
#          Body ('type' scope)
#              Instruction
#                  Can
#                      Method requirement
#                          Property variable '.getValue'
#                          Named argument list [1 item]
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
#              Instruction
#                  Can
#                      Method requirement
#                          Property variable '.deleteValue'
#                          Named argument list [1 item]
#                              Item 0
#                                  Pair 'index'
#                                      Bareword 'Hashable'
#      Include (Any, Error, Extension, Extension::Hash, Extension::List, Extension::Number, Extension::String, Hashable, Iterator, Obj, Object, Signal, Str)
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

my $pos = before_content( 'CORE.frt', './std/CORE.frt' );

use Ferret::Core::Operations qw(equal num);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'CORE' );
    my $scope = $file_scope;
    load_core('CORE');

    load_namespaces( $context,
        qw(Any Error Extension Extension::Hash Extension::List Extension::Number Extension::String Hashable Iterator Obj Object Signal Str)
    );

    typedef(
        $scope, $context, 'Any',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            typedef_check(
                $scope, $scope, $ins,
                conditions => undef,
                equal_to   => undef
            ) ? $ins : undef;
        },
        undef
    );
    $context->set_property( Obj    => $$scope->{'Any'}, $pos->(15.3) );
    $context->set_property( Object => $$scope->{'Any'}, $pos->(16.3) );
    typedef(
        $scope, $context, 'Code',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            typedef_check(
                $scope, $scope, $ins,
                conditions => [ $$ins->{'name'}, $$ins->{'signature'} ],
                equal_to   => undef
            ) ? $ins : undef;
        },
        undef
    );
    typedef(
        $scope, $context, 'Char',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            typedef_check(
                $scope, $scope, $ins,
                conditions => [
                    $ins->fits_type_u( $$scope->{'Str'} ),
                    equal( $scope, $$ins->{'length'}, num( $f, "1" ) )
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
    typedef(
        $scope, $context,
        'Hashable',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            typedef_check(
                $scope, $scope, $ins,
                conditions => [
                    $create_can->( 'hashValue', undef, $ins )->(),
                    do { $ins = $transform->( $$ins->{'hashValue'}, $ins ) }
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
    typedef(
        $scope, $context,
        'Indexed',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            typedef_check(
                $scope, $scope, $ins,
                conditions => [
                    $create_can->( 'getValue', [ index => 'Hashable' ], $ins )
                      ->(),
                    $create_can->(
                        'setValue', [ value => 'Obj', index => 'Hashable' ],
                        $ins
                      )->(),
                    $create_can->(
                        'deleteValue', [ index => 'Hashable' ], $ins
                    )->()
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
};

after_content();
