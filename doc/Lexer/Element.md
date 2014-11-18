# Ferret::Lexer::Element

The element is the most basic object created by the lexer. In their simplest
form, elements are essentially objective representations of [tokens](Tokens.md).
The elements are then arranged in a DOM-like tree which is then executed. The
process of creating elements is done during the "construction" stage and is handled by the [constructor](Constructor.md).

Most elements are categorized through heredity. The simplest parent element
is the [node](node.md); normal elements cannot encapsulate others.

## Methods

### $el->parent

Returns the parent element or `undef` if it is a root element. Usually, all
elements except perhaps [documents](Document.md) will have a parent.

### $el->type

Returns a string representing the element's type.  
Examples: `If`, `After`, `Method`, `Expression`.

### $el->desc

Returns a string describing the element. This is human-readable and more
detailed than the value of the `->type` method.  
Examples: `Class 'Person' version 2.5`, `Main method 'new'`.

### $el->is_node

Conveniently returns true if the element is a [node](Node.md).
