augroup garrettburroughs
    autocmd!
    " autocmd BufWritePre * if &filetype !~# '^\(markdown\|mdx\|text\)$' | :NeoFormat | endif
    " autocmd BufWritePre * :Neoformat
    autocmd BufWritePost *.tex :!pdflatex <afile>
augroup END

augroup FileTypeSpecificSpellCheck
    autocmd!
    autocmd FileType markdown,mdx,text setlocal spell
augroup END
