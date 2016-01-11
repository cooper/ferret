# === Document Model ===
#  Document './test/21-nested-callbacks.frt'
#      Instruction
#          Assignment
#              Lexical variable '$parts'
#              Call
#                  Property 'split'
#                      String 's p a m'
#                  Argument list [1 items]
#                      Item 0
#                          String ' '
#      For (pairs)
#          Expression ('for' parameter)
#              Set [2 items]
#                  Item 0
#                      Lexical variable '$i'
#                  Item 1
#                      Lexical variable '$part'
#          Expression ('in' parameter)
#              Lexical variable '$parts'
#          Body ('for' scope)
#              On
#                  Expression ('on' parameter)
#                      Property 'expire'
#                          Call
#                              Property 'once'
#                                  Call
#                                      Bareword 'Timer'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Lexical variable '$i'
#                              Argument list [0 items]
#                  Anonymous function
#                      Body ('function' scope)
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Operation
#                                              String '('
#                                              Addition operator (+)
#                                              Lexical variable '$i'
#                                              Addition operator (+)
#                                              String ') '
#                                              Addition operator (+)
#                                              Lexical variable '$part'
#      For (values)
#          Expression ('for' parameter)
#              Lexical variable '$part'
#          Expression ('in' parameter)
#              Value list [3 items]
#                  Item 0
#                      Number '1'
#                  Item 1
#                      Number '2'
#                  Item 2
#                      Number '3'
#          Body ('for' scope)
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Lexical variable '$part'
#      Include (Timer)
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

FF::before_content('21-nested-callbacks.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $$scope->{'say'}->(
                [
                    add(
                        $scope,         str( $f, "(" ),
                        $$scope->{'i'}, str( $f, ") " ),
                        $$scope->{'part'}
                    )
                ],
                $scope, undef, 5.1
            );
            return $ret;
        }
    );
    FF::load_namespaces( $context, qw(Timer) );
    FF::lex_assign(
        $scope,
        parts => ${ str( $f, "s p a m" ) }->{'split'}
          ->( [ str( $f, " " ) ], $scope, undef, 1.5 ),
        undef, 1.2
    );
    FF::iterate_pair(
        $f, $scope,
        $$scope->{'parts'},
        'i', 'part',
        sub {
            my ( $scope, $loop ) = @_;
            FF::on(
                ${
                    $$scope->{'Timer'}
                      ->( [ $$scope->{'i'} ], $scope, undef, 4.15 )
                  }->{'once'}->( {}, $scope, undef, 4.35 ),
                'expire', $self, $scope,
                $func_0->inside_scope(
                    (undef) => $scope,
                    undef, undef, undef, undef
                ),
                {}
            );
        },
        3.05
    );
    FF::iterate(
        $f, $scope,
        FF::create_list(
            $f, [ num( $f, "1" ), num( $f, "2" ), num( $f, "3" ) ]
        ),
        'part',
        sub {
            my ( $scope, $loop ) = @_;
            $$scope->{'say'}->( [ $$scope->{'part'} ], $scope, undef, 10.2 );
        },
        9.05
    );
};

FF::after_content();
