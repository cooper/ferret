# Based on HOP::Lexer
# http://search.cpan.org/~ovid/HOP-Lexer-0.032/lib/HOP/Lexer.pm
#
# Derived from Higher-Order Perl by Mark Dominus,
# published by Morgan Kaufmann Publishers,
# Copyright 2005 by Elsevier Inc
#
package Ferret::Lexer::Lexer;

use warnings;
use strict;

use parent 'Exporter';
our @EXPORT_OK = qw(make_lexer string_lexer);

sub string_lexer {
    my $text = shift;
    my @text = $text;
    return make_lexer( sub { shift @text }, @_ );
}

sub make_lexer {
    my $lexer = shift;
    while (@_) {
        my $args = shift;
        $lexer = _tokens( $lexer, @$args );
    }
    return $lexer;
}

sub _tokens {
    my ( $input, $label, $pattern, $maketoken ) = @_;
    $maketoken ||= sub { [ $_[0] => $_[1] ] };
    my @tokens;
    my $buf = "";    # set to undef when input is exhausted
    my $split = sub { split /($pattern)/ => $_[0] };

    return sub {
        while ( 0 == @tokens && defined $buf ) {
            my $i = $input->();
            if ( ref $i ) {    # input is a token
                my ( $sep, $tok ) = $split->($buf);
                $tok = $maketoken->( $label, $tok ) if defined $tok;
                push @tokens => grep defined && $_ ne "" => $sep, $tok, $i;
                $buf = "";
                last;
            }
            $buf .= $i if defined $i;    # append new input to buffer
            my @newtoks = $split->($buf);
            while ( @newtoks > 2 || @newtoks && !defined $i ) {

                # buffer contains complete separator plus combined token
                # OR we've reached the end of input
                push @tokens => shift @newtoks;
                push @tokens => $maketoken->( $label, shift @newtoks )
                  if @newtoks;
            }

            # reassemble remaining contents of buffer
            $buf = join "" => @newtoks;
            undef $buf unless defined $i;
            @tokens = grep $_ ne "" => @tokens;
        }
        $_[0] = '' unless defined $_[0];
        return 'peek' eq $_[0] ? $tokens[0] : shift @tokens;
    };
}

=head1 DEBUGGING

The following caveats (or pitfalls, if you prefer), should be kept in mind
while lexing data.

=over 4

=item * Unlexed data

The tokens returned by the lexer are array references.  If any data cannot be
lexed, it will be returned as a string, unchanged.

=item * Capturing parens

Internally, L<Hop::Lexer> uses capturing parentheses to extract the data from
the provided regular expressions.  If you need to group data in regular
expressions, use the non-capturing parentheses C<(?:...)>.  Otherwise, your
code will break.

=item * Precedence

It's important to note that the order of the described tokens is important.
If you have keywords such as "while", "if", "unless", and so on, and any text
which matches C<qr/[[:word:]]+/> is considered a variable, the following fails:

  my @input_tokens = (
      [ 'VAR',     qr/[[:word:]]+/         ],
      [ 'KEYWORD', qr/(?:while|if|unless)/ ],
  );

This is because the potential keywords will be matched as C<VAR>.  To deal
with this, place the higher precedence tokens first:

  my @input_tokens = (
      [ 'KEYWORD', qr/(?:while|if|unless)/ ],
      [ 'VAR',     qr/[[:word:]]+/         ],
  );

=back

=head1 AUTHOR

Mark Jason Dominus.  Maintained by Curtis "Ovid" Poe, C<< <ovid@cpan.org> >>

=head1 FURTHER READING

See L<http://www.perl.com/pub/a/2006/01/05/parsing.html> for a detailed
article about using this module, along with a comprehensive example.

This has now been included in the distribution as L<HOP::Lexer::Article>.

=head1 ACKNOWLEDGEMENTS

Many thanks to Mark Dominus and Elsevier, Inc. for allowing this work to be
republished.

=head1 COPYRIGHT & LICENSE

Code derived from the book "Higher-Order Perl" by Mark Dominus, published by
Morgan Kaufmann Publishers, Copyright 2005 by Elsevier Inc.

=head1 ABOUT THE SOFTWARE

All Software (code listings) presented in the book can be found on the
companion website for the book (http://perl.plover.com/hop/) and is
subject to the License agreements below.

=head1 ELSEVIER SOFTWARE LICENSE AGREEMENT

Please read the following agreement carefully before using this Software. This
Software is licensed under the terms contained in this Software license
agreement ("agreement"). By using this Software product, you, an individual,
or entity including employees, agents and representatives ("you" or "your"),
acknowledge that you have read this agreement, that you understand it, and
that you agree to be bound by the terms and conditions of this agreement.
Elsevier inc. ("Elsevier") expressly does not agree to license this Software
product to you unless you assent to this agreement. If you do not agree with
any of the following terms, do not use the Software.

=head1 LIMITED WARRANTY AND LIMITATION OF LIABILITY

YOUR USE OF THIS SOFTWARE IS AT YOUR OWN RISK. NEITHER ELSEVIER NOR ITS
LICENSORS REPRESENT OR WARRANT THAT THE SOFTWARE PRODUCT WILL MEET YOUR
REQUIREMENTS OR THAT ITS OPERATION WILL BE UNINTERRUPTED OR ERROR-FREE. WE
EXCLUDE AND EXPRESSLY DISCLAIM ALL EXPRESS AND IMPLIED WARRANTIES NOT STATED
HEREIN, INCLUDING THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE. IN ADDITION, NEITHER ELSEVIER NOR ITS LICENSORS MAKE ANY
REPRESENTATIONS OR WARRANTIES, EITHER EXPRESS OR IMPLIED, REGARDING THE
PERFORMANCE OF YOUR NETWORK OR COMPUTER SYSTEM WHEN USED IN CONJUNCTION WITH
THE SOFTWARE PRODUCT. WE SHALL NOT BE LIABLE FOR ANY DAMAGE OR LOSS OF ANY
KIND ARISING OUT OF OR RESULTING FROM YOUR POSSESSION OR USE OF THE SOFTWARE
PRODUCT CAUSED BY ERRORS OR OMISSIONS, DATA LOSS OR CORRUPTION, ERRORS OR
OMISSIONS IN THE PROPRIETARY MATERIAL, REGARDLESS OF WHETHER SUCH LIABILITY IS
BASED IN TORT, CONTRACT OR OTHERWISE AND INCLUDING, BUT NOT LIMITED TO,
ACTUAL, SPECIAL, INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES. IF THE
FOREGOING LIMITATION IS HELD TO BE UNENFORCEABLE, OUR MAXIMUM LIABILITY TO YOU
SHALL NOT EXCEED THE AMOUNT OF THE PURCHASE PRICE PAID BY YOU FOR THE SOFTWARE
PRODUCT. THE REMEDIES AVAILABLE TO YOU AGAINST US AND THE LICENSORS OF
MATERIALS INCLUDED IN THE SOFTWARE PRODUCT ARE EXCLUSIVE.

YOU UNDERSTAND THAT ELSEVIER, ITS AFFILIATES, LICENSORS, SUPPLIERS AND AGENTS,
MAKE NO WARRANTIES, EXPRESSED OR IMPLIED, WITH RESPECT TO THE SOFTWARE
PRODUCT, INCLUDING, WITHOUT LIMITATION THE PROPRIETARY MATERIAL, AND
SPECIFICALLY DISCLAIM ANY WARRANTY OF MERCHANTABILITY OR FITNESS FOR A
PARTICULAR PURPOSE.

IN NO EVENT WILL ELSEVIER, ITS AFFILIATES, LICENSORS, SUPPLIERS OR AGENTS, BE
LIABLE TO YOU FOR ANY DAMAGES, INCLUDING, WITHOUT LIMITATION, ANY LOST
PROFITS, LOST SAVINGS OR OTHER INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING
OUT OF YOUR USE OR INABILITY TO USE THE SOFTWARE PRODUCT REGARDLESS OF WHETHER
SUCH DAMAGES ARE FORESEEABLE OR WHETHER SUCH DAMAGES ARE DEEMED TO RESULT FROM
THE FAILURE OR INADEQUACY OF ANY EXCLUSIVE OR OTHER REMEDY.

=head1 SOFTWARE LICENSE AGREEMENT

This Software License Agreement is a legal agreement between the Author and
any person or legal entity using or accepting any Software governed by this
Agreement. The Software is available on the companion website
(http://perl.plover.com/hop/) for the Book, Higher-Order Perl, which is
published by Morgan Kaufmann Publishers. "The Software" is comprised of all
code (fragments and pseudocode) presented in the book.

By installing, copying, or otherwise using the Software, you agree to be bound
by the terms of this Agreement.

The parties agree as follows:

=over 4

=item 1 Grant of License

We grant you a nonexclusive license to use the Software for any purpose,
commercial or non-commercial, as long as the following credit is included
identifying the original source of the Software: "from Higher-Order Perl by
Mark Dominus, published by Morgan Kaufmann Publishers, Copyright 2005 by
Elsevier Inc".

=item 2 Disclaimer of Warranty.

We make no warranties at all. The Software is transferred to you on an "as is"
basis. You use the Software at your own peril. You assume all risk of loss for
all claims or controversies, now existing or hereafter, arising out of use of
the Software. We shall have no liability based on a claim that your use or
combination of the Software with products or data not supplied by us infringes
any patent, copyright, or proprietary right. All other warranties, expressed
or implied, including, without limitation, any warranty of merchantability or
fitness for a particular purpose are hereby excluded.

=item 3 Limitation of Liability.

We will have no liability for special, incidental, or consequential damages
even if advised of the possibility of such damages. We will not be liable for
any other damages or loss in any way connected with the Software.

=back

=cut

1
