" Vim Syntax File
" Language: Lab Assembly Language 
" Maintainer: Garrett Burroughs
" Last Revision: Saturday February 20, 2022

if exists("b:current_syntax")
	finish
endif


syn match lbaNumber '\d\+'
syn match lbaNumber '0x\x[[:xdigit:]]'
syn match lbaNumber '0b[0-1]\+'

syn match comment ';.*'
syn match lbaLabel '\.\S[^[:space:]]*'
syn match definition '#\S\+'


syn keyword doubleRegisterKeywords SET ADD AND RD WR JLZ 
syn keyword singleRegisterKeywords BNT NEG LNT SPC 
syn keyword registerLiteralKeywords LDR ADR ANR RMA 
syn keyword literalKeyword LIT 
syn keyword haltKeyword HALT

let b:current_syntax = "lba"

hi def link comment                 Comment
hi def link lbaNumber               Constant
hi def link lbaLabel                Identifier
hi def link definition              Special
hi def link doubleRegisterKeywords  Statement
hi def link singleRegisterKeywords  Statement 
hi def link registerLiteralKeywords Statement 
hi def link literalKeyword          Statement 
hi def link haltKeyword             Statement


