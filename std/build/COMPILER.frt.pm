# Copyright (c) 2015, Mitchell Cooper
package Ferret::COMPILER;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(looks_like_number blessed);
use Ferret::Core::Conversion qw(pstring pbool fstring ferretize ferror);

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
    },
    # perlEval => {
    #     code => \&_perl_eval
    # }
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
    my $code = $compiler->_code;
    my ($err, @tokens) =
        eval { Ferret::Lexer::Tokenizer::tokenize("$code\n", '(input)') };

    # either it returned an error or an exception occurred
    if (my $bad = $err ? (ref $err ? $$err : $err) : $@) {
        return ferror($bad, 'TokenizeError');
    }

    $compiler->{tokens} = \@tokens;
    return (undef, \@tokens);
}

sub _tokenize {
    my ($compiler, $args, undef, undef, $ret) = @_;

    # tokenize
    my ($err, $tokens) = $compiler->tokenize;
    if ($err) {
        $ret->set_property(error => $err);
        return $ret;
    }

    # pretty
    if ($args->pbool('pretty')) {
        my $pretty = F::show_tok(@$tokens);
        $ret->set_property(pretty => fstring($pretty));
    }

    $ret->set_property(tokens => ferretize($tokens));
    return $ret;
}

sub construct {
    my $compiler = shift;

    # tokenize
    my ($err, $tokens) = $compiler->tokenize;
    return $err if $err;
    my @tokens = @$tokens;

    # construct
    my $main = F::new('Main', name => '(input)');
    $err = eval { Ferret::Lexer::Constructor::construct($main, @tokens) };

    # either it returned an error or an exception occurred
    if (my $bad = $err ? $$err : $@) {
        return ferror($bad, 'ConstructError');
    }

    return (undef, $main);
}

sub _construct {
    my ($compiler, $args, undef, undef, $ret) = @_;

    # construct
    my ($err, $main) = $compiler->construct();
    if ($err) {
        $ret->set_property(error => $err);
        return $ret;
    }

    # pretty
    if ($args->pbool('pretty')) {
        my $pretty = F::show_dom($main);
        $ret->set_property(pretty => fstring($pretty));
    }

    return $ret;
}

sub compile {
    my ($compiler, $mini) = @_;

    # construct
    my ($err, $main) = eval { $compiler->construct };
    return $err if $err;

    # compile
    my $ret = eval { $main->perl_fmt_do($mini) };
    return defined $ret ? (undef, $ret) : ferror($@, 'CompileError');
}

sub _compile {
    my ($compiler, $args, undef, undef, $ret) = @_;
    my $mini = $args->pbool('mini');

    # compile
    my ($err, $code) = $compiler->compile($mini);
    if ($err) {
        $ret->set_property(error => $err);
        return $ret;
    }

    $ret->set_property(perl => fstring($code));
    return $ret;
}

sub eval : method {
    my $compiler = shift;

    # compile
    my ($err, $code) = $compiler->compile;
    return $err if $err;

    # eval
    my $res = __eval($code);
    if (ref $res eq 'SCALAR') {
        my $sig_err = $Ferret::NATIVE::Signal::last_err;
        return $sig_err if $sig_err;
        return ferror($$res, 'EvalError');
    }

    return (undef, $res);
}

sub __eval {
    my $code = shift;
    $code = "$code \$result // Ferret::undefined";
    return eval($code) // \"$@";
}

sub _eval {
    my ($compiler, undef, undef, undef, $ret) = @_;
    my ($err, $res) = $compiler->eval;

    if ($err) {
        $ret->set_property(error => $err);
        return $ret;
    }

    $ret->set_property(result =>
        Ferret::valid_value($res) ? $res : Ferret::undefined);
    return $ret;
}

sub _perl_eval {
    my ($compiler, $args, undef, undef, $ret) = @_;
    my $code = $compiler->_code;
       $code = "my \$result = do { $code };";
    my $res = __eval($code);
    if (ref $res eq 'SCALAR') {
        $ret->set_property(error => ferror($$res, 'EvalError'));
    }
    $ret->set_property(result => ferretize($res));

    return $ret;
}

sub _prettyToken {
    my ($class, $args) = @_;
    my $tok = $args->pstring('token');
       $tok = F::pretty_token($tok);
    return $tok ? fstring($tok) : Ferret::undefined;
}

sub _code {
    # this may read a file if a file a specified.
    return shift->{string};
}

1
