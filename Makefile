papername=minimax_matrix_laplace_transform
latexswitches=batchmode
talkname=covaresttalk

all: paper talk

paper: $(papername).tex $(papername).bib
	pdflatex -interaction=$(latexmode) $(papername).tex
	bibtex $(papername).aux
	pdflatex -interaction=$(latexmode) $(papername).tex
	pdflatex -interaction=$(latexmode) $(papername).tex

talk: $(talkname).tex
	latex -interaction=$(latexmode) $(talkname).tex
	latex -interaction=$(latexmode) $(talkname).tex
	dvips -o$(talkname).ps $(talkname).dvi 
# prepress prevents downsampling of EPS images when converted to PDF (prevents fuzziness, esp when viewed by projector)
# ditto the other settings for bitmap images
# papersize needs to be A4 for prosper slides to look correct
	ps2pdf -sPAPERSIZE=a4 -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode -dPDFsettings=/prepress $(talkname).ps $(talkname).pdf

clean:
	@-rm $(talkname).{dvi,ps,aux,log,out}
	@-rm $(papername).{aux,log,out,blg}
	@-rm *.bak
