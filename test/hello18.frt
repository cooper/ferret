$list = [ "hi" ];
$list.push("there");
say("Length: " + $list.length!);

for $item in $list {
    say("item: $item");
}

$hash = [ hi: "there" ];
$hash.setPair("whats", "up");

for ($key, $val) in $hash {
    say("pair: key=$key; value=$val");
}
