package NATIVE

share $ferret      ?= PerlObject.wrapPackageVariable("Ferret", "\$ferret")
share $coreContext ?= $ferret.core_context()
share $mainContext ?= $ferret.main_context()

func bless {
    need $obj, $class: Str
    _bless($obj, $class)
}
