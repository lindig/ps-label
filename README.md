
# PostScript Labels

This is a single PostScript file to create and print labels for exhibitions
or anything that can use labels that consits of two parts, like using two
languages. Each label constists of one or two centered lines above and
below a dividing line.

![label](./images/label.png)

Labels are arranged on in a 2-by-5 matrix per sheet with optionional cut
marks.

![label](./images/labels.png)

The typical workflow to print such labels is:

1. Edit PostScript file [labels.ps] -- see below.
2. Convert PostScript file  to PDF (using ghostscript(1), pstopdf(1) or
   Acrobat Distiller)
3. Print PDF at 100% and cut out labels

# Using labels.ps

All you need is the file [labels.ps] from this distribution. All other
files are useful for developers but not required for creating labels.

The file [labels.ps] is in ISO-Latin-1 encoding because PostScript nativelu
cannot deal with UTF-8. This is important if you want to use non-ASCII
characters.

To define your own labels, edit [labels.ps]. Labels are defined at the end
of the file:

	%% Put labels here
	(No. 3/No. 13)(Mark Rothko) card

	%% You can have two lines at the top and bottom each.
	%% In that case lines need to be put into an array [...] 
	[(No. 61) (Rust and Blue)] [(Mark Rothko) (1953)] card
	[(For Darks in Red)] [(Mark Rothko) (1958)] card

	%% You can repeat cards. Note how to escape () in strings.
	3 { 
		[(Untitled) (\(Black on Grey\))] [(Mark Rothko) (1970)] card 
	} repeat

	% this marks the end and ensures that the final page is emitted
	finalize

A label is created by each call to `card` which takes two arguments: the
strings that go at the top and the bottom of the card. If you want two
lines, these strings need to go into an array. Strings in PostScript are
delimited by parentheses. Inside a string you need to escape them with a
backslash.  Likewise, the percent sign `%` needs to be escaped as `\%`.

# Fonts

Labels use the open-source font FiraSans that is part of the repository.
These are included already in [labels.ps]. Fonts are governed by their own
copyright.

# License

[MIT License](./LICENSE.md)

[labels.ps]:	./labels.ps "PostScript file labels.ps"