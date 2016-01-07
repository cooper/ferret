# === Document Model ===
#  Document './std/Module.frt'
#      Class 'Module' version 1.0
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@name'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      String '::'
#                  Instruction
#                      Want
#                          Instance variable '@prefix'
#                          Argument type
#                              Bareword 'Str'
#                          Argument value
#                              String 'CORE'
#                  Instruction
#                      Want
#                          Instance variable '@version'
#                          Argument type
#                              Bareword 'Num'
#                          Argument value
#                              Number '1.0'
#                  Instruction
#                      Assignment
#                          Instance variable '@fullName'
#                          Operation
#                              Instance variable '@prefix'
#                              Addition operator (+)
#                              String '::'
#                              Addition operator (+)
#                              Instance variable '@name'
#      Include (Num, Str)
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

FF::before_content('Module.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'Module'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Module', 1.0 );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'name',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'prefix',
                    type     => 'Str',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'version',
                    type     => 'Num',
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $self, $args, 'name' ) or return;
                str( $f, "::" );
                FF::want( $self, $args, 'prefix', 9.2, str( $f, "CORE" ) );
                FF::want( $self, $args, 'version', 12.2, num( $f, "1.0" ) );
                $self->set_property(
                    fullName => add(
                        $scope, $$self->{'prefix'},
                        str( $f, "::" ), $$self->{'name'}
                    ),
                    15.2
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Num Str) );
};

FF::after_content();
