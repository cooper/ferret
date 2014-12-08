$rect = Math::Rect(x: 5, y: 4, width: 12, height: 10);

$center = $rect.center!;
say("Center of rect: " + $center.pretty!);

$otherPt  = Math::Point(9, 2);
$midpoint = Math::Point.midpoint($center, $otherPt).pretty!;
say("Midpoint: $midpoint");