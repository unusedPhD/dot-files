" ==============================================================================
" Neovim Configuration
" ==============================================================================

" ==============================================================================
" 1.0 plugin manager "{{{
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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'

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
" ------------------------------------------------------------------------------

Plug 'Shougo/deoplete.nvim'
"Plug 'Shougo/neocomplete.vim'
"Plug 'scrooloose/syntastic'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
"Plug 'pbrisbin/vim-mkdir'
"Plug 'unusedPhD/scratch.vim'
"Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-surround'
"Plug 'SirVer/ultisnips'
"Plug 'benekastah/neomake'

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
" ==============================================================================

" ------------------------------------------------------------------------------
" 2.1 sensible defaults "{{{
" ------------------------------------------------------------------------------
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
set tabstop=4
set shiftwidth=4
set colorcolumn=80

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme gruvbox
let g:airline_theme = 'gruvbox'

"}}}
" ------------------------------------------------------------------------------
" 2.2 split settings "{{{
" ------------------------------------------------------------------------------
set splitbelow    " horizontal split below current window
set splitright    " vertical split to the right of current window

"}}}
" ------------------------------------------------------------------------------
" 2.3 search settings "{{{
" ------------------------------------------------------------------------------
set ignorecase    " Ignore case by default
set smartcase     " Make search case sensitive only if it contains uppercase letters
set wrapscan      " Search again from top when reached the bottom
set nohlsearch    " Don't highlight after search

"}}}
" ------------------------------------------------------------------------------
" 2.4 white characters settings"{{{
" ------------------------------------------------------------------------------
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:␣
set showbreak=↪

"}}}
" ------------------------------------------------------------------------------
" 2.5 folding settings"{{{
" ------------------------------------------------------------------------------

set foldmethod=marker
"set foldmethod=indent   "fold based on indent ---other method would be syntax
set foldlevel=1
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
"}}}

"}}}
" ==============================================================================
" 3.0 mapping settings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" 3.1 setting leader "{{{
" ------------------------------------------------------------------------------
let g:mapleader="\<space>"

"}}}
" -----------------------------------------------------
" 3.2 Disabling arrow keys, space key, exmode enter"{{{
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
" 3.3 Vim defaults overriding"{{{
" ------------------------------------------------------------------------------

" Cancel terminal mode with ,escape
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>
endif

"}}}
" ------------------------------------------------------------------------------
" 3.4 Common tasks"{{{
" ------------------------------------------------------------------------------

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"}}}
" ------------------------------------------------------------------------------
" 3.5 F-key actions"{{{
" ------------------------------------------------------------------------------

" Paste mode toggling
nnoremap <silent> <F3> :set paste!<CR> :set paste?<CR>
" Source (reload configuration)
nnoremap <silent> <F5> :source $HOME/.config/nvim/init.vim<CR>
" Toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR> :set nohlsearch?<CR>
" Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>

"}}}
" -----------------------------------------------------
" 3.6 Command abbreviations and mappings"{{{
" -----------------------------------------------------

" save having to hit shift
nnoremap ; :

" typo alias
nmap :Q :q
nmap :W :w
nmap :WQ :wq
nmap :Wq :wq

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall
"
"}}}

"}}}
" ==============================================================================
" 4.0 plugins settings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" 4.1 unite "{{{
" ------------------------------------------------------------------------------

" matcher settings
call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_current_file'])
" rank sorter settings
call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_data_directory = "~/.cache/unite"

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Open in bottom right
"let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
"let g:unite_update_time = 200

"let g:unite_source_file_mru_limit = 1000
"let g:unite_cursor_line_highlight = 'TabLineSel'
"let g:unite_abbr_highlight = 'TabLine'

let g:unite_source_rec_max_cache_files = 99999

"let g:unite_source_file_mru_filename_format = ':~:.'
"let g:unite_source_file_mru_time_format = ''

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
      \'-i ' .
      \'--vimgrep ' .
      \'--hidden ' .
      \'--ignore ''.hg'' ' .
      \'--ignore ''.svn'' ' .
      \'--ignore ''.git'' ' .
      \'--ignore ''.bzr'' '
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '-i --no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '-i --no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif

" custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
  \'ignore_pattern', join([
    \'\.git/',
    \'git5/.*/review/',
    \'google/obj/',
    \'tmp/',
    \'.sass-cache',
    \'node_modules/',
    \'bower_components/',
    \'dist/',
    \'.git5_specs/',
    \'.pyc',
  \], '\|'))

"}}}

let g:deoplete#enable_at_startup = 1

"}}}
" ==============================================================================
" 5.0 plugin mappings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" 5.1 unite and extensions "{{{
" ------------------------------------------------------------------------------

" scan current dir
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files -start-insert file<cr>
" scan project dir
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
" mru
nnoremap <leader>m :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
" outline
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" yank history
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
" buffer
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer buffer<cr>
" line
nnoremap <silent> <leader>l :<C-u>Unite -start-insert -buffer-name=search_file line<CR>

" custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " play nice with supertab
  let b:SuperTabDisabled=1
  " enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"}}}
" ------------------------------------------------------------------------------
" 5.2 nerdtree "{{{
" ------------------------------------------------------------------------------
nmap <leader>n :NERDTreeToggle<cr>
imap <leader>n <ESC>:NERDTreeToggle<cr>i
"}}}

"}}}
" ==============================================================================