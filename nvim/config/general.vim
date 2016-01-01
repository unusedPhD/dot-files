" ==============================================================================
" 2.0 basic settings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" 2.1 sensible defaults "{{{
" ------------------------------------------------------------------------------

set relativenumber
set number
"set showmode                  " Always show mode
"set showcmd                   " Show commands as you type them
"set textwidth=120             " Text width is 120 characters
"set cmdheight=1               " Command line height
"set pumheight=10              " Completion window max size
"set noswapfile                " New buffers will be loaded without creating a swapfile
"set hidden                    " Enables to switch between unsaved buffers and keep undo history
"set clipboard+=unnamed        " Allow to use system clipboard
set lazyredraw                 " Don't redraw while executing macros (better performance)
"set showmatch                 " Show matching brackets when text indicator is over them
"set matchtime=2               " How many tenths of a second to blink when matching brackets
"set nostartofline             " Prevent cursor from moving to beginning of line when switching buffers
"set virtualedit=block         " To be able to select past EOL in visual block mode
"set nojoinspaces              " No extra space when joining a line which ends with . ? !
"set scrolloff=5               " Scroll when closing to top or bottom of the screen
"set updatetime=1000           " Update time used to create swap file or other things
set expandtab
set tabstop=4
set shiftwidth=4
set colorcolumn=80

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
" 2.4 white characters settings "{{{
" ------------------------------------------------------------------------------
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:␣
set showbreak=↪

"}}}
" ------------------------------------------------------------------------------
" 2.5 folding settings "{{{
" ------------------------------------------------------------------------------

"set foldmethod=marker
set foldmethod=indent
set foldlevel=1
set foldnestmax=10 "deepest fold is 10 levels
set nofoldenable   "dont fold by default

"}}}
" ------------------------------------------------------------------------------
" 2.6 theme "{{{
" ------------------------------------------------------------------------------

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

if empty($TMUX)
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
colorscheme gruvbox
set background=dark
let g:airline_theme = 'gruvbox'
" if (&term =~? 'xterm') || (&term =~? 'screen')
"     set t_Co=256
" endif

"}}}
" ------------------------------------------------------------------------------

"}}}
