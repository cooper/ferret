package Config
class JSON2

init {
    need @filePath: Str
}

method parse {
    $jsonData = File(@filePath).slurp!
    return JSON.decode($jsonData).data
}
