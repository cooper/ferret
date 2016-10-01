# === Document Model ===
#  Document './test/33-function-prop-var.frt'
#      Instruction
#          Assignment
#              Lexical variable '$roots'
#              Call
#                  Property 'map'
#                      Value list [3 items]
#                          Item 0
#                              Number '4'
#                          Item 1
#                              Number '16'
#                          Item 2
#                              Number '25'
#                  Argument list [1 items]
#                      Item 0
#                          Anonymous function
#                              Body ('function' scope)
#                                  Instruction
#                                      Return
#                                          Property variable '.sqrt'
#      Instruction
#          Call
#              Bareword 'inspect'
#              Argument list [1 items]
#                  Item 0
#                      Lexical variable '$roots'
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

my $pos = FF::before_content( '33-function-prop-var.frt',
    './test/33-function-prop-var.frt' );

use Ferret::Core::Operations qw(num);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            my $ins = $args->{_};
            return $ret_func->( $$ins->{'sqrt'} );
            return $ret;
        }
    );
    FF::lex_assign(
        $scope,
        roots => ${
            FF::create_list( $f,
                [ num( $f, "4" ), num( $f, "16" ), num( $f, "25" ) ] )
          }->{'map'}->(
            [
                $func_0->inside_scope(
                    (undef) => $scope,
                    undef, undef, undef, undef
                )
            ],
            $scope, undef,
            $pos->(1.55)
          ),
        undef,
        $pos->(1.1)
    );
    $$scope->{'inspect'}
      ->( [ $$scope->{'roots'} ], $scope, undef, $pos->(2.2) );
};

FF::after_content();
