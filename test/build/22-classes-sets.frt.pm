# === Document Model ===
#  Document './test/22-classes-sets.frt'
#      Class 'Cow'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@moos'
#                          Argument value
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
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@barks'
#                          Argument value
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
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@mean'
#                          Argument value
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
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

my $pos =
  FF::before_content( '22-classes-sets.frt', './test/22-classes-sets.frt' );

use Ferret::Core::Operations qw(bool str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'Cow'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Cow', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [ { name => 'moos', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $self, $args, 'moos', 6.2, $true );
                return $ret;
            }
        );

        # Method event 'moo' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'moo',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                if ( bool( $$self->{'moos'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( str( $f, "moo" ) );
                }
                return $ret_func->( str( $f, "I am a nonverbal cow" ) );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( moo => $scope, $proto, $class, undef, undef );
    }

    # Class 'Dog'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Dog', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'barks',
                    type     => undef,
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $self, $args, 'barks', 18.2, $false );
                return $ret;
            }
        );

        # Method event 'bark' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'bark',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                if ( bool( $$self->{'barks'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( str( $f, "bark" ) );
                }
                return $ret_func->(
                    str( $f, "I had my bark box bred out of me" ) );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( bark => $scope, $proto, $class, undef, undef );
    }

    # Class 'Cat'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Cat', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [ { name => 'mean', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $self, $args, 'mean', 30.2, $false );
                return $ret;
            }
        );

        # Method event 'meow' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'meow',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return $ret_func->( str( $f, "meow" ) );
                return $ret;
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'cat1', 39.1 ) or return;
                FF::need( $scope, $args, 'cat2', 39.3 ) or return;
                if ( bool( ${ $$scope->{'cat1'} }->{'mean'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        str( $f, "Cat 1 started a catfight!" ) );
                }
                if ( bool( ${ $$scope->{'cat2'} }->{'mean'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        str( $f, "Cat 2 started a catfight!" ) );
                }
                return $ret_func->( str( $f, "nice cats don't fight" ) );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( meow => $scope, $proto, $class, undef, undef );
        $method_2->inside_scope(
            fight => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Cat Cow Dog) );
    FF::lex_assign(
        $scope,
        animal =>
          $$scope->{'Cow'}->( [ undef, [] ], $scope, undef, $pos->(50.4) ),
        undef, $pos->(50.2)
    );
    ${ $$scope->{'Dog'} }->{'init'}
      ->( [ $$scope->{'animal'} ], $scope, undef, $pos->(53.3) )
      ->( [ undef, [] ], $scope, undef, $pos->(53.6) );
    $$scope->{'say'}->(
        [
            ${ $$scope->{'animal'} }->{'moo'}
              ->( [ undef, [] ], $scope, undef, $pos->(56.5) )
        ],
        $scope, undef,
        $pos->(56.2)
    );
    $$scope->{'say'}->(
        [
            ${ $$scope->{'animal'} }->{'bark'}
              ->( [ undef, [] ], $scope, undef, $pos->(57.5) )
        ],
        $scope, undef,
        $pos->(57.2)
    );
    ${ $$scope->{'Cat'} }->{'init'}
      ->( [ $$scope->{'animal'} ], $scope, undef, $pos->(60.15) )
      ->( [ undef, [ mean => $true ] ], $scope, undef, $pos->(60.3) );
    $$scope->{'inspect'}
      ->( [ $$scope->{'animal'} ], $scope, undef, $pos->(62.2) );
    FF::lex_assign(
        $scope,
        cat => $$scope->{'Cat'}->( [ undef, [] ], $scope, undef, $pos->(65.4) ),
        undef, $pos->(65.2)
    );
    FF::lex_assign(
        $scope,
        aftermath =>
          ${ FF::create_set( $scope, $$scope->{'animal'}, $$scope->{'cat'} ) }
          ->{'fight'}->( [ undef, [] ], $scope, undef, $pos->(71.45) ),
        undef, $pos->(71.1)
    );
    $$scope->{'say'}
      ->( [ $$scope->{'aftermath'} ], $scope, undef, $pos->(72.2) );
};

FF::after_content();
