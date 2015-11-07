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
use F::WantNeed;
use F::Expression;
use F::String;
use F::Number;
use F::LexicalVariable;
use F::InstanceVariable;
use F::SpecialVariable;
use F::SetTypeVariable;
use F::Instruction;
use F::List;
use F::ListItem;
use F::Pair;
use F::Call;
use F::Property;
use F::Bareword;
use F::Assignment;
use F::Operation;
use F::Operator;
use F::ReturnPair;
use F::Return;
use F::Maybe;
use F::Spaces;
use F::Inside;
use F::On;
use F::Boolean;
use F::For;
use F::Index;
use F::Equality;
use F::PropertyModifier;
use F::Assignable;
use F::Negation;

# this needs to stay here in case Tokenizer isn't loaded.
our %pretty_tokens = (
    STR_REG     => 'string ("...") or regex (/.../)',
    COMMENT_L   => 'line comment (#...)',
    COMMENT_S   => 'section comment (=== ... ===)',
    COMMENT_B   => 'block comment (/* */)',
    VAR_LEX     => 'lexical variable ($)',
    VAR_THIS    => 'instance variable (@)',
    VAR_SPEC    => 'special variable (*)',
    VAR_SET     => 'set type variable (<>)',
    CLOSURE_S   => 'opening curly bracket "{"',
    CLOSURE_E   => 'closing curly bracket "}"',
    PAREN_S     => 'opening parenthesis "("',
    PAREN_CALL  => 'call parenthesis "("',
    PAREN_E     => 'closing parenthesis ")"',
    BRACKET_S   => 'opening bracket "["',
    BRACKET_IDX => 'index bracket "["',
    BRACKET_E   => 'closing bracket "]"',
    PROPERTY    => 'property accessor (.property)',
    OP_RETURN   => 'return operator (->)',
    OP_ADD_A    => 'altering addition operator (+=)',
    OP_SUB_A    => 'altering subtraction operator (-=)',
    OP_MUL_A    => 'altering multiplication operator (*=)',
    OP_DIV_A    => 'altering division operator (/=)',
    OP_EQUAL_I  => 'reference equality operator (===)',
    OP_EQUAL    => 'equality operator (==)',
    OP_NEQUAL_I => 'negated reference equality operator (===)',
    OP_NEQUAL   => 'negated equality operator (==)',
    OP_ASSIGN   => 'assignment operator (=)',
    OP_ADD      => 'addition operator (+)',
    OP_SADD     => 'positivity operator (+)',
    OP_SUB      => 'subtraction operator (-)',
    OP_SSUB     => 'negation operator (-)',
    OP_MUL      => 'multiplication operator (*)',
    OP_DIV      => 'division operator (/)',
    OP_POW      => 'exponent operator (^)',
    OP_NOT      => 'not operator (!)',
    OP_MOD      => 'modulus operator (%)',
    OP_MAYBE    => 'inline if operator (?)',
    OP_SEMI     => 'semicolon (;)',
    OP_ELLIP    => 'ellipsis (...)',
    OP_RANGE    => 'range operator (..)',
    #OP_PROP     => 'property operator (.)',
    OP_COMMA    => 'comma (,)',
    OP_PACK     => 'namespace operator (::)',
    OP_VALUE    => 'colon (:)',
    OP_CALL     => 'zero-argument call operator (!)',
    PROP_VALUE  => 'property assignment (property: ...)',
    BAREWORD    => 'bareword',
    NUMBER      => 'inline number',
    NEWLINE     => 'newline',
    SPACE       => 'whitespace',
    STRING      => 'string ("...")',
    REGEX       => 'regex (/.../)',
    CLASS_DEC   => 'class declaration',
    PKG_DEC     => 'package declaration',
    FUNCTION    => 'function declaration',
    METHOD      => 'method declaration'
);

our %pretty_currents = (
    node            => 'node',                  # node
    rule_el         => 'rule element',          # element for which rules are being applied
    err_caller      => 'error caller',          # caller for error functions
    package         => 'package',               # package
    end_cap         => 'end keyword capturer',  # structure capturing end keyword
    class           => 'class',                 # clas
    clos_cap        => 'closure capturer',      # upcoming structure to capture closure
    closure         => 'closure',               # closure
    instruction     => 'instruction',           # instruction
    last_element    => 'previous element',      # previous element at same level
    list            => 'list',                  # innermost list
    want            => 'want declaration',      # innermost want
    need            => 'need declaration',      # innermost need
    label           => 'token label',           # most recent label
    unknown_el      => 'unknown element',       # F::Unknown for current token
    elements        => 'element list'           # list of elements
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

sub pretty_current {
    my $c = shift;
    return $pretty_currents{$c} || $c;
}

# $string = show_tok(@tokens)
sub show_tok {
    require JSON::XS;
    state $json = JSON::XS->new->allow_nonref(1);
    my $str = '';
    foreach (@_) {
        my ($label, $value) = @$_;
        $str .= sprintf "%15s | %s\n",
            $label,
            defined $value ? $json->encode($value) : '';
    }
    return $str;
}

# $string = show_dom($document, $include_unknown)
sub show_dom {
    state $indent = 0;
    my ($el, $include_unknown, $str) = @_;
    $str ||= \(my $empty = "");

    return if $el->type eq 'Unknown' && !$include_unknown;

    # generate a description
    my $desc = ucfirst $el->desc;
    $desc =~ s/\r\n|\r|\n/\x{2424}/g;

    $$str .= sprintf "%s %s\n", '    ' x $indent, $desc;

    # if it's a node, do the same for all children.
    return unless $el->is_node;
    $indent++;
        show_dom($_, $include_unknown, $str) foreach $el->children;
    $indent--;

    return $$str;
}

sub fatal($) {
    my $err = shift;
    return bless \$err, 'F::Error';
}

1
