let g:ctrlp_map='<C-,>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_user_command='find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.DS_Store,*/.git/**     " MacOSX/Linux
set wildignore+=*\\vendor\\**
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](tmp|node_modules|.git|bundle|hg|svn)',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ }
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
nnoremap <Leader>f :<C-u>CtrlP<CR>
" reload CtrlP index
nnoremap <Leader>rc :<C-u>CtrlPClearCache<CR>

