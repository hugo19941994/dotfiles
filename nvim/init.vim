" vim-plug
call plug#begin()
" Interface
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Motions, tools
Plug 'cohama/lexima.vim' " auto close parentheses
Plug 'kien/ctrlp.vim'
Plug 'sgur/vim-lazygutter' " lazy-loading version of vim-gutter
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'jamessan/vim-gnupg'
" Languages
Plug 'pangloss/vim-javascript', {'for': ['js', 'jsx', 'vue', 'html']}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': 'tex'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'neomake/neomake'
Plug 'Vimjas/vim-python-pep8-indent'
" Code Completion
Plug 'zchee/deoplete-clang', {'for': ['c', 'cpp', 'h' , 'm']} " Requires clang
Plug 'zchee/deoplete-jedi', {'for': 'python'} " Requires jedi
Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make'} " Requires gocode
Plug 'mhartington/deoplete-typescript', {'for': 'ts'}
Plug 'Shougo/neco-syntax'
Plug 'zchee/deoplete-zsh', {'for': ['sh', 'zsh', 'bash']}
Plug 'Shougo/neoinclude.vim', {'for': ['c', 'cpp', 'h', 'm']}
call plug#end()

" Vim Settings
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
set clipboard=unnamedplus

" Plugin Settings
colorscheme jellybeans
let g:airline_theme = "jellybeans"
let g:gitgutter_max_signs = 1000

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = "/usr/local/Cellar/llvm/4.0.0_1/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/usr/local/Cellar/llvm/4.0.0_1/lib/clang"

let g:neomake_python_enabled_makers = ['flake8', 'mypy']
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake " Execute neomake after :w
" Format c & cpp code with clang-format
autocmd FileType c,cpp setlocal equalprg=clang-format\ -style=llvm
