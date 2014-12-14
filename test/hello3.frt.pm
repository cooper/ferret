use warnings;
use strict;
use utf8;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello3.frt.pm'}++;

use Ferret::Core::Operations qw(add);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::space( $context, $_ ) for qw();

    # Function 'hello1' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => 'hello1' );

        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            $scope->set_property(
                hello => Ferret::String->new( $f, value => "Hello" ) );
            $scope->property('hello')
              ->set_property( name => $scope->property('name1') );
            $scope->property('say')->call(
                [
                    add(
                        $scope,
                        $scope->property('hello'),
                        Ferret::String->new( $f, value => " " ),
                        $scope->property('hello')->property('name')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Function 'hello2' definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, name => 'hello2' );

        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            $scope->property('say')->call(
                [
                    add(
                        $scope,
                        Ferret::String->new( $f, value => "Hello " ),
                        $scope->property('name2')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Function 'helloWorld' definition
    {
        my $func = $funcs[2] =
          Ferret::Function->new( $f, name => 'helloWorld' );
        $func->add_argument( name => 'name1' );
        $func->add_argument( name => 'name2' );
        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            $funcs[0]->inside_scope( hello1 => $scope, $scope );
            $funcs[1]->inside_scope( hello2 => $scope, $scope );
            do {
                return if not defined $arguments->{name1};
                $scope->set_property( name1 => $arguments->{name1} );
            };
            do {
                return if not defined $arguments->{name2};
                $scope->set_property( name2 => $arguments->{name2} );
            };
            $scope->property('hello1')->call( [], $scope );
            $scope->property('hello2')->call( [], $scope );
            return $return;
        };
    }
    $funcs[2]->inside_scope( helloWorld => $scope, $scope );
    $scope->property('helloWorld')->call(
        {
            name2 => Ferret::String->new( $f, value => "USA" ),
            name1 => Ferret::String->new( $f, value => "World" )
        },
        $scope
    );
    $scope->property('helloWorld')->call(
        {
            name2 => Ferret::String->new( $f, value => "Humans" ),
            name1 => Ferret::String->new( $f, value => "Earth" )
        },
        $scope
    );
    $scope->set_property(
        pi => add(
            $scope,
            Ferret::Number->new( $f, value => 3 ),
            Ferret::Number->new( $f, value => 0.1 ),
            Ferret::Number->new( $f, value => 0.04 )
        )
    );
    $scope->property('say')->call(
        [
            add(
                $scope,
                Ferret::String->new( $f, value => "Pi = " ),
                $scope->property('pi')
            )
        ],
        $scope
    );
}
