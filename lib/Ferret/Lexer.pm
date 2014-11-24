# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer;

use warnings;
use strict;
use 5.010;

use Ferret::Lexer::Tokenizer;
use Ferret::Lexer::Constructor;

use Ferret::Lexer::Element;
use Ferret::Lexer::Unknown;
use Ferret::Lexer::Node;
use Ferret::Lexer::Document;

use Ferret::Lexer::Statement;
use Ferret::Lexer::Statement::Class;
use Ferret::Lexer::Statement::Package;
use Ferret::Lexer::Statement::Function;
use Ferret::Lexer::Statement::Method;
use Ferret::Lexer::Statement::If;
use Ferret::Lexer::Statement::Want;
use Ferret::Lexer::Statement::Need;

use Ferret::Lexer::Expression;
use Ferret::Lexer::Expression::String;
use Ferret::Lexer::Expression::LexicalVariable;
use Ferret::Lexer::Expression::InstanceVariable;
use Ferret::Lexer::Expression::SpecialVariable;

use Ferret::Lexer::Structure;
use Ferret::Lexer::Structure::Instruction;
use Ferret::Lexer::Structure::List;
use Ferret::Lexer::Structure::ListItem;
use Ferret::Lexer::Structure::Call;

use Ferret::Lexer::Token::Bareword;

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
    return bless \$err, 'Ferret::Lexer::Error';
}

1
