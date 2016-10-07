# === Document Model ===
#  Document './std/Math/Line.frt'
#      Package 'Math'
#      Class 'Line'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@pt1'
#                          Argument type
#                              Bareword 'Point'
#                  Instruction
#                      Need
#                          Instance variable '@pt2'
#                          Argument type
#                              Bareword 'Point'
#          Computed property 'endpoints'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Value list [2 items]
#                              Item 0
#                                  Instance variable '@pt1'
#                              Item 1
#                                  Instance variable '@pt2'
#          Computed property 'pretty'
#              Body ('method' scope)
#                  Instruction
#                      Assignment
#                          Lexical variable '$mp'
#                          Instance variable '@midpoint'
#                  Instruction
#                      Assignment
#                          Lexical variable '$pox'
#                          Property 'x'
#                              Instance variable '@pt1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$poy'
#                          Property 'y'
#                              Instance variable '@pt1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$ptx'
#                          Property 'x'
#                              Instance variable '@pt2'
#                  Instruction
#                      Assignment
#                          Lexical variable '$pty'
#                          Property 'y'
#                              Instance variable '@pt2'
#                  Instruction
#                      Assignment
#                          Lexical variable '$mx'
#                          Property 'x'
#                              Lexical variable '$mp'
#                  Instruction
#                      Assignment
#                          Lexical variable '$my'
#                          Property 'y'
#                              Lexical variable '$mp'
#                  Instruction
#                      Return
#                          Operation
#                              String 'Segment( |('
#                              Addition operator (+)
#                              Lexical variable '$pox'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Lexical variable '$poy'
#                              Addition operator (+)
#                              String ')---('
#                              Addition operator (+)
#                              Lexical variable '$mx'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Lexical variable '$my'
#                              Addition operator (+)
#                              String ')---('
#                              Addition operator (+)
#                              Lexical variable '$ptx'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Lexical variable '$pty'
#                              Addition operator (+)
#                              String ')| Length = '
#                              Addition operator (+)
#                              Instance variable '@length'
#                              Addition operator (+)
#                              String ' )'
#          Method 'description'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Instance variable '@pretty'
#          Computed property 'midpoint'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Property 'midpoint'
#                                  Set [2 items]
#                                      Item 0
#                                          Instance variable '@pt1'
#                                      Item 1
#                                          Instance variable '@pt2'
#                              Argument list [0 items]
#          Computed property 'length'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Property 'distanceTo'
#                                  Instance variable '@pt1'
#                              Argument list [1 items]
#                                  Item 0
#                                      Instance variable '@pt2'
#      Include (Point)
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

my $pos = FF::before_content( 'Line.frt', './std/Math/Line.frt' );

use Ferret::Core::Operations qw(add str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'Math' );
    my $scope = $file_scope;
    FF::load_core('Math');

    # Class 'Line'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Line', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
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
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $self, $args, 'pt1' ) or return;
                FF::need( $self, $args, 'pt2' ) or return;
                return $ret;
            }
        );

        # Method event 'endpoints' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'endpoints',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                return $ret_func->(
                    FF::create_list( $f, [ $$self->{'pt1'}, $$self->{'pt2'} ] )
                );
                return $ret;
            }
        );

        # Method event 'pretty' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'pretty',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::lex_assign(
                    $scope,
                    mp => $$self->{'midpoint'},
                    $file_scope, $pos->(13.2)
                );
                FF::lex_assign(
                    $scope,
                    pox => $$self->{'pt1'}->property_u( 'x', $pos->(14.2) ),
                    $file_scope, $pos->(14.1)
                );
                FF::lex_assign(
                    $scope,
                    poy => $$self->{'pt1'}->property_u( 'y', $pos->(14.45) ),
                    $file_scope, $pos->(14.35)
                );
                FF::lex_assign(
                    $scope,
                    ptx => $$self->{'pt2'}->property_u( 'x', $pos->(15.2) ),
                    $file_scope, $pos->(15.1)
                );
                FF::lex_assign(
                    $scope,
                    pty => $$self->{'pt2'}->property_u( 'y', $pos->(15.45) ),
                    $file_scope, $pos->(15.35)
                );
                FF::lex_assign(
                    $scope,
                    mx => $$scope->{'mp'}->property_u( 'x', $pos->(16.2) ),
                    $file_scope, $pos->(16.1)
                );
                FF::lex_assign(
                    $scope,
                    my => $$scope->{'mp'}->property_u( 'y', $pos->(16.45) ),
                    $file_scope, $pos->(16.35)
                );
                return $ret_func->(
                    add(
                        $scope,             str( $f, "Segment( |(" ),
                        $$scope->{'pox'},   str( $f, ", " ),
                        $$scope->{'poy'},   str( $f, ")---(" ),
                        $$scope->{'mx'},    str( $f, ", " ),
                        $$scope->{'my'},    str( $f, ")---(" ),
                        $$scope->{'ptx'},   str( $f, ", " ),
                        $$scope->{'pty'},   str( $f, ")| Length = " ),
                        $$self->{'length'}, str( $f, " )" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $method_3 = FF::method_event_def(
            $f, $scope,
            'description',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                return $ret_func->( $$self->{'pretty'} );
                return $ret;
            }
        );

        # Method event 'midpoint' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'midpoint',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                return $ret_func->(
                    FF::create_set( $scope, $$self->{'pt1'}, $$self->{'pt2'} )
                      ->property_u( 'midpoint', $pos->(25.35) )
                      ->( [ undef, [] ], $scope, undef, $pos->(25.4) ) );
                return $ret;
            }
        );

        # Method event 'length' definition
        my $method_5 = FF::method_event_def(
            $f, $scope, 'length',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                return $ret_func->(
                    $$self->{'pt1'}->property_u( 'distanceTo', $pos->(29.3) )
                      ->( [ $$self->{'pt2'} ], $scope, undef, $pos->(29.4) ) );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            endpoints => $scope,
            $proto, $class, 1, undef
        );
        $method_2->inside_scope( pretty => $scope, $proto, $class, 1, undef );
        $method_3->inside_scope(
            description => $scope,
            $proto, $class, undef, undef
        );
        $method_4->inside_scope( midpoint => $scope, $proto, $class, 1, undef );
        $method_5->inside_scope( length   => $scope, $proto, $class, 1, undef );
    }
    FF::load_namespaces( $context, qw(Point) );
};

FF::after_content();
