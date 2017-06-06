"-------------------------------------------------------------
" General
"-------------------------------------------------------------

" Syntax coloring
syntax enable

" Shows line number
set number

"Always show current position
set ruler

" Tabs = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Smart tab and indent
set smarttab
set autoindent
set smartindent

" Auto read when a file is changed from the outside
set autoread

" Highlights matching [{()}]
set showmatch

" Enables mouse
set mouse=a

" Enable 256 colors palette in Gnome Terminal
set t_Co=256

" UTF-8 encoding
set encoding=utf-8

" TabComplete like bash
set wildmenu
set wildmode=longest,list,full

" No swap file creation
set noswapfile

" Request sudo password to modify root files
cmap w!! %!sudo tee % > /dev/null

" To navigate in lines without line break (large line)
imap <up> <esc>gk<insert><right>
imap <down> <esc>gj<insert><right>
map <up> gk
map <down> gj

" Copy, cut and past to clipboard
set clipboard=unnamedplus

" Always show status line
set laststatus=2

"-------------------------------------------------------------
" Vundle
"-------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-------------------------------------------------------------
" YouCompleteMe
"-------------------------------------------------------------

highlight Pmenu ctermfg=white ctermbg=darkgray
highlight PmenuSel ctermfg=black  ctermbg=white
highlight clear SignColumn

let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Remove preview window
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

" Remove diagnostics
let g:ycm_show_diagnostics_ui = 0

"-------------------------------------------------------------
" Vim airline
"-------------------------------------------------------------

" set the symbol dictionary as the one of powerline
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Theme
let g:airline_theme='wombat'
