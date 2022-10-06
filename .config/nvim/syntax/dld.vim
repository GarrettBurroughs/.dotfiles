" Vim Syntax File
" Language: DLD Assembly Language 
" Maintainer: Garrett Burroughs
" Last Revision: Friday April 29, 2022

if exists("b:current_syntax")
	finish
endif


syn match dldNumber '\d\+'
syn match dldNumber '0x\x[[:xdigit:]]'
syn match dldNumber '0b[0-1]\+'

syn match comment ';.*'
syn match dldLabel '\.\S[^[:space:]]*'
syn match definition '#\S\+'


syn keyword singleRegisterKeywords Load Store Add Sub Inc Dec Bra Beq 
syn keyword literalKeyword Data

let b:current_syntax = "dld"

hi def link comment                 Comment
hi def link dldNumber               Constant
hi def link dldLabel                Identifier
hi def link definition              Special
hi def link singleRegisterKeywords  Statement 
hi def link literalKeyword          Statement 


