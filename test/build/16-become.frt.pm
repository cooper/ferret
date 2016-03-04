# === Document Model ===
#  Document './test/16-become.frt'
#      Instruction
#          Assignment
#              Lexical variable '$obj'
#              String 'hi'
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Math::Point'
#                  Argument list [1 items]
#                      Item 0
#                          Lexical variable '$obj'
#              Argument list [2 items]
#                  Item 0
#                      Number '1'
#                  Item 1
#                      Number '1'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Call
#                          Property 'pretty'
#                              Lexical variable '$obj'
#      Include (Math, Math::Point)
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

FF::before_content('16-become.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Math Math::Point) );
    FF::lex_assign( $scope, obj => str( $f, "hi" ), undef, 2.2 );
    ${ $$scope->{'Math::Point'} }->{'init'}
      ->( [ $$scope->{'obj'} ], $scope, undef, 9.25 )
      ->( [ num( $f, "1" ), num( $f, "1" ) ], $scope, undef, 9.4 );
    $$scope->{'say'}->(
        [ ${ $$scope->{'obj'} }->{'pretty'}->( {}, $scope, undef, 11.5 ) ],
        $scope, undef, 11.2
    );
};

FF::after_content();
