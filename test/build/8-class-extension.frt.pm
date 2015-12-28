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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('8-class-extension.frt');

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'String'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'String', undef );

        # Method event 'doubledLength' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'doubledLength',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return(
                    mul(
                        $scope,
                        $self->property_u('length')
                          ->call_u( {}, $scope, undef, 4.3 ),
                        num( $f, 2 )
                    )
                );
                return $ret->return;
            }
        );
        $method_0->inside_scope(
            doubledLength => $scope,
            $proto, $class, undef, undef
        );
    }
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Length times two: " ),
                str( $f, "hi there" )->property_u('doubledLength')
                  ->call_u( {}, $scope, undef, 9.35 )
            )
        ],
        $scope, undef, 9.1
    );
};

FF::after_content();
