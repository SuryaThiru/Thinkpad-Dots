let g:startify_custom_header = [
            \ "\t\t         ________ ++     ________ ",
            \ "\t\t        /VVVVVVVV\\++++  /VVVVVVVV\\",
            \ "\t\t        \\VVVVVVVV/++++++\\VVVVVVVV/",
            \ "\t\t         |VVVVVV|++++++++/VVVVV/' ",
            \ "\t\t         |VVVVVV|++++++/VVVVV/'   ",
            \ "\t\t        +|VVVVVV|++++/VVVVV/'+    ",
            \ "\t\t      +++|VVVVVV|++/VVVVV/'+++++  ",
            \ "\t\t    +++++|VVVVVV|/VVVVV/'+++++++++",
            \ "\t\t      +++|VVVVVVVVVVV/'+++++++++  ",
            \ "\t\t        +|VVVVVVVVV/'+++++++++    ",
            \ "\t\t         |VVVVVVV/'+++++++++      ",
            \ "\t\t         |VVVVV/'+++++++++        ",
            \ "\t\t         |VVV/'+++++++++          ",
            \ "\t\t         'V/'   ++++++            ",
            \ "\t\t                  ++              ",
            \]

function! s:mru_dirs()
  " get 5 most recently used working directories
  let dirs = uniq(map(copy(v:oldfiles), 'fnamemodify(v:val, ":h")'))[:4]
  return map(dirs, '{"line": fnamemodify(v:val, ":."), "path": v:val}')
endfunction

let g:startify_files_number = 5
let g:startify_lists = [
      \ { 'header': ['   MRU dirs'],       'type': function('s:mru_dirs') },
      \ { 'header': ['   MRU'],            'type': 'files' },
      \ ]

