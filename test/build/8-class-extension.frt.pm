# === Document Model ===
#  Document './test/8-class-extension.frt'
#      Class 'String'
#          Method 'doubledLength'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Call
#                                  Instance variable '@length'
#                              Multiplication operator (*)
#                              Number '2'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Length tim...'
#                          Addition operator (+)
#                          Call
#                              Property 'doubledLength'
#                                  String 'hi there'
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
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

my $pos =
  FF::before_content( '8-class-extension.frt', './test/8-class-extension.frt' );

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'String'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'String', undef, undef );

        # Method event 'doubledLength' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'doubledLength',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                return $ret_func->(
                    mul(
                        $scope,
                        $$self->{'length'}
                          ->( [ undef, [] ], $scope, undef, $pos->(4.3) ),
                        num( $f, "2" )
                    )
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            doubledLength => $scope,
            $proto, $class, undef, undef
        );
    }
    $$scope->{'say'}->(
        [
            add(
                $scope,
                str( $f, "Length times two: " ),
                ${ str( $f, "hi there" ) }->{'doubledLength'}
                  ->( [ undef, [] ], $scope, undef, $pos->(9.35) )
            )
        ],
        $scope, undef,
        $pos->(9.1)
    );
};

FF::after_content();
