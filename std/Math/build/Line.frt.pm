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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('Line.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'Math' );
    my $scope = $file_scope;
    FF::load_core('Math');

    # Class 'Line'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Line', undef );

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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return FF::create_list( $f,
                    [ $$self->{'pt1'}, $$self->{'pt2'} ] );
                return $ret;
            }
        );

        # Method event 'pretty' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'pretty',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::lex_assign(
                    $scope,
                    mp => $$self->{'midpoint'},
                    $file_scope, 13.2
                );
                FF::lex_assign(
                    $scope,
                    pox => ${ $$self->{'pt1'} }->{'x'},
                    $file_scope, 14.1
                );
                FF::lex_assign(
                    $scope,
                    poy => ${ $$self->{'pt1'} }->{'y'},
                    $file_scope, 14.35
                );
                FF::lex_assign(
                    $scope,
                    ptx => ${ $$self->{'pt2'} }->{'x'},
                    $file_scope, 15.1
                );
                FF::lex_assign(
                    $scope,
                    pty => ${ $$self->{'pt2'} }->{'y'},
                    $file_scope, 15.35
                );
                FF::lex_assign(
                    $scope,
                    mx => ${ $$scope->{'mp'} }->{'x'},
                    $file_scope, 16.1
                );
                FF::lex_assign(
                    $scope,
                    my => ${ $$scope->{'mp'} }->{'y'},
                    $file_scope, 16.35
                );
                return add(
                    $scope,             str( $f, "Segment( |(" ),
                    $$scope->{'pox'},   str( $f, ", " ),
                    $$scope->{'poy'},   str( $f, ")---(" ),
                    $$scope->{'mx'},    str( $f, ", " ),
                    $$scope->{'my'},    str( $f, ")---(" ),
                    $$scope->{'ptx'},   str( $f, ", " ),
                    $$scope->{'pty'},   str( $f, ")| Length = " ),
                    $$self->{'length'}, str( $f, " )" )
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return $$self->{'pretty'};
                return $ret;
            }
        );

        # Method event 'midpoint' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'midpoint',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return
                  ${ FF::create_set( $scope, $$self->{'pt1'}, $$self->{'pt2'} )
                  }->{'midpoint'}->( {}, $scope, undef, 25.4 );
                return $ret;
            }
        );

        # Method event 'length' definition
        my $method_5 = FF::method_event_def(
            $f, $scope, 'length',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return ${ $$self->{'pt1'} }->{'distanceTo'}
                  ->( [ $$self->{'pt2'} ], $scope, undef, 29.4 );
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
