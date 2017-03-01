package Math

share $pi ?= NATIVE::Math.pi!

func sin {
    need $num: Num
    return NATIVE::Math.sin($num)
}

func cos {
    need $num: Num
    return NATIVE::Math.cos($num)
}

func tan {
    need $num: Num
    return sin($num) / cos($num)
}

func atan2 {
    need $y: Num, $x: Num
    return NATIVE::Math.atan2($y, $x)
}
