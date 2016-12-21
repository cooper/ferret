# === Document Model ===
#  Document './std/EventSet.frt'
#      Class 'EventSet'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Want
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  If
#                      Expression ('if' parameter)
#                          Lexical variable '$code'
#                      If body
#                          Instruction
#                              Call
#                                  Lexical variable '$code'
#                                  Named argument list [1 item]
#                                      Item 0
#                                          Pair '_'
#                                              Special variable '*self'
#      Include (Code)
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

my $pos = before_content( 'EventSet.frt', './std/EventSet.frt' );

use Ferret::Core::Operations qw(bool);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'EventSet'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'EventSet', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => 1,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $scope, $args, 'code', 4.2 );
                if ( bool( $$scope->{'code'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$scope->{'code'}->(
                        [ undef, [ _ => ${ $scope->{special} }->{'self'} ] ],
                        $scope, undef, $pos->(6.2)
                    );
                }
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Code) );
};

after_content();
