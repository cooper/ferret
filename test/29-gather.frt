# simple gather

func nonZeroCoodinates {
    need $pt: Math::Point
    return gather {
        if $pt.x != 0
            take $pt.x
        if $pt.y != 0
            take $pt.y
    }
}

$pt1 = Math::Point(0, 0)
$pt2 = Math::Point(1, 1)
$pt3 = Math::Point(1, 0)

for $pt in [ $pt1, $pt2, $pt3 ] {
    # [ ]
    # [ 1, 1 ]
    # [ 1 ]
    inspect( nonZeroCoodinates($pt) )
}

# gather for

func evenNumbers {
    need $nums: Num...
    even -> gather for $n in $nums {
        if $n.even
            take $n
    }
}

inspect( evenNumbers([1, 2, 3, 4]) )        # [ 2, 4 ]
inspect( evenNumbers((0..9).toList!) )      # [ 0, 2, 4, 6, 8 ]
