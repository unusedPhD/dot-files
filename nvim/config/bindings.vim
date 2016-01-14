"  map     -> recursive key mapping
"  noremap -> non-recursive key mapping
"
"   :map j gg
"   :map Q j
"   :noremap W j
"
"   j = gg
"   Q = gg
"   W = j

" ==============================================================================
" mapping settings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" leader "{{{
" ------------------------------------------------------------------------------

  let g:mapleader="\<space>"

" }}}
" -----------------------------------------------------
" disable/remap arrow keys "{{{
" -----------------------------------------------------

" Get off my lawn
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" navigate  windows
" nnoremap <Up>   <C-W>k
" nnoremap <Down> <C-W>j
" nnoremap <Left> <C-W>h
" nnoremap <Right> <C-W>l

" }}}
" ------------------------------------------------------------------------------
" splits "{{{
" ------------------------------------------------------------------------------

" horizontal split
  noremap <Leader>h :<C-u>split<CR>

" vertical split
  noremap <Leader>v :<C-u>vsplit<CR>

" }}}
" ------------------------------------------------------------------------------
" tabs "{{{
" ------------------------------------------------------------------------------

" normal mode tab navigation
  nnoremap <tab> gt
  nnoremap <s-tab> gT

" }}}
" ------------------------------------------------------------------------------
" common tasks "{{{
" ------------------------------------------------------------------------------

" insert and visual mode escape
  inoremap fj <esc>
  inoremap jf <esc>
  vnoremap fj <esc>
  vnoremap jf <esc>

" visual mode, maintain > and < after shift
  vmap < <gv
  vmap > >gv

" use tab for indenting in visual mode
  vnoremap <Tab> >gv|
  vnoremap <S-Tab> <gv
  nnoremap > >>_
  nnoremap < <<_

" move visual block
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv

" better home/end
  nnoremap B ^
  nnoremap E $

" copy to clipboard
  vnoremap <C-c> "*y"

" }}}
" ------------------------------------------------------------------------------
" F-key actions "{{{
" ------------------------------------------------------------------------------

" toggle white characters visibility
  nnoremap <silent> <F2> :set list!<CR> :set list?<CR>
" paste mode toggling
  set pastetoggle=<F3>
" clear search highlight
  nnoremap <silent> <F4> :noh<CR><CR>
" source (reload configuration)
  nnoremap <silent> <F5> :source $HOME/.config/nvim/init.vim<CR>
" terminal: exit insert mode
" tnoremap <F12> <c-\><C-n>

" }}}
" ------------------------------------------------------------------------------
" Command abbreviations and mappings "{{{
" ------------------------------------------------------------------------------

" command mode save having to hit shift
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

" }}}
" ------------------------------------------------------------------------------
" terminal "{{{
" ------------------------------------------------------------------------------

  set shell=/bin/zsh

" exit insert mode
  tnoremap <F12> <c-\><C-n>

" }}}
" ------------------------------------------------------------------------------

" }}}

" vim: foldmethod=marker
