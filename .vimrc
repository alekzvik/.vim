" Pathogen
execute pathogen#infect()
" set syntax
syntax on
"
filetype plugin indent on
" enable color scheme support
set t_Co=256
" Set leader
let mapleader=","
" set colorscheme
colorscheme hybrid
" show line numbers
set number
" set encoding
set encoding=utf-8
" always show current position
set ruler
" set tabs to have 4 spaces
set ts=4
" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" show a visual line under the cursor's current line 
set cursorline
" show the matching part of the pair for [] {} and ()
set showmatch
" NerdTree
nmap <F2> :NERDTreeToggle<CR>
nmap <C-b> :CtrlPBuffer<cr>

map <Leader> <Plug>(easymotion-prefix)
" Bi-directional find motion
"
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
