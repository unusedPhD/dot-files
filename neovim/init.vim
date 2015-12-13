
" ==============================================================================
" 1.0 Plugin manager (Plug) settings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" 1.1 plugin initiation "{{{
" ------------------------------------------------------------------------------

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')
"}}}

" ------------------------------------------------------------------------------
" 1.2 look and feel"{{{
" ------------------------------------------------------------------------------

Plug 'morhetz/gruvbox'
"Plug 'sickill/vim-monokai'
"Plug 'joshdick/onedark.vim'
Plug 'bling/vim-airline'
"Plug 'joshdick/airline-onedark.vim'
Plug 'vim-scripts/vim-webdevicons'
"}}}

" ------------------------------------------------------------------------------
" 1.3 syntax "{{{
" ------------------------------------------------------------------------------

Plug 'mephux/bro.vim'
Plug 'elubow/cql-vim'
Plug 'yaunj/vim-yara'
"}}}

" ------------------------------------------------------------------------------
" 1.4 interface improvements "{{{
" ------------------------------------------------------------------------------

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
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
"Plug 'tpope/vim-fugitive'
" git log viewer (Gitv! for file mode)
"Plug 'gregsexton/gitv'
" neovim terminal improving
"Plug 'kassio/neoterm', { 'on': 'T' }
" unix commands integration
"Plug 'tpope/vim-eunuch', { 'on': [ 'Rename', 'Move', 'SudoWrite' ] }
"}}}

" ------------------------------------------------------------------------------
" 1.7 misc "{{{
" ------------------------------------------------------------------------------

"Plug 'scrooloose/syntastic'
"Plug 'Shougo/neocomplete.vim'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'jiangmiao/auto-pairs'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'scrooloose/nerdcommenter'
"Plug 'pbrisbin/vim-mkdir'
"Plug 'unusedPhD/scratch.vim'
"Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-surround'
"Plug 'SirVer/ultisnips'
"Plug 'benekastah/neomake'
"}}}

"}}}

" ------------------------------------------------------------------------------
" 1.8 end of plugin declaration "{{{
" ------------------------------------------------------------------------------

if filereadable(expand("~/.config/nvim/bundles.local"))
  source ~/.config/nvim/init.local
endif

call plug#end()
"}}}

"}}}
" ==============================================================================
" 2.0 basic settings "{{{
" Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults
" ==============================================================================

"{{{
set shell=/bin/bash
set number                     " Line numbers on
"set showmode                  " Always show mode
"set showcmd                   " Show commands as you type them
"set textwidth=120             " Text width is 120 characters
"set cmdheight=1               " Command line height
"set pumheight=10              " Completion window max size
"set noswapfile                " New buffers will be loaded without creating a swapfile
"set hidden                    " Enables to switch between unsaved buffers and keep undo history
"set clipboard+=unnamed        " Allow to use system clipboard
set lazyredraw                " Don't redraw while executing macros (better performance)
"set showmatch                 " Show matching brackets when text indicator is over them
"set matchtime=2               " How many tenths of a second to blink when matching brackets
"set nostartofline             " Prevent cursor from moving to beginning of line when switching buffers
"set virtualedit=block         " To be able to select past EOL in visual block mode
"set nojoinspaces              " No extra space when joining a line which ends with . ? !
"set scrolloff=5               " Scroll when closing to top or bottom of the screen
"set updatetime=1000           " Update time used to create swap file or other things

" folding settings
set foldmethod=indent   "fold based on indent ---other method would be syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

" display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪
set tabstop=4
set shiftwidth=4

set colorcolumn=80

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme gruvbox
let g:airline_theme = 'gruvbox'

"}}}

"}}}
" ==============================================================================
" 3.0 mapping settings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" 3.1 setting leader "{{{
" ------------------------------------------------------------------------------
let g:mapleader="\<space>"

nmap <leader>n     :NERDTreeToggle<cr>
imap <leader>n     <ESC>:NERDTreeToggle<cr>i

"}}}

"}}}
" ==============================================================================
" 4.0 plugins settings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" 4.2 unite "{{{
" ------------------------------------------------------------------------------

" matcher settings
call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_current_file'])
call unite#filters#sorter_default#use(['sorter_rank'])

" use ag if available
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts=
    \'--nocolor ' .
    \'--line-numbers ' .
    \'--nogroup ' .
    \'-i ' .
    \'-S ' .
    \'-C0 ' .
    \'--vimgrep ' .
    \'--hidden ' .
    \'--ignore ''.hg'' ' .
    \'--ignore ''.svn'' ' .
    \'--ignore ''.git'' ' .
    \'--ignore ''.bzr'' '
  let g:unite_source_grep_recursive_opt=''
  " Set rec source command
  let g:unite_source_rec_async_command = [
    \'ag',
    \'--follow',
    \'--nocolor',
    \'--nogroup',
    \'--hidden',
    \'-g',
    \''
    \]
endif

" custom profile
call unite#custom#profile('default', 'context', {
  \  'prompt': '» ',
  \  'winheight': 15,
  \})

" add syntax highlighting
let g:unite_source_line_enable_highlight=1

" dont override status line
let g:unite_force_overwrite_statusline=0

" Custom unite menus
let g:unite_source_menu_menus = {}

" utils menu
let g:unite_source_menu_menus.utils = {
  \  'description' : 'Utility commands',
  \}
let g:unite_source_menu_menus.utils.command_candidates = [
  \  ['Color picker', 'VCoolor'],
  \  ['Run XMPFilter', 'Annotate'],
  \  ['Format file', 'Format'],
  \  ['Run file', 'Run'],
  \  ['Generate Ctags', 'GenerateCT'],
  \  ['Generate JS Ctags', 'GenerateJSCT'],
  \  ['Show notes', 'Notes'],
  \]

" git menu
let g:unite_source_menu_menus.git = {
  \  'description' : 'Git commands',
  \}
let g:unite_source_menu_menus.git.command_candidates = [
  \  ['Stage hunk', 'GitGutterStageHunk'],
  \  ['Unstage hunk', 'GitGutterRevertHunk'],
  \  ['Stage', 'Gwrite'],
  \  ['Status', 'Gstatus'],
  \  ['Diff', 'Gvdiff'],
  \  ['Commit', 'Gcommit --verbose'],
  \  ['Revert', 'Gread'],
  \  ['Log', 'Glog'],
  \  ['Visual Log', 'Gitv'],
  \]

" plug menu
let g:unite_source_menu_menus.plug = {
  \  'description' : 'Plugin management commands',
  \}
let g:unite_source_menu_menus.plug.command_candidates = [
  \  ['Install plugins', 'PlugInstall'],
  \  ['Update plugins', 'PlugUpdate'],
  \  ['Clean plugins', 'PlugClean'],
  \  ['Upgrade vim-plug', 'PlugUpgrade'],
  \]

" my unite menu
let g:unite_source_menu_menus.unite = {
  \  'description' : 'My Unite sources',
  \}
let g:unite_source_menu_menus.unite.command_candidates = [
  \  ['Unite MRUs', 'call utils#uniteMRUs()'],
  \  ['Unite buffers', 'call utils#uniteBuffers()'],
  \  ['Unite file browse', 'call utils#uniteFileBrowse()'],
  \  ['Unite file search', 'call utils#uniteFileRec()'],
  \  ['Unite history', 'call utils#uniteHistory()'],
  \  ['Unite line search', 'call utils#uniteLineSearch()'],
  \  ['Unite menu', 'call utils#uniteCustomMenu()'],
  \  ['Unite registers', 'call utils#uniteRegisters()'],
  \  ['Unite snippets', 'call utils#uniteSnippets()'],
  \  ['Unite sources', 'call utils#uniteSources()'],
  \  ['Unite file tags (symbols)', 'call utils#uniteOutline()'],
  \  ['Unite tags', 'call utils#uniteTags()'],
  \  ['Unite windows', 'call utils#uniteWindows()'],
  \  ['Unite yank history', 'call utils#uniteYankHistory()'],
  \  ['Unite jump history', 'call utils#uniteJumps()'],
  \]
"}}}

"}}}
" ==============================================================================
" 5.0 Plugin mappings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" 5.1 Unite and extensions "{{{
" ------------------------------------------------------------------------------

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
"}}}

"}}}
