" ### vim-plug ###
call plug#begin()
" # Interface
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" # Motions, tools
Plug 'easymotion/vim-easymotion'
Plug 'cohama/lexima.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'         " Sublime style multiple cursors
" # Languages
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }    " Requires nodejs & npm
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'nono/jquery.vim'
Plug 'moll/vim-node'
Plug 'LaTeX-Box-Team/LaTeX-Box'             " LaTeX utilities
Plug 'klen/python-mode'
Plug 'Quramy/tsuquyomi'                     " Typescript
Plug 'leafgarland/typescript-vim'           " Typescript syntax
Plug 'jason0x43/vim-js-indent'              " Typescript indenting
" # Completion & lint
Plug 'Shougo/deoplete.nvim'					" Async Code Completion Engine
Plug 'Shougo/vimproc', { 'do' : 'make' }
Plug 'zchee/deoplete-clang'                 " Clang sources for Deoplete
Plug 'zchee/deoplete-jedi'					" Deoplete Python sources, requires jedi
Plug 'zchee/deoplete-go', { 'do': 'make'}	" Deoplete Go sources, required Gocode
Plug 'mhartington/deoplete-typescript'
Plug 'Shougo/neoinclude.vim'                " Deoplete #include source
Plug 'Shougo/neco-vim'                      " Deoplete vim source
Plug 'scrooloose/syntastic'                 " Requires cpplint, pylint
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" ### Vim Settings ###
filetype plugin indent on
syntax on

set undofile
set undodir=~/.config/nvim/undo
set noswapfile
set wildmenu
set wildmode=longest,list,full
set ignorecase
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
set completeopt-=preview

" ### Plugin Settings ###
colorscheme jellybeans

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#flags = ['-x', 'c++', '-std=c++14']

" Disable Python Mode autocompletion
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

let g:syntastic_check_on_open = 1
let g:syntastic_cpp_cpplint_exec = '/usr/bin/cpplint'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++14'
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_typescript_tsc_fname = ''   "Workaround to check tsconfig.json

let g:airline_theme = "jellybeans"
let g:airline_left_alt_sep = ' | '
let g:airline_left_sep = ''
let g:airline_right_alt_sep = ' | '
let g:airline_right_sep = ''

" Close quickfix window automatically
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END
