class NATIVE

share $ferret      ?= NATIVE::PerlObject.wrapPackageVariable("Ferret", "\$ferret")
share $coreContext ?= $ferret.core_context()
share $mainContext ?= $ferret.main_context()
