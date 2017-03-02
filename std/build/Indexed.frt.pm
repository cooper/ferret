# === Document Model ===
#  File './std/Indexed.frt'
#      Package 'CORE'
#          Type definition ('Hashable')
#              Type body
#                  Instruction
#                      Can
#                          Property variable '.hashValue'
#                  Instruction
#                      Transform
#                          Property variable '.hashValue'
#          Type definition ('IndexedRead')
#              Type body
#                  Instruction
#                      Can
#                          Method requirement
#                              Property variable '.getValue'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'index'
#                                          Bareword 'Any'
#          Type definition ('IndexedWrite')
#              Type body
#                  Instruction
#                      Can
#                          Method requirement
#                              Property variable '.setValue'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'value'
#                                          Bareword 'Any'
#                                  Item 1
#                                      Pair 'index'
#                                          Bareword 'Any'
#                  Instruction
#                      Can
#                          Method requirement
#                              Property variable '.deleteValue'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'index'
#                                          Bareword 'Any'
#          Type definition ('Indexed')
#              Type body
#                  Instruction
#                      Isa
#                          Bareword 'IndexedRead'
#                  Instruction
#                      Isa
#                          Bareword 'IndexedWrite'
#          Include (Any, IndexedRead, IndexedWrite)
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
use Ferret::Core::Operations qw();

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) = before_content( 'Indexed.frt', './std/Indexed.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'CORE' );
    my $scope = $file_scope;
    load_core('CORE');

    load_namespaces( $context, $file_name, qw(Any IndexedRead IndexedWrite) );
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

after_content($file_name);
