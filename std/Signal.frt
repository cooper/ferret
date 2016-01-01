class Signal

# TODO: non-standard signals

load NATIVE::Signal

share $INT  ?= *class(:INT)
share $HUP  ?= *class(:HUP)
share $TERM ?= *class(:TERM)
share $ALRM ?= *class(:ALRM)

$signals ?= [
    INT:    $INT,
    HUP:    $HUP,
    TERM:   $TERM,
    ALRM:   $ALRM
]

init {
    need @type: Sym
}

method catch {
    # here, do the default thing
    _exit(0)
}

# this is not to be used directly.
# it is called from NATIVE::Signal.
func fireSignal {
    need $type: Sym
    $signals[$type]?.catch()
}
