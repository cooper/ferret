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
#                      Argument type
#                          Bareword 'Str'
#              Instruction
#                  Need
#                      Lexical variable '$gender'
#                      Argument type
#                          Bareword 'Gender'
#              Instruction
#                  Assignment
#                      Lexical variable '$what'
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

my $pos = before_content( '28-type.frt', './test/28-type.frt' );

use Ferret::Core::Operations qw(add str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Function event 'announce' definition
    my $func_0 = function_event_def(
        $f, $context,
        'announce',
        undef,
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
            my ( $scope, $_self, $this, $ins, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'name',   7.1 ) or return;
            need( $scope, $args, 'gender', 7.3 ) or return;
            var(
                $scope,
                what => $$scope->{'Str'}
                  ->( [ $$scope->{'gender'} ], $scope, undef, $pos->(8.2) )
                  ->property_u( 'trimPrefix', $pos->(8.35) )
                  ->( [ str( $f, ":" ) ], $scope, undef, $pos->(8.4) ),
                $file_scope, $pos->(8.1)
            );
            $$scope->{'say'}->(
                [
                    add(
                        $scope, $$scope->{'name'},
                        str( $f, " is " ), $$scope->{'what'}
                    )
                ],
                $scope, undef,
                $pos->(9.1)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        announce => $scope,
        $context, undef, $ins, undef, undef
    );
    load_namespaces( $context, qw(Gender Str) );
    typedef(
        $scope, $context, 'Gender',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            typedef_check(
                $scope, $scope, $ins,
                conditions => undef,
                equal_to =>
                  [ get_symbol( $f, 'male' ), get_symbol( $f, 'female' ) ]
            ) ? $ins : undef;
        },
        undef
    );
    $$scope->{'announce'}->(
        [ str( $f, "Robert" ), get_symbol( $f, 'male' ) ],
        $scope, undef, $pos->(12.2)
    );
    $$scope->{'announce'}->(
        [ str( $f, "Kris" ), get_symbol( $f, 'female' ) ],
        $scope, undef, $pos->(13.2)
    );
    $$scope->{'announce'}->(
        [ str( $f, "Kylie" ), get_symbol( $f, 'female' ) ],
        $scope, undef, $pos->(14.2)
    );
    $$scope->{'announce'}->(
        [ str( $f, "Caitlyn" ), get_symbol( $f, 'other' ) ],
        $scope, undef, $pos->(15.2)
    );
};

after_content();
