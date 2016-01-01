"if &compatible
    "set nocompatible
"endif

" Respect XDG
"if isdirectory($XDG_CONFIG_HOME.'/vim')
    "let $VIMPATH=expand('$XDG_CONFIG_HOME/vim')
    "let $VARPATH=expand('$XDG_CACHE_HOME/vim')
"else
    "let $VIMPATH=expand('$HOME/.vim')
    "let $VARPATH=expand('$HOME/.cache/vim')
"endif
"let $VIMPATH=expand('$XDG_CONFIG_HOME/nvim')
let $VIMPATH=expand('$HOME/.config/nvim')

function! s:source_file(path)
    execute 'source' fnameescape($VIMPATH.'/config/'.a:path)
endfunction

call s:source_file('plug.vim')
call s:source_file('bindings.vim')
call s:source_file('utils.vim')
call s:source_file('ctags.vim')
call s:source_file('general.vim')
call s:source_file('plugins/unite.vim')
call s:source_file('plugins/vimfiler.vim')
call s:source_file('plugins/deoplete.vim')
