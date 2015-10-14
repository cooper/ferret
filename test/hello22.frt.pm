# === Document Model ===
#  Document './test/hello22.frt'
#      Class 'Cow'
#          Main method '_init_'
#              Instruction
#                  Want
#                      Instance variable '@moos'
#                      Expression ('want' parameter)
#                          Boolean true
#          Method 'moo'
#              If
#                  Expression ('if' parameter)
#                      Instance variable '@moos'
#                  Instruction
#                      Return
#                          String 'moo'
#              Instruction
#                  Return
#                      String 'I am a non...'
#      Class 'Dog'
#          Main method '_init_'
#              Instruction
#                  Want
#                      Instance variable '@barks'
#                      Expression ('want' parameter)
#                          Boolean false
#          Method 'bark'
#              If
#                  Expression ('if' parameter)
#                      Instance variable '@barks'
#                  Instruction
#                      Return
#                          String 'bark'
#              Instruction
#                  Return
#                      String 'I had my b...'
#      Class 'Cat'
#          Main method '_init_'
#              Instruction
#                  Want
#                      Instance variable '@mean'
#                      Expression ('want' parameter)
#                          Boolean false
#          Method 'meow'
#              Instruction
#                  Return
#                      String 'meow'
#          Main method 'fight'
#              Instruction
#                  Need
#                      Lexical variable '$cat1'
#                      Bareword 'Cat'
#              Instruction
#                  Need
#                      Lexical variable '$cat2'
#                      Bareword 'Cat'
#              If
#                  Expression ('if' parameter)
#                      Property 'mean'
#                          Lexical variable '$cat1'
#                  Instruction
#                      Return
#                          String 'Cat 1 star...'
#              If
#                  Expression ('if' parameter)
#                      Property 'mean'
#                          Lexical variable '$cat2'
#                  Instruction
#                      Return
#                          String 'Cat 2 star...'
#              Instruction
#                  Return
#                      String 'nice cats ...'
#      Instruction
#          Assignment (lexical variable '$animal')
#              Call
#                  Bareword 'Cow'
#                  Structural list [0 items]
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Dog'
#                  Structural list [1 items]
#                      Item 0
#                          Lexical variable '$animal'
#              Structural list [0 items]
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Call
#                          Property 'moo'
#                              Lexical variable '$animal'
#                          Structural list [0 items]
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Call
#                          Property 'bark'
#                              Lexical variable '$animal'
#                          Structural list [0 items]
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Cat'
#                  Structural list [1 items]
#                      Item 0
#                          Lexical variable '$animal'
#              Hash [1 items]
#                  Item 0
#                      Pair 'mean'
#                          Boolean true
#      Instruction
#          Call
#              Bareword 'inspect'
#              Structural list [1 items]
#                  Item 0
#                      Lexical variable '$animal'
#      Instruction
#          Assignment (lexical variable '$cat')
#              Call
#                  Bareword 'Cat'
#                  Structural list [0 items]
#      Instruction
#          Assignment (lexical variable '$aftermath')
#              Call
#                  Property 'fight'
#                      Structural list [2 items]
#                          Item 0
#                              Lexical variable '$animal'
#                          Item 1
#                              Lexical variable '$cat'
#                  Structural list [0 items]
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
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
        ref $libs eq 'ARRAY' or die "config error";
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello22.frt.pm'}++;

use Ferret::Core::Operations qw(U bool str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    undef;

    # Class 'Cow'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'Cow' ) ) {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Cow',
                version => undef
            );
            $context->set_property( Cow => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'moos', type => '', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    my $want_val = $arguments->{moos};
                    $want_val ||= Ferret::true;
                    $self->set_property( moos => $want_val );
                };
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'moo' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                if ( bool( $self->property_u('moos') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return str( $f, "moo" );
                }
                return str( $f, "I am a nonverbal cow" );
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'moo',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_ => $scope, $class, $class );
        $methods[1]->inside_scope( moo    => $scope, $proto, $class );
    }

    # Class 'Dog'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'Dog' ) ) {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Dog',
                version => undef
            );
            $context->set_property( Dog => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'barks', type => '', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    my $want_val = $arguments->{barks};
                    $want_val ||= Ferret::false;
                    $self->set_property( barks => $want_val );
                };
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'bark' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                if ( bool( $self->property_u('barks') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return str( $f, "bark" );
                }
                return str( $f, "I had my bark box bred out of me" );
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'bark',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_ => $scope, $class, $class );
        $methods[1]->inside_scope( bark   => $scope, $proto, $class );
    }

    # Class 'Cat'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'Cat' ) ) {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Cat',
                version => undef
            );
            $context->set_property( Cat => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'mean', type => '', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    my $want_val = $arguments->{mean};
                    $want_val ||= Ferret::false;
                    $self->set_property( mean => $want_val );
                };
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'meow' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return str( $f, "meow" );
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'meow',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'fight' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'cat1', type => 'Cat' );
            $func->add_argument( name => 'cat2', type => 'Cat' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{cat1};
                    $scope->set_property( cat1 => $arguments->{cat1} );
                };
                do {
                    return unless defined $arguments->{cat2};
                    $scope->set_property( cat2 => $arguments->{cat2} );
                };
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
            };
            $methods[2] = Ferret::Event->new(
                $f,
                name         => 'fight',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_ => $scope, $class, $class );
        $methods[1]->inside_scope( meow   => $scope, $proto, $class );
        $methods[2]->inside_scope( fight  => $scope, $class, $class );
    }
    Ferret::space( $context, $_ ) for qw(Cat Cow Dog);
    $scope->set_property_ow( $context,
        animal => U( $scope->property_u('Cow')->call( {}, $scope ) ) );
    U(
        U(
            $scope->property_u('Dog')->property_u('init')
              ->call( [ $scope->property_u('animal') ], $scope )
        )->call( {}, $scope )
    );
    U(
        $scope->property_u('say')->call(
            [
                U(
                    $scope->property_u('animal')->property_u('moo')
                      ->call( {}, $scope )
                )
            ],
            $scope
        )
    );
    U(
        $scope->property_u('say')->call(
            [
                U(
                    $scope->property_u('animal')->property_u('bark')
                      ->call( {}, $scope )
                )
            ],
            $scope
        )
    );
    U(
        U(
            $scope->property_u('Cat')->property_u('init')
              ->call( [ $scope->property_u('animal') ], $scope )
        )->call( { mean => Ferret::true }, $scope )
    );
    U( $scope->property_u('inspect')
          ->call( [ $scope->property_u('animal') ], $scope ) );
    $scope->set_property_ow( $context,
        cat => U( $scope->property_u('Cat')->call( {}, $scope ) ) );
    $scope->set_property_ow(
        $context,
        aftermath => U(
            $scope->property_u('animal')
              ->create_set( $scope, $scope->property_u('cat') )
              ->property_u('fight')->call( {}, $scope )
        )
    );
    U( $scope->property_u('say')
          ->call( [ $scope->property_u('aftermath') ], $scope ) );
};

Ferret::runtime();
