## Token

### require_token_before => LIST

Requires the token immediately before to be of a type in LIST.

### require_token_after => LIST

Requires the token immediately after to be of a type in LIST.

## Element

### require_element_before => LIST

Requires there to be an element before this one. Also requires that the element
is of a type in LIST.  

Pseudotype NONE indicates no element.

### require_element_after => LIST

Requires there to be an element after this one. Also requires that the element
is of a type in LIST.  

Pseudotype NONE indicates no element.

### inside_TYPE => RULES

Where TYPE represents a certain type of element, specifically a node, the
hashref collection RULES of additional rules will be applied to the element.
