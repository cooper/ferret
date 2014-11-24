func helloWorld {
    need $name;
    need $name2;
    say("Hello");
    say($name);
    say($name2);
}

helloWorld(name2: "Jack", name: "Joe");
