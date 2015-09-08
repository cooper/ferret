use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    my $libs = do '/etc/ferret.conf';
    ref $libs eq 'ARRAY' or die "config error";
    unshift @INC, @$libs;
}

use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello9.frt.pm'}++;

use Ferret::Core::Operations qw(add str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    # Function 'sayHello' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => 'sayHello' );
        $func->add_argument( name => 'who' );
        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            do {
                return if not defined $arguments->{who};
                $scope->set_property( who => $arguments->{who} );
            };
            $scope->property('say')->call(
                [
                    add(
                        $scope,                  str( $f, "Hello " ),
                        $scope->property('who'), str( $f, "!" )
                    )
                ],
                $scope
            );
            return $return;
        };
    }
    $funcs[0]->inside_scope( sayHello => $scope, $scope );
    Ferret::space( $context, $_ ) for qw(Str);
    {
        my $maybe_0 = $scope->property('sayHello');
        if ($maybe_0) {
            $maybe_0->call( [ str( $f, "World" ) ], $scope );
        }
    }
    {
        my $maybe_0 = $scope->property('sayGoodbye');
        if ($maybe_0) {
            $maybe_0->call( [ str( $f, "World" ) ], $scope );
        }
    }
}
