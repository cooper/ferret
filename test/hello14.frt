say("test");

$str = "hi";

on $str.length {
    say("found '*self' length to be *return");
}

$str.length();

"hello".length();

on String.proto.length {
    say("found '*self' length to be *return")
}

"hello".length();
