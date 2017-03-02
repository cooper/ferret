# === Document Model ===
#  File './test/19-foreach.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$words'
#                  Call
#                      Property 'split'
#                          String 'how are you?'
#                      Argument list [1 item]
#                          Item 0
#                              String ' '
#          For (values)
#              Expression ('for' parameter)
#                  Lexical variable '$word'
#              Expression ('in' parameter)
#                  Lexical variable '$words'
#              For body
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 item]
#                              Item 0
#                                  Operation
#                                      String 'part: '
#                                      Addition operator (+)
#                                      Lexical variable '$word'
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
use Ferret::Core::Operations qw(add str);

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './test/19-foreach.frt';
my $pos = before_content( '19-foreach.frt', $file_name );
my $result;

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    var(
        $scope,
        words => str( $f, "how are you?" )->property_u( 'split', $pos->(1.4) )
          ->( [ str( $f, " " ) ], $scope, undef, $pos->(1.5) ),
        undef, $pos->(1.2)
    );
    {
        my ( $loop_status, $loop_ret ) = iterate(
            $f, $scope,
            $$scope->{'words'},
            'word',
            sub {
                my ( $scope, $ret_func ) = @_;
                $$scope->{'say'}->(
                    [
                        add(
                            $scope, $pos->(4.4),
                            str( $f, "part: " ), $$scope->{'word'}
                        )
                    ],
                    $scope, undef,
                    $pos->(4.2)
                );
            },
            $pos->(3.1)
        );
        return $ret_func->($loop_ret) if $loop_status eq 'return';
    }
};

after_content($file_name);
