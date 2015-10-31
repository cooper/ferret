# === Document Model ===
#  Document './test/hello3.frt'
#      Instruction
#          Call
#              Bareword 'helloWorld'
#              Hash [2 items]
#                  Item 0
#                      Pair 'name2'
#                          String 'USA'
#                  Item 1
#                      Pair 'name1'
#                          String 'World'
#      Instruction
#          Call
#              Bareword 'helloWorld'
#              Hash [2 items]
#                  Item 0
#                      Pair 'name1'
#                          String 'Earth'
#                  Item 1
#                      Pair 'name2'
#                          String 'Humans'
#      Instruction
#          Call
#              Bareword 'helloWorld'
#              Set [2 items]
#                  Item 0
#                      String 'Benjamin'
#                  Item 1
#                      String 'George'
#      Function 'helloWorld'
#          Instruction
#              Need
#                  Lexical variable '$name1'
#          Instruction
#              Need
#                  Lexical variable '$name2'
#          Instruction
#              Call
#                  Bareword 'hello1'
#          Instruction
#              Call
#                  Bareword 'hello2'
#          Function 'hello1'
#              Instruction
#                  Assignment (lexical variable '$hello')
#                      String 'Hello'
#              Instruction
#                  Assignment (property 'name')
#                      Lexical variable '$name1'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Single value [1 items]
#                          Item 0
#                              Operation
#                                  Lexical variable '$hello'
#                                  Addition operator (+)
#                                  String ' '
#                                  Addition operator (+)
#                                  Property 'name'
#                                      Lexical variable '$hello'
#          Function 'hello2'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Single value [1 items]
#                          Item 0
#                              Operation
#                                  String 'Hello '
#                                  Addition operator (+)
#                                  Lexical variable '$name2'
#      Instruction
#          Assignment (lexical variable '$pi')
#              Operation
#                  Number '3'
#                  Addition operator (+)
#                  Number '0.1'
#                  Addition operator (+)
#                  Number '0.04'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
#                  Item 0
#                      Operation
#                          String 'Pi = '
#                          Addition operator (+)
#                          Lexical variable '$pi'
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
$Ferret::tried_files{'hello3.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    undef;
    Ferret::space( $context, 'CORE' ) or die 'CORE error';

    # Function event 'hello1' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->set_property_ow( $context, hello => str( $f, "Hello" ) );
            $scope->property_u('hello')
              ->set_property( name => $scope->property_u('name1') );
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,
                        $scope->property_u('hello'),
                        str( $f, " " ),
                        $scope->property_u('hello')->property_u('name')
                    )
                ],
                $scope
            );
            return $return;
        };
        $funcs[0] = Ferret::Event->new(
            $f,
            name         => 'hello1',
            default_func => [ undef, $func ]
        );
    }

    # Function event 'hello2' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "Hello " ),
                        $scope->property_u('name2')
                    )
                ],
                $scope
            );
            return $return;
        };
        $funcs[1] = Ferret::Event->new(
            $f,
            name         => 'hello2',
            default_func => [ undef, $func ]
        );
    }

    # Function event 'helloWorld' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 'name1', type => '', more => undef );
        $func->add_argument( name => 'name2', type => '', more => undef );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $funcs[0]->inside_scope( hello1 => $scope, $scope );
            $funcs[1]->inside_scope( hello2 => $scope, $scope );
            do {
                return unless defined $arguments->{name1};
                $scope->set_property( name1 => $arguments->{name1} );
            };
            do {
                return unless defined $arguments->{name2};
                $scope->set_property( name2 => $arguments->{name2} );
            };
            $scope->property_u('hello1')->call_u( {}, $scope );
            $scope->property_u('hello2')->call_u( {}, $scope );
            return $return;
        };
        $funcs[2] = Ferret::Event->new(
            $f,
            name         => 'helloWorld',
            default_func => [ undef, $func ]
        );
    }
    $funcs[2]->inside_scope( helloWorld => $scope, $scope );
    $scope->property_u('helloWorld')
      ->call_u( { name2 => str( $f, "USA" ), name1 => str( $f, "World" ) },
        $scope );
    $scope->property_u('helloWorld')
      ->call_u( { name1 => str( $f, "Earth" ), name2 => str( $f, "Humans" ) },
        $scope );
    $scope->property_u('helloWorld')
      ->call_u( [ str( $f, "Benjamin" ), str( $f, "George" ) ], $scope );
    $scope->set_property_ow( $context,
        pi => add( $scope, num( $f, 3 ), num( $f, 0.1 ), num( $f, 0.04 ) ) );
    $scope->property_u('say')
      ->call_u( [ add( $scope, str( $f, "Pi = " ), $scope->property_u('pi') ) ],
        $scope );
};

Ferret::runtime();
