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
#                              Argument list [1 items]
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
#              Body ('method' scope)
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
#              Body ('method' scope)
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
#                              Argument list [1 items]
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
#              Body ('method' scope)
#                  Instruction
#                      Call
#                          Property 'incr_reset'
#                              Instance variable '@xs'
#                          Argument list [0 items]
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
#      Include (Bool, Charset, Error, List, NATIVE, NATIVE::PerlObject, Str)
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
                                    FF::get_symbol( $f, 'PerlRequireFailed' ),
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
                                    FF::get_symbol(
                                        $f, 'PerlConstructorFailed'
                                    ),
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
                FF::need( $scope, $args, 'data', 81.2 ) or return;
                FF::try_catch(
                    $f, $scope,
                    sub {
                        $ret->set_property(
                            json => ${ $$self->{'xs'} }->{'encode'}
                              ->( [ $$scope->{'data'} ], $scope, undef, 82.25 ),
                            82.1
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
                                $scope, undef, 83.15
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
                FF::need( $scope, $args, 'json', 88.2 ) or return;
                FF::try_catch(
                    $f, $scope,
                    sub {
                        $ret->set_property(
                            data => ${ $$self->{'xs'} }->{'decode'}
                              ->( [ $$scope->{'json'} ], $scope, undef, 89.25 ),
                            89.1
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
                                $scope, undef, 90.15
                            )
                        );
                    },
                    'err'
                );
                return $ret;
            }
        );

        # Method event 'decoderAdd' definition
        my $method_3 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'fragment', 121.2 ) or return;
                FF::try_catch(
                    $f, $scope,
                    sub {
                        ${ $$self->{'xs'} }->{'perlCall'}->(
                            [
                                str( $f, "incr_parse" ),
                                $$scope->{'fragment'},
                                { CONTEXT => str( $f, "void" ) }
                            ],
                            $scope, undef, 125.15
                        );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    FF::get_symbol( $f, 'JSONError' ),
                                    str( $f, "JSON incr_parse() error" ),
                                    { subError => $$scope->{'err'} }
                                ],
                                $scope, undef, 126.15
                            )
                        );
                    },
                    'err'
                );
                $ret->set_property( added => $true, 128.2 );
                return $ret;
            }
        );

        # Method event 'decoderDone' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'decoderDone',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::try_catch(
                    $f, $scope,
                    sub {
                        FF::lex_assign(
                            $scope,
                            objects => ${ $$self->{'xs'} }->{'perlCall'}->(
                                [
                                    str( $f, "incr_parse" ),
                                    { CONTEXT => str( $f, "list" ) }
                                ],
                                $scope, undef, 136.25
                            ),
                            $file_scope,
                            136.1
                        );
                    },
                    sub {
                        my ($scope) = @_;
                        return $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    FF::get_symbol( $f, 'JSONError' ),
                                    str( $f, "JSON incr_parse() error" ),
                                    { subError => $$scope->{'err'} }
                                ],
                                $scope, undef, 137.15
                            )
                        );
                    },
                    'err'
                );
                if (
                    bool(
                        ${ $$scope->{'objects'} }->{'*instanceOf'}
                          ->( [ $$scope->{'List'} ], $scope, undef, 139.4 )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $ret->set_property(
                        found => ${ $$scope->{'objects'} }->{'length'},
                        140.2
                    );
                }
                $ret->set_property( data => $$scope->{'objects'}, 142.2 );
                return $ret;
            }
        );

        # Method event 'decoderReset' definition
        my $method_5 = FF::method_event_def(
            $f, $scope,
            'decoderReset',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                ${ $$self->{'xs'} }->{'incr_reset'}
                  ->( {}, $scope, undef, 147.3 );
                return $ret;
            }
        );

        # Method event 'encode' definition
        my $method_6 = FF::method_event_def(
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
                FF::need( $scope, $args, 'data', 158.2 ) or return;
                return ${ $$scope->{'default'} }->{'encode'}
                  ->( [ $$scope->{'data'} ], $scope, undef, 159.4 );
                return $ret;
            }
        );

        # Method event 'decode' definition
        my $method_7 = FF::method_event_def(
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
                FF::need( $scope, $args, 'json', 163.2 ) or return;
                return ${ $$scope->{'default'} }->{'decode'}
                  ->( [ $$scope->{'json'} ], $scope, undef, 164.4 );
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
            decoderAdd => $scope,
            $proto, $class, undef, undef
        );
        $method_4->inside_scope(
            decoderDone => $scope,
            $proto, $class, undef, undef
        );
        $method_5->inside_scope(
            decoderReset => $scope,
            $proto, $class, undef, undef
        );
        $method_6->inside_scope(
            encode => $scope,
            $class, $class, undef, undef
        );
        $method_7->inside_scope(
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
        $class->set_property( stringify => $$scope->{'encode'}, 167.3 );
        $class->set_property( parse     => $$scope->{'decode'}, 168.3 );
    }
    FF::load_namespaces( $context,
        qw(Bool Charset Error List NATIVE NATIVE::PerlObject Str) );
};

FF::after_content();
