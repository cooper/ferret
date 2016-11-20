package Ferret::Lexer::Rules;

use warnings;
use strict;
use 5.010;

use Ferret::Lexer::RuleFunctions;
use Ferret::Lexer::RuleSet;
use List::Util qw(any);

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

        # FIXME: package is not a node so this currently only works for classes

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

    ANGLE_E => [

        current_node_must_be => [                                               # ANGLE_E[0]
            'TypedClass',
            'Attempted to terminate a <Type>, but one is not open',
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

    ],

    OP_PROP => [

        next_token_must_be => [                                                 # OP_PROP[0]
            'BRACKET_S',
            'Property operator (.) must be followed by either a bareword '.
            'property or a bracket-delimited expression',
            0
        ]

    ],

    KEYWORD_CATCH => [

        current_must_have => [                                                  # KEYWORD_CATCH[0]
            'instruction',
            'Attempted to catch an error on a failable instruction, but no '.
            "instruction is open. Make sure the 'catch' keyword comes before ".
            "instruction terminator (semicolon or newline)",
            0
        ]
    ],

    KEYWORD_IN => [

        current_node_must_satisfy => [                                          # KEYWORD_IN[0]
            sub {
                my $node = shift;
                $node->{parameter_for} && $node->{parameter_for} eq 'for';
            },
            "Could not find the corresponding 'for' keyword",
            0
        ]
    ],

    KEYWORD_CONTINUE => [

        last_element_must_be => [                                               # KEYWORD_CONTINUE[0]
            'For',
            "Could not find the corresponding 'for' block",
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

        # there has to be at least one child, the statement.
        # I don't think this can ever actually happen.
        min_children => [                                                       # Instruction[0]
            1,
            undef,
            0
        ],

        # we could have up to two children. the second could be a catch.
        max_children => [                                                       # Instruction[1]
            2,
            'Seems likely that you forgot a semicolon',
            1
        ],

        # if a second child does exist, it MUST be a catch.
        child_1_must_be => [                                                    # Instruction[2]
            'Catch',
            'Seems likely that you forgot a semicolon',
            2
        ]

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
        children_must_satisfy => [                                              # Class[2]
            sub {
                my $el = shift;
                return 1 if $el->type ne 'Instruction';
                my $child = $el->first_child;

                # these are ayy-ok.
                return 1 if $child->type eq 'Load';
                return 1 if $child->type eq 'Alias';
                return 1 if $child->type eq 'SharedDeclaration';

                # if it's an assignment, it must be a lexical variable.
                if ($child->type eq 'Assignment') {
                    return $child->assign_to->type eq 'LexicalVariable';
                }

                return;
            },
            'Class-level instructions can only include lexical variable '.
            'assignments and load statements',
            2
        ]

    },

    WantNeed => {

        # WantNeed must always be a direct child of an instruction.
        parent_must_be => [                                                     # WantNeed[0]
            'Instruction',
            undef,
            0
        ],

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

        min_children => [                                                       # WantNeed[3]
            1,
            undef,
            3
        ],

        max_children => [                                                       # WantNeed[4]
            3,
            undef,
            4
        ]

    },

    WantNeedType => {

        parent_must_be => [                                                     # WantNeedType[0]
            'WantNeed',
            undef,
            0
        ],

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

        min_children => [                                                       # WantNeedType[3]
            1,
            undef,
            3
        ]

    },

    WantNeedValue => {

        parent_must_be => [                                                     # WantNeedValue[0]
            'WantNeed',
            undef,
            0
        ],

        children_must_be => [                                                   # WantNeedValue[1]
            '@Expression',
            'Argument declaration fallback value must be an expression '.
            'of sorts',
            1
        ],

        must_come_after => [                                                    # WantNeedValue[2]
            'InstanceVariable LexicalVariable WantNeedType',
            'Argument declaration type must follow argument variable or type',
            2
        ],

        num_children => [                                                       # WantNeedValue[3]
            1,
            undef,
            3
        ]

    },

    PropertyModifier => {

        # must be a direct child an instruction.
        parent_must_be => [                                                     # PropertyModifier[0]
            'Instruction',
            undef,
            0
        ],

        # it can be variables or properties.
        # however, it cannot be a special variable.
        children_must_be => [                                                   # PropertyModifier[1]
            'LexicalVariable InstanceVariable ThisVariable Property Index',
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
        num_children => [                                                       # PropertyModifier[3]
            1,
            undef,
            3
        ]

    },

    InstanceVariable => {

        # instance variables only make sense inside of classes.
        must_be_somewhere_inside => [                                           # InstanceVariable[0]
            'Function',
            'Instance variables must be inside a class instance method',
            0
        ],

        parent_must_satisfy => [                                                # InstanceVariable[1] TODO
            sub {
                my @upper_funcs = shift->filter_ancestors(type => 'Function');
                return any { $_->is_method } @upper_funcs;
            },
            'Instance variables must be inside a class instance method',
            1
        ]

    },

    ThisVariable => {

        # instance variables only make sense inside of classes.
        must_be_somewhere_inside => [                                           # ThisVariable[0]
            'Function Method',
            'Instance variables must be inside a class function or method',
            0
        ]

    },

    NamedPair => {

        # pairs can only be inside of lists (specifically, hashes or objects).
        must_be_somewhere_inside => [                                           # NamedPair[0]
            'List',
            'Pair must be inside a list',
            0
        ],

        # each pair must be a direct child of a list item.
        parent_must_be => [                                                     # NamedPair[1]
            'ListItem',
            'Pair must be a direct child of a list item',
            1
        ],

        num_children => [                                                       # NamedPair[2]
            1,
            undef,
            2
        ],

        children_must_be => [                                                   # NamedPair[3]
            '@Expression',
            undef,
            3
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
        ],

        num_children => [                                                       # Pair[2]
            2,
            undef,
            2
        ],

        children_must_be => [                                                   # Pair[3]
            '@Expression',
            undef,
            3
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
        children_must_be => [                                                   # ListItem[0]
            '@Expression NamedPair Pair',
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

        max_children => [                                                       # ListItem[3]
            1,
            undef,
            3
        ]

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

        # children can only be non-special variables or properties.
        children_must_be => [                                                   # OnParameter[0]
            'Property LexicalVariable InstanceVariable ThisVariable '.
            'PropertyVariable Bareword',
            "'On' parameter can only be a non-special variable or property",
            0
        ],

        # if it's a property, it cannot be a special one.
        children_must_satisfy => [                                              # OnParameter[1]
            sub {
                my $el = shift;
                return 1 if $el->type ne 'Property';
                return !$el->is_special;
            },
            "'On' parameter cannot be a special property",
            1
        ],

        # it can only contain one property or variable.
        num_children => [                                                       # OnParameter[2]
            1,
            undef,
            2
        ]

    },

    SharedDeclaration => {

        # must be a direct child an instruction.
        parent_must_be => [                                                     # SharedDeclaration[0]
            'Instruction',
            undef,
            0
        ],

        # rules for the parent instruction
        parent_rules => {

            # the instruction's parent must be a class or document.
            parent_must_be => [                                                 # SharedDeclaration[4]
                'Class Document',
                'Shared variable declaration can only exist at class or '.
                'document level',
                4
            ]

        },

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
        num_children => [                                                       # SharedDeclaration[3]
            1,
            undef,
            3
        ]

    },

    LocalDeclaration => {

        # must be a direct child an instruction.
        parent_must_be => [                                                     # LocalDeclaration[0]
            'Instruction',
            undef,
            0
        ],

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
                my $parent = shift;
                return 1 if $el->type ne 'Assignment';
                return $el->assign_to->type eq 'LexicalVariable';
            },
            'Local variable declaration can capture an assignment only '.
            'of a lexical variable',
            2
        ],

        # there can only be one child.
        num_children => [                                                       # LocalDeclaration[3]
            1,
            undef,
            0
        ]

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

        # there can only be one child.
        num_children => [                                                       # Load[3]
            1,
            undef,
            3
        ]

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

    LoopStatement => {

        parent_must_be => [                                                     # LoopStatement[0]
            'Instruction',
            'Loop control statement (next/last/redo) must be a direct child '.
            'of an instruction',
            0
        ],

        must_be_somewhere_inside => [                                           # LoopStatement[1]
            'ForBody',
            'Loop control statement (next/last/redo) must be inside a for '.
            'loop body',
            1
        ]

    },

    PropertyVariable => {

        must_be_somewhere_inside => [                                           # PropertyVariable[0]
            'InsideBody TypeBody FunctionBody',
            "Property variable (standalone .property) can only exist within ".
            "'inside', 'type', or 'function' block",
            0
        ],

        # make sure we're in the BODY of the Inside, not the param_exp.
        parent_must_satisfy => [                                                # PropertyVariable[1]
            sub {
                my $el = shift;

                # if it's somewhere in one of these, we're ok
                return 1 if $el->first_self_or_parent('InsideBody');
                return 1 if $el->first_self_or_parent('Type');

                # otherwise, it's a function
                my $func = $el->first_self_or_parent('Function') or return;
                return $func->anonymous && !$func->arguments;

            },
            'Property variable (standalone .property) is only valid within '.
            'a function if it is anonymous and has no additional argument '.
            'requirements',
            1
        ]

    },

    TypeBody => {

        children_must_be => [                                                   # TypeBody[0]
            'Instruction',
            'Type definitions can only contain instructions',
            0
        ],

        children_must_satisfy => [                                              # TypeBody[1]
            sub {
                my $el = shift;

                # not instruction, pass on top children_must_be.
                return 1 if $el->type ne 'Instruction';
                my $child = $el->first_child;

                # first of all, it has to be an expression,
                # unless it's a type requirement.
                return if
                    !$child or
                    !$child->is_type('Expression')
                    && $child->type ne 'TypeRequirement';

                return 1;
            },
            'Type definitions can only contain test values or method '.
            'requirements',
            1
        ]

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
            'Instruction IfParameter Alias SharedDeclaration LocalDeclaration',
            "Assignment must be direct child of an instruction, 'if' ".
            "parameter, alias, or variable declaration",
            0
        ],

        # left side and right side
        num_children => 2,                                                      # Assignment[1]

        # the first child is the left side of the assignment.
        # it has be assignable.
        child_0_must_be => [                                                    # Assignment[2]
            '@Assignable Bareword',
            'Left side of assignment must be an assignable expression',
            2
        ],

        # if the left side is a bareword, this has to be an alias
        child_0_must_satisfy => [                                               # Assignment[7]
            sub {
                my ($left, $as) = @_;
                return 1 if $left->type ne 'Bareword';
                return $as->parent->type eq 'Alias';
            },
            7
        ],

        # the right side of the assignment has to be an expression.
        child_1_must_be => [                                                    # Assignment[3]
            '@Expression',
            'Right side of assignment must be an expression',
            3
        ],

        directly_inside_rules => {

            # with Alias as parent...
            Alias => {

                # both sides have to be a bareword.
                children_must_be => [                                           # Assignment[4]
                    'Bareword',
                    'Both sides of assignment must be a bareword function or '.
                    'type name inside "alias" declaration',
                    4
                ]

            }

        }

    },

    Alias => {

        parent_must_be => [                                                     # Alias[0]
            'Instruction',
            undef,
            0
        ],

        children_must_be => [                                                   # Alias[1]
            'Assignment',
            'Alias can only contain an assignment for a bareword function '.
            'or type name',
            1
        ],

        num_children => [                                                       # Alias[2]
            1,
            undef,
            2
        ]

        # note the rules within assignment for while inside Alias.

    },

    IfParameter => {

        children_must_satisfy => [                                              # IfParameter[0]
            sub {
                my $el = shift;

                # lazy assignments cannot act as expressions because
                # they return a non-Ferret value (CODE reference)
                return !$el->{lazy} if $el->is_type('Assignment');

                return $el->is_type('Expression');
            },
            'If parameter must be an expression',
            0
        ],

        num_children => [                                                       # IfParameter[1]
            1,
            undef,
            1
        ]

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

        child_0_must_be => [                                                   # TypeRequirement[2] TODO
            '@Expression',
            'Type requirement (can/isa/satisfies/transform) must contain '.
            'an expression of some sort',
            2
        ],

        child_1_must_be => [                                                    # TypeRequirement[3] TODO
            'Bareword List',
            'Return type in method requirement must be a bareword or a '.
            'list in the form (name: Type, other: OtherType)',
            3
        ],

        child_1_must_satisfy => [                                               # TypeRequirement[4]
            sub {
                my ($child, $type) = @_;

                # first of all, if this child even exists, it has to have been
                # marked as having a return type (which means -> was found).
                return if !$type->{has_return};

                # next, the list can only contain bareword return pair names
                # and their bareword types.
                return interface_method_list(@_) if $child->type eq 'List';

                return 1;
            },
            'Type requirement can only capture one element unless it is a '.
            'method requirement with a return type or list of return types',
            4
        ],

        min_children => [                                                       # TypeRequirement[5] TODO
            1,
            undef,
            5
        ],

        max_children => [                                                       # TypeRequirement[6] TODO
            2,
            undef,
            6
        ],

        # Rule implemented in F/TypeRequirement.pm:
        #   If the type requirement is a 'can' statement,
        #   its interface method, represented by a subtype of Call,
        #   must have a 'function' of type PropertyVariable.
        #   e.g.   .someMethod()
        #   NOT    someMethod()
        #   Checked on ->close of the TypeRequirement.

    },


    Call => {

        # first child better be an expression
        child_0_must_be => [                                                    # Call[0]
            '@Expression',
            "Cannot call non-expression",
            0
        ],

        # second child better be an argument list
        child_1_must_be => [                                                    # Call[1]
            'List',
            "Second child of call, if any, must be its argument list",
            1
        ],

        # disallows call operator to omit the argument list
        min_children => [                                                       # Call[2]
            1,
            undef,
            2
        ]

    },


    InterfaceMethod => {

        # first child better be a .property
        child_0_must_be => [                                                    # InterfaceMethod[0]
            'PropertyVariable',
            "'can' method requirement must look like: can .methodName(...)",
            0
        ],

        # second child better be an argument list
        child_1_must_be => [                                                    # InterfaceMethod[1]
            'List',
            "'can' method requirement must look like: can .methodName(...)",
            1
        ],

        # the list can only contain pairs of argName:BarewordType
        children_must_satisfy => [                                              # InterfaceMethod[2]
            \&interface_method_list,
            "'can' method requirement arguments must be named with ".
            "bareword types, like: can .methodName(argName: Type, ...)",
            2
        ],

        # disallows call operator to omit the argument list
        num_children => [                                                       # InterfaceMethod[3]
            2,
            "'can' method requirement must look like: can .methodName(...)",
            3
        ]

    },

    Function => {

        # if it's an anonymous function, it can act as an expression and be
        # just about anywhere. if not, it must be direct child of scope owner.
        parent_must_satisfy => [                                                # Function[0]
            sub {
                my ($parent, $func) = @_;
                return $func->anonymous || $parent->is_type('ScopeOwner');
            },
            'Function must be inside a scope owner',
            0
        ]

    },

    Property => {

        children_must_be => [                                                   # Property[0]
            '@Expression',
            'Properties can only be accessed on expressions on sorts',
            0
        ],

        # it has to be a list.
        child_1_must_be => [                                                    #Property[1]
            'List',
            'Properties with evaluated (non-bareword) names must only contain '.
            'a bracket-delimited expression: $obj.[someExpression]',
            1
        ],

        # it has to be "[" .. "]" list.
        child_1_must_satisfy => [                                               #Property[2]
            sub {
                my $list = shift;
                return 1 if $list->type ne 'List';
                return $list->{list_terminator} eq 'BRACKET_E';
            },
            'Properties with evaluated (non-bareword) names must only contain '.
            'a bracket-delimited expression: $obj.[someExpression]',
            2
        ],

        # rules for the list.
        child_1_rules => {

            # it has to have exactly one list item.
            num_children => [                                                   # Property[3]
                1,
                undef,
                3
            ]

        },

        # no less than 1 child (the left side)
        min_children => [                                                       # Property[4]
            1,
            undef,
            4
        ],

        # no more than 2 children (the left side and the index list)
        max_children => [                                                       # Property[5]
            2,
            undef,
            5
        ]

    },

    CatchParameter => {

        children_must_be => [                                                   # CatchParameter[0]
            'LexicalVariable',
            '"Catch" parameter must be a lexical variable representing an '.
            'error object',
            0
        ],

        max_children => [                                                       # CatchParameter[1]
            1,
            undef,
            1
        ]

    },

    FailThrow => {

        parent_must_be => [                                                     # FailThrow[0]
            'Instruction',
            undef,
            0
        ],

        children_must_be => [                                                   # FailThrow[1]
            '@Expression',
            'Fail/throw statement must consume an expression of sorts',
            1
        ],

        num_children => [                                                       # FailThrow[2]
            1,
            undef,
            2
        ],

        parent_must_satisfy => [                                                # FailThrow[3]
            sub {
                my ($p, $fail) = @_;

                # throws can be anywhere.
                return 1 if $fail->{fail_type} eq 'throw';

                # fails can only be in functions.
                return $p->first_self_or_parent('Function');

            },
            'Fail statement must be inside a function, method, or callback',
            3
        ],

    },

    Take => {

        parent_must_be => [                                                     # Take[0]
            'Instruction',
            undef,
            0
        ],

        children_must_be => [                                                   # Take[1]
            '@Expression',
            'Take statement must consume an expression of sorts',
            1
        ],

        num_children => [                                                       # Take[2]
            1,
            undef,
            2
        ],

        must_be_somewhere_inside => [                                           # Take[3]
            'Gather',
            'Take statement must be somewhere inside a gather body',
            3
        ]

    },

    TypedClass => {

        # note that Maybes can contain more than barewords, which is undesired
        # and enforced by Maybe[1].
        children_must_be => [                                                   # TypedClass[0]
            'Bareword Maybe',
            'Type generics can only consist of bareword types',
            0
        ],

        # note that when TypedClass is used with class declarations,
        # this rule is not satisfied. it doesn't matter because this
        # rule isn't checked until the tree is fully constructed, and
        # by that time, the TypedClass is gone from the document tree.
        min_children => [                                                       # TypedClass[1]
            2,
            undef,
            1
        ]

    },

    Maybe => {

        # there must only be one uncertainty
        num_children => [                                                       # Maybe[0]
            1,
            'Inline if operator (?) can only capture a single element',
            0
        ],

        directly_inside_rules => {

            # inside a TypedClass, we can only allow a single bareword
            TypedClass => {

                # must be a bareword
                children_must_be => [                                           # Maybe[1]
                    'Bareword',
                    'Type generics can only consist of bareword types',
                    1
                ]

            }

        }

    },

    Detail => {

        children_must_be => [                                                   # Detail[0]
            'Call',
            'Detail can only capture the return object of a call',
            0
        ],

        num_children => [                                                       # Detail[1]
            1,
            'Detail can only capture the return object of a call',
            1
        ]

    },

    Continue => {

        parent_must_be => [                                                     # Continue[0]
            'For',
            'Continue must immediately follow a for block',
            0
        ],

        must_come_after => [                                                    # Continue[1]
            'ForBody',
            'Continue must immediately follow a for block',
            1
        ],

        children_must_be => [                                                   # Continue[2]
            'ContinueBody',
            'Continue can only contain one child, its body',
            2
        ],

        num_children => [                                                       # Continue[3]
            1,
            'Continue can only contain one child, its body',
            3
        ]

    },

    Return => {

        must_be_somewhere_inside => [                                           # Return[0]
            'Function Method',
            'Return must be somewhere inside a function, method, or callback',
            0
        ],

        max_children => [                                                       # Return[1]
            2,
            'Return can only contain one expression and possibly a type, '.
            'separated by a colon (:)',
            1
        ],

        children_must_be => [                                                   # Return[2]
            '@Expression',
            'Cannot return non-expression',
            2
        ],

        child_1_must_be => [                                                    # Return[3] TODO
            'Bareword',
            'Return statement type must be a bareword',
            3
        ],

        # check if the colon was reached
        child_1_must_satisfy => [                                               # Return[4] TODO
            sub {
                my (undef, $ret) = @_;
                $ret->{has_type};
            },
            'Return can only contain one expression and possibly a type, '.
            'separated by a colon (:)',
            4
        ]

    },

    ReturnPair => {

        must_be_somewhere_inside => [                                           # ReturnPair[0] TODO
            'Function Method',
            'Return must be somewhere inside a function, method, or callback',
            0
        ],

        max_children => [                                                       # ReturnPair[1] TODO
            2,
            'Return can only contain one expression and possibly a type, '.
            'separated by a colon (:)',
            1
        ],

        children_must_be => [                                                   # ReturnPair[2] TODO
            '@Expression',
            'Cannot return non-expression',
            2
        ],

        child_1_must_be => [                                                    # ReturnPair[3] TODO
            'Bareword',
            'Return statement type must be a bareword',
            3
        ],

        # check if the colon was reached
        child_1_must_satisfy => [                                               # ReturnPair[4] TODO
            sub {
                my (undef, $ret) = @_;
                $ret->{has_type};
            },
            'Return can only contain one expression and possibly a type, '.
            'separated by a colon (:)',
            4
        ]

    },

    Negation => {

        max_children => [                                                       # Negation[0] TODO
            1,
            'Negation (!) can only capture a single element',
            0
        ],

        children_must_be => [                                                   # Negation[1] TODO
            '@Expression',
            'Negation (!) can only capture an expression',
            1
        ]

    },

    Unknown => {

        # tokens cannot be astray.
        parent_must_be => [                                                     # Token[0]
            'NONE',
            'This token is not valid in the current context',
            0
        ]

    }

);

sub interface_method_list {
    my $list = shift;

    # it has to be a "hash list"
    # meaning named args only. not array. not mixture.
    return 1 if $list->type ne 'List';
    return if !$list->{hash} && $list->children;

    # each item has to be a NamedPair.
    for my $item ($list->children) {
        my $el = $item->first_child;
        return if $el->type ne 'NamedPair';

        # the value of the pair has to be a bareword type.
        return if $el->first_child->type ne 'Bareword';
    }

    return 1;
}

1
