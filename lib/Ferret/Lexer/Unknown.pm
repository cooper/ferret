# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer::Unknown;

use warnings;
use strict;
use 5.010;
use parent 'Ferret::Lexer::Element';

sub type { 'Token' }
sub desc {
    my $el = shift;
    my $desc  = "Token $$el{token_label}";
       $desc .= " = $$el{token_value}" if defined $el->{token_value};
    return $desc;
}

sub type_or_tok { shift->{token_label} }

1
