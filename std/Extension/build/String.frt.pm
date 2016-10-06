# === Document Model ===
#  Document './std/Extension/String.frt'
#      Class 'String'
#          Type definition ('NonEmpty')
#              Body ('type' scope)
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
#              Body ('type' scope)
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
#              Body ('type' scope)
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
#          Method 'word'
#              Body ('method' scope)
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
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$wordI'
#          Method 'fromWord'
#              Body ('method' scope)
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
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$wordN'
#      Include (LC, Lowercase, NE, NonEmpty, Num, UC, Uppercase)
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

my $pos = FF::before_content( 'String.frt', './std/Extension/String.frt' );

use Ferret::Core::Operations qw(add nequal num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'String'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'String', undef, undef );

        # Method event 'word' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, 'word',
            [
                {
                    name     => 'wordI',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $scope, $args, 'wordI', 25.2 ) or return;
                return $ret_func->(
                    $$self->{'split'}->(
                        [
                            str( $f, " " ),
                            [
                                limit => add(
                                    $scope, $$scope->{'wordI'},
                                    num( $f, "2" )
                                )
                            ]
                        ],
                        $scope, undef,
                        $pos->(26.15)
                      )->get_index_value(
                        [ $$scope->{'wordI'} ],
                        $scope, $pos->(26.55)
                      )
                );
                return $ret;
            }
        );

        # Method event 'fromWord' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'fromWord',
            [
                {
                    name     => 'wordN',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $scope, $args, 'wordN', 30.2 ) or return;
                return $ret_func->(
                    $$self->{'split'}->(
                        [
                            str( $f, " " ),
                            [
                                limit => add(
                                    $scope, $$scope->{'wordN'},
                                    num( $f, "1" )
                                )
                            ]
                        ],
                        $scope, undef,
                        $pos->(31.15)
                      )->get_index_value(
                        [ $$scope->{'wordN'} ],
                        $scope, $pos->(31.55)
                      )
                );
                return $ret;
            }
        );
        $method_0->inside_scope( word => $scope, $proto, $class, undef, undef );
        $method_1->inside_scope(
            fromWord => $scope,
            $proto, $class, undef, undef
        );
        FF::typedef(
            $scope, $class,
            'NonEmpty',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
                    $scope, $scope, $ins,
                    conditions => [
                        $ins->fits_type_u( ${ $scope->{special} }->{'class'} ),
                        nequal( $scope, $$ins->{'length'}, num( $f, "0" ) )
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        $class->set_property( NE => $$scope->{'NonEmpty'}, $pos->(8.3) );
        FF::typedef(
            $scope, $class,
            'Uppercase',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
                    $scope, $scope, $ins,
                    conditions => [
                        $ins->fits_type_u( ${ $scope->{special} }->{'class'} ),
                        do { $ins = $transform->( $$ins->{'uppercase'}, $ins ) }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        $class->set_property( UC => $$scope->{'Uppercase'}, $pos->(15.3) );
        FF::typedef(
            $scope, $class,
            'Lowercase',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
                    $scope, $scope, $ins,
                    conditions => [
                        $ins->fits_type_u( ${ $scope->{special} }->{'class'} ),
                        do { $ins = $transform->( $$ins->{'lowercase'}, $ins ) }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        $class->set_property( LC => $$scope->{'Lowercase'}, $pos->(22.3) );
    }
    FF::load_namespaces( $context,
        qw(LC Lowercase NE NonEmpty Num UC Uppercase) );
};

FF::after_content();
