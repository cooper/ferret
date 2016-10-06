class Error 1.0

init {
    need @type: Sym
    need @msg: Str

    want @hints: List
    want @subError: Error

    NATIVE.bless(*self, "Ferret::Error")
}

method description {
    if @subError:
        return @msg + ": " + @subError.description!
    if @hints && !@hints.empty:
        return @msg + _prettyHints(@hints)
    return @msg
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
