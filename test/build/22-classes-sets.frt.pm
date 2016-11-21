# === Document Model ===
#  Document './test/22-classes-sets.frt'
#      Class 'Cow'
#          Class method 'initializer__'
#              Body ('function' scope)
#                  Instruction
#                      Want
#                          Instance variable '@moos'
#                          Argument value
#                              Boolean true
#          Method 'moo'
#              Body ('function' scope)
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
#              Body ('function' scope)
#                  Instruction
#                      Want
#                          Instance variable '@barks'
#                          Argument value
#                              Boolean false
#          Method 'bark'
#              Body ('function' scope)
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
#              Body ('function' scope)
#                  Instruction
#                      Want
#                          Instance variable '@mean'
#                          Argument value
#                              Boolean false
#          Method 'meow'
#              Body ('function' scope)
#                  Instruction
#                      Return
#                          String 'meow'
#          Class method 'fight'
#              Body ('function' scope)
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
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [ { name => 'moos', type => undef, optional => 1, more => undef } ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $self, $args, 'moos', 6.2, $true );
                return $ret;
            }
        );

        # Method event 'moo' definition
        my $func_1 = method_event_def(
            $f, $scope, 'moo', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                if ( bool( $$self->{'moos'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( str( $f, "moo" ) );
                }
                return $ret_func->( str( $f, "I am a nonverbal cow" ) );
                return $ret;
            }
        );
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
        my $func_2 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $self, $args, 'barks', 18.2, $false );
                return $ret;
            }
        );

        # Method event 'bark' definition
        my $func_3 = method_event_def(
            $f, $scope, 'bark', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                if ( bool( $$self->{'barks'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( str( $f, "bark" ) );
                }
                return $ret_func->(
                    str( $f, "I had my bark box bred out of me" ) );
                return $ret;
            }
        );
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
        my $func_4 = method_event_def(
            $f, $scope,
            'initializer__',
            [ { name => 'mean', type => undef, optional => 1, more => undef } ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $self, $args, 'mean', 30.2, $false );
                return $ret;
            }
        );

        # Method event 'meow' definition
        my $func_5 = method_event_def(
            $f, $scope, 'meow', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( str( $f, "meow" ) );
                return $ret;
            }
        );

        # Method event 'fight' definition
        my $func_6 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'cat1', 39.1 ) || return;
                need( $scope, $args, 'cat2', 39.3 ) || return;
                if (
                    bool(
                        $$scope->{'cat1'}->property_u( 'mean', $pos->(40.3) )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        str( $f, "Cat 1 started a catfight!" ) );
                }
                if (
                    bool(
                        $$scope->{'cat2'}->property_u( 'mean', $pos->(42.3) )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        str( $f, "Cat 2 started a catfight!" ) );
                }
                return $ret_func->( str( $f, "nice cats don't fight" ) );
                return $ret;
            }
        );
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
