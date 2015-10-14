# === Document Model ===
#  Document './test/hello9.frt'
#      Function 'sayHello'
#          Instruction
#              Need
#                  Lexical variable '$who'
#                  Bareword 'Str'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Structural list [1 items]
#                      Item 0
#                          Operation
#                              String 'Hello '
#                              Addition operator (+)
#                              Lexical variable '$who'
#                              Addition operator (+)
#                              String '!'
#      Instruction
#          Call
#              Maybe
#                  Bareword 'sayHello'
#              Structural list [1 items]
#                  Item 0
#                      String 'World'
#      Instruction
#          Call
#              Maybe
#                  Bareword 'sayGoodbye'
#              Structural list [1 items]
#                  Item 0
#                      String 'World'
#      Include (Str)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die "config error";
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello9.frt.pm'}++;

use Ferret::Core::Operations qw(add bool str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    undef;

    # Function event 'sayHello' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 'who', type => 'Str' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{who};
                $scope->set_property( who => $arguments->{who} );
            };
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,                    str( $f, "Hello " ),
                        $scope->property_u('who'), str( $f, "!" )
                    )
                ],
                $scope
            );
            return $return;
        };
        $funcs[0] = Ferret::Event->new(
            $f,
            name         => 'sayHello',
            default_func => [ undef, $func ]
        );
    }
    $funcs[0]->inside_scope( sayHello => $scope, $scope );
    Ferret::space( $context, $_ ) for qw(Str);
    {
        my $maybe_0 = $scope->property_u('sayHello');
        if ( bool($maybe_0) ) {
            $maybe_0->call_u( [ str( $f, "World" ) ], $scope );
        }
    }
    {
        my $maybe_0 = $scope->property_u('sayGoodbye');
        if ( bool($maybe_0) ) {
            $maybe_0->call_u( [ str( $f, "World" ) ], $scope );
        }
    }
};

Ferret::runtime();
