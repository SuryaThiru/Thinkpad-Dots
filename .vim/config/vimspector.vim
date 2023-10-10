" let g:vimspector_enable_mappings = 'HUMAN'  " overrides mappings if uncommented
" Reassign mappings
nnoremap <S-F4> <Plug>VimspectorRestart
nnoremap <S-F5> <Plug>VimspectorContinue
nnoremap <S-F6> <Plug>VimspectorPause
nnoremap <C-S-F6> :VimspectorReset<CR>
nnoremap <S-F8> <Plug>VimspectorAddFunctionBreakpoint
nnoremap <F7> <Plug>VimspectorJumpToNextBreakpoint
nnoremap <S-F7> <Plug>VimspectorJumpToPreviousBreakpoint
nnoremap <F9> <Plug>VimspectorToggleBreakpoint
nnoremap <F10> <Plug>VimspectorStepOver
nnoremap <F11> <Plug>VimspectorStepInto
nnoremap <S-F11> <Plug>VimspectorStepOut
" NOTE: copy the default vimspector config {HOME}/.vim/bundle/vimspector/configurations/linux/python


let g:vimspector_configurations = {
\       'Python': {
\           'adapter': 'debugpy',
\           'filetypes': [ 'python' ],
\           'default': v:true,
\           'variables': {
\               'PYTHON': {
\                   'shell': "/bin/sh -c 'if [ -z \"${dollar}VIRTUAL_ENV\" ]; then echo $$(which python3); else echo \"${dollar}VIRTUAL_ENV/bin/python\"; fi'"
\               }
\           },
\           'configuration': {
\               'request': 'launch',
\               'program': '${file}',
\               'python': '$PYTHON',
\               'cwd': '${workspaceRoot}'
\           },
\           'breakpoints': {
\               'exception': {
\                   'caught': 'N',
\                   'uncaught': 'Y',
\                   'raised': 'N',
\                   'userUnhandled': 'N'
\               }
\           }
\       }
\}

