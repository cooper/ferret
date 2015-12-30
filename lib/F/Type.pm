# Copyright 2015, Mitchell Cooper
package F::Type;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util qw(weaken);

sub new {
    my ($class, %opts) = @_;
    my $type = $class->SUPER::new(%opts);

    # create the body.
    my $body = F::TypeBody->new;
    weaken($type->{body} = $body);
    $type->adopt($body);

    return $type;
}

sub close : method {
    my $type = shift;

    # check method requirements.
    # the function being 'called' must be a VAR_PROP.
    foreach my $item (map $_->first_child, $type->body->children) {
        if ($item && ($item->{req_type} || '') eq 'can') {
            my $var = $item->first_child->function;
            return $var->unexpected([
                "in interface method requirement ('can')",
                "Only method requirements are permitted, using the syntax: ".
                "can .methodName(arguments)"
            ]) if $var->type ne 'PropertyVariable';
        }
    }

    return $type->SUPER::close(@_);
}

sub perl_fmt {
    my $type = shift;

    my (@equal_possibly, @requirements);
    foreach my $item (map $_->first_child, $type->body->children) {

        # it's some sort of requirement or transform.
        if (defined $item->{req_type}) {
            my $format = $item->{req_type} eq 'can' ?
                         _handle_can($item)         :
                         $item->perl_fmt_do;
            push @requirements, [ $item->{req_type} => $format ];
        }

        # it's just an expression.
        push @equal_possibly, $item->perl_fmt_do;

    }

    # they must be subs with $ins.

    my $equal_to = join(', ', @equal_possibly);
       $equal_to = $equal_to ? "[ $equal_to ]" : 'undef';

    return type => {
        name     => $type->type_name,
        equal_to => $equal_to
    };
}

sub _handle_can {
    my $req  = shift;
    my $mreq = $req->first_child;

    # the function being 'called' is guaranteed to be a property variable.
    my $method_name = $mreq->function->{var_name};
    my $list = $mreq->arg_list;


    return '';
}

sub type_name  { shift->{type_name} }
sub body       { shift->{body}      }
sub is_closure { 1 }
sub hold_instr { 1 }
sub type       { 'Type' }
sub desc       {
    my $type = shift;
    my $name = $type->type_name;
    return 'type definition'.($name ? " ('$name')" : '');
}

package F::TypeBody;

use warnings;
use strict;
use 5.010;
use parent 'F::Body';

sub type { 'TypeBody' }

1
