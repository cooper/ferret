# === Document Model ===
#  File './std/Math/Line.frt'
#      Package 'Math'
#          Class 'Line'
#              Class method 'initializer__' { $pt1:Point $pt2:Point }
#                  Function body
#                      Instruction
#                          Need
#                              Instance variable '@pt1'
#                              Argument type
#                                  Bareword 'Point'
#                      Instruction
#                          Need
#                              Instance variable '@pt2'
#                              Argument type
#                                  Bareword 'Point'
#              Computed property 'length' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Property 'distanceTo'
#                                      Instance variable '@pt1'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Instance variable '@pt2'
#              Computed property 'endpoints' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Value list [2 items]
#                                  Item 0
#                                      Instance variable '@pt1'
#                                  Item 1
#                                      Instance variable '@pt2'
#              Computed property 'midpoint' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Property 'midpoint'
#                                      Set [2 items]
#                                          Item 0
#                                              Instance variable '@pt1'
#                                          Item 1
#                                              Instance variable '@pt2'
#                                  Argument list [0 items]
#              Method 'description' { -> $result }
#                  Function body
#                      Instruction
#                          Assignment
#                              Lexical variable '$mp'
#                              Instance variable '@midpoint'
#                      Instruction
#                          Assignment
#                              Lexical variable '$pox'
#                              Property 'x'
#                                  Instance variable '@pt1'
#                      Instruction
#                          Assignment
#                              Lexical variable '$poy'
#                              Property 'y'
#                                  Instance variable '@pt1'
#                      Instruction
#                          Assignment
#                              Lexical variable '$ptx'
#                              Property 'x'
#                                  Instance variable '@pt2'
#                      Instruction
#                          Assignment
#                              Lexical variable '$pty'
#                              Property 'y'
#                                  Instance variable '@pt2'
#                      Instruction
#                          Assignment
#                              Lexical variable '$mx'
#                              Property 'x'
#                                  Lexical variable '$mp'
#                      Instruction
#                          Assignment
#                              Lexical variable '$my'
#                              Property 'y'
#                                  Lexical variable '$mp'
#                      Instruction
#                          Return
#                              Operation
#                                  String 'Segment( |('
#                                  Addition operator (+)
#                                  Lexical variable '$pox'
#                                  Addition operator (+)
#                                  String ', '
#                                  Addition operator (+)
#                                  Lexical variable '$poy'
#                                  Addition operator (+)
#                                  String ')---('
#                                  Addition operator (+)
#                                  Lexical variable '$mx'
#                                  Addition operator (+)
#                                  String ', '
#                                  Addition operator (+)
#                                  Lexical variable '$my'
#                                  Addition operator (+)
#                                  String ')---('
#                                  Addition operator (+)
#                                  Lexical variable '$ptx'
#                                  Addition operator (+)
#                                  String ', '
#                                  Addition operator (+)
#                                  Lexical variable '$pty'
#                                  Addition operator (+)
#                                  String ')| Length = '
#                                  Addition operator (+)
#                                  Instance variable '@length'
#                                  Addition operator (+)
#                                  String ' )'
#          Include (Point)
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
use Ferret::Core::Operations qw(add str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) = before_content( 'Line.frt', './std/Math/Line.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'Math', 1.1 );
    my $scope = $file_scope;
    load_core('Math');

    # Class 'Line'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Line', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'pt1',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'pt2',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'pt1' ) || return $ret_func->();
                need( $self, $args, 'pt2' ) || return $ret_func->();
                return $ret;
            }
        );

        # Method event 'length' definition
        my $func_1 = method_event_def(
            $f, $scope, 'length', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$self->{'pt1'}->property_u( 'distanceTo', $pos->(13.3) )
                      ->( [ $$self->{'pt2'} ], $scope, undef, $pos->(13.4) ) );
                return $ret;
            }
        );

        # Method event 'endpoints' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'endpoints',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    create_list( $f, [ $$self->{'pt1'}, $$self->{'pt2'} ] ) );
                return $ret;
            }
        );

        # Method event 'midpoint' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'midpoint',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    create_set( $scope, $$self->{'pt1'}, $$self->{'pt2'} )
                      ->property_u( 'midpoint', $pos->(23.35) )
                      ->( [ undef, [] ], $scope, undef, $pos->(23.4) ) );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    mp => $$self->{'midpoint'},
                    $file_scope, $pos->(27.2)
                );
                var(
                    $scope,
                    pox => $$self->{'pt1'}->property_u( 'x', $pos->(28.2) ),
                    $file_scope, $pos->(28.1)
                );
                var(
                    $scope,
                    poy => $$self->{'pt1'}->property_u( 'y', $pos->(28.45) ),
                    $file_scope, $pos->(28.35)
                );
                var(
                    $scope,
                    ptx => $$self->{'pt2'}->property_u( 'x', $pos->(29.2) ),
                    $file_scope, $pos->(29.1)
                );
                var(
                    $scope,
                    pty => $$self->{'pt2'}->property_u( 'y', $pos->(29.45) ),
                    $file_scope, $pos->(29.35)
                );
                var(
                    $scope,
                    mx => $$scope->{'mp'}->property_u( 'x', $pos->(30.2) ),
                    $file_scope, $pos->(30.1)
                );
                var(
                    $scope,
                    my => $$scope->{'mp'}->property_u( 'y', $pos->(30.45) ),
                    $file_scope, $pos->(30.35)
                );
                return $ret_func->(
                    add(
                        $scope, $pos->(31.075),
                        str( $f, "Segment( |(" ),  $$scope->{'pox'},
                        str( $f, ", " ),           $$scope->{'poy'},
                        str( $f, ")---(" ),        $$scope->{'mx'},
                        str( $f, ", " ),           $$scope->{'my'},
                        str( $f, ")---(" ),        $$scope->{'ptx'},
                        str( $f, ", " ),           $$scope->{'pty'},
                        str( $f, ")| Length = " ), $$self->{'length'},
                        str( $f, " )" )
                    )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            length => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_2->inside_scope(
            endpoints => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_3->inside_scope(
            midpoint => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_4->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    provides_namespaces( $context, $file_name, $pos->(32.1), qw(Line) );
    load_namespaces( $context, $file_name, $pos->(32.1), qw(Point) );
};

after_content($file_name);
