# === Document Model ===
#  Document './test/32-convenient-return.frt'
#      Function 'A'
#          Body ('function' scope)
#              Instruction
#                  Return
#                      String 'return value'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Call
#                          Bareword 'A'
#      Include (A)
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

my $pos = FF::before_content( '32-convenient-return.frt',
    './test/32-convenient-return.frt' );

use Ferret::Core::Operations qw(str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event 'A' definition
    my $func_0 = FF::function_event_def(
        $f, $context, 'A', undef,
        [],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            return $ret_func->( str( $f, "return value" ) );
            return $ret;
        }
    );
    $func_0->inside_scope( A => $scope, $context, undef, undef, undef );
    FF::load_namespaces( $context, qw(A) );
    $$scope->{'say'}->(
        [ $$scope->{'A'}->( [ undef, [] ], $scope, undef, $pos->(5.4) ) ],
        $scope, undef, $pos->(5.2)
    );
};

FF::after_content();