class Error 1.0

init {
    need @type: Sym
    need @msg: Str

    want @hints: List
    want @subError: Error

    NATIVE.bless(*self, "Ferret::Error")
}

method description {
    $desc = "[@type.name] " + @msg
    if @hints && !@hints.empty:
        $desc += _prettyHints(@hints)
    if @subError:
        $desc += " ->" + @subError.*description
    return $desc
}

func _prettyHints {
    need $list: List
    $str = "\n"
    for ($i, $el) in $list {
        if $i.even:
            $str += "    " + $el + ": "
        else:
            $str += $el + "\n"
    }
    return $str
}
