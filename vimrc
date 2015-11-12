let mapleader = ","      "change leader key into a comma insted of a backslash
set nocompatible         "make vim incompatible with vi
set history=100

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" key bindings
nmap <leader><tab> :Sscratch<cr>
nmap <leader>n     :NERDTreeToggle<cr>
imap <leader>n     <ESC>:NERDTreeToggle<cr>i

let g:syntastic_mode_map =
\{
    \'mode':'active',
    \'active_filetypes':['perl', 'python', 'go'],
    \'passive_filetypes':[]
\}
let g:syntastic_auto_jump=1

" display
set t_Co=256
set background=dark
"syntax enable
if has('gui_running')
    colorscheme monokai
    set guioptions=aegimrLt
else
    colorscheme monokai
endif

let g:airline_theme = 'powerlineish'

"Common VIM settings
set encoding=utf-8
set ruler
set number
set laststatus=2
set showmode
set modelines=0
set showcmd     "Show (partial) command in status line.
set autowrite   "Automatically save before commands like :next and :make
set hidden      "Hide buffers when they are abandoned
set noswapfile
set mouse=a     "Enable mouse
set ignorecase  "Do case insensitive matching
set smartcase   "Do smart case matching
set incsearch   "Incremental search
set showmatch   "Show matching brackets.
set hlsearch    "Highlight search matches
set scrolloff=2 "Minimum number of lines to keep above cursor
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" TAB settings
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" autodetect filetype and load indentation rules
filetype plugin on
filetype indent on
set smartindent

" make pasting done without any indentation break.
set pastetoggle=<F3>

" folding settings
set foldmethod=indent   "fold based on indent ---other method would be syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" strip whitespace
autocmd BufWritePre *.{pm,pl,py,js} :call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
    " save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " strip whitespace
    %s/\s\+$//e
    " restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" wildmenu completion
set wildmenu
set wildmode=list:longest
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

" vim handles long lines nicely
"set wrap
"set textwidth=80
"set formatoptions=qrn1
set colorcolumn=80

" jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" working with split screens, resize split when window is resized
au VimResized * :wincmd =

" split screen ctrl+arrow navigation
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" typo alias
nmap :Q :q
nmap :W :w
nmap :WQ :wq
nmap :Wq :wq

" remove help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"===============================================================================
" Unite
"===============================================================================

" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Use the rank sorter for everything
" call unite#filters#sorter_default#use(['sorter_rank'])

" Set up some custom ignores
"call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      "\ 'ignore_pattern', join([
      "\ '\.git/',
      "\ 'git5/.*/review/',
      "\ 'google/obj/',
      "\ 'tmp/',
      "\ '.sass-cache',
      "\ 'node_modules/',
      "\ 'bower_components/',
      "\ 'dist/',
      "\ '.git5_specs/',
      "\ '.pyc',
      "\ ], '\|'))

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

nnoremap <C-p> :<C-u>Unite -start-insert file_rec/async:!<CR>
"nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
"nnoremap [unite]f :Unite -start-insert file<CR>

" General fuzzy search
"nnoremap <silent> [unite]<space> :<C-u>Unite
      "\ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>

" Quick registers
"nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers file_mru buffer<CR>

" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick outline
"nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick sessions (projects)
"nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick sources
"nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" Quick snippet
"nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets ultisnips<CR>

" Quickly switch lcd
"nnoremap <silent> [unite]d
      "\ :<C-u>Unite -buffer-name=change-cwd -default-action=cd directory_mru directory_rec/async<CR>

" Quick file search
"nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick help
"nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help <CR>

" Quick line using the word under cursor
"nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick line
nnoremap <silent> [unite]l :<C-u>Unite -start-insert -buffer-name=search_file line<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
"nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
"nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
"nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

" Fuzzy search from current buffer
" nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
" \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

" Quick commands
"nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history -default-action=edit history/command command<CR>

" Custom Unite settings
"autocmd MyAutoCmd FileType unite call s:unite_settings()
"function! s:unite_settings()
  " nmap <buffer> <ESC> <Plug>(unite_exit)
  "nmap <buffer> <ESC> <Plug>(unite_insert_enter)
  "imap <buffer> <ESC> <Plug>(unite_exit)
  "" imap <buffer> <c-j> <Plug>(unite_select_next_line)
  "imap <buffer> <c-j> <Plug>(unite_insert_leave)
  "nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  "nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)
  "nmap <buffer> <tab> <Plug>(unite_loop_cursor_down)
  "nmap <buffer> <s-tab> <Plug>(unite_loop_cursor_up)
  "imap <buffer> <c-a> <Plug>(unite_choose_action)
  "imap <buffer> <Tab> <Plug>(unite_insert_leave)
  "imap <buffer> jj <Plug>(unite_insert_leave)
  "imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
  "imap <buffer> <C-u> <Plug>(unite_delete_backward_path)
  "imap <buffer> '     <Plug>(unite_quick_match_default_action)
  "nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  "nmap <buffer> <C-r> <Plug>(unite_redraw)
  "imap <buffer> <C-r> <Plug>(unite_redraw)
  "inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  "nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  "inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  "nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

  "let unite = unite#get_current_unite()
  "if unite.buffer_name =~# '^search'
    "nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  "else
    "nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  "endif

  "nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')

  " Using Ctrl-\ to trigger outline, so close it using the same keystroke
  "if unite.buffer_name =~# '^outline'
    "imap <buffer> <C-\> <Plug>(unite_exit)
  "endif

  " Using Ctrl-/ to trigger line, close it using same keystroke
  "if unite.buffer_name =~# '^search_file'
    "imap <buffer> <C-_> <Plug>(unite_exit)
  "endif
"endfunction

" Start in insert mode
"let g:unite_enable_start_insert = 1

let g:unite_data_directory = "~/.cache/unite"

" Enable short source name in window
" let g:unite_enable_short_source_names = 1

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
"let g:unite_update_time = 200

"let g:unite_source_file_mru_limit = 1000
"let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'

"let g:unite_source_file_mru_filename_format = ':~:.'
"let g:unite_source_file_mru_time_format = ''

" For ack.
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

let g:unite_source_rec_max_cache_files = 99999

"===============================================================================
" neocomplete
"===============================================================================

" disable AutoComplPop.
let g:acp_enableAtStartup = 0
" use neocomplete.
let g:neocomplete#enable_at_startup = 1
" use smartcase.
let g:neocomplete#enable_smart_case = 1
" set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
\ }

" define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
