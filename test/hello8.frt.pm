# --- DOM ---
#  Document './test/hello8.frt'
#      Class 'String'
#          Method 'doubledLength'
#              Instruction
#                  Return
#                      Mathematical operation
#                          Call
#                              Instance variable '@length'
#                          Multiplication operator (*)
#                          Number '2'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Structural list [1 items]
#                      Item 0
#                          Mathematical operation
#                              String 'Length tim...'
#                              Addition operator (+)
#                              Call
#                                  Property 'doubledLength'
#                                      String 'hi there'
#      Include
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

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello8.frt.pm'}++;

use Ferret::Core::Operations qw(add mul num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

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

        # Method event 'doubledLength' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
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
            $methods[0] = Ferret::Event->new(
                $f,
                name         => 'doubledLength',
                default_func => [ undef, $func ]
            );
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

Ferret::runtime();
