class NATIVE

load NATIVE::PerlObject # FIXME: for classes we should load just like pkgs

share $ferret      ?= PerlObject.wrapPackageVariable("Ferret", "\$ferret")
share $coreContext ?= $ferret.core_context()
share $mainContext ?= $ferret.main_context()
