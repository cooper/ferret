# Copyright (c) 2015, Mitchell Cooper
package F::Unknown;

use warnings;
use strict;
use 5.010;
use parent 'F::Element';

sub type { 'Token' }
sub desc {
    my $el = shift;
    my $desc  = Ferret::Lexer::pretty_token($el->{token_label});
       $desc .= " (value '$$el{token_value}')"
           if defined $el->{token_value} && !ref $el->{token_value};
    return $desc;
}

sub tok         { shift->{token_label} }
sub type_or_tok { shift->{token_label} }

1
