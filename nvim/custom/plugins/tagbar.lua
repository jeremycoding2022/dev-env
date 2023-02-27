
vim.cmd(
[[
let g:tagbar_type_go = {
    \ 'kinds' : [
        \ 'p:package:0:0',
        \ 'i:imports:1:0',
        \ 'c:constants:0:0',
        \ 'v:variables:0:0',
        \ 't:types:0:0',
        \ 'n:intefaces:0:0',
        \ 'w:fields:0:0',
        \ 'e:embedded:0:0',
        \ 'm:methods:0:0',
        \ 'r:constructors:0:0',
        \ 'f:functions:0:0',
        \ '?:unknown',
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
]]
)
