let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
" let g:unite_winwidth = 40
nmap <Space> [Unite]
nnoremap [Unite]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap [Unite]m :<C-u>Unite  file_mru <CR>
nnoremap [Unite]rc :<C-u>Unite file:./app/controllers/ file/new <CR>
nnoremap [Unite]rm :<C-u>Unite file:./app/models/ file/new <CR>
nnoremap [Unite]rv :<C-u>Unite file:./app/views/ file/new <CR>
nnoremap [Unite]rs :<C-u>Unite file:./app/assets/stylesheets/ file/new <CR>
nnoremap [Unite]rj :<C-u>Unite file:./app/assets/javascripts/ file/new <CR>
nnoremap [Unite]ro :<C-u>Unite file:./config/ file/new <CR>
nnoremap [Unite]rl :<C-u>Unite file:./lib/ file/new <CR>
nnoremap [Unite]rr :<C-u>Unite file:./spec/ file/new <CR>
" search for current directory
nnoremap [Unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" unite grep uses ag(The Silver Searcher)
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

