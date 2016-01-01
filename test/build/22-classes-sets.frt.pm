# === Document Model ===
#  Document './test/22-classes-sets.frt'
#      Class 'Cow'
#          Class method '_init_'
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
#          Class method '_init_'
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
#          Class method '_init_'
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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('22-classes-sets.frt');

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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::want( $self, $args, 'moos', 6.2, $true );
                return $ret->return;
            }
        );

        # Method event 'moo' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'moo',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                if ( bool( $self->property_u('moos') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret->return( str( $f, "moo" ) );
                }
                return $ret->return( str( $f, "I am a nonverbal cow" ) );
                return $ret->return;
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::want( $self, $args, 'barks', 18.2, $false );
                return $ret->return;
            }
        );

        # Method event 'bark' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'bark',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                if ( bool( $self->property_u('barks') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret->return( str( $f, "bark" ) );
                }
                return $ret->return(
                    str( $f, "I had my bark box bred out of me" ) );
                return $ret->return;
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::want( $self, $args, 'mean', 30.2, $false );
                return $ret->return;
            }
        );

        # Method event 'meow' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'meow',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return( str( $f, "meow" ) );
                return $ret->return;
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
                $ret->inc;
                FF::need( $scope, $args, 'cat1', 39.1 ) or return;
                FF::need( $scope, $args, 'cat2', 39.3 ) or return;
                if ( bool( $scope->property_u('cat1')->property_u('mean') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret->return(
                        str( $f, "Cat 1 started a catfight!" ) );
                }
                if ( bool( $scope->property_u('cat2')->property_u('mean') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret->return(
                        str( $f, "Cat 2 started a catfight!" ) );
                }
                return $ret->return( str( $f, "nice cats don't fight" ) );
                return $ret->return;
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
    $$context->set_property(
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
    $$context->set_property(
        cat => $scope->property_u('Cat')->call_u( {}, $scope, undef, 65.4 ),
        65.2
    );
    $$context->set_property(
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
