"
"                                        ________ ++     ________
"                                       /VVVVVVVV\++++  /VVVVVVVV\
"                                       \VVVVVVVV/++++++\VVVVVVVV/
"                                        |VVVVVV|++++++++/VVVVV/'
"                                        |VVVVVV|++++++/VVVVV/'
"                                       +|VVVVVV|++++/VVVVV/'+
"                                     +++|VVVVVV|++/VVVVV/'+++++
"                                   +++++|VVVVVV|/VVVVV/'+++++++++
"                                     +++|VVVVVVVVVVV/'+++++++++
"                                       +|VVVVVVVVV/'+++++++++
"                                        |VVVVVVV/'+++++++++
"                                        |VVVVV/'+++++++++
"                                        |VVV/'+++++++++
"                                        'V/'   ++++++
"                                                 ++
"    __/\\\________/\\\__/\\\\\\\\\\\__/\\\\____________/\\\\____/\\\\\\\\\____________/\\\\\\\\\_
"     _\/\\\_______\/\\\_\/////\\\///__\/\\\\\\________/\\\\\\__/\\\///////\\\_______/\\\////////__
"      _\//\\\______/\\\______\/\\\_____\/\\\//\\\____/\\\//\\\_\/\\\_____\/\\\_____/\\\/___________
"       __\//\\\____/\\\_______\/\\\_____\/\\\\///\\\/\\\/_\/\\\_\/\\\\\\\\\\\/_____/\\\_____________
"        ___\//\\\__/\\\________\/\\\_____\/\\\__\///\\\/___\/\\\_\/\\\//////\\\____\/\\\_____________
"         ____\//\\\/\\\_________\/\\\_____\/\\\____\///_____\/\\\_\/\\\____\//\\\___\//\\\____________
"          _____\//\\\\\__________\/\\\_____\/\\\_____________\/\\\_\/\\\_____\//\\\___\///\\\__________
"           ______\//\\\________/\\\\\\\\\\\_\/\\\_____________\/\\\_\/\\\______\//\\\____\////\\\\\\\\\_
"            _______\///________\///////////__\///______________\///__\///________\///________\/////////__
"=================================================================================================================
" MUST HAVE'S
"=================================================================================================================
set nu
syntax on

set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

set mouse=a

set timeoutlen=1000 ttimeoutlen=10

"=================================================================================================================
" PLUGINS
"=================================================================================================================

" vundle stuff
set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Git gutter
Plugin 'airblade/vim-gitgutter'

" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Space vim colorscheme
Plugin 'liuchengxu/space-vim-dark'

" Auto close
Plugin 'AutoClose'

" Nerdtree fileviewer
Plugin 'scrooloose/nerdtree'
map <silent> <C-f> :NERDTreeFocus<CR>

" Nerdtree git plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Buffer management
Plugin 'jeetsukumaran/vim-buffergator'

" Fuzzy finder
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" FZF configs
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }
command B Buffers
command F Files
command T Tags

" Tag bar
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" Tag management
Plugin 'ludovicchabant/vim-gutentags'

" Session management
Plugin 'xolox/vim-misc' " Dependency
Plugin 'xolox/vim-session'
nmap <F2> :SaveSession<CR>
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_name = fnamemodify(getcwd(), ':t')

" NerdCommenter
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" 2 spaces in python
let g:NERDCustomDelimiters = {
      \ 'python': { 'left': '#', 'right': '' }
      \ }

" Async autocompletion
Plugin 'maralla/completor.vim'
" let g:completor_completion_delay = 50
let g:completor_python_binary = '/home/suryak/miniconda3/bin/python'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
noremap <silent> K :call completor#do('doc')<CR>

" Syntastic
Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_mode_map = { "mode": "passive" }
set sessionoptions-=blank " Retain error list when saving vim session
nnoremap <leader>sc :SyntasticCheck<CR>
nnoremap <leader>sr :SyntasticReset<CR>

" Snippets
Plugin 'sirver/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMeta.
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/bundle/vim-snippets/UltiSnips']

" Autopep8 for python
Plugin 'tell-k/vim-autopep8'

" Black formatter for python
Plugin 'psf/black'

" VIM REPL
Plugin 'sillybun/vim-repl'
let g:repl_program = {
    \ 'python': 'ipython',
    \ 'r': 'R',
    \ }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
nnoremap <F4> :REPLToggle<Cr>

" Pydoc strings
Plugin 'heavenshell/vim-pydocstring'
let g:pydocstring_doq_path = "/home/suryak/miniconda3/bin/doq"
let g:pydocstring_formatter = 'google'
nnoremap <leader>ds :Pydocstring<CR>

" Pytest
Plugin 'alfredodeza/pytest.vim'

" Python folding
Plugin 'tmhedberg/SimpylFold'
set foldcolumn=1  " for mouse folding

" Python better syntax highlighting
Plugin 'vim-python/python-syntax'
let g:python_highlight_all = 1

" multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" status themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_theme='violet'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Vim devicons
Plugin 'ryanoasis/vim-devicons'

" color schemes
Plugin 'flazz/vim-colorschemes'

" indent guides
Plugin 'yggdroot/indentline'

" increment sequence of numbers under visual selection
Plugin 'triglav/vim-visual-increment'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"=================================================================================================================
" CUSTOM BINDINGS AND CONFIGS
"=================================================================================================================

" Omni complete enable
set omnifunc=syntaxcomplete#Complete

" aliases for commands and stuff used temporarily
" source ~/.vim/alias.vim

set termguicolors
set background=dark
" Space vim dark setup
colorscheme space-vim-dark
hi LineNr ctermbg=NONE guibg=NONE
hi Comment guifg=#5C6370 ctermfg=59


" comments in italic
highlight Comment cterm=italic gui=italic

" split line character
set fillchars=vert:│

" Cursor styles
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"------------------------------------------------------------------------------------------------------------------
" brackets cursor placement
autocmd FileType php,c,java inoremap <expr> <cr>
   \   getline(".") =~ '\S\s*{$'                 ? "<bs><cr>{<cr>}<esc>O"
   \ : getline('.') =~ '^\s*{$'                  ? "<cr>}<esc>O"
   \ : getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>O"
   \ :                                             "<cr>"
"------------------------------------------------------------------------------------------------------------------

" buggy background color fix in kitty (xterm-kitty)
" set t_ut= | set ttyscroll=1
" let &t_ut=''

" splits below
set splitbelow

" netrw default open behavior
let g:netrw_browse_split = 4
let g:netrw_winsize = -28

"------------------------------------------------------------------------------------------------------------------
" Quick vim config
command SourceConfig source ~/.vimrc
command VimConfig tabedit ~/.vimrc
"------------------------------------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------------------------------------
" Auto reload open buffers when it is edited by other editors with notifs
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
"------------------------------------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------------------------------------
" Quick window resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . float2nr(winwidth(0) * 0.85)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . float2nr(winwidth(0) * 1.15)<CR>
"------------------------------------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------------------------------------
" Remove trailing white spaces
autocmd BufWritePre * %s/\s\+$//e
"------------------------------------------------------------------------------------------------------------------



"------------------------------------------------------------------------------------------------------------------
" Remove trailing white spaces
autocmd BufWritePre * %s/\s\+$//e
"------------------------------------------------------------------------------------------------------------------
