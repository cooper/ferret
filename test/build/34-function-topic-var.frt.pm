# === Document Model ===
#  Document './test/34-function-topic-var.frt'
#      Instruction
#          Assignment
#              Lexical variable '$doubles'
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
#                                      Operation
#                                          Topic variable '$_'
#                                          Multiplication operator (*)
#                                          Number '2'
#      Instruction
#          Call
#              Bareword 'inspect'
#              Argument list [1 items]
#                  Item 0
#                      Lexical variable '$doubles'
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

FF::before_content('34-function-topic-var.frt');

use Ferret::Core::Operations qw(mul num);
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
            mul( $scope, $ins, num( $f, "2" ) );
            return $ret;
        }
    );
    FF::lex_assign(
        $scope,
        doubles => ${
            FF::create_list( $f,
                [ num( $f, "4" ), num( $f, "16" ), num( $f, "25" ) ] )
          }->{'map'}->(
            [
                $func_0->inside_scope(
                    (undef) => $scope,
                    undef, undef, undef, undef
                )
            ],
            $scope, undef, 1.55
          ),
        undef,
        1.1
    );
    $$scope->{'inspect'}->( [ $$scope->{'doubles'} ], $scope, undef, 2.2 );
};

FF::after_content();
