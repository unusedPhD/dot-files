## Structure
- [init.vim](init.vim) - Nvim initialization and loading of configs
- [config](./config)/ - Configuration
  - [plug.vim](./config/plug.vim) - Plugin bundles
  - [plugins](./plugins)/ - Individual plugin configurations
  - [bindings.vim](./config/bindings.vim) - Key bindings
  - [utils.vim](./config/utils.vim) - Commands and functions
  - [general.vim](./config/general.vim) - VIM general configuration


## Custom Key bindings

Key   | Mode | Action
----- |:----:| ------------------
`Space` | Normal | **Leader**
`<C-c>` | Visual | Copy content to system clipboard
`<leader>` + `v` | Normal | Create a vertical split
`<leader>` + `h` | Normal | Create a horizontal split
`<F2>` | Normal | Toggle display of hidden characters
`<F3>` | Normal | Toggle paste mode
`<F4>` | Normal | Toggle highlighting search words
`<F5>` | Normal | Reload nvim config
`<F12>` | Insert | Exit terminal insert mode
`<leader>` + `ed` | Normal | Open VimFiler in current buffer dir
`<leader>` + `ep` | Normal | Open VimFiler in project dir

`<leader>` + `fd` | Normal | Unite - search current dir
`<leader>` + `fc` | Normal | Unite - search project dir, open in current buffer
`<leader>` + `fv` | Normal | Unite - search project dir, open in vertical split
`<leader>` + `fh` | Normal | Unite - search project dir, open in horizontal split
`<leader>` + `ft` | Normal | Unite - search project dir, open in new tab
`<leader>` + `m` | Normal | Unite - search mru (recently accessed files)
`<leader>` + `o` | Normal | Unite - search outline of current buffer
`<leader>` + `y` | Normal | Unite - search yank history
`<leader>` + `b` | Normal | Unite - search active buffers
`<leader>` + `l` | Normal | Unite - search for matching lines in current buffer
`<leader>` + `g` | Normal | Unite - run ag query for pattern
