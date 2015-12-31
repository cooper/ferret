# Copyright 2015, Mitchell Cooper
package F::ScopeOwner;

use warnings;
use strict;
use parent 'F::Node';


sub scope { shift->{scope} }

sub new {
    my ($class, %opts) = @_;
    my $el = $class->SUPER::new(%opts);
    my $scope = Ferret::Lexer::Scope->new(owner => $el);
    $el->{scope} = $scope;
    return $el;
}

1
