package Math

func sqrt {
    need $num: Num
    return NATIVE::Math.sqrt($num)
}

func root {
    need $root: Num, $num: Num
    return $num ^ (1 / $root)
}
