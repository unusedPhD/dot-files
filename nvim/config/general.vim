scriptencoding utf-8

" ==============================================================================
" basic settings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" sensible defaults "{{{
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
set showmatch                  " Show matching brackets when text indicator is over them
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

" Don't show current mode on last line (vim-airline does this instead)
set noshowmode

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

"}}}
" ------------------------------------------------------------------------------
" split settings "{{{
" ------------------------------------------------------------------------------

set splitbelow    " horizontal split below current window
set splitright    " vertical split to the right of current window

"}}}
" ------------------------------------------------------------------------------
" search settings "{{{
" ------------------------------------------------------------------------------

set ignorecase    " Ignore case by default
set smartcase     " Make search case sensitive only if it contains uppercase letters
set wrapscan      " Search again from top when reached the bottom
set nohlsearch    " Don't highlight after search

"}}}
" ------------------------------------------------------------------------------
" white characters settings "{{{
" ------------------------------------------------------------------------------

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:␣
set showbreak=↪

"}}}
" ------------------------------------------------------------------------------
" folding settings "{{{
" ------------------------------------------------------------------------------

"set foldmethod=marker
set foldmethod=indent
set foldlevel=1
set foldnestmax=10 "deepest fold is 10 levels
set nofoldenable   "dont fold by default

"}}}
" ------------------------------------------------------------------------------
" wildmenu "{{{
" ------------------------------------------------------------------------------

set wildmenu
set wildmode=longest:full
set wildignore+=*.hg,*.git,*.svn                 "Version Controls
set wildignore+=*.aux,*.out,*.toc                "Latex Indermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   "Binary Imgs
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files
set wildignore+=*.spl                            "Compiled spelling world list
set wildignore+=*.sw?                            "Vim swap files
set wildignore+=*.DS_Store                       "OSX SHIT
set wildignore+=*.luac                           "Lua byte code
set wildignore+=*migrations                      "Django migrations
set wildignore+=*.pyc                            "Python Object codes
set wildignore+=*.orig                           "Merge resolution files

"}}}
" ------------------------------------------------------------------------------

"}}}

" vim: foldmethod=marker
