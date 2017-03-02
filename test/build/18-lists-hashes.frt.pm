# === Document Model ===
#  Document './test/18-lists-hashes.frt'
#      Instruction
#          Assignment
#              Lexical variable '$list'
#              Value list [1 item]
#                  Item 0
#                      String 'hi'
#      Instruction
#          Call
#              Property 'push'
#                  Lexical variable '$list'
#              Argument list [1 item]
#                  Item 0
#                      String 'there'
#      Instruction
#          Assignment
#              Index
#                  Lexical variable '$list'
#                  Index list [1 item]
#                      Item 0
#                          Number '4'
#              String 'yeah'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 item]
#                  Item 0
#                      Operation
#                          String 'Length: '
#                          Addition operator (+)
#                          Property 'length'
#                              Lexical variable '$list'
#      For (values)
#          Expression ('for' parameter)
#              Lexical variable '$item'
#          Expression ('in' parameter)
#              Lexical variable '$list'
#          For body
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 item]
#                          Item 0
#                              Operation
#                                  String 'item: '
#                                  Addition operator (+)
#                                  Lexical variable '$item'
#      Instruction
#          Assignment
#              Lexical variable '$hash'
#              Hash [1 item]
#                  Item 0
#                      Pair 'hi'
#                          String 'there'
#      Instruction
#          Assignment
#              Index
#                  Lexical variable '$hash'
#                  Index list [1 item]
#                      Item 0
#                          String 'whats'
#              String 'up'
#      Instruction
#          Assignment
#              Index
#                  Lexical variable '$hash'
#                  Index list [1 item]
#                      Item 0
#                          String 'thank'
#              String 'you'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 item]
#                  Item 0
#                      Operation
#                          String 'whats '
#                          Addition operator (+)
#                          Index
#                              Lexical variable '$hash'
#                              Index list [1 item]
#                                  Item 0
#                                      String 'whats'
#      For (pairs)
#          Expression ('for' parameter)
#              Set [2 items]
#                  Item 0
#                      Lexical variable '$key'
#                  Item 1
#                      Lexical variable '$val'
#          Expression ('in' parameter)
#              Lexical variable '$hash'
#          For body
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 item]
#                          Item 0
#                              Operation
#                                  String 'pair: key='
#                                  Addition operator (+)
#                                  Lexical variable '$key'
#                                  Addition operator (+)
#                                  String ' value='
#                                  Addition operator (+)
#                                  Lexical variable '$val'
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

my $file_name = './test/18-lists-hashes.frt';
my $pos = before_content( '18-lists-hashes.frt', $file_name );

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    var(
        $scope,
        list => create_list( $f, [ str( $f, "hi" ) ] ),
        undef, $pos->(1.2)
    );
    $$scope->{'list'}->property_u( 'push', $pos->(2.2) )
      ->( [ str( $f, "there" ) ], $scope, undef, $pos->(2.3) );
    $$scope->{'list'}->set_index_value(
        [ num( $f, "4" ) ],
        str( $f, "yeah" ),
        $scope, $pos->(3.5)
    );
    $$scope->{'say'}->(
        [
            add(
                $scope, $pos->(5.4),
                str( $f, "Length: " ),
                $$scope->{'list'}->property_u( 'length', $pos->(5.6) )
            )
        ],
        $scope, undef,
        $pos->(5.2)
    );
    {
        my ( $loop_status, $loop_ret ) = iterate(
            $f, $scope,
            $$scope->{'list'},
            'item',
            sub {
                my ( $scope, $ret_func ) = @_;
                $$scope->{'say'}->(
                    [
                        add(
                            $scope, $pos->(8.4),
                            str( $f, "item: " ), $$scope->{'item'}
                        )
                    ],
                    $scope, undef,
                    $pos->(8.2)
                );
            },
            $pos->(7.1)
        );
        return $ret_func->($loop_ret) if $loop_status eq 'return';
    }
    var(
        $scope,
        hash => create_hash( $f, [ hi => str( $f, "there" ) ] ),
        undef, $pos->(11.2)
    );
    $$scope->{'hash'}->set_index_value(
        [ str( $f, "whats" ) ],
        str( $f, "up" ),
        $scope, $pos->(12.5)
    );
    $$scope->{'hash'}->set_index_value(
        [ str( $f, "thank" ) ],
        str( $f, "you" ),
        $scope, $pos->(13.5)
    );
    $$scope->{'say'}->(
        [
            add(
                $scope,
                $pos->(15.2),
                str( $f, "whats " ),
                $$scope->{'hash'}->get_index_value(
                    [ str( $f, "whats" ) ],
                    $scope, $pos->(15.3)
                )
            )
        ],
        $scope, undef,
        $pos->(15.1)
    );
    {
        my ( $loop_status, $loop_ret ) = iterate_pair(
            $f, $scope,
            $$scope->{'hash'},
            'key', 'val',
            sub {
                my ( $scope, $ret_func ) = @_;
                $$scope->{'say'}->(
                    [
                        add(
                            $scope, $pos->(18.2),
                            str( $f, "pair: key=" ), $$scope->{'key'},
                            str( $f, " value=" ),    $$scope->{'val'}
                        )
                    ],
                    $scope, undef,
                    $pos->(18.1)
                );
            },
            $pos->(17.05)
        );
        return $ret_func->($loop_ret) if $loop_status eq 'return';
    }
};

after_content($file_name);
