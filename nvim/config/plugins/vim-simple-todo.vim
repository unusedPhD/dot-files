" ==============================================================================
" vim-simple-todo
" ==============================================================================

" ------------------------------------------------------------------------------
" plugins settings "{{{
" ------------------------------------------------------------------------------

" disable default key bindings
  let g:simple_todo_map_keys = 0

" }}}
" ------------------------------------------------------------------------------
" plugin mappings "{{{
" ------------------------------------------------------------------------------

  autocmd FileType todotxt nmap <Leader>i <Plug>(simple-todo-new)
  autocmd FileType todotxt nmap <Leader>I <Plug>(simple-todo-new-start-of-line)
  autocmd FileType todotxt vmap <Leader>I <Plug>(simple-todo-new-start-of-line)
  autocmd FileType todotxt nmap <Leader>o <Plug>(simple-todo-below)
  autocmd FileType todotxt nmap <Leader>O <Plug>(simple-todo-above)
  autocmd FileType todotxt nmap <Leader>x <Plug>(simple-todo-mark-as-done)
  autocmd FileType todotxt vmap <Leader>x <Plug>(simple-todo-mark-as-done)
  autocmd FileType todotxt nmap <Leader>X <Plug>(simple-todo-mark-as-undone)
  autocmd FileType todotxt vmap <Leader>X <Plug>(simple-todo-mark-as-undone)

" }}}
" ------------------------------------------------------------------------------

" vim: foldmethod=marker
