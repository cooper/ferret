# === Document Model ===
#  Document './std/IRC/Message.frt'
#      Package 'IRC'
#      Class 'Message'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Lexical variable '$data'
#                          Argument type
#                              Bareword 'Str::NonEmpty'
#                  If
#                      Expression ('if' parameter)
#                          Lexical variable '$data'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Instance variable '@parse'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Lexical variable '$data'
#          Method 'parse'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                          Argument type
#                              Bareword 'Str::NonEmpty'
#                  Instruction
#                      Assignment
#                          Lexical variable '$words'
#                          Call
#                              Property 'split'
#                                  Lexical variable '$data'
#                              Argument list [1 items]
#                                  Item 0
#                                      Regex /\s+/
#      Include (Str, Str::NonEmpty)
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

FF::before_content('Message.frt');

use Ferret::Core::Operations qw(bool rgx);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC' );
    my $scope = $file_scope;
    FF::load_core('IRC');

    # Class 'Message'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Message', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'data',
                    type     => 'Str::NonEmpty',
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $scope, $args, 'data', 7.2 );
                if ( bool( $$scope->{'data'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'parse'}
                      ->( [ $$scope->{'data'} ], $scope, undef, 9.2 );
                }
                return $ret;
            }
        );

        # Method event 'parse' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'parse',
            [
                {
                    name     => 'data',
                    type     => 'Str::NonEmpty',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'data', 15.2 ) or return;
                FF::lex_assign(
                    $scope,
                    words => ${ $$scope->{'data'} }->{'split'}->(
                        [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                        undef, 16.5
                    ),
                    $file_scope,
                    16.2
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            parse => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Str Str::NonEmpty) );
};

FF::after_content();
