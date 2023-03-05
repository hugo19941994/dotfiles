" vim-plug
call plug#begin()
" Interface
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Code highlighting
"Plug 'wincent/terminus' " Bracketed paste mode inside tmux
" Motions, tools
"Plug 'cohama/lexima.vim' " auto close parentheses
Plug 'kien/ctrlp.vim' " Fuzzy finder
Plug 'tpope/vim-fugitive' " Git integration
Plug 'sgur/vim-lazygutter' " lazy-loading version of vim-gutter
"Plug 'tpope/vim-repeat' " Repeat actions using .
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'jamessan/vim-gnupg' " Edit .gpg files directly
" Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
" Languages
Plug 'neovim/nvim-lspconfig'
"Plug 'w0rp/ale' " Linter and fixers
"Plug 'pangloss/vim-javascript', {'for': ['js', 'jsx', 'vue', 'html']}
"Plug 'mxw/vim-jsx', {'for': ['jsx']}
"Plug 'posva/vim-vue', {'for': 'vue'}
"Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoInstallBinaries'}
"Plug 'othree/html5.vim'
"Plug 'elzr/vim-json'
"Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': 'tex'}
"Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'tikhomirov/vim-glsl'
"Plug 'leafgarland/typescript-vim'
"Plug 'chr4/nginx.vim'
" Code Completion
"Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'} " Auto completion
"Plug 'zchee/deoplete-clang', {'for': ['c', 'cpp', 'h' , 'm']} " Requires clang
"Plug 'zchee/deoplete-jedi', {'for': 'python'} " Requires jedi
"Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make'} " Requires gocode
"Plug 'mhartington/deoplete-typescript', {'for': 'ts'}
"Plug 'zchee/deoplete-zsh', {'for': ['sh', 'zsh', 'bash']}
"Plug 'Shougo/neoinclude.vim', {'for': ['c', 'cpp', 'h', 'm']}
"Plug 'Shougo/echodoc.vim'
call plug#end()

lua require('init')

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
set formatoptions+=j
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

let g:jsx_ext_required = 1

let g:echodoc#enable_at_startup	 = 1
set cmdheight=2

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = "/usr/local/Cellar/llvm/6.0.0/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/usr/local/Cellar/llvm/6.0.0/lib/clang"

" Fix switch case indentation in cpp
:set cinoptions=l1

" ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" easymotion
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:ale_fixers = {'javascript': ['prettier'], 'typescript': ['prettier'], 'json': ['prettier'], 'css': ['prettier'], 'scss': ['prettier'], 'cpp': ['clang-format'], 'python': ['autopep8']}
let g:ale_linters = {
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['tslint', 'prettier', 'tsserver', 'typecheck'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'cpp': ['clangtidy', 'clang'],
\   'docker': ['hadolint'],
\   'python': ['flake8']
\}
let g:ale_fix_on_save = 1
let g:ale_c_clangformat_options = '-style="{BasedOnStyle: llvm, IndentWidth: 4, ColumnLimit: 100}"'
let g:ale_cpp_clangtidy_checks = ['*', '-fuchsia*']
let g:ale_javascript_prettier_options = '--print-width 120 --tab-width 4 --single-quote true'
let g:ale_python_autopep8_options = '--max-line-length=120'
let g:ale_python_flake8_options = '--max-line-length=120'
let NERDTreeShowHidden=1
set list listchars=tab:»\ ,trail:·,nbsp:⎵,precedes:<,extends:>
