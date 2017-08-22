let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
" let g:unite_winwidth = 40
nmap <Space> [Unite]
nnoremap [Unite]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap [Unite]m :<C-u>Unite  file_mru <CR>
nnoremap [Unite]rc :<C-u>Unite file_rec/async:./app/controllers/ <CR>
nnoremap [Unite]rm :<C-u>Unite file_rec/async:./app/models/ <CR>
nnoremap [Unite]rv :<C-u>Unite file_rec/async:./app/views/ <CR>
nnoremap [Unite]rs :<C-u>Unite file_rec/async:./app/assets/stylesheets/ <CR>
nnoremap [Unite]rj :<C-u>Unite file_rec/async:./app/assets/javascripts/ <CR>
nnoremap [Unite]ro :<C-u>Unite file_rec/async:./config/ <CR>
nnoremap [Unite]rl :<C-u>Unite file_rec/async:./lib/ <CR>
nnoremap [Unite]rr :<C-u>Unite file_rec/async:./spec/ <CR>
nnoremap [Unite]rfc :<C-u>Unite file file/new -input=./app/controllers/ <CR>
nnoremap [Unite]rfm :<C-u>Unite file file/new -input=./app/models/ <CR>
nnoremap [Unite]rfv :<C-u>Unite file file/new -input=./app/views/ <CR>
nnoremap [Unite]rfs :<C-u>Unite file file/new -input=./app/assets/stylesheets/ <CR>
nnoremap [Unite]rfj :<C-u>Unite file file/new -input=./app/assets/javascripts/ <CR>
nnoremap [Unite]rfo :<C-u>Unite file file/new -input=./config/ <CR>
nnoremap [Unite]rfl :<C-u>Unite file file/new -input=./lib/ <CR>
nnoremap [Unite]rfr :<C-u>Unite file file/new -input=./spec/ <CR>
" search for current directory
nnoremap [Unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" unite grep uses ag(The Silver Searcher)
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

