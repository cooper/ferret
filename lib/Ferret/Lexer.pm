# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer;

use warnings;
use strict;
use 5.010;

use Ferret::Lexer::Tokenizer;
use Ferret::Lexer::Constructor;

use F::Element;
use F::Unknown;
use F::Node;
use F::Document;

use F::Statement;
use F::Class;
use F::Package;
use F::Function;
use F::Method;
use F::If;
use F::Want;
use F::Need;

use F::Expression;
use F::String;
use F::LexicalVariable;
use F::InstanceVariable;
use F::SpecialVariable;

use F::Structure;
use F::Instruction;
use F::List;
use F::ListItem;
use F::Pair;
use F::Call;
use F::Property;

use F::Bareword;

sub pretty_token {
    my $tok = shift;
    return 'beginning of file' if not defined $tok;

    # keywords.
    if ($tok =~ m/^KEYWORD_(.+)$/) {
        my $key = lc $1;
        return "keyword '$key'";
    }

    # operators.
    if ($tok =~ m/^OP_(.+)$/) {
        my $key = lc $1;
        return "$key operator";
    }

    return $tok;
}

sub fatal($) {
    my $err = shift;
    return bless \$err, 'F::Error';
}

1
