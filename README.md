# Ferret

Ferret is a hobby programming language.

### Compiled

Ferret currently compiles exclusively to Perl, a high-level language. It might
therefore be considered a very-high-level language (VHLL). In other words, it
probably has a lot of useless overhead.

```
say("Hello World!");
```

```perl
$scope->property_u('say')->call_u( [ str( $f, "Hello World!" ) ], $scope );
```

### Interpretable

While Ferret is a compiled language, its compiler and
runtime are both written in an interpreted language. Therefore, it offers some
features of interpreted languages such as compilation and evaluation during
runtime.

```
$code = "sqrt(4)";
$two = COMPILER($code).eval().result;
```

### Concepts

Ferret was originally titled
[__EOPRJ__](https://github.com/cooper/evented-objective-perl-ruby-javascript),
an acronym in which each letter represents a fundamental idea.

#### Evented

Ferret makes extensive use of
[Evented::Object](https://github.com/cooper/evented-object).
All functions and methods in Ferret are implemented as events.

```
class Person

init {
    need @name: Str, @age: Num;
}

# all methods are implemented as events
method haveBirthday {
    $old = @age;
    @age = $old + 1;
    oldAge -> $old;
    newAge -> @age;
}

```

Example use of event

```
# create a person
$person = Person(name: "Jake", age: 22);

# add an event callback for haveBirthday
on $person.haveBirthday {
    say("Happy Birthday Jake!");
}
```

It is also possible to respond to events regardless of object.

```
on Person.proto.haveBirthday {
    $name = *this.name;
    say("Happy Birthday $name!");
}
```

#### Objective

All Ferret data types are objects. Yeah, that sounds pretty cliché nowadays,
but Ferret's inheritance system makes it unique (see "Inheritance").

```
"hello".length()                        # 5
1.odd                                   # true
(test: "hello").test                    # "hello"
Math::Rect(10, 10, 10, 10).center()     # Math::Point(10, 10)
```

#### Perl

If Ferret resembles one language more than all others, that
language is probably Perl. Just look at all its sigils, brackets, and
parentheses. And although Perl's basic datatypes are value types,
its extensive use of references influenced the fact that all Ferret values
are referential. And Perl happens to be the language to which Ferret
compiles, as well as the one in which its compiler and runtime are written.

```
(hello: "world")
```

```perl
Ferret::Object->new($f, initial_props => { hello => str($f, "world") })
```

#### Ruby

The original EOPRJ syntax looked a lot like Ruby, without many curly
brackets or parentheses, but it has since evolved into a more Perlish look.
However, Ferret shares with Ruby the "everything is an object" concept, a
similar type of class definition, and a symbol datatype
(:symbol in Ruby is ~symbol in Ferret).

#### JavaScript

Ferret's properties are similar to those of JavaScript.
Any object may or may not have a value for a string key, and properties are
not considered at compile time. Ferret also has JavaScript-style prototypes.__ __

### Inheritance

Perhaps Ferret's most unique feature is its ISA inheritance system. The name
ISA is borrowed from Perl, where package variables `@ISA` consist of parent
package names. However, Ferret's inheritance system is quite different.

Ferret objects do not inherit from classes; they inherit from other objects.
As silly as it may sound, objects can belong to any number of classes.
But they don't inherit from those classes; they inherit from their prototype
objects.

If an object is an instance of the String class, for instance, its `*isa`
(list of parent objects) would include the `String.proto` object.

#### Example class

Below is an example of a Ferret class from the standard library.

```
package Math
class Point

init {
    need @x, @y;
}

method distanceTo {
    need $pt2;
    $dx = @x - $pt2.x;
    $dy = @y - $pt2.y;
    return sqrt($dx ^ 2 + $dy ^ 2);
}

method distanceFromOrigin {
    return @distanceTo(*class(0, 0));
}

method pretty {
    return "(@x, @y)";
}

method toString {
    return @pretty();
}

main method midpoint {
    need $pt1, $pt2;
    return *class(
        x: ($pt1.x + $pt2.x) / 2,
        y: ($pt1.y + $pt2.y) / 2
    );
}

main method distanceBetween {
    need $pt1, $pt2;
    return $pt1.distanceTo($pt2);
}
```

Initializing an object as a certain type is as simple as adding an object to
its `*isa` list. However, this is not typically done directly. Consider this
example.

```
# Create an empty object. This is like {} in JavaScript.
$obj = (:);

# Make the object an instance of Point.
Math::Point.init($obj)(0, 0);

# The object is now a Point representing the origin.
# Therefore, $obj.*isa includes Math::Point.proto.
inspect($obj);
```

Output

```
[ Point ](
    x = 0
    y = 0
)
```

This is equivalent to below, as calling a class create an empty object and
initializes it in one step.

```
$obj = Math::Point(0, 0);
```

#### Example of basic inheritance

Because Ferret objects can inherit from any objects, a class is not required
for inheritance. Below is an example of basic inheritance without a class.

```

# create a standard object representing a male being.
$male = (gender: "male");

# create standard object representing a specific person.
$person = (name: "Jake", age: 22);

# add $male to $person's *isa list
$person.*isa.push($male);

inspect($person);
```

Output

```
[ Object ](
    age = 22
    name = "Jake"
    (gender) = "male"
)
```

### Runtime

Ferret features a transparent runtime based on a Perl I/O framework. If any
asynchronous operations are occurring at any given moment, a Ferret program
will continue processing until all operations are complete. It is not necessary
to create custom run loops, and Ferret will effortlessly make use of
system-specific polling methods.

```
on Timer(5).once().expire {
    say("it's been five seconds!");
}

say("starting timer...");
```

### Stages

The Ferret compiler is also written entirely in Perl. Compilation is a
multi-stage process.

#### 1. Tokenizer

The source code is tokenized into a flat list of labels and values. This step
involves very minimal error checking. In fact, the only error that can occur
during this process is a failure to tokenize a certain byte or string.

```
# === Tokens ===
#         PKG_DEC | {"name":"Math"}
#       CLASS_DEC | {"name":"Line"}
#          METHOD | {"name":"_init_","main":1}
#       CLOSURE_S |
#    KEYWORD_NEED |
#        VAR_THIS | "pt1"
#        OP_COMMA |
#        VAR_THIS | "pt2"
#         OP_SEMI |
#       CLOSURE_E |
#          METHOD | {"name":"midpoint","main":null}
#       CLOSURE_S |
#  KEYWORD_RETURN |
#         PAREN_S |
#        VAR_THIS | "pt1"
#        OP_COMMA |
#        VAR_THIS | "pt2"
#         PAREN_E |
#        PROPERTY | "midpoint"
#      PAREN_CALL |
#         PAREN_E |
#         OP_SEMI |
#       CLOSURE_E |
#          METHOD | {"name":"length","main":null}
#       CLOSURE_S |
#  KEYWORD_RETURN |
#        VAR_THIS | "pt1"
#        PROPERTY | "distanceTo"
#      PAREN_CALL |
#        VAR_THIS | "pt2"
#         PAREN_E |
#         OP_SEMI |
#       CLOSURE_E |
```

#### 2. Constructor

The most significant step is the construction of the document model. The
tokens are processed into a hierarchical tree of elements. Elements are
represented by Perl objects which may belong to several categories such as
List, Node, Expression, etc. Throughout this process, the constructor is
checking that grammatical rules are met and aborts compilation if it
encounters nonsense.

```
# === Document Model ===
#  Document './test/hello20/IRC/Bot.frt'
#      Package 'IRC'
#      Class 'Bot'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Instance variable '@addr'
#                      Bareword 'Str'
#              Instruction
#                  Need
#                      Instance variable '@nick'
#                      Bareword 'Str'
#              Instruction
#                  Want
#                      Instance variable '@port'
#                      Expression ('want' parameter)
#                          Number '6667'
#                      Bareword 'Num'
#              Instruction
#                  Assignment (instance variable '@handlers')
#                      Hash [3 items]
#                          Item 0
#                              Pair 'MODE'
#                                  Instance variable '@joinChannels'
#                          Item 1
#                              Pair 'PING'
#                                  Instance variable '@pong'
#                          Item 2
#                              Pair 'PRIVMSG'
#                                  Instance variable '@handleMessage'
#              Instruction
#                  Assignment (instance variable '@sock')
#                      Call
#                          Bareword 'Socket::TCP'
#                          Hash [2 items]
#                              Item 0
#                                  Pair 'address'
#                                      Instance variable '@addr'
#                              Item 1
#                                  Pair 'port'
#                                      Instance variable '@port'
#              On
#                  Expression ('on' parameter)
#                      Property 'connected'
#                          Instance variable '@sock'
#                  Anonymous function
#                      Instruction
#                          Call
#                              Instance variable '@send'
#                              Single value [1 items]
#                                  Item 0
#                                      Operation
#                                          String 'USER '
#                                          Addition operator (+)
#                                          Instance variable '@user'
#                                          Addition operator (+)
#                                          String ' * * :'
#                                          Addition operator (+)
#                                          Instance variable '@real'
#                      Instruction
#                          Call
#                              Instance variable '@send'
#                              Single value [1 items]
#                                  Item 0
#                                      Operation
#                                          String 'NICK '
#                                          Addition operator (+)
#                                          Instance variable '@nick'
#          Method 'connect'
#              Instruction
#                  Call
#                      Property 'connect'
#                          Instance variable '@sock'
#                      Structural list [0 items]
```

#### 3. Verifier

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

#### 4. Compiler

At this point in the process, the document tree is fully constructed, and all
error checking is complete. The object model is converted to Perl source code.

```perl
# Method event 'center' definition
{
    my $func = Ferret::Function->new($f,
        name      => 'default',
        is_method => 1
    );

    $func->{code} = sub {
        my ($self, $arguments, $call_scope, $scope, $return) = @_;
        $scope->set_property_ow($context, x => add($scope, $self->property_u('origin')->property_u('x'), mul($scope, $self->property_u('width'), num($f, 0.5))));
        $scope->set_property_ow($context, y => add($scope, $self->property_u('origin')->property_u('y'), mul($scope, $self->property_u('height'), num($f, 0.5))));
        return $scope->property_u('Point')->call_u([ $scope->property_u('x'), $scope->property_u('y') ], $scope);
        return $return;
    };
    $methods[7] = Ferret::Event->new($f,
        name         => 'center',
        default_func => [ undef, $func ]
    );
}
```

#### 5. Beautifier

Finally, the code is beautified using perltidy. Well, I wouldn't call it
beautiful, but it does help when the lines begin to exceed 1,000 characters.

```perl
# Method event 'center' definition
{
    my $func = Ferret::Function->new(
        $f,
        name      => 'default',
        is_method => 1
    );

    $func->{code} = sub {
        my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
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
        return $return;
    };
    $methods[7] = Ferret::Event->new(
        $f,
        name         => 'center',
        default_func => [ undef, $func ]
    );
}
```
