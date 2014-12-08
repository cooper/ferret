# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer::Tokenizer;

use warnings;
use strict;
use 5.010;

use HOP::Lexer qw(string_lexer);
use JSON::XS;
my $json = JSON::XS->new->allow_nonref(1);
my $current_line = 1;

# keywords
my $keyword_reg = '^('.join('|', qw{
    package     class       main        method
    need        want        inside      then
    if          else        return      after
    for         in          func        __END__
    init
}).')$';
$keyword_reg = qr/$keyword_reg/;

# these tokens do not have values.
# some which are handled manually are not in this list.
my %no_value = map { $_ => 1 } qw(
    CLOSURE_S   CLOSURE_E   PAREN_S     PAREN_E
    BRACKET_S   BRACKET_E   OP_ADD_A    OP_SUB_A
    OP_ADD      OP_SUB      OP_CALL     OP_PROP
    OP_DIV      OP_DIV_A    OP_MUL      OP_MUL_A
    OP_VALUE    OP_PACK     OP_EQUAL    OP_EQUAL_I
    OP_ASSIGN   OP_COMMA    OP_RETURN   OP_SEMI
);

# reused formats
my $prop_reg    = qr/\b[A-Za-z][A-Za-z0-9]*/;
my $string_reg  = qr/"(?:[^"\\]|\\.)*"/;
my $regex_reg   = qr/\/(?:[^\/\\\n]|\\.)*\/[a-zA-Z]*/;

my @token_formats = (

    # strings and regex at the same precedence
    [ STR_REG       => qr/$string_reg|$regex_reg/, \&increment_lines        ],  # string or regex

    # comments
    [ COMMENT_L     => qr/[#]+[^\n]*\n+/,       \&ignore_increment          ],  # line comment
    [ COMMENT_S     => qr/===.*===(?:\n)?/,     \&ignore_increment          ],  # section comment
    [ COMMENT_B     => qr/\/#.*#\//,            \&ignore_increment          ],  # block comment
    # comments don't really work
    # I need to fix it by making comment start and end

    # variables
    [ VAR_LEX       => qr/\$+$prop_reg+/,   \&remove_first_char             ],  # lexical variable
    [ VAR_THIS      => qr/\@+$prop_reg+/,   \&remove_first_char             ],  # object variable
    [ VAR_SPEC      => qr/\*+$prop_reg+/,   \&remove_first_char             ],  # special variable

    # wrappers
    [ CLOSURE_S     => qr/{/                                                ],  # closure start
    [ CLOSURE_E     => qr/}/                                                ],  # closure end
    [ PAREN_S       => qr/\s*\(/                                            ],  # parentheses start
    [ PAREN_E       => qr/\)/                                               ],  # parentheses end
    [ BRACKET_S     => qr/\[/                                               ],  # bracket start
    [ BRACKET_E     => qr/\]/                                               ],  # bracket start

    # simple properties
    [ PROPERTY      => qr/\.$prop_reg/, \&remove_first_char                 ],  # simple .property

    # operators
    [ OP_RETURN     => qr/->/                                               ],  # return property
    [ OP_ADD_A      => qr/\+=/                                              ],  # addition assignment
    [ OP_SUB_A      => qr/-=/                                               ],  # subtraction assignment
    [ OP_MUL_A      => qr/\*=/                                              ],  # multiplication assignment
    [ OP_DIV_A      => qr/\/=/                                              ],  # division assignment
    [ OP_EQUAL_I    => qr/==/                                               ],  # object equality
    [ OP_EQUAL      => qr/==/                                               ],  # equality
    [ OP_ASSIGN     => qr/=/                                                ],  # assignment
    [ OP_ADD        => qr/\+/                                               ],  # addition
    [ OP_SUB        => qr/\-/                                               ],  # subtraction
    [ OP_MUL        => qr/\*/                                               ],  # multiplication
    [ OP_DIV        => qr/\//                                               ],  # division
    [ OP_EXCLAM     => qr/!/                                                ],  # call without arguments
    [ OP_SEMI       => qr/;/                                                ],  # instruction terminator
    #[ OP_PROP       => qr/\./                                               ],  # property
    [ OP_COMMA      => qr/,/                                                ],  # list separator
    [ OP_PACK       => qr/::/                                               ],  # package
    [ PROP_VALUE    => qr/$prop_reg:/,  \&remove_last_char                  ],  # property: value
    [ OP_VALUE      => qr/:/                                                ],  # key:value (not bareword)

    # other
    [ BAREWORD      => qr/\b[A-Za-z][A-Za-z0-9:]*/                          ],  # bareword (and keywords)
    [ NUMBER        => qr/[+-]?\d+(?:\.\d+(?:e\d+)?)?/                      ],  # number
    [ NEWLINE       => qr/\n/,          \&ignore_increment                  ],  # newline
    [ SPACE         => qr/\s*/,         \&ignore                            ],  # whitespace

);

# separate keywords into individual tokens.
sub tok_KEYWORD {
    my ($tokens, $value) = @_;
    $value = uc $value;
    return [ "KEYWORD_$value" ]
}

# parentheses can be wrappers or function calls.
sub tok_PAREN_S {
    my ($tokens, $value) = @_;

    # if it starts with whitespace, it can't be a function call.
    return if $value =~ m/^\s/;

    # can the previous item be a function value?
    return unless possibly_call($tokens);

    # otherwise, this a function call.
    return [ PAREN_CALL => ];
}

sub possibly_call {
    my $tokens = shift;

    # if there's no previous value, it can't be a function call.
    my $last = $tokens->[-1] or return;
    $last    = $last->[0]    or return;

    # there can't be an operator or a keyword before a function call.
    return if grep { $last =~ $_ } qr/^OP_(.*)$/, qr/^KEYWORD$/;
    return if grep { $last eq $_ } qw(PAREN_S BRACKET_S CLOSURE_S);

    return 1;
}

# differentiate strings and regex.
sub tok_STR_REG {
    my ($tokens, $value) = @_;
    my ($dat, $is_str, $in_str, $in_exp, $escaped, $var, @parts) = '';

    # TODO: interpolation
    for my $char (split //, $value) {

        # this char was escaped.
        # TODO: escape codes like \n.
        # TODO: consider how this should be handled in regex.
        if ($escaped) {
            $dat .= $char;
            undef $escaped;
            next;
        }

        # escape the next char.
        if ($char eq '\\') {
            $escaped = 1;
            next;
        }

        # start or end the string.
        if ($char eq '"' && !$in_exp) {
            $in_str = !$in_str;
            $is_str = 1;
            next;
        }

        # start or end the regex.
        if ($char eq '/' && !$in_str) {
            $in_exp = !$in_exp;
            next;
        }

        # if interpolating.
        if ($is_str && 1) {

            # start of a variable.
            if ($char =~ m/[\$\@\*]/) {
                $var = { sigil => $char, name => '' };
                push @parts, $dat if length $dat;
                $dat = '';
                next;
            }

            # add to the variable.
            if ($var && $char =~ m/$prop_reg/) {
                $var->{name} .= $char;
                next;
            }

            # end of variable.
            elsif ($var) {
                push @parts, $var;
                undef $var;
            }

        }

        # regex is fallback because of modifiers.
        $dat .= $char;

    }

    push @parts, $var if $var;
    push @parts, $dat if length $dat;

    # tokenize the variables.
    my $i = -1;
    foreach my $part (@parts) { $i++;
        ref $part eq 'HASH' or next;
        my $code = "$$part{sigil}$$part{name}";
        $parts[$i] = (tokenize($code))[0];
    }

    return $is_str ? [ STRING => \@parts ] : [ REGEX => \@parts ];
}

sub tok_BAREWORD {
    my ($tokens, $value) = @_;

    # init keyword = main method _init_.
    if ($value eq 'init') {
        return [ METHOD => { name => '_init_', main => 1 } ];
    }

    # other keyword.
    if ($value =~ $keyword_reg) {
        my $key = uc $value;
        return [ "KEYWORD_$key" => ];
    }

    my $last = $tokens->[-1] or return;

    # class declaration.
    if ($last->[0] eq 'KEYWORD_CLASS') {
        delete $tokens->[-1];
        return [ CLASS_DEC => { name => $value } ];
    }

    # package declaration.
    if ($last->[0] eq 'KEYWORD_PACKAGE') {
        delete $tokens->[-1];
        return [ PKG_DEC => { name => $value } ];
    }

    # function.
    if ($last->[0] eq 'KEYWORD_FUNC') {
        delete $tokens->[-1];
        return [ FUNCTION => { name => $value } ];
    }

    # method.
    if ($last->[0] eq 'KEYWORD_METHOD') {
        delete $tokens->[-1];

        # is this a main method?
        $last = $tokens->[-1];
        my $main = $last && $last->[0] eq 'KEYWORD_MAIN' ?
            !!delete $tokens->[-1] : undef;

        return [ METHOD => { name => $value, main => $main } ]
    }

}

sub tok_NUMBER {
    my ($tokens, $value) = @_;
    my $last = $tokens->[-1] or return;

    # class or package declaration version.
    if ($last->[0] eq 'CLASS_DEC' || $last->[0] eq 'PKG_DEC') {
        $last->[1]{version} = $value;
        return [];
    }

}

sub tok_OP_EXCLAM {
    my ($tokens, $value) = @_;

    # can the previous item be a function value?
    return unless possibly_call($tokens);

    return [ OP_CALL => ];
}

# common token modifiers.
sub remove_first_char { [ $_[0], substr $_[1], 1     ] }
sub remove_last_char  { [ $_[0], substr $_[1], 0, -1 ] }
sub ignore            { }
sub ignore_increment  { &increment_lines; () }
sub increment_lines   {
    my ($l, $v) = @_;
    $current_line++ for ($v =~ /\n/g);
    return [ $l, $v ];
}

sub tokenize {
    my $string = shift;
    my $lexer  = string_lexer($string, @token_formats);
    my @tokens;
    while (my $token = &$lexer) {

        # something wasn't tokenized.
        return Ferret::Lexer::fatal(sprintf
            "Not sure what to do with '%s' at line %d.",
            $token, $current_line
        ) unless ref $token eq 'ARRAY';

        # additional tokenizing subroutine.
        my $code = __PACKAGE__->can("tok_$$token[0]");
        $token = $code->(\@tokens, $token->[1]) || $token if $code;

        # skip/end.
        next unless @$token;
        last if $token->[0] eq 'KEYWORD___END__';

        # we don't care about the value for this type of token.
        undef $token->[1] if $no_value{ $token->[0] };
        $token->[2] = $current_line;

        push @tokens, $token;
    }
    return @tokens;
}

1