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
#              Body ('function' scope)
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
#                          Argument list [1 item]
#                              Item 0
#                                  String 'JSON::XS'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Body ('catch' scope)
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :PerlRequireFailed
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
#                              Argument list [1 item]
#                                  Item 0
#                                      String 'JSON::XS'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Body ('catch' scope)
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :PerlConstructorFailed
#                                              Item 1
#                                                  String 'Could not ...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#                  Instruction
#                      Call
#                          Property (name evaluated at runtime)
#                              Instance variable '@xs'
#                              Property index [1 item]
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
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                  Instruction
#                      Return pair 'json'
#                          Call
#                              Property 'encode'
#                                  Instance variable '@xs'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$data'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Body ('catch' scope)
#                              Instruction
#                                  Fail (nonfatal exception)
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
#              Body ('function' scope)
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
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$json'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Body ('catch' scope)
#                              Instruction
#                                  Fail (nonfatal exception)
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
#          Method 'decoderAdd'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$fragment'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Call
#                          Property 'perlCall'
#                              Instance variable '@xs'
#                          Mixed argument list [3 items]
#                              Item 0
#                                  String 'incr_parse'
#                              Item 1
#                                  Lexical variable '$fragment'
#                              Item 2
#                                  Pair 'CONTEXT'
#                                      String 'void'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Body ('catch' scope)
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :JSONError
#                                              Item 1
#                                                  String 'JSON incr_...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#                  Instruction
#                      Return pair 'added'
#                          Boolean true
#          Method 'decoderDone'
#              Body ('function' scope)
#                  Instruction
#                      Assignment
#                          Lexical variable '$objects'
#                          Call
#                              Property 'perlCall'
#                                  Instance variable '@xs'
#                              Mixed argument list [2 items]
#                                  Item 0
#                                      String 'incr_parse'
#                                  Item 1
#                                      Pair 'CONTEXT'
#                                          String 'list'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Body ('catch' scope)
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :JSONError
#                                              Item 1
#                                                  String 'JSON incr_...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#                  If
#                      Expression ('if' parameter)
#                          Call
#                              Special property '*instanceOf'
#                                  Lexical variable '$objects'
#                              Argument list [1 item]
#                                  Item 0
#                                      Bareword 'List'
#                      Body ('if' scope)
#                          Instruction
#                              Return pair 'found'
#                                  Property 'length'
#                                      Lexical variable '$objects'
#                  Instruction
#                      Return pair 'data'
#                          Lexical variable '$objects'
#          Method 'decoderReset'
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Property 'incr_reset'
#                              Instance variable '@xs'
#                          Argument list [0 items]
#          Class method 'encode'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                  Instruction
#                      Return
#                          Call
#                              Property 'encode'
#                                  Lexical variable '$default'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$data'
#          Class method 'decode'
#              Body ('function' scope)
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
#                              Argument list [1 item]
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
#      Include (Bool, Charset, Error, List, NATIVE, NATIVE::PerlObject, Str)
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

my $pos = before_content( 'JSON.frt', './std/JSON.frt' );

use Ferret::Core::Operations qw(_not bool str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'JSON'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'JSON', 1.0, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $self, $args, 'strict',     24.2, $true );
                want( $self, $args, 'consistent', 30.2, $false );
                want( $self, $args, 'charset', 37.2, get_symbol( $f, 'utf8' ) );
                want( $self, $args, 'strictRoot',  41.2, $false );
                want( $self, $args, 'pretty',      46.2, $false );
                want( $self, $args, 'spaceBefore', 51.2, $false );
                want( $self, $args, 'spaceAfter',  55.2, $false );
                want( $self, $args, 'indent',      59.2, $false );
                try_catch(
                    $f, $scope,
                    sub {
                        $$scope->{'_PO'}->property_u( 'require', $pos->(65.2) )
                          ->(
                            [ str( $f, "JSON::XS" ) ],
                            $scope, undef, $pos->(65.3)
                          );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'PerlRequireFailed' ),
                                    str( $f, "Unable to load JSON::XS" ),
                                    [ subError => $$scope->{'err'} ]
                                ],
                                $scope, undef,
                                $pos->(66.3)
                            ),
                            $pos->(66.1)
                        );
                    },
                    'err'
                );
                try_catch(
                    $f, $scope,
                    sub {
                        $self->set_property(
                            xs => $$scope->{'_PO'}->(
                                [ str( $f, "JSON::XS" ) ], $scope,
                                undef, $pos->(72.2)
                            ),
                            $pos->(72.1)
                        );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'PerlConstructorFailed' ),
                                    str(
                                        $f, "Could not create JSON::XS object"
                                    ),
                                    [ subError => $$scope->{'err'} ]
                                ],
                                $scope, undef,
                                $pos->(73.3)
                            ),
                            $pos->(73.1)
                        );
                    },
                    'err'
                );
                $$self->{'xs'}->property_u( $$self->{'charset'}, $pos->(79.2) )
                  ->( [ undef, [] ], $scope, undef, $pos->(79.6) );
                if ( bool( $$self->{'pretty'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'xs'}->property_u( 'pretty', $pos->(80.5) )
                      ->( [ undef, [] ], $scope, undef, $pos->(80.6) );
                }
                if ( bool( $$self->{'spaceBefore'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'xs'}->property_u( 'spaceBefore', $pos->(81.5) )
                      ->( [ undef, [] ], $scope, undef, $pos->(81.6) );
                }
                if ( bool( $$self->{'spaceAfter'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'xs'}->property_u( 'spaceAfter', $pos->(82.5) )
                      ->( [ undef, [] ], $scope, undef, $pos->(82.6) );
                }
                if ( bool( $$self->{'indent'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'xs'}->property_u( 'indent', $pos->(83.5) )
                      ->( [ undef, [] ], $scope, undef, $pos->(83.6) );
                }
                if ( bool( _not( $$self->{'strict'} ) ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'xs'}->property_u( 'relaxed', $pos->(84.6) )
                      ->( [ undef, [] ], $scope, undef, $pos->(84.7) );
                }
                if ( bool( $$self->{'consistent'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'xs'}->property_u( 'canonical', $pos->(85.5) )
                      ->( [ undef, [] ], $scope, undef, $pos->(85.6) );
                }
                if ( bool( _not( $$self->{'strictRoot'} ) ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'xs'}->property_u( 'allow_nonref', $pos->(86.6) )
                      ->( [ undef, [] ], $scope, undef, $pos->(86.7) );
                }
                return $ret;
            }
        );

        # Method event 'encode' definition
        my $func_1 = method_event_def(
            $f, $scope, 'encode',
            [
                {
                    name     => 'data',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'data', 96.2 ) || return;
                try_catch(
                    $f, $scope,
                    sub {
                        $ret->set_property(
                            json => $$self->{'xs'}
                              ->property_u( 'encode', $pos->(97.2) )->(
                                [ $$scope->{'data'} ], $scope,
                                undef,                 $pos->(97.25)
                              ),
                            $pos->(97.1)
                        );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'JSONError' ),
                                    str( $f, "JSON encode error" ),
                                    [ subError => $$scope->{'err'} ]
                                ],
                                $scope, undef,
                                $pos->(98.15)
                            ),
                            $pos->(98.05)
                        );
                    },
                    'err'
                );
                return $ret;
            }
        );

        # Method event 'decode' definition
        my $func_2 = method_event_def(
            $f, $scope, 'decode',
            [
                {
                    name     => 'json',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'json', 105.2 ) || return;
                try_catch(
                    $f, $scope,
                    sub {
                        $ret->set_property(
                            data => $$self->{'xs'}
                              ->property_u( 'decode', $pos->(106.2) )->(
                                [ $$scope->{'json'} ], $scope,
                                undef,                 $pos->(106.25)
                              ),
                            $pos->(106.1)
                        );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'JSONError' ),
                                    str( $f, "JSON decode error" ),
                                    [ subError => $$scope->{'err'} ]
                                ],
                                $scope, undef,
                                $pos->(107.15)
                            ),
                            $pos->(107.05)
                        );
                    },
                    'err'
                );
                return $ret;
            }
        );

        # Method event 'decoderAdd' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'decoderAdd',
            [
                {
                    name     => 'fragment',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'fragment', 138.2 ) || return;
                try_catch(
                    $f, $scope,
                    sub {
                        $$self->{'xs'}->property_u( 'perlCall', $pos->(142.1) )
                          ->(
                            [
                                str( $f, "incr_parse" ),
                                $$scope->{'fragment'},
                                [ CONTEXT => str( $f, "void" ) ]
                            ],
                            $scope, undef,
                            $pos->(142.15)
                          );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'JSONError' ),
                                    str( $f, "JSON incr_parse() error" ),
                                    [ subError => $$scope->{'err'} ]
                                ],
                                $scope, undef,
                                $pos->(143.15)
                            ),
                            $pos->(143.05)
                        );
                    },
                    'err'
                );
                $ret->set_property( added => $true, $pos->(145.2) );
                return $ret;
            }
        );

        # Method event 'decoderDone' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'decoderDone',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                try_catch(
                    $f, $scope,
                    sub {
                        var(
                            $scope,
                            objects => $$self->{'xs'}
                              ->property_u( 'perlCall', $pos->(155.2) )->(
                                [
                                    str( $f, "incr_parse" ),
                                    [ CONTEXT => str( $f, "list" ) ]
                                ],
                                $scope, undef,
                                $pos->(155.25)
                              ),
                            $file_scope,
                            $pos->(155.1)
                        );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'JSONError' ),
                                    str( $f, "JSON incr_parse() error" ),
                                    [ subError => $$scope->{'err'} ]
                                ],
                                $scope, undef,
                                $pos->(156.15)
                            ),
                            $pos->(156.05)
                        );
                    },
                    'err'
                );
                if (
                    bool(
                        $$scope->{'objects'}
                          ->property_u( '*instanceOf', $pos->(158.3) )->(
                            [ $$scope->{'List'} ], $scope,
                            undef,                 $pos->(158.4)
                          )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $ret->set_property(
                        found => $$scope->{'objects'}
                          ->property_u( 'length', $pos->(159.4) ),
                        $pos->(159.2)
                    );
                }
                $ret->set_property(
                    data => $$scope->{'objects'},
                    $pos->(161.2)
                );
                return $ret;
            }
        );

        # Method event 'decoderReset' definition
        my $func_5 = method_event_def(
            $f, $scope,
            'decoderReset',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $$self->{'xs'}->property_u( 'incr_reset', $pos->(167.2) )
                  ->( [ undef, [] ], $scope, undef, $pos->(167.3) );
                return $ret;
            }
        );

        # Method event 'encode' definition
        my $func_6 = method_event_def(
            $f, $scope, 'encode',
            [
                {
                    name     => 'data',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'data', 180.2 ) || return;
                return $ret_func->(
                    $$scope->{'default'}->property_u( 'encode', $pos->(181.3) )
                      ->( [ $$scope->{'data'} ], $scope, undef, $pos->(181.4) )
                );
                return $ret;
            }
        );

        # Method event 'decode' definition
        my $func_7 = method_event_def(
            $f, $scope, 'decode',
            [
                {
                    name     => 'json',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'json', 187.2 ) || return;
                return $ret_func->(
                    $$scope->{'default'}->property_u( 'decode', $pos->(188.3) )
                      ->( [ $$scope->{'json'} ], $scope, undef, $pos->(188.4) )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            encode => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            decode => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            decoderAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            decoderDone => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_5->inside_scope(
            decoderReset => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            encode => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            decode => $scope,
            $class, $class, $ins, undef, undef
        );
        $scope->set_property(
            _PO => $$scope->{'NATIVE::PerlObject'},
            $pos->(9.3)
        );
        var(
            $scope,
            default => [
                sub {
                    ${ $scope->{special} }->{'class'}
                      ->( [ undef, [] ], $scope, undef, $pos->(12.4) );
                }
            ],
            undef,
            $pos->(12.2)
        );
        typedef(
            $scope, $class,
            'Charset',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => undef,
                    equal_to   => [
                        sub { get_symbol( $f, 'ascii' ) },
                        sub { get_symbol( $f, 'latin1' ) },
                        sub { get_symbol( $f, 'utf8' ) }
                    ]
                ) ? $ins : undef;
            },
            undef
        );
        $class->set_property( stringify => $$scope->{'encode'}, $pos->(191.3) );
        $class->set_property( parse     => $$scope->{'decode'}, $pos->(192.3) );
    }
    load_namespaces( $context,
        qw(Bool Charset Error List NATIVE NATIVE::PerlObject Str) );
};

after_content();
