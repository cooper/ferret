# create an empty object
$obj = (:)

# become a timer
Timer.init($obj)(5)

on $obj.once().expire {
    say("it works!")
}
