# Copyright (c) 2014 Mitchell Cooper
package F::Unknown;

use warnings;
use strict;
use 5.010;
use parent 'F::Element';

sub type { 'Token' }
sub desc {
    my $el = shift;
    my $desc  = "Token $$el{token_label}";
       $desc .= " = $$el{token_value}" if defined $el->{token_value};
    return $desc;
}

sub type_or_tok { shift->{token_label} }

# there should be no unconstructed tokens left by this point.
sub perl_fmt_do {
    my $el = shift;
    die sprintf "Unexpected %s on line %d\n", $el->desc, $el->{create_line};
}

1
