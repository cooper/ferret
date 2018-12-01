class File 1.0

type Encoding {
    :binary
    :utf8
}

init {
    need @path: Str
    want @encoding: Encoding = :utf8
}

method slurp -> NATIVE.slurp(@path, @encoding)
