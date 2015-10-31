# === Document Model ===
#  Document './test/hello4.frt'
#      Function 'makePoint'
#          Instruction
#              Need
#                  Lexical variable '$x'
#          Instruction
#              Need
#                  Lexical variable '$y'
#          Instruction
#              Want
#                  Lexical variable '$z'
#          Instruction
#              Assignment (lexical variable '$point')
#                  Object [2 items]
#                      Item 0
#                          Pair 'x'
#                              Lexical variable '$x'
#                      Item 1
#                          Pair 'y'
#                              Lexical variable '$y'
#          Instruction
#              Return pair 'point'
#                  Lexical variable '$point'
#      Instruction
#          Assignment (lexical variable '$pt')
#              Property 'point'
#                  Call
#                      Bareword 'makePoint'
#                      Set [2 items]
#                          Item 0
#                              Number '5'
#                          Item 1
#                              Number '3'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
#                  Item 0
#                      Operation
#                          String 'Point('
#                          Addition operator (+)
#                          Property 'x'
#                              Lexical variable '$pt'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Property 'y'
#                              Lexical variable '$pt'
#                          Addition operator (+)
#                          String ')'
#      Instruction
#          Assignment (lexical variable '$numbers')
#              Value list [5 items]
#                  Item 0
#                      Number '1'
#                  Item 1
#                      Number '2'
#                  Item 2
#                      Number '3'
#                  Item 3
#                      Number '4'
#                  Item 4
#                      Operation
#                          Number '4'
#                          Addition operator (+)
#                          Number '1'
#      Instruction
#          Assignment (lexical variable '$emptyArray')
#              Value list [0 items]
#      Instruction
#          Assignment (lexical variable '$emptyHash')
#              Hash [0 items]
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello4.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    undef;
    Ferret::space( $context, 'CORE' ) or die 'CORE error';

    # Function event 'makePoint' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 'x', type => '', more => undef );
        $func->add_argument( name => 'y', type => '', more => undef );
        $func->add_argument(
            name     => 'z',
            type     => '',
            optional => 1,
            more     => undef
        );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{x};
                $scope->set_property( x => $arguments->{x} );
            };
            do {
                return unless defined $arguments->{y};
                $scope->set_property( y => $arguments->{y} );
            };
            $scope->set_property( z => $arguments->{z} );
            $scope->set_property_ow(
                $context,
                point => Ferret::Object->new(
                    $f,
                    initial_props => {
                        x => $scope->property_u('x'),
                        y => $scope->property_u('y')
                    }
                )
            );
            $return->set_property( point => $scope->property_u('point') );
            return $return;
        };
        $funcs[0] = Ferret::Event->new(
            $f,
            name         => 'makePoint',
            default_func => [ undef, $func ]
        );
    }
    $funcs[0]->inside_scope( makePoint => $scope, $scope );
    $scope->set_property_ow( $context,
        pt => $scope->property_u('makePoint')
          ->call_u( [ num( $f, 5 ), num( $f, 3 ) ], $scope )
          ->property_u('point') );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Point(" ),
                $scope->property_u('pt')->property_u('x'),
                str( $f, ", " ),
                $scope->property_u('pt')->property_u('y'),
                str( $f, ")" )
            )
        ],
        $scope
    );
    $scope->set_property_ow(
        $context,
        numbers => Ferret::List->new(
            $f,
            items => [
                num( $f, 1 ),
                num( $f, 2 ),
                num( $f, 3 ),
                num( $f, 4 ),
                add( $scope, num( $f, 4 ), num( $f, 1 ) )
            ]
        )
    );
    $scope->set_property_ow( $context,
        emptyArray => Ferret::List->new( $f, items => [] ) );
    $scope->set_property_ow( $context,
        emptyHash => Ferret::Hash->new( $f, pairs => {} ) );
};

Ferret::runtime();
