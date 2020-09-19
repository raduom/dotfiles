""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Vim setup
"
"                                 Provided by
"                            radu.ometita@gmail.com
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Nightmare mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" You do you.
set nocompatible

" Plugins
call plug#begin()

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Themes
Plug 'doums/darcula'
Plug 'lifepillar/vim-solarized8'
Plug 'franbach/miramare'
Plug 'fcpg/vim-farout'

" Latex
Plug 'lervag/vimtex'

" Statusline
Plug 'itchyny/lightline.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Comments
Plug 'tpope/vim-commentary'

" LSP
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}

" Haskell
Plug 'neovimhaskell/haskell-vim'

" HTML
Plug 'mattn/emmet-vim'

" Unicode
Plug 'chrisbra/unicode.vim'

call plug#end()

let g:tex_flavor="latex"

" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Making vim sane
" (https://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader)
set encoding=utf-8
set scrolloff=5
set autoindent
set copyindent " copy previous indentation on autoindenting
set noshowmode
set showcmd
set showmatch " show matching parenthesis
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set number
set number relativenumber
set undofile
set history=1000
set cursorline
set cmdheight=2
set updatetime=300
set signcolumn=yes
set autoread
set noswapfile
syntax sync fromstart " Large comments don't get properly handled

" Remove scrollbars
set go-=l go-=L go-=r go-=R

" Show tabs
set list
set listchars=tab:»·,trail:·

" Leader bindings
let mapleader="\\"
let maplocalleader=" "
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :Rg<cr>

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" Remove highlighted searches
nnoremap <leader><space> :noh<cr> 

" Wrapping
set wrap
set colorcolumn=85
au FocusLost * :wa

" Easy escape
inoremap jj <ESC>

" Disable formatting when pasting
set pastetoggle=<F2>

" GUI settings
set guifont=SourceCodePro-Regular:h16
colorscheme darcula

" Coc setup
source ~/.vim/coc-setup.vim
