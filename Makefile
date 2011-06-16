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
	pdflatex -interaction=$(latexmode) $(talkname).tex
	pdflatex -interaction=$(latexmode) $(talkname).tex

clean:
	-@rm $(talkname).{snm,toc,nav,aux,log,out}
	-@rm $(papername).{aux,log,out,blg}
	-@rm *.bak
