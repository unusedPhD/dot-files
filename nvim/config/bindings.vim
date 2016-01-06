
" ==============================================================================
" mapping settings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" setting leader "{{{
" ------------------------------------------------------------------------------
let g:mapleader="\<space>"

"}}}
" -----------------------------------------------------
" 3.2 Disabling arrow keys, space key, exmode enter "{{{
" with Q key, help with F1, etc.
" -----------------------------------------------------

"nnoremap <up> <NOP>
"nnoremap <down> <NOP>
"nnoremap <left> <NOP>
"nnoremap <right> <NOP>
"nnoremap <bs> <NOP>
"nnoremap <delete> <NOP>
"inoremap <up> <NOP>
"inoremap <down> <NOP>
"inoremap <left> <NOP>
"inoremap <right> <NOP>
"nnoremap <Space> <NOP>
"inoremap <F1> <NOP>
"nnoremap <F1> <NOP>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"}}}
" ------------------------------------------------------------------------------
" split "{{{
" ------------------------------------------------------------------------------

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"}}}
" ------------------------------------------------------------------------------
" common tasks "{{{
" ------------------------------------------------------------------------------

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Use tab for indenting in visual mode
vnoremap <Tab> >gv|
vnoremap <S-Tab> <gv
nnoremap > >>_
nnoremap < <<_

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" better home/end
nnoremap B ^
nnoremap E $

" Copy to clipboard
vnoremap <C-c> "*y"

"}}}
" ------------------------------------------------------------------------------
" F-key actions "{{{
" ------------------------------------------------------------------------------

" Toggle white characters visibility
nnoremap <silent> <F2> :set list!<CR> :set list?<CR>
" Paste mode toggling
set pastetoggle=<F3>
" nnoremap <silent> <F3> :set paste!<CR> :set paste?<CR>
" Toggle search highlight
nnoremap <silent> <F4> :set nohlsearch!<CR> :set nohlsearch?<CR>
" Source (reload configuration)
nnoremap <silent> <F5> :source $HOME/.config/nvim/init.vim<CR>
" terminal: exit insert mode
"tnoremap <F12> <c-\><C-n>

"}}}
" ------------------------------------------------------------------------------
" Command abbreviations and mappings "{{{
" ------------------------------------------------------------------------------

" save having to hit shift
nnoremap ; :

" typo alias
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall
"
"}}}
" ------------------------------------------------------------------------------
" terminal "{{{
" ------------------------------------------------------------------------------

set shell=/bin/zsh
" exit insert mode
tnoremap <F12> <c-\><C-n>

"}}}
" ------------------------------------------------------------------------------

"}}}

" vim: foldmethod=marker
