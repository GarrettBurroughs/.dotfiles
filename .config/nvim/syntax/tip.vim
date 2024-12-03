" Define TIP file type and enable syntax highlighting
if exists("b:current_syntax")
    finish
endif

syntax clear


" Define TIP keywords
syntax keyword tipKeyword poly var return null input output error while if else alloc
syntax keyword tipConditional if else
syntax keyword tipLoop while for

" Define TIP operators
syntax match tipOperator /\[=+\|-=\|\*\|\/\|>\|==\|!=\]/

" Define TIP numbers
syntax match tipNumber /\v\d+/

" Define TIP identifiers
syntax match tipIdentifier /\v[a-zA-Z_][a-zA-Z0-9_]*/

" Define TIP comments
syntax match tipComment /\/\/.*$/
syntax match tipBlockComment /\/\*.*\*\//

" Highlight TIP keywords and control structures
highlight link tipKeyword Keyword
highlight link tipConditional Conditional
highlight link tipLoop Repeat

" Highlight TIP operators
highlight link tipOperator Operator

" Highlight TIP numbers
highlight link tipNumber Number

" Highlight TIP identifiers
highlight link tipIdentifier Identifier

" Highlight TIP comments
highlight link tipComment Comment
highlight link tipBlockComment Comment

let b:current_syntax = "tip"

