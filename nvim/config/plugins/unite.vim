" ==============================================================================
" unite "{{{
" ==============================================================================

  scriptencoding utf-8

" ------------------------------------------------------------------------------
" plugin settings "{{{
" ------------------------------------------------------------------------------

  let g:unite_data_directory = '~/.cache/unite'

  let g:unite_prompt = '➤ '
" let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'

" enable history yank source
  let g:unite_source_history_yank_enable = 1

" don't cache, it's fast enough
  let g:unite_source_rec_max_cache_files = 0

  let g:unite_source_file_mru_limit = 200
  let g:unite_source_file_mru_filename_format = ':~:.'

" matcher settings
  call g:unite#filters#matcher_default#use(
      \['matcher_fuzzy', 'matcher_hide_current_file']
  \)

" rank sorter settings
  call g:unite#filters#sorter_default#use(
      \['sorter_rank']
  \)

  if executable('ag')
      let g:unite_source_rec_async_command =
          \'ag ' .
          \'--nocolor ' .
          \'--follow ' .
          \'--nogroup ' .
          \'-g ""'
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
  call g:unite#custom_source(
      \'file_rec,file_rec/async,file_mru,file,buffer,grep',
      \'ignore_pattern',
      \join([
          \'\.git/',
          \'tmp/',
          \'.sass-cache',
          \'node_modules/',
          \'bower_components/',
          \'dist/',
          \'.pyc',
      \],'\|')
  \)


" }}}
" ------------------------------------------------------------------------------
" plugin mappings "{{{
" ------------------------------------------------------------------------------

" The prefix key.
" nnoremap [unite] <Nop>
" nmap "\<space>" [unite]

" ------------------------------------------------------------------------------
" - search current dir
" ------------------------------------------------------------------------------
  nnoremap <silent> <leader>fd :<C-u>Unite -no-split
                                       \ -buffer-name=files-current
                                       \ -resume
                                       \ -input=
                                       \ -start-insert file<cr>

" ------------------------------------------------------------------------------
" - search project dir
" ------------------------------------------------------------------------------

" open in current window
  nnoremap <silent> <leader>fc :<C-u>Unite -no-split
                                       \ -buffer-name=files
                                       \ -resume
                                       \ -input=
                                       \ -start-insert
                                       \ file_rec/async:!<cr>
" open in new vsplit
  nnoremap <silent> <leader>fv :<C-u>Unite -no-split
                                       \ -buffer-name=files
                                       \ -resume
                                       \ -input=
                                       \ -start-insert
                                       \ -default-action=vsplit
                                       \ file_rec/async:!<cr>
" open in new split
  nnoremap <silent> <leader>fh :<C-u>Unite -no-split
                                       \ -buffer-name=files
                                       \ -resume
                                       \ -input=
                                       \ -start-insert
                                       \ -default-action=split
                                       \ file_rec/async:!<cr>
" open in new tab
  nnoremap <silent> <leader>ft :<C-u>Unite -no-split
                                       \ -buffer-name=files
                                       \ -resume
                                       \ -input=
                                       \ -start-insert
                                       \ -default-action=tabopen
                                       \ file_rec/async:!<cr>

" ------------------------------------------------------------------------------
" - search mru
" ------------------------------------------------------------------------------
  nnoremap <silent> <leader>m  :<C-u>Unite -no-split
                                       \ -buffer-name=mru
                                       \ -resume
                                       \ -start-insert
                                       \ file_mru<cr>

" ------------------------------------------------------------------------------
" - search outline
" ------------------------------------------------------------------------------
  nnoremap <silent> <leader>o  :<C-u>Unite -no-split
                                       \ -buffer-name=outline
                                       \ -auto-preview
                                       \ outline<cr>

" ------------------------------------------------------------------------------
" - search yank history
" ------------------------------------------------------------------------------
  nnoremap <silent> <leader>y  :<C-u>Unite -no-split
                                       \ -start-insert
                                       \ history/yank<cr>
" nnoremap <silent> <leader>y  :<C-u>Unite -no-split -quick-match history/yank<cr>

" ------------------------------------------------------------------------------
" - search buffer
" ------------------------------------------------------------------------------
  nnoremap <silent> <leader>b  :<C-u>Unite -no-split
                                       \ -buffer-name=buffer
                                       \ -resume
                                       \ -quick-match
                                       \ buffer<cr>

" ------------------------------------------------------------------------------
" - search lines of current file
" ------------------------------------------------------------------------------
  nnoremap <silent> <leader>l  :<C-u>Unite -start-insert line<CR>

" ------------------------------------------------------------------------------
" - grep current dir
" ------------------------------------------------------------------------------
  nnoremap <silent> <leader>g  :<C-u>Unite -no-split
                                       \ -silent
                                       \ -buffer-name=ag
                                       \ grep:.<CR>

" custom mappings for the unite buffer
  autocmd vimrc FileType unite call s:unite_settings()
  function! s:unite_settings()
      " play nice with supertab
      let b:SuperTabDisabled=1
      " enable navigation with control-j and control-k in insert mode
      imap <buffer> <C-j> <Plug>(unite_select_next_line)
      imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  endfunction

" }}}
" ------------------------------------------------------------------------------

" vim: foldmethod=marker
