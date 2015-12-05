# === Document Model ===
#  Document './test/hello22.frt'
#      Class 'Cow'
#          Main method '_init_'
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
#          Main method '_init_'
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
#          Main method '_init_'
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
#          Main method 'fight'
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
my $f = FF::get_ferret();

FF::before_content('hello22.frt');

use Ferret::Core::Operations qw(bool str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'Cow'
    {
        my ( $class, $self, $proto ) =
          FF::get_class( $f, $context, 'Cow', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [ { name => 'moos', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    my $want_val = $arguments->{moos};
                    $want_val ||= Ferret::true;
                    $self->set_property( moos => $want_val );
                };
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
        my ( $class, $self, $proto ) =
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
                do {
                    my $want_val = $arguments->{barks};
                    $want_val ||= Ferret::false;
                    $self->set_property( barks => $want_val );
                };
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
        my ( $class, $self, $proto ) =
          FF::get_class( $f, $context, 'Cat', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [ { name => 'mean', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    my $want_val = $arguments->{mean};
                    $want_val ||= Ferret::false;
                    $self->set_property( mean => $want_val );
                };
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
                FF::need( $scope, $arguments, 'cat1' ) or return;
                FF::need( $scope, $arguments, 'cat2' ) or return;
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
    $scope->set_property_ow( $context,
        animal => $scope->property_u('Cow')->call_u( {}, $scope, undef, 58 ) );
    $scope->property_u('Dog')->property_u('init')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 60 )
      ->call_u( {}, $scope, undef, 60 );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('animal')->property_u('moo')
              ->call_u( {}, $scope, undef, 62 )
        ],
        $scope, undef, 62
    );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('animal')->property_u('bark')
              ->call_u( {}, $scope, undef, 63 )
        ],
        $scope, undef, 63
    );
    $scope->property_u('Cat')->property_u('init')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 65 )
      ->call_u( { mean => Ferret::true }, $scope, undef, 65 );
    $scope->property_u('inspect')
      ->call_u( [ $scope->property_u('animal') ], $scope, undef, 67 );
    $scope->set_property_ow( $context,
        cat => $scope->property_u('Cat')->call_u( {}, $scope, undef, 69 ) );
    $scope->set_property_ow(
        $context,
        aftermath => FF::create_set(
            $scope,
            $scope->property_u('animal'),
            $scope->property_u('cat')
        )->property_u('fight')->call_u( {}, $scope, undef, 71 )
    );
    $scope->property_u('say')
      ->call_u( [ $scope->property_u('aftermath') ], $scope, undef, 72 );
};

FF::after_content();
