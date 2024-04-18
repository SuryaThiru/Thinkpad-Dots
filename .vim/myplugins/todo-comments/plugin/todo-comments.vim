if exists("g:loaded_todo")
    finish
endif
let g:loaded_todo = 1

"------------------------------------------------------------------------------------------------------------------
" TODO management
call matchadd('Todo', '\<\(TODO\|NOTE\|FIXME\|WARNING\|HACK\)\>')

function! HighlightTodoQF()
    call matchadd('ErrorMsg', "")
    call matchadd('WarningMsg', "")
    call matchadd('Todo', "")
    call matchadd('MoreMsg', "")
    call matchadd('SpecialChar', "")
endfunction

function! FormatTodoQF(info)
    echom info
    let list = []
    call add(list, info.icon)
    return list
endfunction

" lot of hardcoding and blocking unfortunately
function! s:TodoRg()
    let rgoutput = system('rg --vimgrep TODO\|FIXME\|HACK\|NOTE\|WARNING')
    let rg_lines = split(rgoutput, "\n")
    let rg_qf = getqflist({'lines': rg_lines}).items

    let qf_list = []

    for parts in rg_qf
        let text = parts['text']

        if stridx(text, "FIXME") != -1
            let icon = ""
        elseif stridx(text, "TODO") != -1
            let icon = ""
        elseif stridx(text, "WARNING") != -1
            let icon = ""
        elseif stridx(text, "NOTE") != -1
            let icon = ""
        elseif stridx(text, "HACK") != -1
            let icon = ""
        endif

        " Create a Quickfix entry dictionary
        let parts['icon'] = icon
        let parts['text'] = icon . " " . parts['text']

        " Add the entry to the Quickfix list
        call add(qf_list, parts)
    endfor

    call setqflist(qf_list)
    cwin
endfunction

autocmd FileType qf call HighlightTodoQF()
" nnoremap <Leader>td :call TodoRg()<CR>

if !hasmapto('<Plug>TodoList')
    nnoremap <unique> <Leader>td <Plug>TodoList
endif

nnoremap <unique> <script> <Plug>TodoList :call <SID>TodoRg()<CR>

"------------------------------------------------------------------------------------------------------------------

