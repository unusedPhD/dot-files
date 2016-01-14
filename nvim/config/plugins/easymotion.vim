" These keys are easier to type than the default set
" We exclude semicolon because it's hard to read and
" i and l are too easy to mistake for each other slowing
" down recognition. The home keys and the immediate keys
" accessible by middle fingers are available
let g:EasyMotion_keys='asdfjkoweriop'

nmap s <Plug>(easymotion-s)

" Default Mapping      | Details
" ---------------------|----------------------------------------------
" <leader>             | <space><space>
" <Leader>f{char}      | Find {char} to the right. See |f|.
" <Leader>F{char}      | Find {char} to the left. See |F|.
" <Leader>t{char}      | Till before the {char} to the right. See |t|.
" <Leader>T{char}      | Till after the {char} to the left. See |T|.
" <Leader>w            | Beginning of word forward. See |w|.
" <Leader>W            | Beginning of WORD forward. See |W|.
" <Leader>b            | Beginning of word backward. See |b|.
" <Leader>B            | Beginning of WORD backward. See |B|.
" <Leader>e            | End of word forward. See |e|.
" <Leader>E            | End of WORD forward. See |E|.
" <Leader>ge           | End of word backward. See |ge|.
" <Leader>gE           | End of WORD backward. See |gE|.
" <Leader>j            | Line downward. See |j|.
" <Leader>k            | Line upward. See |k|.
" <Leader>n            | Jump to latest "/" or "?" forward. See |n|.
" <Leader>N            | Jump to latest "/" or "?" backward. See |N|.
" <Leader>s            | Find(Search) {char} forward and backward.
"                      | See |f| and |F|.

