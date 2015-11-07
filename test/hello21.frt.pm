# === Document Model ===
#  Document './test/hello21.frt'
#      Instruction
#          Assignment (lexical variable '$parts')
#              Call
#                  Property 'split'
#                      String 's p a m'
#                  Single value [1 items]
#                      Item 0
#                          String ' '
#      For
#          Expression ('for' parameter)
#              Set [2 items]
#                  Item 0
#                      Lexical variable '$i'
#                  Item 1
#                      Lexical variable '$part'
#          Expression ('in' parameter)
#              Lexical variable '$parts'
#          On
#              Expression ('on' parameter)
#                  Property 'expire'
#                      Call
#                          Property 'once'
#                              Call
#                                  Bareword 'Timer'
#                                  Single value [1 items]
#                                      Item 0
#                                          Lexical variable '$i'
#                          Structural list [0 items]
#              Anonymous function
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Single value [1 items]
#                              Item 0
#                                  Operation
#                                      String '('
#                                      Addition operator (+)
#                                      Lexical variable '$i'
#                                      Addition operator (+)
#                                      String ') '
#                                      Addition operator (+)
#                                      Lexical variable '$part'
#      For
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
#          Instruction
#              Call
#                  Bareword 'say'
#                  Single value [1 items]
#                      Item 0
#                          Lexical variable '$part'
#      Include (Timer)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('hello21.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my @funcs;
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,                  str( $f, "(" ),
                        $scope->property_u('i'), str( $f, ") " ),
                        $scope->property_u('part')
                    )
                ],
                $scope
            );
            return $return;
        };
    }
    FF::load_namespaces( $context, qw(Timer) );
    $scope->set_property_ow( $context,
        parts => str( $f, "s p a m" )->property_u('split')
          ->call_u( [ str( $f, " " ) ], $scope ) );
    FF::iterate_pair(
        $f, $scope,
        $scope->property_u('parts'),
        'i', 'part',
        sub {
            my $scope = shift;
            FF::on(
                $scope->property_u('Timer')
                  ->call_u( [ $scope->property_u('i') ], $scope )
                  ->property_u('once')->call_u( {}, $scope ),
                'expire', $self, $scope,
                $funcs[0]->inside_scope(
                    (undef) => $scope,
                    $scope, undef, undef, undef
                )
            );
        }
    );
    FF::iterate(
        $f, $scope,
        FF::create_list( $f, [ num( $f, 1 ), num( $f, 2 ), num( $f, 3 ) ] ),
        'part',
        sub {
            my $scope = shift;
            $scope->property_u('say')
              ->call_u( [ $scope->property_u('part') ], $scope );
        }
    );
};

FF::after_content();
