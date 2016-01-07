# === Document Model ===
#  Document './test/17-empty-become.frt'
#      Instruction
#          Assignment
#              Lexical variable '$obj'
#              Object [0 items]
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Timer'
#                  Argument list [1 items]
#                      Item 0
#                          Lexical variable '$obj'
#              Argument list [1 items]
#                  Item 0
#                      Number '5'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Lexical variable '$obj'
#                      Argument list [0 items]
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'it works!'
#      Include (Timer)
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

FF::before_content('17-empty-become.frt');

use Ferret::Core::Operations qw(num str);
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
            $$scope->{'say'}
              ->( [ str( $f, "it works!" ) ], $scope, undef, 8.2 );
            return $ret;
        }
    );
    FF::load_namespaces( $context, qw(Timer) );
    FF::lex_assign( $scope, obj => FF::create_object( $f, {} ), undef, 2.2 );
    ${ $$scope->{'Timer'} }->{'init'}
      ->( [ $$scope->{'obj'} ], $scope, undef, 5.15 )
      ->( [ num( $f, 5 ) ], $scope, undef, 5.3 );
    FF::on(
        ${ $$scope->{'obj'} }->{'once'}->( {}, $scope, undef, 7.4 ),
        'expire',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
};

FF::after_content();
