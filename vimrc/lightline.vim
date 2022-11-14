let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['fugitive', 'filename', 'anzu']
  \   ]
  \ },
  \ 'component' : {
  \ },
  \ 'component_function': {
  \   'fugitive': 'MyFugitive',
  \   'anzu'    : 'anzu#search_status'
  \ }
  \ }

function! MyFugitive()
  if exists("*FugitiveHead")
    let _ = FugitiveHead()
    return strlen(_) ? _ : ''
  endif
  return ''
endfunction
