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
use F::Number;
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
use F::Assignment;
use F::Addition;

# this needs to stay here in case Tokenizer isn't loaded.
our %pretty_tokens = (
    STR_REG     => 'string ("...") or regex (/.../)',
    COMMENT_L   => 'line comment (#...)',
    COMMENT_S   => 'section comment (=== ... ===)',
    COMMENT_B   => 'block comment (/* */)',
    VAR_LEX     => 'lexical variable ($)',
    VAR_THIS    => 'instance variable (@)',
    VAR_SPEC    => 'special variable (*)',
    CLOSURE_S   => 'opening curly bracket "{"',
    CLOSURE_E   => 'closing curly bracket "}"',
    PAREN_S     => 'opening parenthesis "("',
    PAREN_E     => 'closing parenthesis ")"',
    BRACKET_S   => 'opening bracket "["',
    BRACKET_E   => 'closing bracket "]"',
    PROPERTY    => 'property accessor (.property)',
    OP_RETURN   => 'return operator (->)',
    OP_ADD_A    => 'altering addition operator (+=)',
    OP_SUB_A    => 'altering subtraction operator (-=)',
    OP_MUL_A    => 'altering multiplication operator (*=)',
    OP_DIV_A    => 'altering division operator (/=)',
    OP_EQUAL_I  => 'reference equality operator (===)',
    OP_EQUAL    => 'equality operator (==)',
    OP_ASSIGN   => 'assignment operator (=)',
    OP_ADD      => 'addition operator (+)',
    OP_SUB      => 'subtraction operator (-)',
    OP_MUL      => 'multiplication operator (*)',
    OP_DIV      => 'division operator (/)',
    OP_EXCLAM   => 'not operator (!)',
    OP_SEMI     => 'semicolon (;)',
    #OP_PROP     => 'property operator (.)',
    OP_COMMA    => 'comma (,)',
    OP_PACK     => 'namespace operator (::)',
    PROP_VALUE  => 'property assignment (property: ...)',
    OP_VALUE    => 'colon (:)',
    BAREWORD    => 'bareword',
    NUMBER      => 'inline number',
    NEWLINE     => 'newline',
    SPACE       => 'whitespace',
    PAREN_CALL  => 'call parenthesis "("',
    STRING      => 'string ("...")',
    REGEX       => 'regex (/.../)',
    CLASS_DEC   => 'class declaration',
    PKG_DEC     => 'package declaration',
    FUNCTION    => 'function declaration',
    METHOD      => 'method declaration',
    OP_CALL     => 'zero-argument call operator (!)'
);

sub pretty_token {
    my $tok = shift;
    return 'beginning of file' if not defined $tok;

    # keywords.
    if ($tok =~ m/^KEYWORD_(.+)$/) {
        my $key = lc $1;
        return "keyword '$key'";
    }

    return $pretty_tokens{$tok} || $tok;
}

sub fatal($) {
    my $err = shift;
    return bless \$err, 'F::Error';
}

1
