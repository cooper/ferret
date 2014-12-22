use warnings;
use strict;
use utf8;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello4.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    # Function 'makePoint' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => 'makePoint' );
        $func->add_argument( name => 'x' );
        $func->add_argument( name => 'y' );
        $func->add_argument( name => 'z', optional => 1 );
        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            do {
                return if not defined $arguments->{x};
                $scope->set_property( x => $arguments->{x} );
            };
            do {
                return if not defined $arguments->{y};
                $scope->set_property( y => $arguments->{y} );
            };
            $scope->set_property( z => $arguments->{z} );
            $scope->set_property(
                point => Ferret::Hash->new(
                    $f,
                    pairs => {
                        x => $scope->property('x'),
                        y => $scope->property('y')
                    }
                )
            );
            $return->set_property( point => $scope->property('point') );
            return $return;
        };
    }
    $funcs[0]->inside_scope( makePoint => $scope, $scope );

    $scope->set_property( pt => $scope->property('makePoint')
          ->call( [ num( $f, 5 ), num( $f, 3 ) ], $scope )->property('point') );
    $scope->property('say')->call(
        [
            add(
                $scope,                                str( $f, "Point(" ),
                $scope->property('pt')->property('x'), str( $f, "," ),
                $scope->property('pt')->property('y'), str( $f, ")" )
            )
        ],
        $scope
    );
    $scope->set_property(
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
    $scope->set_property( emptyArray => Ferret::List->new( $f, items => [] ) );
    $scope->set_property( emptyHash  => Ferret::Hash->new( $f, pairs => {} ) );
}
