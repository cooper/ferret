# === Document Model ===
#  Document './std/Extension/String.frt'
#      Class 'String'
#          Type definition ('NonEmpty')
#              Type body
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Operation
#                              Property variable '.length'
#                              Negated equality operator (!=)
#                              Number '0'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'NE'
#                      Bareword 'NonEmpty'
#          Type definition ('Uppercase')
#              Type body
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Transform
#                          Property variable '.uppercase'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'UC'
#                      Bareword 'Uppercase'
#          Type definition ('Lowercase')
#              Type body
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Transform
#                          Property variable '.lowercase'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'LC'
#                      Bareword 'Lowercase'
#          Type definition ('Any')
#              Type body
#                  Instruction
#                      Transform
#                          Call
#                              Bareword 'Str'
#                              Argument list [1 item]
#                                  Item 0
#                                      Topic variable '$_'
#          Method 'word'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$wordI'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Index
#                              Call
#                                  Instance variable '@split'
#                                  Mixed argument list [2 items]
#                                      Item 0
#                                          String ' '
#                                      Item 1
#                                          Pair 'limit'
#                                              Operation
#                                                  Lexical variable '$wordI'
#                                                  Addition operator (+)
#                                                  Number '2'
#                              Index list [1 item]
#                                  Item 0
#                                      Lexical variable '$wordI'
#          Method 'fromWord'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$wordN'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Index
#                              Call
#                                  Instance variable '@split'
#                                  Mixed argument list [2 items]
#                                      Item 0
#                                          String ' '
#                                      Item 1
#                                          Pair 'limit'
#                                              Operation
#                                                  Lexical variable '$wordN'
#                                                  Addition operator (+)
#                                                  Number '1'
#                              Index list [1 item]
#                                  Item 0
#                                      Lexical variable '$wordN'
#          Computed property 'empty' (lazy)
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Instance variable '@length'
#                              Equality operator (==)
#                              Number '0'
#      Include (LC, Lowercase, NE, NonEmpty, Num, Str, UC, Uppercase)
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

my $pos = before_content( 'String.frt', './std/Extension/String.frt' );

use Ferret::Core::Operations qw(add equal nequal num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'String'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'String', undef, undef );

        # Method event 'word' definition
        my $func_0 = method_event_def( $f, $scope, 'word' );

        # Method event 'fromWord' definition
        my $func_1 = method_event_def( $f, $scope, 'fromWord' );

        # Method event 'empty' definition
        my $func_2 = method_event_def( $f, $scope, 'empty' );
        $func_0->inside_scope(
            word => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            fromWord => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope( empty => $scope, $proto, $class, $ins, 1, 1 );
        typedef(
            $scope, $class,
            'NonEmpty',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => [
                        sub {
                            $ins->fits_type_u(
                                ${ $scope->{special} }->{'class'} );
                        },
                        sub {
                            nequal( $scope, $$ins->{'length'}, num( $f, "0" ) );
                        }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        $class->set_property( NE => $$scope->{'NonEmpty'}, $pos->(8.3) );
        typedef(
            $scope, $class,
            'Uppercase',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => [
                        sub {
                            $ins->fits_type_u(
                                ${ $scope->{special} }->{'class'} );
                        },
                        sub {
                            do {
                                $ins =
                                  $transform->( $$ins->{'uppercase'}, $ins );
                              }
                        }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        $class->set_property( UC => $$scope->{'Uppercase'}, $pos->(15.3) );
        typedef(
            $scope, $class,
            'Lowercase',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => [
                        sub {
                            $ins->fits_type_u(
                                ${ $scope->{special} }->{'class'} );
                        },
                        sub {
                            do {
                                $ins =
                                  $transform->( $$ins->{'lowercase'}, $ins );
                              }
                        }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        $class->set_property( LC => $$scope->{'Lowercase'}, $pos->(22.3) );
        typedef(
            $scope, $class, 'Any',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => [
                        sub {
                            do {
                                $ins = $transform->(
                                    $$scope->{'Str'}
                                      ->( [$ins], $scope, undef, $pos->(25.3) ),
                                    $ins
                                );
                              }
                        }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
    }
    load_namespaces( $context,
        qw(LC Lowercase NE NonEmpty Num Str UC Uppercase) );
};

after_content();
