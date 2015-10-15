package Ferret::Lexer::Rules;

use warnings;
use strict;
use 5.010;

use Ferret::Lexer::RuleFunctions;
use Ferret::Lexer::RuleSet;

our %element_rules = (

    Class => {
        children_must_be => [
            'Method',
            'Class must only contain class functions, instance methods, '.
            'and variable declarations'
        ]
    },

    WantNeed => {

        # WantNeed must always be a direct child of an instruction.
        parent_must_be => 'Instruction',

        # WantNeed must always be inside one of these.
        must_be_inside_one => [
            'Function Method',
            'Argument declaration must be within a function or method'
        ],

        directly_inside_rules => {

            # directly inside a method, WantNeed can ONLY contain these things.
            Method => {
                children_must_be => [
                    'InstanceVariable LexicalVariable Expression Bareword',
                    'Argument declaration inside method can only contain lexical '.
                    'or instance variables and their types'
                ]
            },

            # directly inside a function, WantNeed can ONLY contain these things.
            Function => {
                children_must_be => [
                    'LexicalVariable Expression Bareword',
                    'Argument declaration inside function can only contain '.
                    'lexical variables and their types'
                ]
            },

        } # end directly_inside_rules

    },

    PropertyModifier => {

        parent_must_be => 'Instruction',

        # it can be variables or properties.
        # however, it cannot be a special variable.
        children_must_be => [
            'LexicalVariable InstanceVariable Property',
            'Property modifier can only capture non-special variables '.
            'or properties'
        ],

        # if it's a property, it cannot be a special one.
        children_must_satisfy => [
            sub {
                my $el = shift;
                return 1 if $el->type ne 'Property';
                return !$el->is_special;
            },
            'Property modifier cannot capture special properties'
        ],

        # there can only be one child.
        max_children => 1

    },

    Token => {
        parent_must_be => 'NONE'
    }

);

1
