" ==============================================================================
" vim-go
" ==============================================================================

" ------------------------------------------------------------------------------
" plugins settings "{{{
" ------------------------------------------------------------------------------

  let g:go_fmt_command = "goimports"

" temporary workaround until issue #502 is fixed
" disables gofmt on every save, so requires manual gofmt runs
" let g:go_fmt_autosave = 0

" }}}
" ------------------------------------------------------------------------------
" plugin mappings "{{{
" ------------------------------------------------------------------------------

  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)

" By default the mapping gd is enabled, which opens the target identifier in current buffer.
" You can also open the definition/declaration, 
" in a new vertical, horizontal, or tab, for the word under your cursor:
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" open the relevant Godoc for the word under the cursor with <leader>gd or 
" open it vertically with <leader>gv
" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" }}}
" ------------------------------------------------------------------------------

" vim: foldmethod=marker
