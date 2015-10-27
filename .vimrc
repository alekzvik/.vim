set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'honza/vim-snippets'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'wincent/Command-T'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'majutsushi/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'tmhedberg/SimpylFold'

call vundle#end()

filetype plugin indent on
let mapleader=" "


syntax on
set background=dark
set nowrap
set modeline
set modelines=5
set nofoldenable
set splitright
set noshowmatch
set autoindent
set autoread
set noacd
set backspace=2
set completeopt-=preview
set complete=.,b
set encoding=utf-8
set expandtab
set gdefault
set hidden
set history=1000
" set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set noswapfile
set number
set path+=**
set ruler
set scrolloff=99
set shell=/bin/bash
set shiftwidth=4
set switchbuf=usetab
set t_Co=256
set tags=./tags;
set tabstop=4
set undodir=~/.vim/undos
set undofile
set undolevels=1000
set wildmode=list:longest
set viminfo+=n~/.vim/viminfo
set wildignore+=*.pyc
set clipboard=unnamed

colorscheme tomorrow-night

" Create needed directories if they don't exist
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" ===== NERDTree =====
nmap ,N :NERDTreeFind<CR>
nmap ,nc :NERDTreeClose<CR>
nmap ,nn :NERDTreeFocus<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let NERDTreeHighlightCursorLine = 1
let NERDTreeShowLineNumbers=0

" ===== TagBar =====
nmap ,qq :TagbarOpen fj<CR>
nmap ,qc :TagbarClose<CR>

" no autoopen doc preview
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" list buffers
nmap ,t :CommandT<CR>
nmap ,b :CommandTBuffer<CR>
" search in tags
nmap ,T :CommandTTag<CR>

let g:CommandTMatchWindowReverse = 1
let g:CommandTHighlightColor = 'PMenu'

nmap ,u :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_help = 0
let g:gundo_close_on_revert = 1
let g:gundo_width = 5

inoremap jk <ESC>l
inoremap HH <C-o>I
inoremap LL <C-o>A
inoremap KK <C-o>O
inoremap JJ <C-o>o
inoremap CC <C-o>C
inoremap SS <C-o>S

map <leader>l <c-w>l
map <leader>h <c-w>h
map <leader>k <c-w>k
map <leader>j <c-w>j

" unset the last search pattern
nnoremap <CR> :noh<CR><CR>

" custom mappings for exiting and saving
map QQ :qa!<CR>
map ZZ :wqa!<CR>

map [n :lnext<CR>
map [p :lprev<CR>

map <F8> :SyntasticCheck<CR>

let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsListSnippets = "<c-l>"

" fix clear screen shortcut
inoremap <c-x><c-k> <c-x><c-k>

" Open the file on the last exit place
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" autodetect python filetype
au BufRead,BufNewFile *.py        set filetype=python

" Enable omni completion and set filetype indent settings.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS shiftwidth=2 tabstop=2 colorcolumn=80
autocmd FileType html,markdown,htmldjango setlocal omnifunc=htmlcomplete#CompleteTags shiftwidth=2 tabstop=2 colorcolumn=120
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS shiftwidth=2 tabstop=2 colorcolumn=80
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags shiftwidth=2 tabstop=2
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete colorcolumn=73,80

autocmd FileType rst setlocal filetype=text

" nicer colors
highlight DiffAdd           ctermbg=None ctermfg=119
highlight DiffDelete        ctermbg=None ctermfg=167
highlight DiffChange        ctermbg=None ctermfg=227
highlight DiffText          ctermbg=None ctermfg=98

" trim whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

let python_version_2 = 1
let python_highlight_space_errors = 0
let python_highlight_all = 1
let python_print_as_function = 0

set pastetoggle=<F10>

autocmd insertenter * set cul
autocmd insertleave * set nocul

" insert blank lines
nnoremap <silent> ]<leader> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<leader> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

" make Alt key work properly
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeoutlen=1000 ttimeoutlen=0

nmap <Leader> <Plug>(easymotion-prefix)
nmap / <Plug>(easymotion-sn)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion "
let g:EasyMotion_smartcase = 1
let g:EasyMotion_move_highlight = 0
let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj;ASDGHKLQWERTYUIOPZXCVBNMFJ:'
let g:Easymotion_do_mapping = 0
let g:EasyMotion_prompt = '>>> '
map s <Plug>(easymotion-s)

vnoremap ,s :sort<CR>
vnoremap < <gv
vnoremap > >gv

let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = {"mode": "passive"}
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5

" vim-airline settings
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#wordcount#enabled = 0

vmap ,F <Plug>CtrlSFVwordExec
nmap ,ft :CtrlSFToggle<CR>
nmap ,ff <Plug>CtrlSFCwordExec
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_context = '-B 2 -A 1'

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap ,r :RangerChooser<CR>

nmap ,g :YcmCompleter GoTo<CR>
nmap K :YcmCompleter GetDoc<CR>
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1

let delimitMate_nesting_quotes = ['"',"'"]
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

nnoremap <space> za
