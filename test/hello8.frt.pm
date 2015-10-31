# === Document Model ===
#  Document './test/hello8.frt'
#      Class 'String'
#          Method 'doubledLength'
#              Instruction
#                  Return
#                      Operation
#                          Call
#                              Instance variable '@length'
#                          Multiplication operator (*)
#                          Number '2'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
#                  Item 0
#                      Operation
#                          String 'Length tim...'
#                          Addition operator (+)
#                          Call
#                              Property 'doubledLength'
#                                  String 'hi there'
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
$Ferret::tried_files{'hello8.frt.pm'}++;

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    undef;
    Ferret::space( $context, 'CORE' ) or die 'CORE error';

    # Class 'String'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'String' ) ) {
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return mul(
                    $scope,
                    $self->property_u('length')->call_u( {}, $scope ),
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
    }
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Length times two: " ),
                str( $f, "hi there" )->property_u('doubledLength')
                  ->call_u( {}, $scope )
            )
        ],
        $scope
    );
};

Ferret::runtime();
