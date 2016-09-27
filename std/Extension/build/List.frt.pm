# === Document Model ===
#  Document './std/Extension/List.frt'
#      Class 'List'
#          Type definition ('Pairs')
#              Body ('type' scope)
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Property 'even'
#                              Property variable '.length'
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

FF::before_content('List.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'List'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'List', undef, undef );

        FF::typedef(
            $scope, $class, 'Pairs',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
                    $scope, $scope, $ins,
                    conditions => [
                        $ins->fits_type_u( ${ $scope->{special} }->{'class'} ),
                        ${ $$ins->{'length'} }->{'even'}
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
    }
};

FF::after_content();
