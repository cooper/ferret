# Copyright (c) 2015, Mitchell Cooper
package Ferret::COMPILER;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(looks_like_number);
use Ferret::Core::Conversion qw(pstring pbool fstring ferretize);

use Ferret::Lexer;
use Ferret::Perl;

my @methods = (
    tokenize => {
        code => \&_tokenize
    },
    construct => {
        want => '$pretty:Bool',
        code => \&_construct
    },
    compile => {
        want => '$mini:Bool',
        code => \&_compile
    },
    eval => {
        code => \&_eval
    }
);

my @functions = (
    prettyToken => {
        want => '$token:Str',
        code => \&_prettyToken
    }
);

Ferret::bind_class(
    name      => 'COMPILER',
    methods   => \@methods,
    functions => \@functions,
    init_need => '$string:Str',
    init      => \&init
);

sub init {
    my ($compiler, $args) = @_;
    $compiler->{string} = $args->pstring('string') or return;
    return;
}

sub tokenize {
    my $compiler = shift;

    # already tokenized
    return $compiler->{tokens} if $compiler->{tokens};

    # tokenize
    my $code = $compiler->_ferret_code;
    my ($err, @tokens) = Ferret::Lexer::Tokenizer::tokenize("$code\n");
    return $err if $err;

    return $compiler->{tokens} = \@tokens;
}

sub _tokenize {
    my ($compiler, $args, undef, undef, $ret) = @_;

    # tokenize
    my $tokens = $compiler->tokenize;
    if (ref $tokens eq 'F::Error') {
        $ret->set_property(error => fstring($$tokens));
        return $ret;
    }

    # pretty
    if ($args->pbool('pretty')) {
        my $pretty = Ferret::Lexer::show_tok(@$tokens);
        $ret->set_property(pretty => fstring($pretty));
    }

    $ret->set_property(tokens => ferretize($tokens));
    return $ret;
}

sub construct {
    my $compiler = shift;

    # tokenize
    my $tokens = $compiler->tokenize;
    if (ref $tokens ne 'ARRAY') {
        return $tokens;
    }
    my @tokens = @$tokens;

    # construct
    my $doc = F::Document->new(name => '(stdin)');
    my $err = Ferret::Lexer::Constructor::construct($doc, @tokens);

    return $err if $err;
    return $doc;
}

sub _construct {
    my ($compiler, $args, undef, undef, $ret) = @_;

    # construct
    my $doc = $compiler->construct();
    if (ref $doc eq 'F::Error') {
        $ret->set_property(error => fstring($$doc));
        return $ret;
    }

    # pretty
    if ($args->pbool('pretty')) {
        my $pretty = Ferret::Lexer::show_dom($doc);
        $ret->set_property(pretty => fstring($pretty));
    }

    return $ret;
}

sub compile {
    my ($compiler, $mini) = @_;

    # construct
    my $doc = $compiler->construct;
    return \"$$doc" if ref $doc eq 'F::Error';

    # compile
    return eval { Ferret::Perl::main($doc, $mini) } // \"$@";

}

sub _compile {
    my ($compiler, $args, undef, undef, $ret) = @_;
    my $mini = $args->pbool('mini');

    # compile
    my $code = $compiler->compile($mini);
    if (ref $code eq 'SCALAR') {
        $ret->set_property(error => fstring($$code));
        return $ret;
    }

    $ret->set_property(perl => fstring($code));
    return $ret;
}

sub eval : method {
    my $compiler = shift;

    # compile
    my $code = $compiler->compile;
    return $code if ref $code eq 'SCALAR'; # error

    # eval
    my $res = __eval($code);

    return $res;
}

sub __eval {
    my $code = shift;
    $code = "$code \$result";
    return eval($code) // \"$@";
}

sub _eval {
    my ($compiler, undef, undef, undef, $ret) = @_;
    my $res = $compiler->eval;
    if (ref $res eq 'SCALAR') {
        $ret->set_property(error => fstring($$res));
    }
    $ret->set_property(result =>
        Ferret::valid_value($res) ? $res : Ferret::undefined
    );
    $ret->set_property(stringResult => fstring($res));
    return $ret;
}

sub _prettyToken {
    my ($class, $args) = @_;
    my $tok = $args->pstring('token');
       $tok = Ferret::Lexer::pretty_token($tok);
    return $tok ? fstring($tok) : Ferret::undefined;
}

sub _ferret_code {
    # this may read a file if a file a specified.
    return shift->{string};
}

1
