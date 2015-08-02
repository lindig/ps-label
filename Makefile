# vim: noet ts=8:

FONTS  =
FONTS += fonts/FiraSans-Italic.ps
FONTS += fonts/FiraSans-Medium.ps
# FONTS += fonts/FiraSans-Regular.ps
# FONTS += fonts/FiraSans-Bold.ps

PSTOPDF = ps2pdf
PSTOPDF = pstopdf

all: 		labels.pdf

clean:
		rm -f fonts.ps 

distclean: 	clean
		rm -f labels.ps labels.pdf
			

labels.ps: 	labels.src.ps fonts.ps
		sed '/^%%@Fonts/r fonts.ps' $< > $@

labels.pdf: 	labels.ps
		$(PSTOPDF) $<

fonts.ps: 	$(FONTS) Makefile
		cat $(FONTS) > fonts.ps


