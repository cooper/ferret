# === Document Model ===
#  Document './test/28-type.frt'
#      Type definition ('Gender')
#          Body ('type' scope)
#              Instruction
#                  Symbol :male
#              Instruction
#                  Symbol :female
#      Function 'announce'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$name'
#                      Argument type
#                          Bareword 'Str'
#              Instruction
#                  Need
#                      Lexical variable '$gender'
#                      Argument type
#                          Bareword 'Gender'
#              Instruction
#                  Assignment
#                      Lexical variable '$what'
#                      Call
#                          Property 'trimPrefix'
#                              Call
#                                  Bareword 'Str'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Lexical variable '$gender'
#                          Argument list [1 items]
#                              Item 0
#                                  String ':'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  Lexical variable '$name'
#                                  Addition operator (+)
#                                  String ' is '
#                                  Addition operator (+)
#                                  Lexical variable '$what'
#      Instruction
#          Call
#              Bareword 'announce'
#              Argument list [2 items]
#                  Item 0
#                      String 'Robert'
#                  Item 1
#                      Symbol :male
#      Instruction
#          Call
#              Bareword 'announce'
#              Argument list [2 items]
#                  Item 0
#                      String 'Kris'
#                  Item 1
#                      Symbol :female
#      Instruction
#          Call
#              Bareword 'announce'
#              Argument list [2 items]
#                  Item 0
#                      String 'Kylie'
#                  Item 1
#                      Symbol :female
#      Instruction
#          Call
#              Bareword 'announce'
#              Argument list [2 items]
#                  Item 0
#                      String 'Caitlyn'
#                  Item 1
#                      Symbol :other
#      Include (Gender, Str)
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

FF::before_content('28-type.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event 'announce' definition
    my $func_0 = FF::function_event_def(
        $f, $context,
        'announce',
        [
            { name => 'name', type => 'Str', optional => undef, more => undef },
            {
                name     => 'gender',
                type     => 'Gender',
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'name',   7.1 ) or return;
            FF::need( $scope, $args, 'gender', 7.3 ) or return;
            FF::lex_assign(
                $scope,
                what => ${
                    $$scope->{'Str'}
                      ->( [ $$scope->{'gender'} ], $scope, undef, 8.2 )
                  }->{'trimPrefix'}->( [ str( $f, ":" ) ], $scope, undef, 8.4 ),
                $file_scope,
                8.1
            );
            $$scope->{'say'}->(
                [
                    add(
                        $scope, $$scope->{'name'},
                        str( $f, " is " ), $$scope->{'what'}
                    )
                ],
                $scope, undef, 9.1
            );
            return $ret;
        }
    );
    $func_0->inside_scope( announce => $scope, $context, undef, undef, undef );
    FF::load_namespaces( $context, qw(Gender Str) );
    FF::typedef(
        $scope, $context, 'Gender',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            FF::typedef_check(
                $scope, $scope, $ins,
                conditions => undef,
                equal_to   => [
                    FF::get_symbol( $f, 'male' ),
                    FF::get_symbol( $f, 'female' )
                ]
            ) ? $ins : undef;
        },
        undef
    );
    $$scope->{'announce'}->(
        [ str( $f, "Robert" ), FF::get_symbol( $f, 'male' ) ],
        $scope, undef, 12.2
    );
    $$scope->{'announce'}->(
        [ str( $f, "Kris" ), FF::get_symbol( $f, 'female' ) ],
        $scope, undef, 13.2
    );
    $$scope->{'announce'}->(
        [ str( $f, "Kylie" ), FF::get_symbol( $f, 'female' ) ],
        $scope, undef, 14.2
    );
    $$scope->{'announce'}->(
        [ str( $f, "Caitlyn" ), FF::get_symbol( $f, 'other' ) ],
        $scope, undef, 15.2
    );
};

FF::after_content();
