# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer;

use warnings;
use strict;
use 5.010;

# Lexer.pm loads both the constructor and the tokenizer,
# but they can be loaded individually if desired.
use F;
use Ferret::Lexer::Tokenizer;
use Ferret::Lexer::Constructor;

1
