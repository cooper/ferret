package Config
class JSON2

init {
    need @filePath: Str
}

method parse {
    $jsonData = File(@filePath).slurp!
    -> JSON.decode($jsonData).data
}
