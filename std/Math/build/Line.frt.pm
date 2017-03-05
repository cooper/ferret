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
#                                      Instance variable '@pt1'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Instance variable '@pt2'
#              Method 'description' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Operation
#                                  String '|('
#                                  Addition operator (+)
#                                  Property 'x'
#                                      Instance variable '@pt1'
#                                  Addition operator (+)
#                                  String ', '
#                                  Addition operator (+)
#                                  Property 'y'
#                                      Instance variable '@pt1'
#                                  Addition operator (+)
#                                  String ')---('
#                                  Addition operator (+)
#                                  Property 'x'
#                                      Instance variable '@pt2'
#                                  Addition operator (+)
#                                  String ', '
#                                  Addition operator (+)
#                                  Property 'y'
#                                      Instance variable '@pt2'
#                                  Addition operator (+)
#                                  String ')|'
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
                    $$self->{'pt1'}->property_u( 'midpoint', $pos->(23.3) )
                      ->( [ $$self->{'pt2'} ], $scope, undef, $pos->(23.4) ) );
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
                return $ret_func->(
                    add(
                        $scope,
                        $pos->(27.1),
                        str( $f, "|(" ),
                        $$self->{'pt1'}->property_u( 'x', $pos->(27.16667) ),
                        str( $f, ", " ),
                        $$self->{'pt1'}->property_u( 'y', $pos->(27.33333) ),
                        str( $f, ")---(" ),
                        $$self->{'pt2'}->property_u( 'x', $pos->(27.5) ),
                        str( $f, ", " ),
                        $$self->{'pt2'}->property_u( 'y', $pos->(27.66667) ),
                        str( $f, ")|" )
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
    provides_namespaces( $context, $file_name, $pos->(28.1), qw(Line) );
    load_namespaces( $context, $file_name, $pos->(28.1), qw(Point) );
};

after_content($file_name);
