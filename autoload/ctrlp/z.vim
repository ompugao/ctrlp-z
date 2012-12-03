if exists('g:loaded_ctrlp_z') && g:loaded_ctrlp_z
  finish
endif
let g:loaded_ctrlp_z = 1

let s:z_var = {
\  'init':   'ctrlp#z#init()',
\  'exit':   'ctrlp#z#exit()',
\  'accept': 'ctrlp#z#accept',
\  'lname':  'z',
\  'sname':  'z',
\  'type':   'z',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:z_var)
else
  let g:ctrlp_ext_vars = [s:z_var]
endif

function! ctrlp#z#init()
  let ans = input('args: ')
  let cmd = 'fasd -d -l -e printf '. ans
  let pathes = split(system(cmd),"\n")[1:]
  return pathes
endfunc

function! ctrlp#z#accept(mode, str)
  call ctrlp#exit()
  exec "lcd ".a:str
  echo a:str
endfunction

function! ctrlp#z#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#z#id()
  return s:id
endfunction
