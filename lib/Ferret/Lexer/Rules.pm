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
            'Multiple packages per file not yet implemented',
            0
        ],

    ],

    KEYWORD_END => [

        # the current node must be somewhere inside a Package or Class.
        upper_nodes_must_have => [                                              # KEYWORD_END[0]
            'Package Class',
            'End keyword must terminate a class or package declaration',
            0
        ],

        # $c->{end_cap} (the class or package to capture 'end') must exist
        current_must_have => [                                                  # KEYWORD_END[1]
            'end_cap',
            'Class or package must capture end keyword',
            1
        ],

        # the current node at this time must be a Package or Class.
        current_node_must_be => [                                               # KEYWORD_END[2]
            'Package Class',
            'Package or class must be the current node to capture end keyword',
            2
        ]

    ],

    CLOSURE_S => [

        # $c->{clos_cap} (a node/structure to capture the closure)
        # must be set for an opening curly bracket.
        current_must_have => [                                                  # CLOSURE_S[0]
            'clos_cap',
            'No preceding structure to capture the closure',
            0
        ]

    ],

    CLOSURE_E => [

        # $c->{closure} (the current closure) must be set
        # for a closing curly bracket.
        current_must_have => [                                                  # CLOSURE_E[0]
            'closure',
            'Attempted to terminate a closure, but no closure is open',
            0
        ]

    ],

    PAREN_E => [

        # $c->{list} (the current list) must be set for a closing parenthesis.
        current_must_have => [                                                  # PAREN_E[0]
            'list',
            'Attempted to close a structural list, but no list is open',
            0
        ]

    ],

    BRACKET_E => [

        # $c->{list} (the current list) must be set for a closing bracket.
        current_must_have => [                                                  # BRACKET_E[0]
            'list',
            'Attempted to close a value list or hash, but no list is open',
            0
        ]

    ],

    OP_SEMI => [

        # $c->{instruction} (the current instruction) must be set in order
        # for a semicolon to terminate it.
        current_must_have => [                                                  # OP_SEMI[0]
            'instruction',
            'Attempted to terminate an instruction, but no instruction is open',
            0
        ]

    ],

    OP_ELLIP => [

        current_node_must_be => [                                               # OP_ELLIP[0]
            'WantNeed WantNeedType WantNeedValue',
            'Ellipsis can only follow an argument declaration',
            0
        ]

    ]

);

our %element_rules = (

    Package => {

        # parent of package declaration must be a document.
        parent_must_be => [                                                     # Package[0]
            'Document',
            'Package declaration must be in the global scope',
            0
        ]

    },

    Instruction => {

        max_children => [ 1, undef, 0 ]                                         # Instruction[0]

    },

    Class => {

        # parent of package declaration must be a document.
        parent_must_be => [                                                     # Class[0]
            'Document',
            'Class declaration must be in the global scope',
            0
        ],

        # classes can currently contain only methods and variable declarations.
        children_must_be => [                                                   # Class[1]
            'Function Method Instruction Type',
            'Class must only contain class functions, instance methods, '.
            'and variable/type declarations',
            1
        ],

        # if it's an instruction, it must satisfy these rules.
        after_rules => [

            children_must_satisfy => [                                          # Class[2]
                sub {
                    my $el = shift;
                    return 1 if $el->type ne 'Instruction';
                    my $child = $el->first_child;

                    # Loads are a-ok.
                    return 1 if $child->type eq 'Load';

                    # if it's an assignment, it must be a lexical variable.
                    if ($child->type eq 'Assignment') {
                        return $child->assign_to->type eq 'LexicalVariable';
                    }

                    # # if it's a WantNeed, it must be an instance variable.
                    # elsif ($child->type eq 'WantNeed') {
                    #     return $child->variable->type eq 'InstanceVariable';
                    # }

                    return;
                },
                'Class-level instructions can only include lexical variable '.
                'assignments and load statements',
                2
            ]

        ]

    },

    WantNeed => {

        # WantNeed must always be a direct child of an instruction.
        parent_must_be => [ 'Instruction', undef, 0 ],                          # WantNeed[0]

        # WantNeed must always be inside one of these.
        must_be_somewhere_inside => [                                           # WantNeed[1]
            'Function Method',
            'Argument declaration must be within a function or method',
            1
        ],

        children_must_be => [                                                   # WantNeed[2]
            'InstanceVariable LexicalVariable WantNeedType WantNeedValue',
            'Argument declaration can only contain lexical variables, '.
            'instance variables, their bareword types, and their fallback '.
            'value expressions',
            2
        ],

        min_children => [ 1, undef, 3 ],                                        # WantNeed[3]
        max_children => [ 3, undef, 4 ]                                         # WantNeed[4]

    },

    WantNeedType => {

        parent_must_be => [ 'WantNeed', undef, 0 ],                             # WantNeedType[0]

        children_must_be => [                                                   # WantNeedType[1]
            'Bareword',
            'Argument declaration type following colon (:) must be a bareword',
            1
        ],

        must_come_after => [                                                    # WantNeedType[2]
            'InstanceVariable LexicalVariable',
            'Argument declaration type must follow argument variable',
            2
        ],

        num_children => [ 1, undef, 3 ]                                         # WantNeedType[3]

    },

    WantNeedValue => {

        parent_must_be => [ 'WantNeed', undef, 0 ],                             # WantNeedValue[0]

        children_must_satisfy => [                                              # WantNeedValue[1]
            sub { shift->isa('F::Expression') },
            'Argument declaration fallback value must be an expression of sorts',
            1
        ],

        must_come_after => [                                                    # WantNeedValue[2]
            'InstanceVariable LexicalVariable WantNeedType',
            'Argument declaration type must follow argument variable or type',
            2
        ],

        num_children => [ 1, undef, 3 ]                                         # WantNeedValue[3]

    },

    PropertyModifier => {

        # must be a direct child an instruction.
        parent_must_be => [ 'Instruction', undef, 0 ],                          # PropertyModifier[0]

        # it can be variables or properties.
        # however, it cannot be a special variable.
        children_must_be => [                                                   # PropertyModifier[1]
            'LexicalVariable InstanceVariable Property',
            'Property modifier can only capture non-special variables '.
            'or properties',
            1
        ],

        # if it's a property, it cannot be a special one.
        children_must_satisfy => [                                              # PropertyModifier[2]
            sub {
                my $el = shift;
                return 1 if $el->type ne 'Property';
                return !$el->is_special;
            },
            'Property modifier cannot capture special properties',
            2
        ],

        # there can only be one child.
        num_children => [ 1, undef, 3 ]                                         # PropertyModifier[3]

    },

    InstanceVariable => {

        # instance variables only make sense inside of classes.
        must_be_somewhere_inside => [                                           # InstanceVariable[0]
            'Function Method',
            'Instance variables must be inside a class function or method',
            0
        ]

    },

    Pair => {

        # pairs can only be inside of lists (specifically, hashes or objects).
        must_be_somewhere_inside => [                                           # Pair[0]
            'List',
            'Pair must be inside a list',
            0
        ],

        # each pair must be a direct child of a list item.
        parent_must_be => [                                                     # Pair[1]
            'ListItem',
            'Pair must be a direct child of a list item',
            1
        ]

    },

    List => {

        children_must_be => [                                                   # List[0]
            'ListItem',
            'Lists can only directly contain list items',
            0
        ]

    },

    ListItem => {

        # list items can only contain expressions and pairs.
        children_must_satisfy => [                                              # ListItem[0]
            sub { $_[0]->isa('F::Expression') || $_[0]->isa('F::Pair') },
            'Lists can only contain expressions of sorts',
            0
        ],

        must_come_after => [                                                    # ListItem[1]
            'NONE ListItem',
            'List items can only follow other list items',
            1
        ],

        must_come_before => [                                                   # ListItem[2]
            'NONE ListItem',
            'List items can only follow other list items',
            2
        ],

        max_children => [ 1, undef, 3 ]                                         # ListItem[3]

        # Rule implemented in F/List.pm:
        #   Pairs and non-pairs cannot be mixed in a list unless it is the
        #   argument list of a call.

    },

    Method => {

        # direct parent must be a class.
        parent_must_be => [                                                     # Method[0]
            'Class',
            'Methods and computed properties must be directly inside a class',
            0
        ]

    },

    OnParameter => {

        after_rules => {

            # children can only be non-special variables or properties.
            children_must_be => [                                               # OnParameter[0]
                'Property LexicalVariable InstanceVariable PropertyVariable Bareword',
                "'On' parameter can only be a non-special variable or property",
                0
            ],

            # if it's a property, it cannot be a special one.
            children_must_satisfy => [                                          # OnParameter[1]
                sub {
                    my $el = shift;
                    return 1 if $el->type ne 'Property';
                    return !$el->is_special;
                },
                "'On' parameter cannot be a special property",
                1
            ],

            # it can only contain one property or variable.
            num_children => [ 1, undef, 2 ]                                     # OnParameter[2]

        }

    },

    SharedDeclaration => {

        # must be a direct child an instruction.
        parent_must_be => [ 'Instruction', undef, 0 ],                          # SharedDeclaration[0]

        # it can be lexical variables or an assignment of a lexical variable.
        children_must_be => [                                                   # SharedDeclaration[1]
            'LexicalVariable Assignment',
            'Shared variable declaration can only capture a lexical variable '.
            'or a lexical variable assignment',
            1
        ],

        # if it's an assignment, it must be of a lexical variable.
        children_must_satisfy => [                                              # SharedDeclaration[2]
            sub {
                my $el = shift;
                return 1 if $el->type ne 'Assignment';
                return $el->assign_to->type eq 'LexicalVariable';
            },
            'Shared variable declaration can capture an assignment only '.
            'of a lexical variable',
            2
        ],

        # there can only be one child.
        num_children => [ 1, undef, 3 ]                                         # SharedDeclaration[3]

    },

    LocalDeclaration => {

        # must be a direct child an instruction.
        parent_must_be => [ 'Instruction', undef, 0 ],                          # LocalDeclaration[0]

        # it can be lexical variables or an assignment of a lexical variable.
        children_must_be => [                                                   # LocalDeclaration[1]
            'LexicalVariable Assignment',
            'Local variable declaration can only capture a lexical variable '.
            'or a lexical variable assignment',
            1
        ],

        # if it's an assignment, it must be of a lexical variable.
        children_must_satisfy => [                                              # LocalDeclaration[2]
            sub {
                my $el = shift;
                return 1 if $el->type ne 'Assignment';
                return $el->assign_to->type eq 'LexicalVariable';
            },
            'Local variable declaration can capture an assignment only '.
            'of a lexical variable',
            2
        ],

        # there can only be one child.
        num_children => [ 1, undef, 0 ]                                         # LocalDeclaration[3]

    },

    Load => {

        # the parent must be an instruction.
        parent_must_be => [                                                     # Load[0]
            'Instruction',
            "Load statement must be a direct child of an instruction",
            0
        ],

        # rules for the parent instruction
        parent_rules => {

            # the instruction's parent must be a class or document.
            parent_must_be => [                                                 # Load[1]
                'Class Document',
                'Load statement can only exist at class or document level',
                1
            ]

        },

        children_must_be => [                                                   # Load[2]
            'Bareword',
            'Load statement can only contain a bareword package name',
            2
        ],

        # there can only be one child.                                          # Load[3]
        num_children => [ 1, undef, 3 ]

    },

    Stop => {

        parent_must_be => [                                                     # Stop[0]
            'Instruction',
            'Stop statement must be a direct child of an instruction',
            0
        ],

        must_be_somewhere_inside => [                                           # Stop[1]
            'Function Method',
            'Stop statement must be inside a function, method, or callback',
            1
        ]

    },

    PropertyVariable => {

        must_be_somewhere_inside => [                                           # PropertyVariable[0]
            'Inside Type',
            "Property variable (standalone .property) can only exist within ".
            "'inside' or 'type' block",
            0
        ],

        # make sure we're in the BODY of the Inside, not the param_exp.
        parent_must_satisfy => [                                                # PropertyVariable[1]
            sub {
                my $el = shift;
                my $inside = $el->first_self_or_parent('Inside') or return 1;
                return $el->somewhere_inside($inside->body);
            },
            "Property variable (standalone .property) cannot exist within ".
            "'inside' parameter expression; it must be in the body instead",
            1
        ]

    },

    TypeBody => {

        children_must_be => [                                                   # TypeBody[0]
            'Instruction',
            'Type definitions can only contain instructions',
            0
        ],

        after_rules => {

            children_must_satisfy => [                                          # TypeBody[1]
                sub {
                    my $el = shift;

                    # not instruction, pass on top children_must_be.
                    return 1 if $el->type ne 'Instruction';
                    my $child = $el->first_child;

                    # first of all, it has to be an expression,
                    # unless it's a type requirement.
                    return if
                        !$child or
                        !$child->isa('F::Expression')
                        && $child->type ne 'TypeRequirement';

                    return 1;
                },
                'Type definitions can only contain test values or method '.
                'requirements',
                1
            ]

        }

    },

    Defer => {

        must_be_somewhere_inside => [                                           # Defer[0]
            'Function Method',
            "'Defer' can only exist within a function or method",
            0
        ]

    },

    Assignment => {

        parent_must_be => [                                                     # Assignment[0]
            'Instruction IfParameter',
            "Assignment must be direct child of an instruction or 'if' parameter",
            0
        ],

        # left side and right side
        num_children => 2                                                       # Assignment[1]

    },

    IfParameter => {

        children_must_satisfy => [                                              # IfParameter[0]
            sub {
                my $el = shift;

                # lazy assignments cannot act as expressions because
                # they return a non-Ferret value (CODE reference)
                return !$el->{lazy} if $el->isa('F::Assignment');

                return $el->isa('F::Expression');
            },
            'If parameter must be an expression',
            0
        ],

        num_children => [ 1, undef, 1 ]                                         # IfParameter[1]

    },

    TypeRequirement => {

        parent_must_be => [                                                     # TypeRequirement[0]
            'Instruction',
            'Type requirement (can/isa/satisfies/transform) must be a direct '.
            'child of an instruction',
            0
        ],

        must_be_somewhere_inside => [                                           # TypeRequirement[1]
            'Type',
            'Type requirement (can/isa/satisfies/transform) can only exist '.
            "somewhere inside of a 'type' construct",
            1
        ],

        children_must_satisfy => [                                              # TypeRequirement[2]
            sub { shift->isa('F::Expression') },
            'Type requirement (can/isa/satisfies/transform) must contain '.
            'an expression of some sort',
            2
        ],

        num_children => [ 1, undef, 3 ]                                         # TypeRequirement[3]

        # Rule implemented in F/TypeRequirement.pm:
        #   If the type requirement is a 'can' statement,
        #   its interface method, represented by a subtype of Call,
        #   must have a 'function' of type PropertyVariable.
        #   e.g.   .someMethod()
        #   NOT    someMethod()
        #   Checked on ->close of the TypeRequirement.

    },

    Function => {

        # if it's an anonymous function, it can act as an expression and be
        # just about anywhere. if not, it must be direct child of scope owner.
        parent_must_satisfy => [                                                # Function[0]
            sub {
                my ($parent, $func) = @_;
                return $func->anonymous || $parent->isa('F::ScopeOwner');
            },
            'Function must be inside a scope owner',
            0
        ]

    },

    Token => {

        # tokens cannot be astray.
        parent_must_be => [                                                     # Token[0]
            'NONE',
            'This token is not valid in the current context',
            0
        ]

    }

);

1
