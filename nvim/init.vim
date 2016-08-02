  let $VIMPATH=expand('$HOME/.config/nvim')

  function! s:source_file(path)
      execute 'source' fnameescape($VIMPATH.'/config/'.a:path)
  endfunction

  call s:source_file('start.vim')
  call s:source_file('plug.vim')
  call s:source_file('theme.vim')
  call s:source_file('bindings.vim')
  call s:source_file('utils.vim')
  call s:source_file('ctags.vim')
  call s:source_file('general.vim')
" call s:source_file('plugins/deoplete.vim')
" call s:source_file('plugins/easymotion.vim')
  call s:source_file('plugins/unite.vim')
  call s:source_file('plugins/vim-easy-align.vim')
  call s:source_file('plugins/vim-easytags.vim')
  call s:source_file('plugins/vim-go.vim')
  call s:source_file('plugins/vim-polyglot.vim')
  call s:source_file('plugins/vim-simple-todo.vim')
  call s:source_file('plugins/vimfiler.vim')

