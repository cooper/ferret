# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer::Tokenizer;

use warnings;
use strict;
use 5.010;

use Ferret::Lexer::Rules;
use HOP::Lexer qw(string_lexer);
use JSON::XS;
my $json = JSON::XS->new->allow_nonref(1);

my ($position, $increment);

# keywords
my $keyword_reg = '^('.join('|', qw{
    package     class       end
    main        method      func        prop
    need        want        inside      then
    if          else        return      after
    for         in          init        on
    true        false       undefined   set
    delete      weaken      share       local
    __END__     __LINE__
}).')$';
$keyword_reg = qr/$keyword_reg/;

# these tokens do not have values.
# some which are handled manually are not in this list.
my %no_value = map { $_ => 1 } qw(
    CLOSURE_S   CLOSURE_E   PAREN_S     PAREN_E
    BRACKET_S   BRACKET_E   OP_ADD_A    OP_SUB_A
    OP_ADD      OP_SUB      OP_CALL     OP_PROP
    OP_DIV      OP_DIV_A    OP_MUL      OP_MUL_A
    OP_POW      OP_POW_A    OP_VALUE    OP_PACK
    OP_EQUAL    OP_EQUAL_I  OP_NEQUAL   OP_NEQUAL_I
    OP_ASSIGN   OP_COMMA    OP_RETURN   OP_SEMI
    OP_NOT      OP_MAYBE    OP_ELLIP    OP_RANGE
    OP_MOD
);

# reused formats
my $prop_reg    = qr/[A-Za-z_]+[A-Za-z0-9_]*/;
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

    # simple properties
    [ PROPERTY      => qr/\.[\*]?$prop_reg/, \&remove_first_char            ],  # simple .property

    # this is way up here because it must be above VAR_SYM and OP_VALUE.
    [ OP_PACK       => qr/::/                                               ],  # package

    # variables
    [ VAR_LEX       => qr/\$$prop_reg/,   \&remove_first_char               ],  # lexical variable
    [ VAR_THIS      => qr/\@$prop_reg/,   \&remove_first_char               ],  # object variable
    [ VAR_SPEC      => qr/\*$prop_reg/,   \&remove_first_char               ],  # special variable
    [ VAR_SYM       => qr/\:$prop_reg/,   \&remove_first_char               ],  # symbol variable
    [ VAR_SET       => qr/\<[A-Za-z_]+[A-Za-z0-9:_]*\>/, \&remove_firstlast ],  # set type variable

    # wrappers
    [ CLOSURE_S     => qr/{/                                                ],  # closure start
    [ CLOSURE_E     => qr/}/                                                ],  # closure end
    [ PAREN_S       => qr/\s*\(/                                            ],  # parentheses start
    [ PAREN_E       => qr/\)/                                               ],  # parentheses end
    [ BRACKET_S     => qr/\[/                                               ],  # bracket start
    [ BRACKET_E     => qr/\]/                                               ],  # bracket end

    # operators
    [ OP_RETURN     => qr/->/                                               ],  # return property
    [ OP_ADD_A      => qr/\+=/                                              ],  # addition assignment
    [ OP_SUB_A      => qr/-=/                                               ],  # subtraction assignment
    [ OP_MUL_A      => qr/\*=/                                              ],  # multiplication assignment
    [ OP_DIV_A      => qr/\/=/                                              ],  # division assignment
    [ OP_POW_A      => qr/\^=/                                              ],  # power assignment
    [ OP_EQUAL_I    => qr/===/                                              ],  # object equality
    [ OP_NEQUAL_I   => qr/!==/                                              ],  # negated object equality
    [ OP_EQUAL      => qr/==/                                               ],  # equality
    [ OP_NEQUAL     => qr/!=/                                               ],  # negated equality
    [ OP_ASSIGN     => qr/=/                                                ],  # assignment
    [ OP_ADD        => qr/\+/                                               ],  # addition
    [ OP_SUB        => qr/\-/                                               ],  # subtraction
    [ OP_MUL        => qr/\*/                                               ],  # multiplication
    [ OP_DIV        => qr/\//                                               ],  # division
    [ OP_POW        => qr/\^/                                               ],  # power
    [ OP_NOT        => qr/!/                                                ],  # call without arguments
    [ OP_MOD        => qr/%/                                                ],  # modulus operator
    [ OP_MAYBE      => qr/\?/                                               ],  # inline if operator
    [ OP_SEMI       => qr/;/                                                ],  # instruction terminator
    [ OP_ELLIP      => qr/\.\.\./                                           ],  # ellipsis
    [ OP_RANGE      => qr/\.\./                                             ],  # range
   #[ OP_PROP       => qr/\./                                               ],  # property
    [ OP_COMMA      => qr/,/                                                ],  # list separator
    [ PROP_VALUE    => qr/$prop_reg:/,  \&remove_last_char                  ],  # property: value
    [ OP_VALUE      => qr/:/                                                ],  # key:value (not bareword)

    # other
    [ BAREWORD      => qr/[A-Za-z_]+[A-Za-z0-9:_]*/                         ],  # bareword (and keywords)
    [ NUMBER        => qr/\d+(?:\.\d+(?:e\d+)?)?/                           ],  # number
    [ NEWLINE       => qr/\n/,          \&ignore_increment                  ],  # newline
    [ SPACE         => qr/\s*/,         \&ignore                            ],  # whitespace

);

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

# brackets can be lists or indices.
sub tok_BRACKET_S {
    my ($tokens, $value) = @_;

    # if it starts with whitespace, it can't be an index.
    return if $value =~ m/^\s/;

    # this isn't a call, but it's similar in nature.
    return unless possibly_call($tokens);

    # this is an index.
    return [ BRACKET_IDX => ];
}

sub possibly_call {
    my $tokens = shift;

    # if there's no previous value, it can't be a function call.
    my $last = $tokens->[-1] or return;
    $last    = $last->[0]    or return;

    # there can't be an operator or a keyword before a function call.
    return if grep {
        $last ne 'OP_MAYBE' && $last =~ $_
    } qr/^OP_(.*)$/, qr/^KEYWORD.*$/;
    return if grep { $last eq $_ } qw(
        PAREN_S     PAREN_CALL
        BRACKET_S   BRACKET_IDX
        CLOSURE_S
    );

    return 1;
}

# differentiate strings and regex.
sub tok_STR_REG {
    my ($tokens, $value) = @_;
    my ($dat, $is_str, $in_str, $in_exp, $escaped, $var, @parts) = '';

    my $next_works = sub {
        my ($var, $char) = @_;
        return 1 if "$$var{name}$char" =~ m/^$prop_reg$/;
        return;
    };

    for my $char (split //, $value) {

        # this char was escaped.
        # TODO: consider how this should be handled in regex.
        if ($escaped) {
            $dat .= _escape($char);
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
        if ($is_str) {

            # start of a variable.
            if ($char =~ m/[\$\@\*]/) {
                $var = { sigil => $char, name => '' };
                push @parts, $dat if length $dat;
                $dat = '';
                next;
            }

            # add to the variable.
            if ($var && $next_works->($var, $char)) {
                $var->{name} .= $char;
                next;
            }

            # end of variable.
            if ($var) {
                push @parts, $var;
                undef $var;
            }

            # start of a property.
            if ($char eq '.' && !length $dat && ref $parts[-1] eq 'HASH') {
                $var = { sigil => $char, name => '' };
                next;
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

        # no length for the variable. just insert the sigil.
        if (!$part->{name}) {
            $parts[$i] = $part->{sigil};
            next;
        }

        my $code = "$$part{sigil}$$part{name}";
        $parts[$i] = (_tokenize($code))[1];
    }

    @parts = "" if !@parts;
    return $is_str ? [ STRING => \@parts ] : [ REGEX => \@parts ];
}

sub _escape {
    my $char = shift;
    # TODO: do this correctly
    return "\n" if $char eq 'n';
    return "\r" if $char eq 'r';
    return $char;
}

sub tok_BAREWORD {
    my ($tokens, $value) = @_;

    # init keyword = main method _init_.
    if ($value eq 'init') {
        return [ METHOD => { name => '_init_', main => 1 } ];
    }

    # line number.
    if ($value eq '__LINE__') {
        return [ NUMBER => $position ];
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

    # property.
    if ($last->[0] eq 'KEYWORD_PROP') {
        delete $tokens->[-1];

        # 'set prop'
        my $set;
        my $last_last = $tokens->[-1];
        if ($last_last->[0] eq 'KEYWORD_SET') {
            delete $tokens->[-1];
            $set = 1;
        }

        return [ METHOD => {
            name    => $value,
            p_set   => $set,
            is_prop => 1
        } ];
    }

    # method.
    if ($last->[0] eq 'KEYWORD_METHOD') {
        delete $tokens->[-1];
        return [ METHOD => { name => $value } ]
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

sub tok_OP_NOT {
    my ($tokens, $value) = @_;

    # can the previous item be a function value?
    return unless possibly_call($tokens);

    return [ OP_CALL => ];
}

# opening curly bracket can start an anonymous function
# or an empty for loop
sub tok_CLOSURE_S {
    my ($tokens, $value) = @_;
    my $last = $tokens->[-1] or return;
    if ($last->[0] eq 'KEYWORD_FUNC') {
        $tokens->[-1] = [ FUNCTION => { anonymous => 1 } ];
        return;
    }
}

# common token modifiers.
sub remove_first_char { [ $_[0], substr $_[1], 1     ] }
sub remove_last_char  { [ $_[0], substr $_[1], 0, -1 ] }
sub remove_firstlast  { [ $_[0], substr(substr($_[1], 0, -1), 1) ] }
sub ignore            { }
sub ignore_increment  { &increment_lines; () }
sub increment_lines   {
    my ($l, $v) = @_;
    my $old = $position;
    $position += () = $v =~ /\n/g;
    $position = int $position if $position > $old;
    return [ $l, $v ];
}

sub tokenize {

    # reset the position.
    $position = 1;

    # determine the increment.
    my $length = length $_[0];
    $increment = 1 / $length;

    return _tokenize(@_);
}

sub _tokenize {
    my $string = shift;
    my $lexer  = string_lexer($string, @token_formats);
    my @tokens;

    while (my $token = &$lexer) {
        $position += $increment;

        # something wasn't tokenized.
        return (Ferret::Lexer::fatal(sprintf
            "Unable to tokenize '%s' at line %d.",
            $token, $position
        ), @tokens) if ref $token ne 'ARRAY';

        # additional tokenizing subroutine.
        my $code = __PACKAGE__->can("tok_$$token[0]");
        $token = $code->(\@tokens, $token->[1]) || $token if $code;

        # skip/end.
        next unless @$token;
        last if $token->[0] eq 'KEYWORD___END__';

        # we don't care about the value for this type of token.
        undef $token->[1] if $no_value{ $token->[0] };
        $token->[2] = $position;

        push @tokens, $token;
    }

    return (undef, @tokens);
}

1
