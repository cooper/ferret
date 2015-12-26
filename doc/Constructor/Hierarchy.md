# Hierarchy of element types

* __Element__
    * __Node__ - capable of containing other elements.
        * __Statement__
            * __Closure__ - captures a block within curly brackets.
                * If
                * Inside
                * On
                * Function
                * Method
                * For
            * __Instruction__
            * Class
            * Package
            * WantNeed
            * Assignment
            * Return
            * ReturnPair
            * PropertyModifier
        * Document
        * List
        * ListItem
        * Pair
        * Call
        * Property
        * Operation
        * Maybe
        * Index
    * __Expression__ - possesses a value.
        * String
        * Number
        * LexicalVariable
        * InstanceVariable
        * SpecialVariable
        * List
        * ListItem
        * Pair
        * Call
        * Property
        * Bareword
        * Operation
        * Maybe
        * Boolean
        * Index
    * __Assignable__ - allowed at left of assignment operator.
        * Bareword
        * LexicalVariable
        * InstanceVariable
        * Property
        * Index
    * Operator
    * Spaces
    * Unknown
