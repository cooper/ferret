package Math
class Quantity
#< A number associated with a unit

$docOption_instanceName = "q"

init {
    need @num:  Num
    need @unit: Unit
}

method toBase {
    if @unit.isBase
        return *self
    return Quantity(@unit.multiplier * @num, @unit.base)
}

method to {
    need $unit: Unit
    $baseQ = @toBase!
    if $baseQ.unit == $unit
        return $baseQ
    if $baseQ.unit != $unit.base
        throw Error(:notpossible, "sorry")
    return Quantity($baseQ.num / $unit.multiplier, $unit)
}

method description {
    return @num.*description + " " + @unit.suffix
}
