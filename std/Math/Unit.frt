package Math
class Unit

#> default initializer creates a unit given a base unit and a multipler
init {
    need @base: Unit
    need @multiplier: Num
}

#> creates a base unit with multiplier 1
init {
    need @isBase: Bool = true
    @multiplier = 1
}
