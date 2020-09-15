let g:ctrlp_map='<C-,>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_user_command='find %s -type f'
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.DS_Store,*/.git/**     " MacOSX/Linux
set wildignore+=*\\vendor\\**
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](tmp|node_modules|.git|bundle|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ }

" NOTE: You can check mappings :help ctrlp-mappings
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':        ['<c-h>', '<bs>'],
  \ 'PrtCurLeft()':   ['<left>', '<c-b>'],
  \ 'PrtCurRight()':  ['<right>', '<c-f>'],
  \ 'ToggleType(1)':  ['<c-l>'],
  \ 'ToggleType(-1)': ['<nop>'],
  \ }
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
nnoremap <Leader>f :<C-u>CtrlP<CR>
" reload CtrlP index
nnoremap <Leader>rc :<C-u>CtrlPClearCache<CR>

