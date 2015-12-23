# Node

The node is a direct descendent of the [element](Element.md) and the most basic
type of element capable of containing other elements.

## Methods

### $node->adopt($el)

Adopts an element. The element will be appended to the node's `->children`, and
the element's `->parent` will be set to the node. If the node already belongs to
another element, that relationship will be nullified. Conveniently returns the
adopted element.

```perl
# you would see something like this if you were
# say, creating an if {} inside of a method {}
$c->{node} = $c->{node}->adopt($if);
```

* __$el__: any element to be adopted by the node.

### $node->abandon($el)

Abandons a child element. The element will be removed from the node's
`->children`, and the element's `->parent` will be unset. Unless the element is
then injected into the tree somewhere else, it will be disposed of. Conveniently
returns the abandoned element.

* __$el__: any element to be abandoned by the node.

### $node->is_closure

Conveniently returns true if the node is a [closure](Closure.md).

### $node->children

Returns a list of all child elements. The method is not recursive; children's
children are not included.

```perl
# example of a basic DOM inspector
sub show {
    my $el = shift;
    printf "I have a %s inside a %s!\n",
        $el->type,
        $el->parent ? $el->parent->type : 'file';
    next unless $el->is_node; # has no method ->children
    show($_) foreach $el->children;
}
show($document);
```

### $node->children_c

Some statements with [closures](Closure.md) have child expression(s)
which are not within the closure. This is a variation of `->children` that
returns ONLY the children within the closure.  

For any non-closure, this will return a list identical to `->children`.

```ruby
for $a in $b {
    $c
    $d
}
```
```perl
say join ' ', map $_->desc, $for->children;   # includes $a, $b, $c, $d
say join ' ', map $_->desc, $for->children_c; # includes $c, $d
```
