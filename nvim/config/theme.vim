  if empty($TMUX)
      let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  endif
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

  colorscheme gruvbox
  set background=dark
" let g:airline_theme = 'gruvbox'
  if (&term =~? 'xterm') || (&term =~? 'screen')
      set t_Co=256
  endif
