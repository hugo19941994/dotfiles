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
Plug 'tpope/vim-fugitive'
Plug 'sgur/vim-lazygutter' " lazy-loading version of vim-gutter
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'jamessan/vim-gnupg'
Plug 'kana/vim-operator-user' " to map <Plug>(operator-clang-format) to =
" Languages
Plug 'pangloss/vim-javascript', {'for': ['js', 'jsx', 'vue', 'html']}
Plug 'mxw/vim-jsx', {'for': ['js', 'jsx']}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoInstallBinaries'}
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': 'tex'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tikhomirov/vim-glsl'
Plug 'StanAngeloff/php.vim'
Plug 'leafgarland/typescript-vim'
Plug 'rhysd/vim-clang-format', {'for': ['cpp', 'c', 'h', 'hpp', 'cc', 'cs']}
Plug 'jvirtanen/vim-octave'
Plug 'w0rp/ale'
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
set mouse=a

" Plugin Settings
colorscheme jellybeans
let g:airline_theme = "jellybeans"
let g:gitgutter_max_signs = 1000

let g:jsx_ext_required = 0

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = "/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/usr/local/Cellar/llvm/5.0.0/lib/clang"

" Fix switch case indentation in cpp
:set cinoptions=l1

let g:clang_format#code_style = 'google'
let g:clang_format#style_options = {"Standard" : "C++17"}
autocmd FileType c, cpp ClangFormatAutoEnable
