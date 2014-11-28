helloWorld(name2: "USA", name1: "World");
helloWorld(name2: "Humans", name1: "Earth");

func helloWorld {
    need $name1, $name2;

    hello1!;
    hello2!;

    func hello1 {
        $hello = "Hello";
        $hello.name = $name1;
        say($hello + " " + $hello.name);
    }

    func hello2 {
        say("Hello " + $name2);
    }

}

$pi = 3 + 0.1 + 0.04;
say("Pi = " + $pi);
