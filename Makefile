# .tex files
DOCNAME = deconinck-1page

# Set to "yes" if you have a bibliography.
HASHBIB = no

TEX = pdflatex
BIB = bibtex
SPELL = aspell
RM = rm -f
WC = wc -w

ASPELL_FLAGS = -t check -l en

TEXFILES = deconinck-1page.tex 

ifeq ($(HASHBIB), yes)
all: spellcheck makebib makepdf wc
else
all: spellcheck makepdf wc
endif

spellcheck:
	$(foreach var,$(TEXFILES), $(SPELL) $(ASPELL_FLAGS) $(var);)

wc:
	$(foreach var,$(TEXFILES), $(WC) $(var);)

makebib:
	$(TEX) $(DOCNAME)
	$(BIB) $(DOCNAME)

makepdf:
	$(TEX) $(DOCNAME)
	$(TEX) $(DOCNAME)

clean:
	$(RM) $(TEXFILES:.tex=.aux)
	$(RM) $(TEXFILES:.tex=.log)
	$(RM) $(TEXFILES:.tex=.out)
	$(RM) $(TEXFILES:.tex=.lof)
	$(RM) $(TEXFILES:.tex=.pdf)
	$(RM) $(TEXFILES:.tex=.dvi)
	$(RM) $(TEXFILES:.tex=.idx)
	$(RM) $(TEXFILES:.tex=.toc)
ifeq ($(HASHBIB), yes)
	$(RM) *.bbl
	$(RM) *.blg
endif
