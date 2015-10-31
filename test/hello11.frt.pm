# === Document Model ===
#  Document './test/hello11.frt'
#      Instruction
#          Assignment (lexical variable '$point')
#              Call
#                  Bareword 'Math::Point'
#                  Set [2 items]
#                      Item 0
#                          Number '0'
#                      Item 1
#                          Number '0'
#      If
#          Expression ('if' parameter)
#              Lexical variable '$point'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Single value [1 items]
#                      Item 0
#                          String 'The point ...'
#          Instruction
#              Call
#                  Bareword 'inspect'
#                  Single value [1 items]
#                      Item 0
#                          Lexical variable '$point'
#      Inside
#          Expression ('inside' parameter)
#              Lexical variable '$point'
#          Instruction
#              Assignment (lexical variable '$x')
#                  Number '5'
#          Instruction
#              Assignment (lexical variable '$y')
#                  Number '10'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
#                  Item 0
#                      Operation
#                          String 'Point: '
#                          Addition operator (+)
#                          Lexical variable '$point'
#      On
#          Expression ('on' parameter)
#              Bareword 'say'
#          Anonymous function
#              Instruction
#                  Need
#                      Lexical variable '$twice'
#              Instruction
#                  Need
#                      Lexical variable '$message'
#              If
#                  Expression ('if' parameter)
#                      Lexical variable '$twice'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Single value [1 items]
#                              Item 0
#                                  Operation
#                                      Lexical variable '$message'
#                                      Addition operator (+)
#                                      String ' again'
#              Instruction
#                  Return pair 'didTwice'
#                      Lexical variable '$twice'
#      Instruction
#          Assignment (lexical variable '$r')
#              Call
#                  Bareword 'say'
#                  Hash [2 items]
#                      Item 0
#                          Pair 'message'
#                              String 'It was said'
#                      Item 1
#                          Pair 'twice'
#                              Boolean true
#      If
#          Expression ('if' parameter)
#              Property 'didTwice'
#                  Lexical variable '$r'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Single value [1 items]
#                      Item 0
#                          String 'Did the fi...'
#      Instruction
#          Call
#              Bareword 'say'
#              Set [2 items]
#                  Item 0
#                      String 'this shoul...'
#                  Item 1
#                      Boolean true
#      Include (Math, Math::Point)
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
$Ferret::tried_files{'hello11.frt.pm'}++;

use Ferret::Core::Operations qw(add bool num on str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    undef;
    Ferret::space( $context, 'CORE' ) or die 'CORE error';

    # Anonymous function definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, anonymous => 1 );
        $func->add_argument( name => 'twice',   type => '' );
        $func->add_argument( name => 'message', type => '' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{twice};
                $scope->set_property( twice => $arguments->{twice} );
            };
            do {
                return unless defined $arguments->{message};
                $scope->set_property( message => $arguments->{message} );
            };
            if ( bool( $scope->property_u('twice') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope,
                            $scope->property_u('message'),
                            str( $f, " again" )
                        )
                    ],
                    $scope
                );
            }
            $return->set_property( didTwice => $scope->property_u('twice') );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(Math Math::Point);
    $scope->set_property_ow( $context,
        point => $scope->property_u('Math::Point')
          ->call_u( [ num( $f, 0 ), num( $f, 0 ) ], $scope ) );
    if ( bool( $scope->property_u('point') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property_u('say')
          ->call_u( [ str( $f, "The point exists!" ) ], $scope );
        $scope->property_u('inspect')
          ->call_u( [ $scope->property_u('point') ], $scope );
    }

    # Inside
    {
        my $outer_scope = $scope;
        my $scope       = $scope->property_u('point');
        $scope->add_parent($outer_scope);

        $scope->set_property_ow( $context, x => num( $f, 5 ) );
        $scope->set_property_ow( $context, y => num( $f, 10 ) );

        $scope->remove_parent($outer_scope);
    }
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Point: " ), $scope->property_u('point') ) ],
        $scope );
    on( $scope, 'say', $self, $scope,
        $funcs[0]->inside_scope( (undef) => $scope, $scope ) );
    $scope->set_property_ow(
        $context,
        r => $scope->property_u('say')->call_u(
            { message => str( $f, "It was said" ), twice => Ferret::true },
            $scope
        )
    );
    if ( bool( $scope->property_u('r')->property_u('didTwice') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property_u('say')
          ->call_u( [ str( $f, "Did the first one twice!" ) ], $scope );
    }
    $scope->property_u('say')->call_u(
        [ str( $f, "this should ignore the second parameter" ), Ferret::true ],
        $scope
    );
};

Ferret::runtime();
