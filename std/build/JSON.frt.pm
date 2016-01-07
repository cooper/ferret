# === Document Model ===
#  Document './std/JSON.frt'
#      Class 'JSON' version 1.0
#          Instruction
#              Alias
#                  Assignment
#                      Bareword '_PO'
#                      Bareword 'NATIVE::PerlObject'
#          Instruction
#              Lazy assignment
#                  Lexical variable '$default'
#                  Call
#                      Special variable '*class'
#                      Argument list [0 items]
#          Type definition ('Charset')
#              Body ('type' scope)
#                  Instruction
#                      Symbol :ascii
#                  Instruction
#                      Symbol :latin1
#                  Instruction
#                      Symbol :utf8
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@strict'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean true
#                  Instruction
#                      Want
#                          Instance variable '@consistent'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Want
#                          Instance variable '@charset'
#                          Argument type
#                              Bareword 'Charset'
#                          Argument value
#                              Symbol :utf8
#                  Instruction
#                      Want
#                          Instance variable '@strictRoot'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Want
#                          Instance variable '@pretty'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Want
#                          Instance variable '@spaceBefore'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Want
#                          Instance variable '@spaceAfter'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Want
#                          Instance variable '@indent'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Call
#                          Property 'require'
#                              Bareword '_PO'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'JSON::XS'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Body ('catch' scope)
#                              Instruction
#                                  Fail
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :NativeCodeError
#                                              Item 1
#                                                  String 'Unable to ...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#                  Instruction
#                      Assignment
#                          Instance variable '@xs'
#                          Call
#                              Bareword '_PO'
#                              Argument list [1 items]
#                                  Item 0
#                                      String 'JSON::XS'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Body ('catch' scope)
#                              Instruction
#                                  Fail
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :NativeCodeError
#                                              Item 1
#                                                  String 'Could not ...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#                  Instruction
#                      Call
#                          Property (name evaluated at runtime)
#                              Instance variable '@xs'
#                              Property index [1 items]
#                                  Item 0
#                                      Instance variable '@charset'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@pretty'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Property 'pretty'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@spaceBefore'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Property 'spaceBefore'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@spaceAfter'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Property 'spaceAfter'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@indent'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Property 'indent'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Instance variable '@strict'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Property 'relaxed'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@consistent'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Property 'canonical'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Instance variable '@strictRoot'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Property 'allow_nonref'
#                                      Instance variable '@xs'
#          Method 'encode'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                  Instruction
#                      Return pair 'json'
#                          Call
#                              Property 'encode'
#                                  Instance variable '@xs'
#                              Argument list [1 items]
#                                  Item 0
#                                      Lexical variable '$data'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Body ('catch' scope)
#                              Instruction
#                                  Fail
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :JSONError
#                                              Item 1
#                                                  String 'JSON encod...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#          Method 'decode'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$json'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Return pair 'data'
#                          Call
#                              Property 'decode'
#                                  Instance variable '@xs'
#                              Argument list [1 items]
#                                  Item 0
#                                      Lexical variable '$json'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Body ('catch' scope)
#                              Instruction
#                                  Fail
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :JSONError
#                                              Item 1
#                                                  String 'JSON decod...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#          Class method 'encode'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                  Instruction
#                      Return
#                          Call
#                              Property 'encode'
#                                  Lexical variable '$default'
#                              Argument list [1 items]
#                                  Item 0
#                                      Lexical variable '$data'
#          Class method 'decode'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$json'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Return
#                          Call
#                              Property 'decode'
#                                  Lexical variable '$default'
#                              Argument list [1 items]
#                                  Item 0
#                                      Lexical variable '$json'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'stringify'
#                      Bareword 'encode'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'parse'
#                      Bareword 'decode'
#      Include (Bool, Charset, Error, NATIVE, NATIVE::PerlObject, Str)
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

FF::before_content('JSON.frt');

use Ferret::Core::Operations qw(_not bool str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'JSON'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'JSON', 1.0 );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'strict',
                    type     => 'Bool',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'consistent',
                    type     => 'Bool',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'charset',
                    type     => 'Charset',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'strictRoot',
                    type     => 'Bool',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'pretty',
                    type     => 'Bool',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'spaceBefore',
                    type     => 'Bool',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'spaceAfter',
                    type     => 'Bool',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'indent',
                    type     => 'Bool',
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $self, $args, 'strict',     20.2, $true );
                FF::want( $self, $args, 'consistent', 26.2, $false );
                FF::want( $self, $args, 'charset', 29.2,
                    FF::get_symbol( $f, 'utf8' ) );
                FF::want( $self, $args, 'strictRoot',  34.2, $false );
                FF::want( $self, $args, 'pretty',      39.2, $false );
                FF::want( $self, $args, 'spaceBefore', 43.2, $false );
                FF::want( $self, $args, 'spaceAfter',  44.2, $false );
                FF::want( $self, $args, 'indent',      49.2, $false );
                FF::try_catch(
                    $f, $scope,
                    sub {
                        ${ $$scope->{'_PO'} }->{'require'}
                          ->( [ str( $f, "JSON::XS" ) ], $scope, undef, 52.3 );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    FF::get_symbol( $f, 'NativeCodeError' ),
                                    str( $f, "Unable to load JSON::XS" ),
                                    { subError => $$scope->{'err'} }
                                ],
                                $scope, undef, 53.3
                            )
                        );
                    },
                    'err'
                );
                FF::try_catch(
                    $f, $scope,
                    sub {
                        $self->set_property(
                            xs => $$scope->{'_PO'}->(
                                [ str( $f, "JSON::XS" ) ], $scope,
                                undef, 59.2
                            ),
                            59.1
                        );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    FF::get_symbol( $f, 'NativeCodeError' ),
                                    str(
                                        $f, "Could not create JSON::XS object"
                                    ),
                                    { subError => $$scope->{'err'} }
                                ],
                                $scope, undef, 60.3
                            )
                        );
                    },
                    'err'
                );
                $$self->{'xs'}->property_eval_u( $$self->{'charset'} )
                  ->( {}, $scope, undef, 66.6 );
                if ( bool( $$self->{'pretty'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    ${ $$self->{'xs'} }->{'pretty'}
                      ->( {}, $scope, undef, 67.6 );
                }
                if ( bool( $$self->{'spaceBefore'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    ${ $$self->{'xs'} }->{'spaceBefore'}
                      ->( {}, $scope, undef, 68.6 );
                }
                if ( bool( $$self->{'spaceAfter'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    ${ $$self->{'xs'} }->{'spaceAfter'}
                      ->( {}, $scope, undef, 69.6 );
                }
                if ( bool( $$self->{'indent'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    ${ $$self->{'xs'} }->{'indent'}
                      ->( {}, $scope, undef, 70.6 );
                }
                if ( bool( _not( $$self->{'strict'} ) ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    ${ $$self->{'xs'} }->{'relaxed'}
                      ->( {}, $scope, undef, 71.7 );
                }
                if ( bool( $$self->{'consistent'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    ${ $$self->{'xs'} }->{'canonical'}
                      ->( {}, $scope, undef, 72.6 );
                }
                if ( bool( _not( $$self->{'strictRoot'} ) ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    ${ $$self->{'xs'} }->{'allow_nonref'}
                      ->( {}, $scope, undef, 73.7 );
                }
                return $ret;
            }
        );

        # Method event 'encode' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'encode',
            [
                {
                    name     => 'data',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'data', 80.2 ) or return;
                FF::try_catch(
                    $f, $scope,
                    sub {
                        $ret->set_property(
                            json => ${ $$self->{'xs'} }->{'encode'}
                              ->( [ $$scope->{'data'} ], $scope, undef, 81.25 ),
                            81.1
                        );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    FF::get_symbol( $f, 'JSONError' ),
                                    str( $f, "JSON encode error" ),
                                    { subError => $$scope->{'err'} }
                                ],
                                $scope, undef, 82.15
                            )
                        );
                    },
                    'err'
                );
                return $ret;
            }
        );

        # Method event 'decode' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'decode',
            [
                {
                    name     => 'json',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'json', 86.2 ) or return;
                FF::try_catch(
                    $f, $scope,
                    sub {
                        $ret->set_property(
                            data => ${ $$self->{'xs'} }->{'decode'}
                              ->( [ $$scope->{'json'} ], $scope, undef, 87.25 ),
                            87.1
                        );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    FF::get_symbol( $f, 'JSONError' ),
                                    str( $f, "JSON decode error" ),
                                    { subError => $$scope->{'err'} }
                                ],
                                $scope, undef, 88.15
                            )
                        );
                    },
                    'err'
                );
                return $ret;
            }
        );

        # Method event 'encode' definition
        my $method_3 = FF::method_event_def(
            $f, $scope, 'encode',
            [
                {
                    name     => 'data',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'data', 99.2 ) or return;
                return ${ $$scope->{'default'} }->{'encode'}
                  ->( [ $$scope->{'data'} ], $scope, undef, 100.4 );
                return $ret;
            }
        );

        # Method event 'decode' definition
        my $method_4 = FF::method_event_def(
            $f, $scope, 'decode',
            [
                {
                    name     => 'json',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'json', 104.2 ) or return;
                return ${ $$scope->{'default'} }->{'decode'}
                  ->( [ $$scope->{'json'} ], $scope, undef, 105.4 );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            encode => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            decode => $scope,
            $proto, $class, undef, undef
        );
        $method_3->inside_scope(
            encode => $scope,
            $class, $class, undef, undef
        );
        $method_4->inside_scope(
            decode => $scope,
            $class, $class, undef, undef
        );
        $scope->set_property( _PO => $$scope->{'NATIVE::PerlObject'}, 3.3 );
        FF::lex_assign(
            $scope,
            default => [
                sub {
                    ${ $scope->{special} }->{'class'}
                      ->( {}, $scope, undef, 6.4 );
                }
            ],
            undef,
            6.2
        );
        FF::typedef(
            $scope, $class,
            'Charset',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
                    $scope, $scope, $ins,
                    conditions => undef,
                    equal_to   => [
                        FF::get_symbol( $f, 'ascii' ),
                        FF::get_symbol( $f, 'latin1' ),
                        FF::get_symbol( $f, 'utf8' )
                    ]
                ) ? $ins : undef;
            },
            undef
        );
        $class->set_property( stringify => $$scope->{'encode'}, 108.3 );
        $class->set_property( parse     => $$scope->{'decode'}, 109.3 );
    }
    FF::load_namespaces( $context,
        qw(Bool Charset Error NATIVE NATIVE::PerlObject Str) );
};

FF::after_content();
