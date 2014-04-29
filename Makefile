
#
# Makefile to build the book from the raw SGML files

CHAPTERS = advxs.sgml altxs.sgml api.sgml book.sgml cadv.sgml \
cintro.sgml embed.sgml emstudy.sgml hacking.sgml \
internals.sgml moreapi.sgml perlvar.sgml xsintro.sgml

BOOK = book.sgml

# Output formats

PDFCHAPTERS = $(CHAPTERS:.sgml=.pdf)
PSCHAPTERS  = $(CHAPTERS:.sgml=.ps)
DVICHAPTERS = $(CHAPTERS:.sgml=.dvi)
TEXCHAPTERS = $(CHAPTERS:.sgml=.tex)

PDFBOOK     = $(BOOK:.sgml=.pdf)
PSBOOK      = $(BOOK:.sgml=.ps)
DVIBOOK     = $(BOOK:.sgml=.dvi)
DVIBOOK     = $(BOOK:.sgml=.tex)

# Location for upload
FTPPUT  = ncftpput
FTPHOST = books.manning.com
FTPUSER = -u area16
FTPPASS = -p hedr321j
FTPDIR  = /home/area16/public_html/beta

#FTPHOST = sftp.jach.hawaii.edu
#FTPUSER = -u timj
#FTPPASS = 
#FTPDIR  = /home/timj/perlbook/test

FTPCOMMAND = $(FTPPUT) $(FTPUSER) $(FTPPASS) $(FTPHOST) $(FTPDIR)


# How to translate SGML to HTML
.SUFFIXES:
.SUFFIXES: .sgml .ps .pdf .dvi .tex


# Use horrible kluge to prevent docbook2tex returning
# with bad exit status whenever there is an unmatched reference
# This prevents us from using db2ps et al
.sgml.tex:
	docbook2tex $< | cat

.tex.dvi:
	jadetex $<

.dvi.ps:
	dvips $< -o

.tex.pdf:
	pdfjadetex $<

book.tex: $(CHAPTERS)

book.dvi: $(TEXBOOK)

book.ps: $(DVIBOOK)

book.pdf: $(PSBOOK)

allpdf: $(PDFBOOK) $(PDFCHAPTERS)

alldvi: $(DVIBOOK) $(DVICHAPTERS)

allps: $(PSBOOK) $(PSCHAPTERS)

# HTML index file
indexfile: $(CHAPTERS) $(BOOK)
	perl genindex.pl > index.html


install: allpdf indexfile
	$(FTPCOMMAND) index.html
	$(FTPCOMMAND) $(CHAPTERS) $(BOOK)
	$(FTPCOMMAND) $(PDFCHAPTERS) $(PDFBOOK)

book.xml: $(CHAPTERS)
	sgmlnorm -d book.sgml | sgml2xml -xndata -xlower -xid - >| book.xml; echo

book.fo: book.xml
	xsltproc /usr/share/sgml/docbook/stylesheet/xsl/nwalsh/fo/docbook.xsl book.xml > book.fo

simonpdf: book.fo
	 pdflatex "&pdfxmltex" book.fo ; pdflatex "&pdfxmltex" book.fo

simondvi: book.fo
	 latex "&xmltex" book.fo ; latex "&xmltex" book.fo
	
