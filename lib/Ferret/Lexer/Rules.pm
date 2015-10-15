package Ferret::Lexer::Rules;

use warnings;
use strict;
use 5.010;

use Ferret::Lexer::RuleFunctions;
use Ferret::Lexer::RuleSet;

our %token_rules = (

    PKG_DEC => [

        # only one package declaration per document.
        current_must_not_have => [                                              # PKG_DEC[0]
            'package',
            'Multiple packages per file not yet implemented'
        ],

    ],

    KEYWORD_END => [

        # the current node must be somewhere inside a Package or Class.
        upper_nodes_must_have => [                                              # KEYWORD_END[0]
            'Package Class',
            'End keyword must terminate a class or package declaration'
        ],

        # $c->{end_cap} (the class or package to capture 'end') must exist
        current_must_have => [                                                  # KEYWORD_END[1]
            'end_cap',
            'Class or package must capture end keyword'
        ],

        current_node_must_be => [                                               # KEYWORD_END[2]
            'Package Class',
            'Package or class must be the current node to capture end keyword'
        ]

    ],

    CLOSURE_S => [

        # $c->{clos_cap} (a node/structure to capture the closure)
        # must be set for an opening curly bracket.
        current_must_have => [                                                  # CLOSURE_S[0]
            'clos_cap',
            'No preceding structure to capture the closure'
        ]

    ],

    CLOSURE_E => [

        # $c->{closure} (the current closure) must be set
        # for a closing curly bracket.
        current_must_have => [                                                  # CLOSURE_E[0]
            'closure',
            'Attempted to terminate a closure, but no closure is open'
        ]

    ],

    PAREN_E => [

        # $c->{list} (the current list) must be set for a closing parenthesis.
        current_must_have => [                                                  # PAREN_E[0]
            'list',
            'Attempted to close a structural list, but no list is open'
        ]

    ],

    BRACKET_E => [

        # $c->{list} (the current list) must be set for a closing bracket.
        current_must_have => [                                                  # BRACKET_E[0]
            'list',
            'Attempted to close a value list or hash, but no list is open'
        ]

    ],

    OP_SEMI => [

        # $c->{instruction} (the current instruction) must be set in order
        # for a semicolon to terminate it.
        current_must_have => [                                                  # OP_SEMI[0]
            'instruction',
            'Attempted to terminate an instruction, but no instruction is open'
        ]

    ]

);

our %element_rules = (

    Package => {

        # parent of package declaration must be a document.
        parent_must_be => [                                                     # Package[0]
            'Document',
            'Package declaration must be in the global scope'
        ]

    },

    Class => {

        # parent of package declaration must be a document.
        parent_must_be => [                                                     # Class[0]
            'Document',
            'Class declaration must be in the global scope'
        ],

        # classes can currently contain only methods.
        children_must_be => [                                                   # Class[1]
            'Method',
            'Class must only contain class functions, instance methods, '.
            'and variable declarations'
        ]

    },

    WantNeed => {

        # WantNeed must always be a direct child of an instruction.
        parent_must_be => 'Instruction',                                        # WantNeed[0]

        # WantNeed must always be inside one of these.
        must_be_somewhere_inside => [                                           # WantNeed[1]
            'Function Method',
            'Argument declaration must be within a function or method'
        ],

        directly_inside_rules => {

            # directly inside a method, WantNeed can ONLY contain these things.
            Method => {
                children_must_be => [                                           # WantNeed[2]
                    'InstanceVariable LexicalVariable Expression Bareword',
                    'Argument declaration inside method can only contain '.
                    'lexical or instance variables and their types'
                ]
            },

            # directly inside a function, WantNeed can ONLY contain these things.
            Function => {
                children_must_be => [                                           # WantNeed[3]
                    'LexicalVariable Expression Bareword',
                    'Argument declaration inside function can only contain '.
                    'lexical variables and their types'
                ]
            },

        } # end directly_inside_rules

    },

    PropertyModifier => {

        # must be a direct child an instruction.
        parent_must_be => 'Instruction',                                        # PropertyModifier[0]

        # it can be variables or properties.
        # however, it cannot be a special variable.
        children_must_be => [                                                   # PropertyModifier[1]
            'LexicalVariable InstanceVariable Property',
            'Property modifier can only capture non-special variables '.
            'or properties'
        ],

        # if it's a property, it cannot be a special one.
        children_must_satisfy => [                                              # PropertyModifier[2]
            sub {
                my $el = shift;
                return 1 if $el->type ne 'Property';
                return !$el->is_special;
            },
            'Property modifier cannot capture special properties'
        ],

        # there can only be one child.
        max_children => 1                                                       # PropertyModifier[3]

    },

    InstanceVariable => {

        # instance variables only make sense inside of classes.
        must_be_somewhere_inside => [                                           # InstanceVariable[0]
            'Class',
            'Instance variables must be inside a class'
        ]

    },

    Pair => {

        # pairs can only be inside of lists (specifically, hashes or objects).
        must_be_somewhere_inside => [                                           # Pair[0]
            'List',
            'Pair must be inside a list'
        ],

        # each pair must be a direct child of a list item.
        parent_must_be => [                                                     # Pair[1]
            'ListItem',
            'Pair must be a direct child of a list item'
        ]

    },

    Token => {

        # tokens cannot be astray.
        parent_must_be => 'NONE'                                                # Token[0]

    }

);

1
