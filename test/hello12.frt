$sock = Socket::TCP(address: "k.notroll.net", port: 6667);
dump($sock);

on $sock.gotLine {
    need $data;
    say("recv: $data");
}

on $sock.println {
    need $data;
    say("send: $data");
}

on $sock.connected {
    $sock.println("NICK k");
    $sock.println("USER k \* \* :k");
}

$sock.connect();

on Timer(5).once!.expire {
    $sock.println("JOIN #k");
}
