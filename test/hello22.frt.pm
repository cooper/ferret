# === Tokenization ===
#       CLASS_DEC |                 {"name":"Cow"} | 3.1
#          METHOD |     {"main":1,"name":"_init_"} | 5.1
#       CLOSURE_S |                                | 5.2
#    KEYWORD_WANT |                                | 6.1
#        VAR_THIS |                         "moos" | 6.2
#       OP_ASSIGN |                                | 6.3
#    KEYWORD_TRUE |                                | 6.4
#         OP_SEMI |                              1 | 6.5
#       CLOSURE_E |                                | 7.1
#          METHOD |                 {"name":"moo"} | 9.1
#       CLOSURE_S |                                | 9.2
#      KEYWORD_IF |                                | 10.1
#        VAR_THIS |                         "moos" | 10.2
#        OP_VALUE |                                | 10.3
#  KEYWORD_RETURN |                                | 11.1
#          STRING |                        ["moo"] | 11.2
#         OP_SEMI |                              1 | 11.3
#  KEYWORD_RETURN |                                | 12.1
#          STRING |       ["I am a nonverbal cow"] | 12.2
#         OP_SEMI |                              1 | 12.3
#       CLOSURE_E |                                | 13.1
#       CLASS_DEC |                 {"name":"Dog"} | 15.1
#          METHOD |     {"main":1,"name":"_init_"} | 17.1
#       CLOSURE_S |                                | 17.2
#    KEYWORD_WANT |                                | 18.1
#        VAR_THIS |                        "barks" | 18.2
#       OP_ASSIGN |                                | 18.3
#   KEYWORD_FALSE |                                | 18.4
#         OP_SEMI |                              1 | 18.5
#       CLOSURE_E |                                | 19.1
#          METHOD |                {"name":"bark"} | 21.1
#       CLOSURE_S |                                | 21.2
#      KEYWORD_IF |                                | 22.1
#        VAR_THIS |                        "barks" | 22.2
#        OP_VALUE |                                | 22.3
#  KEYWORD_RETURN |                                | 23.1
#          STRING |                       ["bark"] | 23.2
#         OP_SEMI |                              1 | 23.3
#  KEYWORD_RETURN |                                | 24.1
#          STRING | ["I had my bark box bred out of me"] | 24.2
#         OP_SEMI |                              1 | 24.3
#       CLOSURE_E |                                | 25.1
#       CLASS_DEC |                 {"name":"Cat"} | 27.1
#          METHOD |     {"name":"_init_","main":1} | 29.1
#       CLOSURE_S |                                | 29.2
#    KEYWORD_WANT |                                | 30.1
#        VAR_THIS |                         "mean" | 30.2
#       OP_ASSIGN |                                | 30.3
#   KEYWORD_FALSE |                                | 30.4
#         OP_SEMI |                              1 | 30.5
#       CLOSURE_E |                                | 31.1
#          METHOD |                {"name":"meow"} | 33.1
#       CLOSURE_S |                                | 33.2
#  KEYWORD_RETURN |                                | 34.1
#          STRING |                       ["meow"] | 34.2
#         OP_SEMI |                              1 | 34.3
#       CLOSURE_E |                                | 35.1
#        FUNCTION |               {"name":"fight"} | 38.1
#       CLOSURE_S |                                | 38.2
#    KEYWORD_NEED |                                | 39.05
#         VAR_LEX |                         "cat1" | 39.1
#        OP_VALUE |                                | 39.15
#        BAREWORD |                          "Cat" | 39.2
#        OP_COMMA |                                | 39.25
#         VAR_LEX |                         "cat2" | 39.3
#        OP_VALUE |                                | 39.35
#        BAREWORD |                          "Cat" | 39.4
#         OP_SEMI |                              1 | 39.45
#      KEYWORD_IF |                                | 40.1
#         VAR_LEX |                         "cat1" | 40.2
#        PROPERTY |                         "mean" | 40.3
#        OP_VALUE |                                | 40.4
#  KEYWORD_RETURN |                                | 41.1
#          STRING |  ["Cat 1 started a catfight!"] | 41.2
#         OP_SEMI |                              1 | 41.3
#      KEYWORD_IF |                                | 42.1
#         VAR_LEX |                         "cat2" | 42.2
#        PROPERTY |                         "mean" | 42.3
#        OP_VALUE |                                | 42.4
#  KEYWORD_RETURN |                                | 43.1
#          STRING |  ["Cat 2 started a catfight!"] | 43.2
#         OP_SEMI |                              1 | 43.3
#  KEYWORD_RETURN |                                | 44.1
#          STRING |      ["nice cats don't fight"] | 44.2
#         OP_SEMI |                              1 | 44.3
#       CLOSURE_E |                                | 45.1
#     KEYWORD_END |                                | 47.1
#         VAR_LEX |                       "animal" | 50.1
#       OP_ASSIGN |                                | 50.2
#        BAREWORD |                          "Cow" | 50.3
#      PAREN_CALL |                                | 50.4
#         PAREN_E |                                | 50.5
#         OP_SEMI |                              1 | 50.6
#        BAREWORD |                          "Dog" | 53.1
#        PROPERTY |                         "init" | 53.2
#      PAREN_CALL |                                | 53.3
#         VAR_LEX |                       "animal" | 53.4
#         PAREN_E |                                | 53.5
#      PAREN_CALL |                                | 53.6
#         PAREN_E |                                | 53.7
#         OP_SEMI |                              1 | 53.8
#        BAREWORD |                          "say" | 56.1
#      PAREN_CALL |                                | 56.2
#         VAR_LEX |                       "animal" | 56.3
#        PROPERTY |                          "moo" | 56.4
#      PAREN_CALL |                                | 56.5
#         PAREN_E |                                | 56.6
#         PAREN_E |                                | 56.7
#         OP_SEMI |                              1 | 56.8
#        BAREWORD |                          "say" | 57.1
#      PAREN_CALL |                                | 57.2
#         VAR_LEX |                       "animal" | 57.3
#        PROPERTY |                         "bark" | 57.4
#      PAREN_CALL |                                | 57.5
#         PAREN_E |                                | 57.6
#         PAREN_E |                                | 57.7
#         OP_SEMI |                              1 | 57.8
#        BAREWORD |                          "Cat" | 60.05
#        PROPERTY |                         "init" | 60.1
#      PAREN_CALL |                                | 60.15
#         VAR_LEX |                       "animal" | 60.2
#         PAREN_E |                                | 60.25
#      PAREN_CALL |                                | 60.3
#      PROP_VALUE |                         "mean" | 60.35
#    KEYWORD_TRUE |                                | 60.4
#         PAREN_E |                                | 60.45
#         OP_SEMI |                              1 | 60.5
#        BAREWORD |                      "inspect" | 62.1
#      PAREN_CALL |                                | 62.2
#         VAR_LEX |                       "animal" | 62.3
#         PAREN_E |                                | 62.4
#         OP_SEMI |                              1 | 62.5
#         VAR_LEX |                          "cat" | 65.1
#       OP_ASSIGN |                                | 65.2
#        BAREWORD |                          "Cat" | 65.3
#      PAREN_CALL |                                | 65.4
#         PAREN_E |                                | 65.5
#         OP_SEMI |                              1 | 65.6
#         VAR_LEX |                    "aftermath" | 71.05
#       OP_ASSIGN |                                | 71.1
#         PAREN_S |                                | 71.15
#         VAR_LEX |                       "animal" | 71.2
#        OP_COMMA |                                | 71.25
#         VAR_LEX |                          "cat" | 71.3
#         PAREN_E |                                | 71.35
#        PROPERTY |                        "fight" | 71.4
#      PAREN_CALL |                                | 71.45
#         PAREN_E |                                | 71.5
#         OP_SEMI |                              1 | 71.55
#        BAREWORD |                          "say" | 72.1
#      PAREN_CALL |                                | 72.2
#         VAR_LEX |                    "aftermath" | 72.3
#         PAREN_E |                                | 72.4
#         OP_SEMI |                              1 | 72.5
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
                FF::want( $self, $arguments, 'moos', 6.2, $true );
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
                FF::want( $self, $arguments, 'barks', 18.2, $false );
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
                FF::want( $self, $arguments, 'mean', 30.2, $false );
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
                FF::need( $scope, $arguments, 'cat1', 39.1 ) or return;
                FF::need( $scope, $arguments, 'cat2', 39.3 ) or return;
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
        animal => $scope->property_u('Cow')->call_u( {}, $scope, undef, 50.4 ),
        50.2
    );
    $scope->property_u('Dog')->property_u('init')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 53.3 )
      ->call_u( {}, $scope, undef, 53.6 );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('animal')->property_u('moo')
              ->call_u( {}, $scope, undef, 56.5 )
        ],
        $scope, undef, 56.2
    );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('animal')->property_u('bark')
              ->call_u( {}, $scope, undef, 57.5 )
        ],
        $scope, undef, 57.2
    );
    $scope->property_u('Cat')->property_u('init')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 60.15 )
      ->call_u( { mean => $true }, $scope, undef, 60.3 );
    $scope->property_u('inspect')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 62.2 );
    $scope->set_property_ow(
        $context,
        cat => $scope->property_u('Cat')->call_u( {}, $scope, undef, 65.4 ),
        65.2
    );
    $scope->set_property_ow(
        $context,
        aftermath => FF::create_set(
            $scope,
            $scope->property_u('animal'),
            $scope->property_u('cat')
          )->property_u('fight')->call_u( {}, $scope, undef, 71.45 ),
        71.1
    );
    $scope->property_u('say')
      ->call_u( [ $scope->property_u('aftermath') ], $scope, undef, 72.2 );
};

FF::after_content();
