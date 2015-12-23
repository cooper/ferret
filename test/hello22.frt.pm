# === Tokenization ===
#       CLASS_DEC | {"name":"Cow"}
#          METHOD | {"main":1,"name":"_init_"}
#       CLOSURE_S | 
#    KEYWORD_WANT | 
#        VAR_THIS | "moos"
#       OP_ASSIGN | 
#    KEYWORD_TRUE | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"moo"}
#       CLOSURE_S | 
#      KEYWORD_IF | 
#        VAR_THIS | "moos"
#        OP_VALUE | 
#  KEYWORD_RETURN | 
#          STRING | ["moo"]
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#          STRING | ["I am a nonverbal cow"]
#         OP_SEMI | 
#       CLOSURE_E | 
#       CLASS_DEC | {"name":"Dog"}
#          METHOD | {"main":1,"name":"_init_"}
#       CLOSURE_S | 
#    KEYWORD_WANT | 
#        VAR_THIS | "barks"
#       OP_ASSIGN | 
#   KEYWORD_FALSE | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"bark"}
#       CLOSURE_S | 
#      KEYWORD_IF | 
#        VAR_THIS | "barks"
#        OP_VALUE | 
#  KEYWORD_RETURN | 
#          STRING | ["bark"]
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#          STRING | ["I had my bark box bred out of me"]
#         OP_SEMI | 
#       CLOSURE_E | 
#       CLASS_DEC | {"name":"Cat"}
#          METHOD | {"main":1,"name":"_init_"}
#       CLOSURE_S | 
#    KEYWORD_WANT | 
#        VAR_THIS | "mean"
#       OP_ASSIGN | 
#   KEYWORD_FALSE | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"meow"}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#          STRING | ["meow"]
#         OP_SEMI | 
#       CLOSURE_E | 
#        FUNCTION | {"name":"fight"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "cat1"
#        OP_VALUE | 
#        BAREWORD | "Cat"
#        OP_COMMA | 
#         VAR_LEX | "cat2"
#        OP_VALUE | 
#        BAREWORD | "Cat"
#         OP_SEMI | 
#      KEYWORD_IF | 
#         VAR_LEX | "cat1"
#        PROPERTY | "mean"
#        OP_VALUE | 
#  KEYWORD_RETURN | 
#          STRING | ["Cat 1 started a catfight!"]
#         OP_SEMI | 
#      KEYWORD_IF | 
#         VAR_LEX | "cat2"
#        PROPERTY | "mean"
#        OP_VALUE | 
#  KEYWORD_RETURN | 
#          STRING | ["Cat 2 started a catfight!"]
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#          STRING | ["nice cats don't fight"]
#         OP_SEMI | 
#       CLOSURE_E | 
#     KEYWORD_END | 
#         VAR_LEX | "animal"
#       OP_ASSIGN | 
#        BAREWORD | "Cow"
#      PAREN_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "Dog"
#        PROPERTY | "init"
#      PAREN_CALL | 
#         VAR_LEX | "animal"
#         PAREN_E | 
#      PAREN_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#         VAR_LEX | "animal"
#        PROPERTY | "moo"
#      PAREN_CALL | 
#         PAREN_E | 
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#         VAR_LEX | "animal"
#        PROPERTY | "bark"
#      PAREN_CALL | 
#         PAREN_E | 
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "Cat"
#        PROPERTY | "init"
#      PAREN_CALL | 
#         VAR_LEX | "animal"
#         PAREN_E | 
#      PAREN_CALL | 
#      PROP_VALUE | "mean"
#    KEYWORD_TRUE | 
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "inspect"
#      PAREN_CALL | 
#         VAR_LEX | "animal"
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "cat"
#       OP_ASSIGN | 
#        BAREWORD | "Cat"
#      PAREN_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "aftermath"
#       OP_ASSIGN | 
#         PAREN_S | 
#         VAR_LEX | "animal"
#        OP_COMMA | 
#         VAR_LEX | "cat"
#         PAREN_E | 
#        PROPERTY | "fight"
#      PAREN_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#         VAR_LEX | "aftermath"
#         PAREN_E | 
#         OP_SEMI | 
# === Document Model ===
#  Document './test/hello22.frt'
#      Class 'Cow'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@moos'
#                          Expression ('want' parameter)
#                              Boolean true
#          Method 'moo'
#              Body ('method' scope)
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@moos'
#                      Body ('if' scope)
#                          Instruction
#                              Return
#                                  String 'moo'
#                  Instruction
#                      Return
#                          String 'I am a non...'
#      Class 'Dog'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@barks'
#                          Expression ('want' parameter)
#                              Boolean false
#          Method 'bark'
#              Body ('method' scope)
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@barks'
#                      Body ('if' scope)
#                          Instruction
#                              Return
#                                  String 'bark'
#                  Instruction
#                      Return
#                          String 'I had my b...'
#      Class 'Cat'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@mean'
#                          Expression ('want' parameter)
#                              Boolean false
#          Method 'meow'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          String 'meow'
#          Class method 'fight'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$cat1'
#                          Bareword 'Cat'
#                  Instruction
#                      Need
#                          Lexical variable '$cat2'
#                          Bareword 'Cat'
#                  If
#                      Expression ('if' parameter)
#                          Property 'mean'
#                              Lexical variable '$cat1'
#                      Body ('if' scope)
#                          Instruction
#                              Return
#                                  String 'Cat 1 star...'
#                  If
#                      Expression ('if' parameter)
#                          Property 'mean'
#                              Lexical variable '$cat2'
#                      Body ('if' scope)
#                          Instruction
#                              Return
#                                  String 'Cat 2 star...'
#                  Instruction
#                      Return
#                          String 'nice cats ...'
#      Instruction
#          Assignment (lexical variable '$animal')
#              Call
#                  Bareword 'Cow'
#                  Argument list [0 items]
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Dog'
#                  Argument list [1 items]
#                      Item 0
#                          Lexical variable '$animal'
#              Argument list [0 items]
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Call
#                          Property 'moo'
#                              Lexical variable '$animal'
#                          Argument list [0 items]
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
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
#                  Argument list [1 items]
#                      Item 0
#                          Lexical variable '$animal'
#              Named argument list [1 items]
#                  Item 0
#                      Pair 'mean'
#                          Boolean true
#      Instruction
#          Call
#              Bareword 'inspect'
#              Argument list [1 items]
#                  Item 0
#                      Lexical variable '$animal'
#      Instruction
#          Assignment (lexical variable '$cat')
#              Call
#                  Bareword 'Cat'
#                  Argument list [0 items]
#      Instruction
#          Assignment (lexical variable '$aftermath')
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
#              Argument list [1 items]
#                  Item 0
#                      Lexical variable '$aftermath'
#      Include (Cat, Cow, Dog)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('hello22.frt');

use Ferret::Core::Operations qw(bool str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'Cow'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Cow', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [ { name => 'moos', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $self, $arguments, 'moos', 6.4, $true );
                return $return;
            }
        );

        # Method event 'moo' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'moo',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                if ( bool( $self->property_u('moos') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return str( $f, "moo" );
                }
                return str( $f, "I am a nonverbal cow" );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( moo => $scope, $proto, $class, undef, undef );
    }

    # Class 'Dog'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Dog', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'barks',
                    type     => undef,
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $self, $arguments, 'barks', 18.4, $false );
                return $return;
            }
        );

        # Method event 'bark' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'bark',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                if ( bool( $self->property_u('barks') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return str( $f, "bark" );
                }
                return str( $f, "I had my bark box bred out of me" );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( bark => $scope, $proto, $class, undef, undef );
    }

    # Class 'Cat'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Cat', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [ { name => 'mean', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $self, $arguments, 'mean', 30.4, $false );
                return $return;
            }
        );

        # Method event 'meow' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'meow',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return str( $f, "meow" );
                return $return;
            }
        );

        # Method event 'fight' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'fight',
            [
                {
                    name     => 'cat1',
                    type     => 'Cat',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'cat2',
                    type     => 'Cat',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'cat1', 39.22222 ) or return;
                FF::need( $scope, $arguments, 'cat2', 39.66667 ) or return;
                if ( bool( $scope->property_u('cat1')->property_u('mean') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return str( $f, "Cat 1 started a catfight!" );
                }
                if ( bool( $scope->property_u('cat2')->property_u('mean') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return str( $f, "Cat 2 started a catfight!" );
                }
                return str( $f, "nice cats don't fight" );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( meow => $scope, $proto, $class, undef, undef );
        $method_2->inside_scope(
            fight => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Cat Cow Dog) );
    $scope->set_property_ow(
        $context,
        animal =>
          $scope->property_u('Cow')->call_u( {}, $scope, undef, 58.66667 ),
        58.33333
    );
    $scope->property_u('Dog')->property_u('init')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 60.375 )
      ->call_u( {}, $scope, undef, 60.75 );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('animal')->property_u('moo')
              ->call_u( {}, $scope, undef, 62.625 )
        ],
        $scope, undef, 62.25
    );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('animal')->property_u('bark')
              ->call_u( {}, $scope, undef, 63.625 )
        ],
        $scope, undef, 63.25
    );
    $scope->property_u('Cat')->property_u('init')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 65.3 )
      ->call_u( { mean => $true }, $scope, undef, 65.6 );
    $scope->property_u('inspect')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 67.4 );
    $scope->set_property_ow(
        $context,
        cat => $scope->property_u('Cat')->call_u( {}, $scope, undef, 69.66667 ),
        69.33333
    );
    $scope->set_property_ow(
        $context,
        aftermath => FF::create_set(
            $scope,
            $scope->property_u('animal'),
            $scope->property_u('cat')
          )->property_u('fight')->call_u( {}, $scope, undef, 71.81818 ),
        71.18182
    );
    $scope->property_u('say')
      ->call_u( [ $scope->property_u('aftermath') ], $scope, undef, 72.4 );
};

FF::after_content();
