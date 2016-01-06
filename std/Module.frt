class Module 1.0

init {

    # the shorthand name of the module, excluding its prefix
    need @name: Str

    # the module's prefix, excluding trailing "::"
    want @prefix: Str = "CORE"

    # the module version
    want @version: Num = 1.0

    # the full name includes the prefix
    @fullName = @prefix + "::" + @name

}
