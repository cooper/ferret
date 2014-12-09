## Token

### require_token_before => LIST

Requires the token immediately before to be of a type in LIST.

### require_token_after => LIST

Requires the token immediately after to be of a type in LIST.

## Element

### require_element_before => LIST

Requires there to be an element before this one. Also requires that the element
is of a type in LIST.

### require_element_after => LIST

Requires there to be an element after this one. Also requires that the element
is of a type in LIST.

### allow_element_before => LIST

This requirement works the same as require_element_before except, unlike that
option, will still be satisfied if this element is the first in its level.

In other words, requires that if there is a previous element, it is of a type in
LIST.

### allow_element_after => LIST

This requirement works the same as require_element_after except, unlike that
option, will still be satisfied if this element is the last in its level.

In other words, requires that if there is a following element, it is of a type
in LIST.

### inside_TYPE => RULES

Where TYPE represents a certain type of element, specifically a node, the
hashref collection RULES of additional rules will be applied to the element.
