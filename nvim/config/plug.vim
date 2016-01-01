" ==============================================================================
" 1.0 plugin manager "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" 1.1 plugin initiation "{{{
" ------------------------------------------------------------------------------

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimrc VimEnter * PlugInstall | source $MYVIMRC
endif

call g:plug#begin('$HOME/.config/nvim/bundle')

"}}}
" ------------------------------------------------------------------------------
" 1.2 look and feel "{{{
" ------------------------------------------------------------------------------

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
"Plug 'sickill/vim-monokai'
"Plug 'joshdick/onedark.vim'
"Plug 'joshdick/airline-onedark.vim'
Plug 'jszakmeister/vim-togglecursor'
"}}}
" ------------------------------------------------------------------------------
" 1.3 syntax "{{{
" ------------------------------------------------------------------------------

Plug 'sheerun/vim-polyglot'
Plug 'mephux/bro.vim', { 'for': 'bro' }
Plug 'yaunj/vim-yara', { 'for': 'yara' }
Plug 'dag/vim-fish', { 'for': 'fish' }
"Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

"}}}
" ------------------------------------------------------------------------------
" 1.4 interface improvements "{{{
" ------------------------------------------------------------------------------

Plug 'Shougo/vimfiler.vim'
"Plug 'Shougo/vimfiler.vim', { 'on': 'VimFilerExplorer' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

"}}}
" ------------------------------------------------------------------------------
" 1.5 unite fuzzy searcher "{{{
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
" 1.6 external tools integration plugins "{{{
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
" 1.7 misc "{{{
" --------------------------------------------------------------------------

" Asynchronous maker and linter (needs linters to work)
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
Plug 'Shougo/deoplete.nvim'
"Plug 'Shougo/neocomplete.vim'
"Plug 'scrooloose/syntastic'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
"Plug 'pbrisbin/vim-mkdir'
"Plug 'unusedPhD/scratch.vim'
"Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-surround'
"Plug 'SirVer/ultisnips'
"Plug 'benekastah/neomake'
Plug 'vim-scripts/vim-webdevicons'

"}}}
" ------------------------------------------------------------------------------
" 1.8 end of plugin declaration "{{{
" ------------------------------------------------------------------------------

if filereadable(expand('~/.config/nvim/bundles.local'))
    source ~/.config/nvim/bundles.local
endif

call g:plug#end()
"}}}
" ------------------------------------------------------------------------------


"}}}
