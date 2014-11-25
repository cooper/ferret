helloWorld(name2: "USA", name1: "World");
helloWorld(name2: "Humans", name1: "Earth");
helloWorld(name1: *scope, name2: helloWorld);

func helloWorld {
    need $name1, $name2;

    func hello1 {
        say("Hello");
        say($name1);
    }

    func hello2 {
        say("Hello");
        say($name2);
    }

    hello1();
    hello2();

}
