use warnings;
use strict;
use utf8;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello8.frt.pm'}++;

use Ferret::Core::Operations qw(add mul num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::space( $context, $_ ) for qw();

    # Class 'String'
    {
        my @methods;
        my ( $class, $self );
        if ( $context->has_property('String') ) {
            $class = $self = $context->property('String');
        }
        else {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'String',
                version => undef
            );
            $context->set_property( String => $class );
        }
        my $proto = $class->prototype;

        # Method 'doubledLength' definition
        {
            my $func = $methods[0] = Ferret::Function->new(
                $f,
                name      => 'doubledLength',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                return mul(
                    $scope,
                    $self->property('length')->call( [], $scope ),
                    num( $f, 2 )
                );
                return $return;
            };
        }
        $methods[0]->inside_scope( doubledLength => $scope, $proto, $class );
        $scope->property('say')->call(
            [
                add(
                    $scope,
                    str( $f, "Length times two: " ),
                    str( $f, "hi there" )->property('doubledLength')
                      ->call( [], $scope )
                )
            ],
            $scope
        );
    }
}