" on nvim initiation
  if has ('vim_starting')
    " download plug if not found
      if empty(glob('~/.config/nvim/autoload/plug.vim'))
          silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          augroup plug
              autocmd VimEnter * PlugInstall | source $MYVIMRC
          augroup END
      endif

    " disable pre-bundled plugins
      let g:loaded_2html_plugin = 1
      let g:loaded_getscript = 1
      let g:loaded_getscriptPlugin = 1
      let g:loaded_gzip = 1
      let g:loaded_matchparen = 1
      let g:loaded_netrw = 1
      let g:loaded_netrwFileHandlers = 1
      let g:loaded_netrwPlugin = 1
      let g:loaded_netrwSettings = 1
      let g:loaded_rrhelper = 1
      let g:loaded_tar = 1
      let g:loaded_tarPlugin = 1
      let g:loaded_vimball = 1
      let g:loaded_vimballPlugin = 1
      let g:loaded_zip = 1
      let g:loaded_zipPlugin = 1

  endif

  if has("multi_byte")
      if &termencoding == ""
          let &termencoding = &encoding
      endif
      set encoding=utf-8
      setglobal fileencoding=utf-8
  endif

" if has('persistent_undo')
"   set undodir=~/.local/share/nvim/undos
"   set undofile
"   if !isdirectory(&undodir)
"     call mkdir(&undodir)
"   endif
" endif

" share histories between sessions
  augroup shada
      autocmd!
      autocmd CursorHold * if exists(':rshada') | rshada | wshada | endif
  augroup END
