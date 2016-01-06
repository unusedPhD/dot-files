
" ==============================================================================
" vim-plug - minimalist vim plugin manager
" https://github.com/junegunn/vim-plug.git "{{{
" ==============================================================================

call g:plug#begin('$HOME/.config/nvim/bundle')

" ------------------------------------------------------------------------------
" look and feel "{{{
" ------------------------------------------------------------------------------

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
"Plug 'sickill/vim-monokai'
"Plug 'joshdick/onedark.vim'
"Plug 'joshdick/airline-onedark.vim'
Plug 'jszakmeister/vim-togglecursor'

"}}}
" ------------------------------------------------------------------------------
" syntax "{{{
" ------------------------------------------------------------------------------

Plug 'sheerun/vim-polyglot'
Plug 'mephux/bro.vim', { 'for': 'bro' }
Plug 'yaunj/vim-yara', { 'for': 'yara' }
Plug 'dag/vim-fish', { 'for': 'fish' }
"Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

"}}}
" ------------------------------------------------------------------------------
" interface improvements "{{{
" ------------------------------------------------------------------------------

Plug 'Shougo/vimfiler.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

"}}}
" ------------------------------------------------------------------------------
" unite fuzzy searcher "{{{
" ------------------------------------------------------------------------------

" Unite files, buffers, etc. sources
Plug 'Shougo/unite.vim'
" Outline source
Plug 'Shougo/unite-outline'
" History/yank source
Plug 'Shougo/neoyank.vim'
" MRU source
Plug 'Shougo/neomru.vim'
" Tag source
"Plug 'tsukkee/unite-tag'
" Ag wrapper (Unite grep alternative) search and edit
"Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

"}}}
" ------------------------------------------------------------------------------
" external tools integration plugins "{{{
" ------------------------------------------------------------------------------

" git changes showed on line numbers
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" git log viewer (Gitv! for file mode)
Plug 'gregsexton/gitv'
" neovim terminal improving
"Plug 'kassio/neoterm', { 'on': 'T' }
" unix commands integration
"Plug 'tpope/vim-eunuch', { 'on': [ 'Rename', 'Move', 'SudoWrite' ] }

"}}}
" ------------------------------------------------------------------------------
" misc "{{{
" --------------------------------------------------------------------------

" Asynchronous maker and linter (needs linters to work)
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
Plug 'Shougo/deoplete.nvim'
"Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'pbrisbin/vim-mkdir'
"Plug 'unusedPhD/scratch.vim'
"Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-surround'
"Plug 'SirVer/ultisnips'
Plug 'vim-scripts/vim-webdevicons'

"}}}

call g:plug#end()

"}}}

" vim: foldmethod=marker
