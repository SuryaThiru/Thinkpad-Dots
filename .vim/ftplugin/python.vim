set tabstop=4
set encoding=utf-8
set autoindent

let current_python = substitute(system('which python'), '\n', ' ', "")

"------------------------------------------------------------------------------------------------------------------
" Pytest mappings, uses pytest in the current environment
let current_pytest = fnamemodify(current_python, ':p:h') . '/py.test'
let g:pytest_executable = current_pytest
nnoremap <F6> <Esc>:Pytest project<CR>
nnoremap <C-F6> <Esc>:Pytest file<CR>
command PS Pytest session
command PF Pytest function
command PC Pytest class
command PN Pytest next
command PP Pytest previous
"------------------------------------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------------------------------------
" Folding for python
" set foldmethod=indent
" set nofoldenable
"------------------------------------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------------------------------------
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"------------------------------------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------------------------------------
" PEP 80 column limit
highlight ColorColumn ctermbg=DarkGray
setlocal colorcolumn=80
"------------------------------------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------------------------------------
" Add breakpoint() for python above the current line
nnoremap <Leader>bp Obreakpoint()<esc>
"------------------------------------------------------------------------------------------------------------------

