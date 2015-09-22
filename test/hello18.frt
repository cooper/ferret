$list = [ "hi" ];
$list.push("there");
$list[4] = "yeah";

say("Length: " + $list.length!);

for $item in $list {
    say("item: $item");
}

$hash = [ hi: "there" ];
$hash["whats"] = "up";
$hash["thank"] = "you";

say("whats " + $hash["whats"]);

for ($key, $val) in $hash {
    say("pair: key=$key; value=$val");
}
