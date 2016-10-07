package F::FailThrow;

use warnings;
use strict;
use parent 'F::Node';

sub desc {
    my $type = shift->{fail_type};
    return 'throw (fatal exception)' if $type eq 'throw';
    return 'fail (nonfatal exception)';
}

sub perl_fmt {
    my $fail = shift;
    my $exp  = $fail->first_child->perl_fmt_do;
    my $type = $fail->{fail_type};

    # if we're in a function or method, use _func.
    if ($fail->first_parent('Function') || $fail->first_parent('Method')) {
        $type .= '_func';
    }

    return $type => {
        expression => $exp,
        pos => $fail->{create_pos}
    };
}

1
