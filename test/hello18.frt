$list = [ "hi" ];
$list.push("there");
$list.setValue(5, "yeah");

say("Length: " + $list.length!);

for $item in $list {
    say("item: $item");
}

$hash = [ hi: "there" ];
$hash.setValue("whats", "up");
$hash["thank"] = "you";

say("whats " + $hash["whats"]);

for ($key, $val) in $hash {
    say("pair: key=$key; value=$val");
}
