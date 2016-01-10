# === Document Model ===
#  Document './test/19-foreach.frt'
#      Instruction
#          Assignment
#              Lexical variable '$words'
#              Call
#                  Property 'split'
#                      String 'how are you?'
#                  Argument list [1 items]
#                      Item 0
#                          String ' '
#      For
#          Expression ('for' parameter)
#              Lexical variable '$word'
#          Expression ('in' parameter)
#              Lexical variable '$words'
#          Body ('for' scope)
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  String 'part: '
#                                  Addition operator (+)
#                                  Lexical variable '$word'
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

FF::before_content('19-foreach.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    FF::lex_assign(
        $scope,
        words => ${ str( $f, "how are you?" ) }->{'split'}
          ->( [ str( $f, " " ) ], $scope, undef, 1.5 ),
        undef, 1.2
    );
    FF::iterate(
        $f, $scope,
        $$scope->{'words'},
        'word',
        sub {
            my ( $scope, $loop ) = @_;

            $$scope->{'say'}->(
                [ add( $scope, str( $f, "part: " ), $$scope->{'word'} ) ],
                $scope, undef, 4.2
            );
        },
        3.1
    );
};

FF::after_content();
