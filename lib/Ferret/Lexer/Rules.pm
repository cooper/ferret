package Ferret::Lexer::Rules;

use warnings;
use strict;
use 5.010;

use Ferret::Lexer::RuleFunctions;
use Ferret::Lexer::RuleSet;

our %token_rules = (
    KEYWORD_END => [

        # the current node must be somewhere inside a Package or Class.
        upper_nodes_must_have => [                                              # KEYWORD_END[0]
            'Package Class',
            'End keyword must terminate a class or package declaration'
        ],

        # $c->{end_cap} (the class or package to capture 'end') must exist
        current_must_have => 'end_cap'                                          # KEYWORD_END[1]

    ]
);

our %element_rules = (

    Package => {

        parent_must_be => [                                                     # Package[0]
            'Document',
            'Package declaration must be in the global scope'
        ]

    },

    Class => {

        parent_must_be => [                                                     # Class[0]
            'Document',
            'Class declaration must be in the global scope'
        ],

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

        must_be_somewhere_inside => [                                           # InstanceVariable[0]
            'Class',
            'Instance variables must be inside a class'
        ]

    },

    Pair => {

        must_be_somewhere_inside => [                                           # Pair[0]
            'List',
            'Pair must be inside a list'
        ],

        parent_must_be => [                                                     # Pair[1]
            'ListItem',
            'Pair must be a direct child of a list item'
        ]

    },

    Token => {
        parent_must_be => 'NONE'                                                # Token[0]
    }

);

1
