# vim: noet ts=8:

FONTS  =
FONTS += fonts/FiraSans-Italic.ps
FONTS += fonts/FiraSans-Medium.ps
# FONTS += fonts/FiraSans-Regular.ps
# FONTS += fonts/FiraSans-Bold.ps

all: 		labels.pdf

clean:
			rm -f fonts.ps labels.ps labels.pdf

labels.ps: 	labels.src.ps fonts.ps
			sed '/^%%@Fonts/r fonts.ps' $< > $@

labels.pdf: labels.ps
			pstopdf $<

fonts.ps: 	$(FONTS) Makefile
			cat $(FONTS) > fonts.ps


