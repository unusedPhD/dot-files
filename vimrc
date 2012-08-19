"pathogen settings
call pathogen#infect()

"change leader Key
let mapleader = ","

"key bindings
nmap <leader><tab> :Sscratch<cr>
nmap <leader>n     :NERDTreeToggle<cr>
imap <leader>n     <ESC>:NERDTreeToggle<cr>i
nmap <leader>l     :TagbarToggle<cr>
imap <leader>l     <ESC>:TagbarToggle<cr>i
nmap <leader>p     :ToggleRaibowParenthesis<cr>
imap <leader>p     <ESC>:ToggleRaibowParenthesis<cr>i

"syntastic options
let g:syntastic_mode_map = {'mode':'active',
                            \'active_filetypes':['perl', 'python', 'ruby', 'c'],
                            \'passive_filetypes':[] }
let g:syntastic_auto_jump=1

"yankring
let g:yankring_history_dir = '$HOME/.tmp'
let g:yankring_min_element_length = 2
let g:yankring_max_display = 70

"latex options
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

"colorscheme information
set background=dark
syntax enable
colorscheme literal_tango
"colorscheme ir_black
"colorscheme gentooish
"colorscheme industrial

"Common VIM settings
set nocompatible "make vim incompatible with vi
set encoding=utf-8
set ruler
set number
set laststatus=2
set showmode
set modelines=0
set showcmd		"Show (partial) command in status line.
set vb t_vb= 	"Use visual bell instead of beeping
set autowrite	"Automatically save before commands like :next and :make
set hidden		"Hide buffers when they are abandoned
set noswapfile
set mouse=a		"Enable mouse 
set ignorecase	"Do case insensitive matching
set smartcase	"Do smart case matching
set incsearch	"Incremental search
set showmatch	"Show matching brackets.
set hlsearch    "Highlight search matches
set scrolloff=2 "Minimum number of lines to keep above cursor

"TAB settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"autodetect filetype and load indentation rules
filetype plugin on
filetype indent on
set autoindent
set smartindent

"make pasting done without any indentation break.
"set pastetoggle=<F3>	

"jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"wildmenu completion 
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"

"working with split screens, resize split when window is resized
au VimResized * :wincmd =
