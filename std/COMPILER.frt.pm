# Copyright (c) 2015, Mitchell Cooper
package Ferret::COMPILER;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(looks_like_number);
use Ferret::Core::Conversion qw(perl_string ferret_string ferretize);

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
    my ($compiler, $arguments) = @_;
    $compiler->{string} = perl_string($arguments->{string}) or return;
    return;
}

sub tokenize {
    my $compiler = shift;

    # already tokenized
    return $compiler->{tokens} if $compiler->{tokens};

    # tokenize
    my $code = $compiler->_ferret_code;
    my ($err, @tokens) = Ferret::Lexer::Tokenizer::tokenize($code);
    return $err if $err;

    return $compiler->{tokens} = \@tokens;
}

sub _tokenize {
    my ($compiler, $arguments, undef, undef, $return) = @_;

    # tokenize
    my $tokens = $compiler->tokenize;
    if (ref $tokens eq 'F::Error') {
        $return->set_property(error => ferret_string($$tokens));
        return $return;
    }

    # pretty
    if ($arguments->{pretty}) {
        my $pretty = Ferret::Lexer::show_tok(@$tokens);
        $return->set_property(pretty => ferret_string($pretty));
    }

    $return->set_property(tokens => ferretize($tokens));
    return $return;
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
    return $compiler->{document} = $doc;
}

sub _construct {
    my ($compiler, $arguments, undef, undef, $return) = @_;

    # construct
    my $doc = $compiler->construct();
    if (ref $doc eq 'F::Error') {
        $return->set_property(error => ferret_string($$doc));
        return $return;
    }

    # pretty
    if ($arguments->{pretty}) {
        my $pretty = Ferret::Lexer::show_dom($doc);
        $return->set_property(pretty => ferret_string($pretty));
    }

    return $return;
}

sub compile {
    my $compiler = shift;

    # construct
    my $doc = $compiler->construct;
    return \"$$doc" if ref $doc eq 'F::Error';

    # compile
    return eval { Ferret::Perl::main($doc) } // \"$@";

}

sub _compile {
    my ($compiler, undef, undef, undef, $return) = @_;

    # compile
    my $code = $compiler->compile;
    if (ref $code eq 'SCALAR') {
        $return->set_property(error => ferret_string($$code));
        return $return;
    }

    $return->set_property(perl => ferret_string($code));
    return $return;
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
    my ($compiler, undef, undef, undef, $return) = @_;
    my $res = $compiler->eval;
    if (ref $res eq 'SCALAR') {
        $return->set_property(error => ferret_string($$res));
    }
    $return->set_property(result =>
        Ferret::valid_value($res) ? $res : Ferret::undefined
    );
    $return->set_property(stringResult => ferret_string($res));
    return $return;
}

sub _prettyToken {
    my ($class, $arguments) = @_;
    my $tok = perl_string($arguments->{token});
       $tok = Ferret::Lexer::pretty_token($tok);
    return $tok ? ferret_string($tok) : Ferret::undefined;
}

sub _ferret_code {
    # this may read a file if a file a specified.
    return shift->{string};
}

1
