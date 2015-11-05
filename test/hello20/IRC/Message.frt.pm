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
#                  Assignment (lexical variable '$lineSplit')
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
#                  Assignment (instance variable '@channel')
#                      Index
#                          Lexical variable '$lineSplit'
#                          Single value [1 items]
#                              Item 0
#                                  Number '2'
#              Instruction
#                  Assignment (instance variable '@nickname')
#                      Index
#                          Call
#                              Property 'split'
#                                  Index
#                                      Lexical variable '$lineSplit'
#                                      Single value [1 items]
#                                          Item 0
#                                              Number '0'
#                              Hash [2 items]
#                                  Item 0
#                                      Pair 'separator'
#                                          String '!'
#                                  Item 1
#                                      Pair 'limit'
#                                          Number '2'
#                          Single value [1 items]
#                              Item 0
#                                  Number '0'
#              Instruction
#                  Call
#                      Property 'trimPrefix'
#                          Instance variable '@nickname'
#                      Single value [1 items]
#                          Item 0
#                              String ':'
#              Instruction
#                  Assignment (instance variable '@message')
#                      Index
#                          Lexical variable '$lineSplit'
#                          Single value [1 items]
#                              Item 0
#                                  Number '3'
#              Instruction
#                  Call
#                      Property 'trimPrefix'
#                          Instance variable '@message'
#                      Single value [1 items]
#                          Item 0
#                              String ':'
#              Instruction
#                  Assignment (instance variable '@parts')
#                      Call
#                          Property 'split'
#                              Instance variable '@message'
#                          Single value [1 items]
#                              Item 0
#                                  String ' '
#          Computed property 'command' (lazy)
#              If
#                  Expression ('if' parameter)
#                      Call
#                          Property 'hasPrefix'
#                              Index
#                                  Instance variable '@parts'
#                                  Single value [1 items]
#                                      Item 0
#                                          Number '0'
#                          Single value [1 items]
#                              Item 0
#                                  String '.'
#                  Instruction
#                      Assignment (lexical variable '$cmd')
#                          Call
#                              Property 'trimPrefix'
#                                  Call
#                                      Property 'copy'
#                                          Index
#                                              Instance variable '@parts'
#                                              Single value [1 items]
#                                                  Item 0
#                                                      Number '0'
#                                      Structural list [0 items]
#                              Single value [1 items]
#                                  Item 0
#                                      String '.'
#                  If
#                      Expression ('if' parameter)
#                          Property 'length'
#                              Lexical variable '$cmd'
#                      Instruction
#                          Return
#                              Lexical variable '$cmd'
#              Instruction
#                  Return
#                      Boolean false
#          Computed property 'commandHasParameters' (lazy)
#              Instruction
#                  Return
#                      Equality
#                          Property 'length'
#                              Instance variable '@parts'
#                          Number '1'
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
#                          Single value [1 items]
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
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Message.frt.pm'}++;

use Ferret::Core::Operations qw(_not add bool num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('IRC');
    do 'CORE.frt.pm' or die "Core error: $@" unless 'IRC' eq 'CORE';
    undef;

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
            $func->add_argument( name => 'line', type => 'Str', more => undef );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{line};
                    $self->set_property( line => $arguments->{line} );
                };
                $scope->set_property_ow(
                    $context,
                    lineSplit =>
                      $self->property_u('line')->property_u('split')->call_u(
                        { separator => str( $f, " " ), limit => num( $f, 4 ) },
                        $scope
                      )
                );
                $self->set_property( channel => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 2 ) ], $scope ) );
                $self->set_property(
                    nickname => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 0 ) ], $scope )
                      ->property_u('split')->call_u(
                        { separator => str( $f, "!" ), limit => num( $f, 2 ) },
                        $scope
                      )->get_index_value( [ num( $f, 0 ) ], $scope )
                );
                $self->property_u('nickname')->property_u('trimPrefix')
                  ->call_u( [ str( $f, ":" ) ], $scope );
                $self->set_property( message => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 3 ) ], $scope ) );
                $self->property_u('message')->property_u('trimPrefix')
                  ->call_u( [ str( $f, ":" ) ], $scope );
                $self->set_property(
                    parts => $self->property_u('message')->property_u('split')
                      ->call_u( [ str( $f, " " ) ], $scope ) );
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
                if (
                    bool(
                        $self->property_u('parts')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->property_u('hasPrefix')
                          ->call_u( [ str( $f, "." ) ], $scope )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->set_property_ow( $context,
                        cmd => $self->property_u('parts')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->property_u('copy')->call_u( {}, $scope )
                          ->property_u('trimPrefix')
                          ->call_u( [ str( $f, "." ) ], $scope ) );
                    if ( bool( $scope->property_u('cmd')->property_u('length') )
                      )
                    {
                        my $scope = Ferret::Scope->new( $f, parent => $scope );

                        return $scope->property_u('cmd');
                    }
                }
                return Ferret::false;
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'command',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'commandHasParameters' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return _not( $self->property_u('parts')->property_u('length')
                      ->equal_to( num( $f, 1 ), $scope ) );
                return $return;
            };
            $methods[2] = Ferret::Event->new(
                $f,
                name         => 'commandHasParameters',
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
            $func->add_argument(
                name => 'wordN',
                type => 'Num',
                more => undef
            );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{wordN};
                    $scope->set_property( wordN => $arguments->{wordN} );
                };
                return $self->property_u('message')->property_u('split')
                  ->call_u(
                    {
                        separator => str( $f, " " ),
                        limit     => add(
                            $scope, $scope->property_u('wordN'),
                            num( $f, 1 )
                        )
                    },
                    $scope
                  )->get_index_value( [ $scope->property_u('wordN') ], $scope );
                return $return;
            };
            $methods[3] = Ferret::Event->new(
                $f,
                name         => 'fromWord',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]
          ->inside_scope( _init_ => $scope, $class, $class, undef, undef );
        $methods[1]->inside_scope( command => $scope, $proto, $class, 1, 1 );
        $methods[2]->inside_scope(
            commandHasParameters => $scope,
            $proto, $class, 1, 1
        );
        $methods[3]
          ->inside_scope( fromWord => $scope, $proto, $class, undef, undef );
    }
    Ferret::space( $context, $_ ) for qw(IRC::Num IRC::Str Num Str);
};

Ferret::runtime();
