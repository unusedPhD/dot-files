
" ==============================================================================
" autocommands "{{{
" ==============================================================================

" define a generic group
  augroup vimrc
      autocmd!
  augroup END

" ------------------------------------------------------------------------------
" window resizing "{{{
" ------------------------------------------------------------------------------

" resize splits when the window is resized
  autocmd vimrc VimResized * :wincmd =

" }}}
" ------------------------------------------------------------------------------
" save state "{{{
" ------------------------------------------------------------------------------

" return to last position when reopening files
" function! g:SetCursorPosition()
"     if &filetype !~? 'svn\|commit\c'
"         if line("'\"") > 0 && line("'\"") <= line('$') |
"             execute 'normal! g`"zvzz' |
"         endif
"     end
" endfunction
" autocmd vimrc BufReadPost * call SetCursorPosition()

" }}}
" ------------------------------------------------------------------------------
" run linters after save "{{{
" ------------------------------------------------------------------------------

  augroup linters

    " npm install -g eslint
      if executable('eslint')
          autocmd BufWritePost *.js Neomake eslint
      endif

    " gem install rubocop
      if executable('rubocop')
          autocmd BufWritePost *.rb Neomake rubocop
      endif

    " apt-get install tidy
      if executable('tidy')
          autocmd BufWritePost *.html Neomake tidy
      endif

    " apt-get install shellcheck
      if executable('shellcheck')
          autocmd BufWritePost *.sh Neomake shellcheck
      endif

    " pip3 install vim-vint
      if executable('vint')
          autocmd BufWritePost *.vim Neomake vint
      endif

    " go get -u github.com/golang/lint/golint
      if executable('golint')
          autocmd BufWritePost *.go Neomake golint
      endif

  augroup END

" }}}
" ------------------------------------------------------------------------------
" strip whitespace "{{{
" ------------------------------------------------------------------------------

  autocmd vimrc BufWritePre *.{go,pm,pl,py,js} :call <SID>StripTrailingWhitespaces()
  function! <SID>StripTrailingWhitespaces()
    " save last search, and cursor position
      let l:_s=@/
      let l:l = line('.')
      let l:c = col('.')
    " strip whitespace
      %s/\s\+$//e
    " restore previous search history, and cursor position
      let @/=l:_s
      call cursor(l:l, l:c)
  endfunction

" }}}
" ------------------------------------------------------------------------------

" }}}

