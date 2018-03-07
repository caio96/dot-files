"--------------------------------------"
"               General                "
"--------------------------------------"

" Syntax coloring
syntax enable

" File type detection
filetype plugin on

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
set undodir=~/.vim/undo//

" Swap file location
set directory=~/.vim/swap//

" Disable highlight of search matches
set nohlsearch

" Case insensitive search, sensitive when uppercase present
set ignorecase
set smartcase

" Copy, cut and past to clipboard
set clipboard=unnamedplus

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

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'lambdalisue/suda.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': './install --bin' }

if has("nvim")
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-clang'
    Plug 'zchee/deoplete-jedi'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'honza/vim-snippets'
    Plug 'w0rp/ale'
else
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }
endif

call plug#end()

"--------------------------------------"
"           Plugins config             "
"--------------------------------------"

" airline
"
" Set the symbol dictionary as the one of powerline
let g:airline_powerline_fonts = 1
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" suda
"
" Save readonly file with sudo with:
" :w suda:%
let g:suda#prefix = 'suda:'

" gitgutter
"
" Don't map any keys
let g:gitgutter_map_keys = 0

if has("nvim")
    
    " onedark
    "
    colorscheme onedark
    let g:airline_theme='onedark'

    " deoplete
    "
    let g:deoplete#enable_at_startup = 1
    " tab alternate completion
    inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    
    " neosnippet
    "
    let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)
    " jump to completion fields with tab
    imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " ale        
    "
    " airline integration.
    let g:airline#extensions#ale#enabled = 1
    " message format
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
    " delay on text changed
    let g:ale_lint_delay = 1000
    let g:ale_sign_column_always = 1
    " C-e to next message
    nmap <silent> <C-e> <Plug>(ale_next_wrap)
    " fix python files with autopep8 and yapf.
    let g:ale_fixers = { 'python': ['autopep8', 'yapf'] }

else

    " dracula
    "
    colorscheme dracula
    let g:airline_theme='dracula'

    " youcompleteme
    "
    let g:ycm_python_binary_path = '/usr/bin/python3'
    let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
    let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
    nnoremap <silent>  <C-]>  :YcmCompleter GoTo<CR>

endif




