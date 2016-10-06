# Compilation

The Ferret compiler is also written entirely in Perl. Compilation is a
multi-stage process.

## Stages

#### 1. Tokenizer

The source code is tokenized into a flat list of labels and values. This step
involves very minimal error checking. In fact, the only error that can occur
during this process is a failure to tokenize a certain byte or string.

```
=== Tokenization ===
     PKG_DEC |                {"name":"Math"} | 1.5
   CLASS_DEC |                {"name":"Line"} | 2.5
      METHOD | {"main":1,"name":"initializer__"} | 4.33333
   CLOSURE_S |                                | 4.66667
KEYWORD_NEED |                                | 5.1
    VAR_SELF |                          "pt1" | 5.2
    OP_VALUE |                                | 5.3
    BAREWORD |                        "Point" | 5.4
    OP_COMMA |                                | 5.5
    VAR_SELF |                          "pt2" | 5.6
    OP_VALUE |                                | 5.7
    BAREWORD |                        "Point" | 5.8
     OP_SEMI |                              1 | 5.9
   CLOSURE_E |                                | 6.5
```

Example of an error raised during the tokenization stage

```
1 + 2 @ 3
```

```
Unable to tokenize '@' at line 1.
```

#### 2. Constructor

The most significant step is the construction of the document model. The
tokens are processed into a hierarchical tree of elements. Elements are
represented by Perl objects which may belong to several categories such as
List, Node, Expression, etc. Throughout this process, the constructor is
checking that grammatical rules are met and aborts compilation if it
encounters nonsense.

```
=== Document Model ===
 Document './test/hello20/IRC/Bot.frt'
     Package 'IRC'
     Class 'Bot'
         Class method 'initializer__'
             Instruction
                 Need
                     Instance variable '@addr'
                     Bareword 'Str'
             Instruction
                 Need
                     Instance variable '@nick'
                     Bareword 'Str'
             Instruction
                 Want
                     Instance variable '@port'
                     Expression ('want' parameter)
                         Number '6667'
                     Bareword 'Num'
             Instruction
                 Assignment (instance variable '@handlers')
                     Hash [3 items]
                         Item 0
                             Pair 'MODE'
                                 Instance variable '@joinChannels'
                         Item 1
                             Pair 'PING'
                                 Instance variable '@pong'
                         Item 2
                             Pair 'PRIVMSG'
                                 Instance variable '@handleMessage'
             Instruction
                 Assignment (instance variable '@sock')
                     Call
                         Bareword 'Socket::TCP'
                         Named argument list [2 items]
                             Item 0
                                 Pair 'address'
                                     Instance variable '@addr'
                             Item 1
                                 Pair 'port'
                                     Instance variable '@port'
             On
                 Expression ('on' parameter)
                     Property 'connected'
                         Instance variable '@sock'
                 Anonymous function
                     Instruction
                         Call
                             Instance variable '@send'
                             Single value [1 items]
                                 Item 0
                                     Operation
                                         String 'USER '
                                         Addition operator (+)
                                         Instance variable '@user'
                                         Addition operator (+)
                                         String ' * * :'
                                         Addition operator (+)
                                         Instance variable '@real'
                     Instruction
                         Call
                             Instance variable '@send'
                             Argument list [1 items]
                                 Item 0
                                     Operation
                                         String 'NICK '
                                         Addition operator (+)
                                         Instance variable '@nick'
         Method 'connect'
             Instruction
                 Call
                     Property 'connect'
                         Instance variable '@sock'
                     Argument list [0 items]
```

Example of an error raised during the construction stage

```
$x in (1, 2, 3) {
    say("Number: $x")
}
```

```
Error: Unexpected keyword 'in' (where is 'for'?).
     File    -> (stdin)
     Line    -> 1
     Near    -> lexical variable '$x'
     Parent  -> document '(stdin)'
Exception raised by Ferret::Lexer::Constructor line 387.
```

#### 3. Enforcer

After the entire document tree is constructed, a final check ensures that all
grammatical rules are met. Below is an example of an element rule definition.

```perl
WantNeed => {

    # WantNeed must always be a direct child of an instruction.
    parent_must_be => 'Instruction',                                        # WantNeed[0]

    # WantNeed must always be inside one of these.
    must_be_somewhere_inside => [                                           # WantNeed[1]
        'Function Method',
        'Argument declaration must be within a function or method'
    ],

    instruction_inside_rules => {

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

}
```

Example of an error raised during the enforcement stage

```
func add {
    need $x, $y
    $z = $x + $y
    say("$x + $y = $z")
}

need $x
```

```
Error: Unexpected need outside of a containing function.
Argument declaration must be within a function or method.
     File    -> (stdin)
     Line    -> 7
     Near    -> operation
     Parent  -> document '(stdin)'
Exception raised by F::Node line 24.
```

#### 4. Verifier

Following document tree construction and grammatical rule enforcement, the
verifier stage raises compile-time exceptions for anything that is grammatically
correct but logically incorrect. This stage includes compile-time scope and
variable tracking, type and protocol conformance checks, and more.

Example of an error raised by during the verification stage

```
for ($a, $b) in [color: "blue", mood: "sad"] {
    $x
    $x = true
}
```

```
Error: Reference to lexical variable '$x' without previous declaration.
Note that '$x' is later declared in this scope on line 3.
     Error   -> UndeclaredVariableReference
     File    -> (stdin)
     Line    -> 2
     Element -> lexical variable '$x'
     Near    -> instruction
     Parent  -> body ('for' scope)
Exception raised by Ferret::Lexer::Verifier line 150.
```

#### 5. Compiler

At this point in the process, the document tree is fully constructed, and all
error checking is complete. The object model is converted to Perl source code.

```perl
# Method event 'center' definition
my $method_8 = FF::method_event_def($f, $scope, 'center', [  ], sub {
    my ($self, $args, $call_scope, $scope, $ret) = @_;
    $scope->set_property_ow($context, x => add($scope, $self->property_u('origin')->property_u('x'), mul($scope, $self->property_u('width'), num($f, 0.5))));
    $scope->set_property_ow($context, y => add($scope, $self->property_u('origin')->property_u('y'), mul($scope, $self->property_u('height'), num($f, 0.5))));
    return $scope->property_u('Point')->call_u([ $scope->property_u('x'), $scope->property_u('y') ], $scope);
    return $ret;
});
```

#### 6. Beautifier

Finally, the code is beautified using perltidy. Well, I wouldn't call it
beautiful, but it does help when the lines begin to exceed 1,000 characters.

```perl
# Method event 'center' definition
my $method_8 = FF::method_event_def(
    $f, $scope, 'center',
    [],
    sub {
        my ( $self, $args, $call_scope, $scope, $ret ) = @_;
        $scope->set_property_ow(
            $context,
            x => add(
                $scope,
                $self->property_u('origin')->property_u('x'),
                mul(
                    $scope, $self->property_u('width'),
                    num( $f, 0.5 )
                )
            )
        );
        $scope->set_property_ow(
            $context,
            y => add(
                $scope,
                $self->property_u('origin')->property_u('y'),
                mul(
                    $scope, $self->property_u('height'),
                    num( $f, 0.5 )
                )
            )
        );
        return $scope->property_u('Point')
          ->call_u(
            [ $scope->property_u('x'), $scope->property_u('y') ],
            $scope );
        return $ret;
    }
);
```

## Troubleshooting

Here are some problematic situations you might encounter and their solutions.

#### Unable to tokenize

These errors are raised by the [Tokenizer](Tokenizer/Tokenizer.md).

Try running `ferret` with the `-tv` flags. This will print the tokenization to
give you a better idea of where the error occurred.

#### (Un)expected elements

These errors are raised by the [Constructor](Constructor/Constructor.md).

Hopefully, the error message is descriptive enough for you to find the issue.
If not, it helps to know a little Perl. Ferret will tell you where the
exception occurred in the compiler's Perl source code. That may help you nail
it down.

If the error says it was raised by a rule, it will provide the name of the rule.
Eventually, all rules will be documented, but for the time being, it may be
helpful to manually check the rule definition to see what it means.

Let's say, for example, that you wrote `$x = 1 1` and got an error message
which ends with `Exception raised by rule Instruction[0]`. This is because there
is a rule that says instructions can only contain one element. You could then
search [Rules.pm](../lib/Ferret/Lexer/Rules.pm) and
[Constructor.pm](../lib/Ferret/Lexer/Constructor.pm) for `Instruction[0]`.

#### Compiler process "exited prematurely"

The Ferret compiler is multi-process and asynchronous. Put another way, the
`ferret` executable is more like `make` than `cc`. These errors occur when a
child process exits unexpectedly, but the parent process survives it.

Try running `ferret` with the `-y` flag. This tells the compiler to use only
one process and one thread. Usually it will then provide a Perl error message.

#### None of those

Head to **#k** on **irc.notroll.net** and start complaining.
