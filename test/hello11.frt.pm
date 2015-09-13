# --- DOM ---
#  Document './test/hello11.frt'
#      Instruction
#          Assignment
#              Lexical variable '$point'
#              Call
#                  Bareword 'Math::Point'
#                  Structural list [2 items]
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
#                  Structural list [1 items]
#                      Item 0
#                          String 'The point ...'
#          Instruction
#              Call
#                  Bareword 'dump'
#                  Structural list [1 items]
#                      Item 0
#                          Lexical variable '$point'
#      Inside
#          Expression ('inside' parameter)
#              Lexical variable '$point'
#          Instruction
#              Assignment
#                  Lexical variable '$x'
#                  Number '5'
#          Instruction
#              Assignment
#                  Lexical variable '$y'
#                  Number '10'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Mathematical operation
#                          String 'Point: '
#                          Addition operator (+)
#                          Call
#                              Property 'pretty'
#                                  Lexical variable '$point'
#      On
#          Expression ('on' parameter)
#              Bareword 'say'
#          Function 'callback'
#              Instruction
#                  Need
#                      Lexical variable '$twice'
#                      Comma (,)
#                      Lexical variable '$message'
#              If
#                  Expression ('if' parameter)
#                      Lexical variable '$twice'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Structural list [1 items]
#                              Item 0
#                                  Mathematical operation
#                                      Lexical variable '$message'
#                                      Addition operator (+)
#                                      String ' again'
#              Instruction
#                  Return pair 'didTwice'
#                      Lexical variable '$twice'
#      Instruction
#          Assignment
#              Lexical variable '$r'
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
#                  Structural list [1 items]
#                      Item 0
#                          String 'Did the fi...'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [2 items]
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
    my $libs = do '/etc/ferret.conf';
    ref $libs eq 'ARRAY' or die "config error";
    unshift @INC, @$libs;
}

use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello11.frt.pm'}++;

use Ferret::Core::Operations qw(add bool num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    # Function '+undef' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => '+undef' );
        $func->add_argument( name => 'twice' );
        $func->add_argument( name => 'message' );
        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            do {
                return if not defined $arguments->{twice};
                $scope->set_property( twice => $arguments->{twice} );
            };
            do {
                return if not defined $arguments->{message};
                $scope->set_property( message => $arguments->{message} );
            };
            if ( bool( $scope->property('twice') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property('say')->call(
                    [
                        add(
                            $scope, $scope->property('message'),
                            str( $f, " again" )
                        )
                    ],
                    $scope
                );
            }
            $return->set_property( didTwice => $scope->property('twice') );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(Math Math::Point);
    $scope->set_property( point => $scope->property('Math::Point')
          ->call( [ num( $f, 0 ), num( $f, 0 ) ], $scope ) );
    if ( bool( $scope->property('point') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property('say')
          ->call( [ str( $f, "The point exists!" ) ], $scope );
        $scope->property('dump')->call( [ $scope->property('point') ], $scope );
    }

    # Inside
    {
        my $outer_scope = $scope;
        my $scope       = $scope->property('point');
        $scope->add_parent($outer_scope);

        $scope->set_property( x => num( $f, 5 ) );
        $scope->set_property( y => num( $f, 10 ) );

        $scope->remove_parent($outer_scope);
    }
    $scope->property('say')->call(
        [
            add(
                $scope,
                str( $f, "Point: " ),
                $scope->property('point')->property('pretty')
                  ->call( [], $scope )
            )
        ],
        $scope
    );

    # On
    {
        my $on_func =
          do { $funcs[0]->inside_scope( +undef => $scope, $scope ); };
        $scope->property('say')->add_function($on_func);
    }
    $scope->set_property(
        r => $scope->property('say')->call(
            { message => str( $f, "It was said" ), twice => Ferret::true },
            $scope
        )
    );
    if ( bool( $scope->property('r')->property('didTwice') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property('say')
          ->call( [ str( $f, "Did the first one twice!" ) ], $scope );
    }
    $scope->property('say')->call(
        [ str( $f, "this should ignore the second parameter" ), Ferret::true ],
        $scope
    );
}

Ferret::runtime();
