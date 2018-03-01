"--------------------------------------"
"               General                "
"--------------------------------------"

" Syntax coloring
syntax enable

" Shows line number
set number

"Always show current position
set ruler

" Tabs = 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Smart tab and indent
set smarttab
set autoindent
set smartindent

" Highlights matching [{()}]
set showmatch

" Enables mouse
set mouse=a

" Enable 256 colors palette in Gnome Terminal
set t_Co=256

" UTF-8 encoding
set encoding=utf-8

" Backspace like most other apps
set backspace=indent,eol,start

" Change line after reaching last character
set whichwrap+=<,>,[,]

" TabComplete like bash
set wildmenu
set wildmode=longest,list,full

" Turn off backup
set nobackup

" Persistent undo
set undofile
set undodir=~/.nvim/undo//

" Swap file location
set directory=~/.nvim/swap//

" Case insensitive search, sensitive when uppercase present
set smartcase

" Copy, cut and past to clipboard
set clipboard+=unnamedplus

" Always show status line
set laststatus=2

"--------------------------------------"
"              Mapping                 "
"--------------------------------------"

" Up/down arrow keys move by screen line
nnoremap <Up> g<Up>
nnoremap <Down> g<Down>

"--------------------------------------"
"              Plugins                 "
"--------------------------------------"

" Vim Plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" NeoVim Plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'haya14busa/incsearch.vim'
Plug 'sheerun/vim-polyglot'
Plug 'lambdalisue/suda.vim'

call plug#end()

"--------------------------------------"
"           Plugins config             "
"--------------------------------------"

" onedark

colorscheme onedark
let g:airline_theme='onedark'


" vim-airline

" Set the symbol dictionary as the one of powerline
let g:airline_powerline_fonts = 1
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'


" incsearch

" Turn off hlsearch after search
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


" suda

" save readonly file with sudo with:
" :w suda:%
let g:suda#prefix = 'suda:'
