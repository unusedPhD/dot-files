call pathogen#infect()   "execute the pathogen plugin, which loads other plugins
call pathogen#helptags() "execute command to generate helptags
let mapleader = ","      "change leader key into a comma insted of a backslash
set nocompatible         "make vim incompatible with vi
set history=100

"key bindings
nmap <leader><tab> :Sscratch<cr>
nmap <leader>n     :NERDTreeToggle<cr>
imap <leader>n     <ESC>:NERDTreeToggle<cr>i
nmap <leader>l     :TagbarToggle<cr>
imap <leader>l     <ESC>:TagbarToggle<cr>i
nmap <leader>y     :YRShow<cr>

"navigate windows
"C+w+w jump to next window
"C+w+j jump to window on left
"C+w+l jump to window on right
"C+w+j jump to window below
"C+w+k jump to window above

"nerd commenter default key bindings

"<leader\>cc			Comment out the current line or text selected in visual mode. 
"<leader\>cu			Uncomments the selected line(s). 
"<leader\>c<space>		Toggles the comment state of the selected line(s). 
"						If the topmost selected line is commented, all selected lines are uncommented and vice versa. 
"<leader\>cn 			Same as \<leader\>cc but forces nesting. 
"<leader\>cm 			Comments the given lines using only one set of multipart delimiters. 
"<leader\>ci			Toggles the comment state of the selected line(s) individually. 
"<leader\>cs			Comments out the selected lines ``sexily'' 
"<leader\>cy			Same as \<leader\>cc except that the commented line(s) are yanked first. 
"<leader\>c$			Comments the current line from the cursor to the end of line. 
"<leader\>cA			Adds comment delimiters to the end of line and goes into insert mode between them. 
"<leader\>ca			Switches to the alternative set of delimiters. 
"<leader\>cb			Same as |NERDComComment| except that the delimiters are aligned down the left side (\<leader\>cl) or both sides (\<leader\>cb). 

"folding settings
set foldmethod=indent   "fold based on indent ---other method would be syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
"common key bindings for folding
",za - toggles
",zc - closes
",zo - opens
",zR - open all
",zM - close all

"syntastic options
let g:syntastic_mode_map = 
\{
    \'mode':'active',
    \'active_filetypes':['perl', 'python', 'ruby', 'c'],
    \'passive_filetypes':[]
\}
let g:syntastic_auto_jump=1

"yankring
let g:yankring_history_dir = '$HOME/.cache'
let g:yankring_min_element_length = 2
let g:yankring_max_display = 80

"colorscheme
set background=dark
syntax enable
if has('gui_running')
    " GUI colors
    colorscheme Monokai
    set guioptions=aegimrLt
else
    " Non-GUI (terminal) colors
    colorscheme literal_tango
endif
"colorscheme Monokai
"colorscheme literal_tango
"colorscheme ir_black
"colorscheme gentooish
"colorscheme industrial

"Common VIM settings
set encoding=utf-8
set ruler
set number
set laststatus=2
set showmode
set modelines=0
set showcmd		"Show (partial) command in status line.
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

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"TAB settings
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"autodetect filetype and load indentation rules
filetype plugin on
filetype indent on
set smartindent

"make pasting done without any indentation break.
set pastetoggle=<F3>	

"wildmenu completion 
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    "Version Controls
set wildignore+=*.aux,*.out,*.toc                "Latex Indermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   "Binary Imgs
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files
set wildignore+=*.spl                            "Compiled spelling world list
set wildignore+=*.sw?                            "Vim swap files
set wildignore+=*.DS_Store                       "OSX SHIT
set wildignore+=*.luac                           "Lua byte code
set wildignore+=migrations                       "Django migrations
set wildignore+=*.pyc                            "Python Object codes
set wildignore+=*.orig                           "Merge resolution files

"vim handles long lines nicely
"set wrap
"set textwidth=80
"set formatoptions=qrn1
"set colorcolumn=80

"jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"working with split screens, resize split when window is resized
au VimResized * :wincmd =

"typo alias 
nmap :Q :q 
nmap :WQ :wq
nmap :Wq :wq

"remove help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
