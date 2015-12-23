# === Tokenization ===
#       CLASS_DEC |                 {"name":"Cow"} | 3.5
#          METHOD |     {"main":1,"name":"_init_"} | 5.33333
#       CLOSURE_S |                                | 5.66667
#    KEYWORD_WANT |                                | 6.16667
#        VAR_THIS |                         "moos" | 6.33333
#       OP_ASSIGN |                                | 6.5
#    KEYWORD_TRUE |                                | 6.66667
#         OP_SEMI |                              1 | 6.83333
#       CLOSURE_E |                                | 7.5
#          METHOD |                 {"name":"moo"} | 9.33333
#       CLOSURE_S |                                | 9.66667
#      KEYWORD_IF |                                | 10.25
#        VAR_THIS |                         "moos" | 10.5
#        OP_VALUE |                                | 10.75
#  KEYWORD_RETURN |                                | 11.25
#          STRING |                        ["moo"] | 11.5
#         OP_SEMI |                              1 | 11.75
#  KEYWORD_RETURN |                                | 12.25
#          STRING |       ["I am a nonverbal cow"] | 12.5
#         OP_SEMI |                              1 | 12.75
#       CLOSURE_E |                                | 13.5
#       CLASS_DEC |                 {"name":"Dog"} | 15.5
#          METHOD |     {"main":1,"name":"_init_"} | 17.33333
#       CLOSURE_S |                                | 17.66667
#    KEYWORD_WANT |                                | 18.16667
#        VAR_THIS |                        "barks" | 18.33333
#       OP_ASSIGN |                                | 18.5
#   KEYWORD_FALSE |                                | 18.66667
#         OP_SEMI |                              1 | 18.83333
#       CLOSURE_E |                                | 19.5
#          METHOD |                {"name":"bark"} | 21.33333
#       CLOSURE_S |                                | 21.66667
#      KEYWORD_IF |                                | 22.25
#        VAR_THIS |                        "barks" | 22.5
#        OP_VALUE |                                | 22.75
#  KEYWORD_RETURN |                                | 23.25
#          STRING |                       ["bark"] | 23.5
#         OP_SEMI |                              1 | 23.75
#  KEYWORD_RETURN |                                | 24.25
#          STRING | ["I had my bark box bred out of me"] | 24.5
#         OP_SEMI |                              1 | 24.75
#       CLOSURE_E |                                | 25.5
#       CLASS_DEC |                 {"name":"Cat"} | 27.5
#          METHOD |     {"name":"_init_","main":1} | 29.33333
#       CLOSURE_S |                                | 29.66667
#    KEYWORD_WANT |                                | 30.16667
#        VAR_THIS |                         "mean" | 30.33333
#       OP_ASSIGN |                                | 30.5
#   KEYWORD_FALSE |                                | 30.66667
#         OP_SEMI |                              1 | 30.83333
#       CLOSURE_E |                                | 31.5
#          METHOD |                {"name":"meow"} | 33.33333
#       CLOSURE_S |                                | 33.66667
#  KEYWORD_RETURN |                                | 34.25
#          STRING |                       ["meow"] | 34.5
#         OP_SEMI |                              1 | 34.75
#       CLOSURE_E |                                | 35.5
#        FUNCTION |               {"name":"fight"} | 38.33333
#       CLOSURE_S |                                | 38.66667
#    KEYWORD_NEED |                                | 39.1
#         VAR_LEX |                         "cat1" | 39.2
#        OP_VALUE |                                | 39.3
#        BAREWORD |                          "Cat" | 39.4
#        OP_COMMA |                                | 39.5
#         VAR_LEX |                         "cat2" | 39.6
#        OP_VALUE |                                | 39.7
#        BAREWORD |                          "Cat" | 39.8
#         OP_SEMI |                              1 | 39.9
#      KEYWORD_IF |                                | 40.2
#         VAR_LEX |                         "cat1" | 40.4
#        PROPERTY |                         "mean" | 40.6
#        OP_VALUE |                                | 40.8
#  KEYWORD_RETURN |                                | 41.25
#          STRING |  ["Cat 1 started a catfight!"] | 41.5
#         OP_SEMI |                              1 | 41.75
#      KEYWORD_IF |                                | 42.2
#         VAR_LEX |                         "cat2" | 42.4
#        PROPERTY |                         "mean" | 42.6
#        OP_VALUE |                                | 42.8
#  KEYWORD_RETURN |                                | 43.25
#          STRING |  ["Cat 2 started a catfight!"] | 43.5
#         OP_SEMI |                              1 | 43.75
#  KEYWORD_RETURN |                                | 44.25
#          STRING |      ["nice cats don't fight"] | 44.5
#         OP_SEMI |                              1 | 44.75
#       CLOSURE_E |                                | 45.5
#     KEYWORD_END |                                | 47.5
#         VAR_LEX |                       "animal" | 50.14286
#       OP_ASSIGN |                                | 50.28571
#        BAREWORD |                          "Cow" | 50.42857
#      PAREN_CALL |                                | 50.57143
#         PAREN_E |                                | 50.71429
#         OP_SEMI |                              1 | 50.85714
#        BAREWORD |                          "Dog" | 53.11111
#        PROPERTY |                         "init" | 53.22222
#      PAREN_CALL |                                | 53.33333
#         VAR_LEX |                       "animal" | 53.44444
#         PAREN_E |                                | 53.55556
#      PAREN_CALL |                                | 53.66667
#         PAREN_E |                                | 53.77778
#         OP_SEMI |                              1 | 53.88889
#        BAREWORD |                          "say" | 56.11111
#      PAREN_CALL |                                | 56.22222
#         VAR_LEX |                       "animal" | 56.33333
#        PROPERTY |                          "moo" | 56.44444
#      PAREN_CALL |                                | 56.55556
#         PAREN_E |                                | 56.66667
#         PAREN_E |                                | 56.77778
#         OP_SEMI |                              1 | 56.88889
#        BAREWORD |                          "say" | 57.11111
#      PAREN_CALL |                                | 57.22222
#         VAR_LEX |                       "animal" | 57.33333
#        PROPERTY |                         "bark" | 57.44444
#      PAREN_CALL |                                | 57.55556
#         PAREN_E |                                | 57.66667
#         PAREN_E |                                | 57.77778
#         OP_SEMI |                              1 | 57.88889
#        BAREWORD |                          "Cat" | 60.09091
#        PROPERTY |                         "init" | 60.18182
#      PAREN_CALL |                                | 60.27273
#         VAR_LEX |                       "animal" | 60.36364
#         PAREN_E |                                | 60.45455
#      PAREN_CALL |                                | 60.54545
#      PROP_VALUE |                         "mean" | 60.63636
#    KEYWORD_TRUE |                                | 60.72727
#         PAREN_E |                                | 60.81818
#         OP_SEMI |                              1 | 60.90909
#        BAREWORD |                      "inspect" | 62.16667
#      PAREN_CALL |                                | 62.33333
#         VAR_LEX |                       "animal" | 62.5
#         PAREN_E |                                | 62.66667
#         OP_SEMI |                              1 | 62.83333
#         VAR_LEX |                          "cat" | 65.14286
#       OP_ASSIGN |                                | 65.28571
#        BAREWORD |                          "Cat" | 65.42857
#      PAREN_CALL |                                | 65.57143
#         PAREN_E |                                | 65.71429
#         OP_SEMI |                              1 | 65.85714
#         VAR_LEX |                    "aftermath" | 71.08333
#       OP_ASSIGN |                                | 71.16667
#         PAREN_S |                                | 71.25
#         VAR_LEX |                       "animal" | 71.33333
#        OP_COMMA |                                | 71.41667
#         VAR_LEX |                          "cat" | 71.5
#         PAREN_E |                                | 71.58333
#        PROPERTY |                        "fight" | 71.66667
#      PAREN_CALL |                                | 71.75
#         PAREN_E |                                | 71.83333
#         OP_SEMI |                              1 | 71.91667
#        BAREWORD |                          "say" | 72.16667
#      PAREN_CALL |                                | 72.33333
#         VAR_LEX |                    "aftermath" | 72.5
#         PAREN_E |                                | 72.66667
#         OP_SEMI |                              1 | 72.83333
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
                FF::want( $self, $arguments, 'moos', 6.33333, $true );
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
                FF::want( $self, $arguments, 'barks', 18.33333, $false );
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
                FF::want( $self, $arguments, 'mean', 30.33333, $false );
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
                FF::need( $scope, $arguments, 'cat1', 39.2 ) or return;
                FF::need( $scope, $arguments, 'cat2', 39.6 ) or return;
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
          $scope->property_u('Cow')->call_u( {}, $scope, undef, 50.57143 ),
        50.28571
    );
    $scope->property_u('Dog')->property_u('init')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 53.33333 )
      ->call_u( {}, $scope, undef, 53.66667 );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('animal')->property_u('moo')
              ->call_u( {}, $scope, undef, 56.55556 )
        ],
        $scope, undef, 56.22222
    );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('animal')->property_u('bark')
              ->call_u( {}, $scope, undef, 57.55556 )
        ],
        $scope, undef, 57.22222
    );
    $scope->property_u('Cat')->property_u('init')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 60.27273 )
      ->call_u( { mean => $true }, $scope, undef, 60.54545 );
    $scope->property_u('inspect')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 62.33333 );
    $scope->set_property_ow(
        $context,
        cat => $scope->property_u('Cat')->call_u( {}, $scope, undef, 65.57143 ),
        65.28571
    );
    $scope->set_property_ow(
        $context,
        aftermath => FF::create_set(
            $scope,
            $scope->property_u('animal'),
            $scope->property_u('cat')
          )->property_u('fight')->call_u( {}, $scope, undef, 71.75 ),
        71.16667
    );
    $scope->property_u('say')
      ->call_u( [ $scope->property_u('aftermath') ], $scope, undef, 72.33333 );
};

FF::after_content();
