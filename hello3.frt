helloWorld(name2: "Jack", name1: "Joe");
helloWorld(name1: helloWorld, name2: "that is the function");

func helloWorld {
    need $name1, $name2;
    say("Hello");
    say($name1);
    say($name2);
}
