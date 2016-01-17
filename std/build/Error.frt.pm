# === Document Model ===
#  Document './std/Error.frt'
#      Class 'Error' version 1.0
#          Instruction
#              Assignment
#                  Lexical variable '$hintsAvailable'
#                  Hash [4 items]
#                      Item 0
#                          Pair 'lastName'
#                              String 'Name'
#                      Item 1
#                          Pair 'object'
#                              String 'Object'
#                      Item 2
#                          Pair 'file'
#                              String 'File'
#                      Item 3
#                          Pair 'line'
#                              String 'Line'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@type'
#                          Argument type
#                              Bareword 'Sym'
#                  Instruction
#                      Need
#                          Instance variable '@msg'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Want
#                          Lexical variable '$hints'
#                          Argument type
#                              Bareword 'Hash'
#                  If
#                      Expression ('if' parameter)
#                          Lexical variable '$hints'
#                      Body ('if' scope)
#                          Instruction
#                              Assignment
#                                  Instance variable '@hints'
#                                  Call
#                                      Bareword '_handleHints'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Lexical variable '$hints'
#                  Else
#                      Body ('else' scope)
#                          Instruction
#                              Assignment
#                                  Instance variable '@hints'
#                                  Hash [0 items]
#                  Instruction
#                      Want
#                          Instance variable '@subError'
#                          Argument type
#                              Bareword 'Error'
#                  Instruction
#                      Call
#                          Property 'bless'
#                              Bareword 'NATIVE'
#                          Argument list [2 items]
#                              Item 0
#                                  Special variable '*self'
#                              Item 1
#                                  String 'Ferret::Error'
#          Method 'description'
#              Body ('method' scope)
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@subError'
#                      Body ('if' scope)
#                          Instruction
#                              Return
#                                  Operation
#                                      Instance variable '@msg'
#                                      Addition operator (+)
#                                      String ': '
#                                      Addition operator (+)
#                                      Call
#                                          Property 'description'
#                                              Instance variable '@subError'
#                  Instruction
#                      Return
#                          Instance variable '@msg'
#          Function '_handleHints'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$hints'
#                          Argument type
#                              Bareword 'Hash'
#      Include (Error, Hash, NATIVE, Str, Sym)
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
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('Error.frt');

use Ferret::Core::Operations qw(add bool str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event '_handleHints' definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        '_handleHints',
        undef,
        [
            {
                name     => 'hints',
                type     => 'Hash',
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'hints', 32.2 ) or return;
            return $ret;
        }
    );

    # Class 'Error'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Error', 1.0, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'type',
                    type     => 'Sym',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'msg',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'hints',
                    type     => 'Hash',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'subError',
                    type     => 'Error',
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $self, $args, 'type' ) or return;
                FF::need( $self, $args, 'msg' )  or return;
                FF::want( $scope, $args, 'hints', 14.2 );
                if ( bool( $$scope->{'hints'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $self->set_property(
                        hints => $$scope->{'_handleHints'}
                          ->( [ $$scope->{'hints'} ], $scope, undef, 16.4 ),
                        16.2
                    );
                }
                else {
                    $self->set_property(
                        hints => FF::create_hash( $f, {} ),
                        18.2
                    );
                }
                FF::want( $self, $args, 'subError', 20.2 );
                ${ $$scope->{'NATIVE'} }->{'bless'}->(
                    [
                        ${ $scope->{special} }->{'self'},
                        str( $f, "Ferret::Error" )
                    ],
                    $scope, undef, 22.3
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'description',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                if ( bool( $$self->{'subError'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return add( $scope, $$self->{'msg'}, str( $f, ": " ),
                        ${ $$self->{'subError'} }->{'description'}
                          ->( {}, $scope, undef, 27.4 ) );
                }
                return $$self->{'msg'};
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            description => $scope,
            $proto, $class, undef, undef
        );
        $func_0->inside_scope(
            _handleHints => $scope,
            $scope, $class, undef, undef
        );
        FF::lex_assign(
            $scope,
            hintsAvailable => FF::create_hash(
                $f,
                {
                    lastName => str( $f, "Name" ),
                    object   => str( $f, "Object" ),
                    file     => str( $f, "File" ),
                    line     => str( $f, "Line" )
                }
            ),
            undef,
            3.2
        );
    }
    FF::load_namespaces( $context, qw(Error Hash NATIVE Str Sym) );
};

FF::after_content();
