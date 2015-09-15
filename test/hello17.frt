# create an empty object using the global object initializer
$obj = Object();

# become a timer
Timer.init($obj)(5);

on $obj.once().expire {
    say("it works!");
}
