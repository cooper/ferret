# === Document Model ===
#  Document './test/2-call-expression.frt'
#      Instruction
#          Single value [1 items]
#              Item 0
#                  Call
#                      Single value [1 items]
#                          Item 0
#                              Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              String 'Hello World!'
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

my $pos =
  FF::before_content( '2-call-expression.frt', './test/2-call-expression.frt' );

use Ferret::Core::Operations qw(str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    $$scope->{'say'}
      ->( [ str( $f, "Hello World!" ) ], $scope, undef, $pos->(1.25) );
};

FF::after_content();
