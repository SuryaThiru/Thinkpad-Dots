
" nmap <buffer> <F5> :!gcc % -o %.out && ./%.out<CR> :cw<CR>
" nmap <buffer> <C-F5> :!gcc % -o %.out && ./%.out<CR> :copen<CR>

" https://stackoverflow.com/questions/60866833/vim-compiling-a-c-program-and-displaying-the-output-in-a-tab
" https://stackoverflow.com/questions/2627886/how-do-i-run-a-c-program-from-vim
let $CFLAGS = '-Wall -Wextra -O3 -lm'

nmap <buffer> <silent> <F5> :make %<<CR> :cw<CR>
" nmap <buffer> <silent> <C-F5> :make %<<CR> !./%< | copen<CR>
nmap <buffer> <silent> <C-F5> :make %< && ./%<<CR><CR><CR> : copen<CR>

