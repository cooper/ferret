# === Document Model ===
#  Document './test/22-classes-sets.frt'
#      Class 'Cow'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Want
#                          Instance variable '@moos'
#                          Argument value
#                              Boolean true
#          Method 'moo'
#              Function body
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@moos'
#                      If body
#                          Instruction
#                              Return
#                                  String 'moo'
#                  Instruction
#                      Return
#                          String 'I am a non...'
#      Class 'Dog'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Want
#                          Instance variable '@barks'
#                          Argument value
#                              Boolean false
#          Method 'bark'
#              Function body
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@barks'
#                      If body
#                          Instruction
#                              Return
#                                  String 'bark'
#                  Instruction
#                      Return
#                          String 'I had my b...'
#      Class 'Cat'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Want
#                          Instance variable '@mean'
#                          Argument value
#                              Boolean false
#          Method 'meow'
#              Function body
#                  Instruction
#                      Return
#                          String 'meow'
#          Class method 'fight'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$cat1'
#                          Argument type
#                              Bareword 'Cat'
#                  Instruction
#                      Need
#                          Lexical variable '$cat2'
#                          Argument type
#                              Bareword 'Cat'
#                  If
#                      Expression ('if' parameter)
#                          Property 'mean'
#                              Lexical variable '$cat1'
#                      If body
#                          Instruction
#                              Return
#                                  String 'Cat 1 star...'
#                  If
#                      Expression ('if' parameter)
#                          Property 'mean'
#                              Lexical variable '$cat2'
#                      If body
#                          Instruction
#                              Return
#                                  String 'Cat 2 star...'
#                  Instruction
#                      Return
#                          String 'nice cats ...'
#      Instruction
#          Assignment
#              Lexical variable '$animal'
#              Call
#                  Bareword 'Cow'
#                  Argument list [0 items]
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Dog'
#                  Argument list [1 item]
#                      Item 0
#                          Lexical variable '$animal'
#              Argument list [0 items]
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 item]
#                  Item 0
#                      Call
#                          Property 'moo'
#                              Lexical variable '$animal'
#                          Argument list [0 items]
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 item]
#                  Item 0
#                      Call
#                          Property 'bark'
#                              Lexical variable '$animal'
#                          Argument list [0 items]
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Cat'
#                  Argument list [1 item]
#                      Item 0
#                          Lexical variable '$animal'
#              Named argument list [1 item]
#                  Item 0
#                      Pair 'mean'
#                          Boolean true
#      Instruction
#          Call
#              Bareword 'inspect'
#              Argument list [1 item]
#                  Item 0
#                      Lexical variable '$animal'
#      Instruction
#          Assignment
#              Lexical variable '$cat'
#              Call
#                  Bareword 'Cat'
#                  Argument list [0 items]
#      Instruction
#          Assignment
#              Lexical variable '$aftermath'
#              Call
#                  Property 'fight'
#                      Set [2 items]
#                          Item 0
#                              Lexical variable '$animal'
#                          Item 1
#                              Lexical variable '$cat'
#                  Argument list [0 items]
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 item]
#                  Item 0
#                      Lexical variable '$aftermath'
#      Include (Cat, Cow, Dog)
package FF;

use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $pos = before_content( '22-classes-sets.frt', './test/22-classes-sets.frt' );

use Ferret::Core::Operations qw(bool str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Cow'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Cow', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'moo' definition
        my $func_1 = method_event_def( $f, $scope, 'moo' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            moo => $scope,
            $proto, $class, $ins, undef, undef
        );
    }

    # Class 'Dog'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Dog', undef, undef );

        # Method event 'initializer__' definition
        my $func_2 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'bark' definition
        my $func_3 = method_event_def( $f, $scope, 'bark' );
        $func_2->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            bark => $scope,
            $proto, $class, $ins, undef, undef
        );
    }

    # Class 'Cat'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Cat', undef, undef );

        # Method event 'initializer__' definition
        my $func_4 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'meow' definition
        my $func_5 = method_event_def( $f, $scope, 'meow' );

        # Method event 'fight' definition
        my $func_6 = method_event_def( $f, $scope, 'fight' );
        $func_4->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_5->inside_scope(
            meow => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            fight => $scope,
            $class, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Cat Cow Dog) );
    var(
        $scope,
        animal =>
          $$scope->{'Cow'}->( [ undef, [] ], $scope, undef, $pos->(50.4) ),
        undef, $pos->(50.2)
    );
    $$scope->{'Dog'}->property_u( 'init', $pos->(53.2) )
      ->( [ $$scope->{'animal'} ], $scope, undef, $pos->(53.3) )
      ->( [ undef, [] ], $scope, undef, $pos->(53.6) );
    $$scope->{'say'}->(
        [
            $$scope->{'animal'}->property_u( 'moo', $pos->(56.4) )
              ->( [ undef, [] ], $scope, undef, $pos->(56.5) )
        ],
        $scope, undef,
        $pos->(56.2)
    );
    $$scope->{'say'}->(
        [
            $$scope->{'animal'}->property_u( 'bark', $pos->(57.4) )
              ->( [ undef, [] ], $scope, undef, $pos->(57.5) )
        ],
        $scope, undef,
        $pos->(57.2)
    );
    $$scope->{'Cat'}->property_u( 'init', $pos->(60.1) )
      ->( [ $$scope->{'animal'} ], $scope, undef, $pos->(60.15) )
      ->( [ undef, [ mean => $true ] ], $scope, undef, $pos->(60.3) );
    $$scope->{'inspect'}
      ->( [ $$scope->{'animal'} ], $scope, undef, $pos->(62.2) );
    var(
        $scope,
        cat => $$scope->{'Cat'}->( [ undef, [] ], $scope, undef, $pos->(65.4) ),
        undef, $pos->(65.2)
    );
    var(
        $scope,
        aftermath => create_set( $scope, $$scope->{'animal'}, $$scope->{'cat'} )
          ->property_u( 'fight', $pos->(71.4) )
          ->( [ undef, [] ], $scope, undef, $pos->(71.45) ),
        undef, $pos->(71.1)
    );
    $$scope->{'say'}
      ->( [ $$scope->{'aftermath'} ], $scope, undef, $pos->(72.2) );
};

after_content();
