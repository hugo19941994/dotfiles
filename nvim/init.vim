" ### vim-plug ###
call plug#begin()
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'marijnh/tern_for_vim'
Plug 'Valloric/YouCompleteMe'
Plug 'pangloss/vim-javascript'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'fatih/vim-go'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'nono/jquery.vim'
Plug 'moll/vim-node'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'klen/python-mode'
call plug#end()

" ### Vim Settings ###
filetype plugin indent on
syntax on

set undofile
set undodir=~/.config/nvim/undo
set noswapfile
set wildmode=longest,list,full
set wildmenu
set ignorecase
set smartcase
set gdefault
set showmatch
set backspace=indent,eol,start
set shortmess+=I
set number
set hlsearch
set incsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set ai
set laststatus=2

" ### Plugin Settings ###
colorscheme jellybeans

let g:ycm_global_ycm_extra_conf = "~/.config/nvim/ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0

let g:rehash256 = 1

let g:nerdtree_open_on_console_startup=0

let delimitMate_autoclose = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

let g:syntastic_cpp_cpplint_exec='/usr/bin/cpplint'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++14'
let g:syntastic_cpp_checkers = ['cpplint']

let g:airline_theme="jellybeans"
let g:airline_left_alt_sep = ' | '
let g:airline_left_sep = ''
let g:airline_right_alt_sep = ' | '
let g:airline_right_sep = ''
