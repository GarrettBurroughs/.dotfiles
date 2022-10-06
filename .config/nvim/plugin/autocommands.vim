augroup garrettburroughs
	autocmd!
	autocmd BufWritePre * :Neoformat
	autocmd BufWritePost *.tex :!pdflatex <afile>
augroup END
