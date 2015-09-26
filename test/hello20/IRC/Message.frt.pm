# === Document Model ===
#  Document './test/hello20/IRC/Message.frt'
#      Package 'IRC'
#      Class 'Message'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Instance variable '@line'
#                      Bareword 'Str'
#              Instruction
#                  Assignment
#                      Lexical variable '$lineSplit'
#                      Call
#                          Property 'split'
#                              Instance variable '@line'
#                          Hash [2 items]
#                              Item 0
#                                  Pair 'separator'
#                                      String ' '
#                              Item 1
#                                  Pair 'limit'
#                                      Number '4'
#              Instruction
#                  Assignment
#                      Instance variable '@channel'
#                      Index
#                          Lexical variable '$lineSplit'
#                          Structural list [1 items]
#                              Item 0
#                                  Number '2'
#              Instruction
#                  Assignment
#                      Instance variable '@nickname'
#                      Index
#                          Call
#                              Property 'split'
#                                  Index
#                                      Lexical variable '$lineSplit'
#                                      Structural list [1 items]
#                                          Item 0
#                                              Number '0'
#                              Hash [2 items]
#                                  Item 0
#                                      Pair 'separator'
#                                          String '!'
#                                  Item 1
#                                      Pair 'limit'
#                                          Number '2'
#                          Structural list [1 items]
#                              Item 0
#                                  Number '0'
#              Instruction
#                  Call
#                      Property 'trimPrefix'
#                          Instance variable '@nickname'
#                      Structural list [1 items]
#                          Item 0
#                              String ':'
#              Instruction
#                  Assignment
#                      Instance variable '@message'
#                      Index
#                          Lexical variable '$lineSplit'
#                          Structural list [1 items]
#                              Item 0
#                                  Number '3'
#              Instruction
#                  Call
#                      Property 'trimPrefix'
#                          Instance variable '@message'
#                      Structural list [1 items]
#                          Item 0
#                              String ':'
#              Instruction
#                  Assignment
#                      Instance variable '@parts'
#                      Call
#                          Property 'split'
#                              Instance variable '@message'
#                          Structural list [1 items]
#                              Item 0
#                                  String ' '
#          Method 'command'
#              If
#                  Expression ('if' parameter)
#                      Instance variable '@foundCommand'
#                  Instruction
#                      Return
#                          Instance variable '@foundCommand'
#              If
#                  Expression ('if' parameter)
#                      Call
#                          Property 'hasPrefix'
#                              Index
#                                  Instance variable '@parts'
#                                  Structural list [1 items]
#                                      Item 0
#                                          Number '0'
#                          Structural list [1 items]
#                              Item 0
#                                  String '.'
#                  Instruction
#                      Assignment
#                          Instance variable '@foundCommand'
#                          Call
#                              Property 'trimPrefix'
#                                  Call
#                                      Property 'copy'
#                                          Index
#                                              Instance variable '@parts'
#                                              Structural list [1 items]
#                                                  Item 0
#                                                      Number '0'
#                                      Structural list [0 items]
#                              Structural list [1 items]
#                                  Item 0
#                                      String '.'
#                  Instruction
#                      Return
#                          Instance variable '@foundCommand'
#              Instruction
#                  Assignment
#                      Instance variable '@foundCommand'
#                      Boolean false
#              Instruction
#                  Return
#                      Instance variable '@foundCommand'
#          Method 'fromWord'
#              Instruction
#                  Need
#                      Lexical variable '$wordN'
#                      Bareword 'Num'
#              Instruction
#                  Return
#                      Index
#                          Call
#                              Property 'split'
#                                  Instance variable '@message'
#                              Hash [2 items]
#                                  Item 0
#                                      Pair 'separator'
#                                          String ' '
#                                  Item 1
#                                      Pair 'limit'
#                                          Operation
#                                              Lexical variable '$wordN'
#                                              Addition operator (+)
#                                              Number '1'
#                          Structural list [1 items]
#                              Item 0
#                                  Lexical variable '$wordN'
#      Include (Num, Str)
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
$Ferret::tried_files{'Message.frt.pm'}++;

use Ferret::Core::Operations qw(add bool num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('IRC');

    # Class 'Message'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'Message' ) ) {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Message',
                version => undef
            );
            $context->set_property( Message => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'line' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{line};
                    $self->set_property( line => $arguments->{line} );
                };
                $scope->set_property_ow(
                    $context,
                    lineSplit =>
                      $self->property('line')->property('split')->call(
                        { separator => str( $f, " " ), limit => num( $f, 4 ) },
                        $scope
                      )
                );
                $self->set_property( channel => $scope->property('lineSplit')
                      ->get_index_value( [ num( $f, 2 ) ], $scope ) );
                $self->set_property(
                    nickname => $scope->property('lineSplit')
                      ->get_index_value( [ num( $f, 0 ) ], $scope )
                      ->property('split')->call(
                        { separator => str( $f, "!" ), limit => num( $f, 2 ) },
                        $scope
                      )->get_index_value( [ num( $f, 0 ) ], $scope )
                );
                $self->property('nickname')->property('trimPrefix')
                  ->call( [ str( $f, ":" ) ], $scope );
                $self->set_property( message => $scope->property('lineSplit')
                      ->get_index_value( [ num( $f, 3 ) ], $scope ) );
                $self->property('message')->property('trimPrefix')
                  ->call( [ str( $f, ":" ) ], $scope );
                $self->set_property(
                    parts => $self->property('message')->property('split')
                      ->call( [ str( $f, " " ) ], $scope ) );
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'command' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                if ( bool( $self->property('foundCommand') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $self->property('foundCommand');
                }
                if (
                    bool(
                        $self->property('parts')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->property('hasPrefix')
                          ->call( [ str( $f, "." ) ], $scope )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $self->set_property(
                        foundCommand => $self->property('parts')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->property('copy')->call( {}, $scope )
                          ->property('trimPrefix')
                          ->call( [ str( $f, "." ) ], $scope ) );
                    return $self->property('foundCommand');
                }
                $self->set_property( foundCommand => Ferret::false );
                return $self->property('foundCommand');
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'command',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'fromWord' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'wordN' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{wordN};
                    $scope->set_property( wordN => $arguments->{wordN} );
                };
                return $self->property('message')->property('split')->call(
                    {
                        separator => str( $f, " " ),
                        limit     => add(
                            $scope, $scope->property('wordN'), num( $f, 1 )
                        )
                    },
                    $scope
                )->get_index_value( [ $scope->property('wordN') ], $scope );
                return $return;
            };
            $methods[2] = Ferret::Event->new(
                $f,
                name         => 'fromWord',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_   => $scope, $class, $class );
        $methods[1]->inside_scope( command  => $scope, $proto, $class );
        $methods[2]->inside_scope( fromWord => $scope, $proto, $class );
    }
    Ferret::space( $context, $_ ) for qw(Num Str);
};

Ferret::runtime();
