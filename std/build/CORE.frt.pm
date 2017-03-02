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
#              Bareword 'Complex'
#      Instruction
#          Load
#              Bareword 'Char'
#      Instruction
#          Load
#              Bareword 'Extension::NATIVE'
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
#      Instruction
#          Load
#              Bareword 'Iterator'
#      Instruction
#          Load
#              Bareword 'EventSet'
#      Type definition ('Any')
#          Type body
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
#          Type body
#              Instruction
#                  Satisfies
#                      Property variable '.name'
#              Instruction
#                  Satisfies
#                      Property variable '.signature'
#      Type definition ('Hashable')
#          Type body
#              Instruction
#                  Can
#                      Property variable '.hashValue'
#              Instruction
#                  Transform
#                      Property variable '.hashValue'
#      Type definition ('IndexedRead')
#          Type body
#              Instruction
#                  Can
#                      Method requirement
#                          Property variable '.getValue'
#                          Named argument list [1 item]
#                              Item 0
#                                  Pair 'index'
#                                      Bareword 'Any'
#      Type definition ('IndexedWrite')
#          Type body
#              Instruction
#                  Can
#                      Method requirement
#                          Property variable '.setValue'
#                          Named argument list [2 items]
#                              Item 0
#                                  Pair 'value'
#                                      Bareword 'Any'
#                              Item 1
#                                  Pair 'index'
#                                      Bareword 'Any'
#              Instruction
#                  Can
#                      Method requirement
#                          Property variable '.deleteValue'
#                          Named argument list [1 item]
#                              Item 0
#                                  Pair 'index'
#                                      Bareword 'Any'
#      Type definition ('Indexed')
#          Type body
#              Instruction
#                  Isa
#                      Bareword 'IndexedRead'
#              Instruction
#                  Isa
#                      Bareword 'IndexedWrite'
#      Include (Any, Char, Complex, Error, EventSet, Extension, Extension::Hash, Extension::List, Extension::NATIVE, Extension::Number, Extension::String, IndexedRead, IndexedWrite, Iterator, Obj, Object, Signal)
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

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'CORE' );
    my $scope = $file_scope;
    load_core('CORE');

    load_namespaces( $context,
        qw(Any Char Complex Error EventSet Extension Extension::Hash Extension::List Extension::NATIVE Extension::Number Extension::String IndexedRead IndexedWrite Iterator Obj Object Signal)
    );

    typedef(
        $scope, $context, 'Any',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions => undef,
                equal_to   => undef
            ) ? $ins : undef;
        },
        undef
    );
    $context->set_property( Obj    => $$scope->{'Any'}, $pos->(20.3) );
    $context->set_property( Object => $$scope->{'Any'}, $pos->(21.3) );
    typedef(
        $scope, $context, 'Code',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions =>
                  [ sub { $$ins->{'name'} }, sub { $$ins->{'signature'} } ],
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
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions => [
                    sub { $create_can->( 'hashValue', undef, undef, $ins )->() }
                    ,
                    sub {
                        do { $ins = $transform->( $$ins->{'hashValue'}, $ins ) }
                    }
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
    typedef(
        $scope, $context,
        'IndexedRead',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions => [
                    sub {
                        $create_can->(
                            'getValue', [ index => 'Any' ],
                            undef, $ins
                        )->();
                    }
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
    typedef(
        $scope, $context,
        'IndexedWrite',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions => [
                    sub {
                        $create_can->(
                            'setValue', [ value => 'Any', index => 'Any' ],
                            undef, $ins
                        )->();
                    },
                    sub {
                        $create_can->(
                            'deleteValue', [ index => 'Any' ],
                            undef, $ins
                        )->();
                    }
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
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions => [
                    sub { $ins->fits_type_u( $$scope->{'IndexedRead'} ) },
                    sub { $ins->fits_type_u( $$scope->{'IndexedWrite'} ) }
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
};

after_content();
