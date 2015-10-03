# this example demonstrates an object implementing multiple classes

class Cow

init {
    want @moos = true;
}

method moo {
    if @moos:
        return "moo";
    return "I am a nonverbal cow";
}

class Dog

init {
    want @barks = false;
}

method bark {
    if @barks:
        return "bark";
    return "I had my bark box bred out of me";
}

class Cat

init {
    want @mean = false;
}

method meow {
    return "meow";
}

# usage: (cat, othercat).fight()
main method fight {
    need $cat1: Cat, $cat2: Cat;
    if $cat1.mean:
        return "Cat 1 started a catfight!";
    if $cat2.mean:
        return "Cat 2 started a catfight!";
    return "nice cats don't fight";
}

end

# create a cow
$animal = Cow();

# make the cow also a dog
Dog.init($animal)();

# should indicate a moo and a refusal to bark
say($animal.moo());
say($animal.bark());

# make the animal a cat as well, but a mean one
Cat.init($animal)(mean: true);

inspect($animal);

# now create a second cat that's nice
$cat = Cat();

# cat fight
# the set (a, b).property syntax will automatically determine the nearest
# class relationship between the two objects and call a method of that class
#
$aftermath = ($animal, $cat).fight();
say($aftermath);
