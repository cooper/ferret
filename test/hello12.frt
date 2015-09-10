$sock = Socket::TCP(address: "k.notroll.net", port: 6667);

on $sock.gotLine {
    need $data;
    say("got data: $data");
}

$sock.connect();

on Timer(5).once!.expire {
    $sock.println("NICK k");
    $sock.println("USER k * * :k");
}