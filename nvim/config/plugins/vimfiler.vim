" ==============================================================================
" 4.0 plugins settings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" 4.3 vimfiler "{{{
" ------------------------------------------------------------------------------

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_time_format = ' '
call g:vimfiler#custom#profile(
    \'default',
    \'context', {
        \'safe' : 0,
        \'auto-cd' : 1,
    \}
\)

"}}}
" ==============================================================================
" 5.0 plugin mappings "{{{
" ==============================================================================

" ------------------------------------------------------------------------------
" 5.2 vimfiler "{{{
" ------------------------------------------------------------------------------

nnoremap <silent> <leader>ed :VimFilerBufferDir -buffer-name=explorer-current -toggle<cr>
nnoremap <silent> <leader>ep :VimFilerExplorer -split -winwidth=40 -toggle<cr>

"}}}

