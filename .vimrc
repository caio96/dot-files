"--------------------------------------"
"               General                "
"--------------------------------------"

" Syntax coloring
syntax on

" No backwards compatibility
set nocompatible

" File type detection
filetype plugin indent on

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

" Show invisibles
set list
set showbreak=﬌
set listchars=tab:›\ ,trail:·,extends:»,precedes:«,nbsp:⣿,eol:¬

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

" If file is changed outside of vim and not changed
" inside vim, update file
set autoread

" Allows you to open a new file without saving the current one
set hidden

" Use dark variant colorscheme by default
set background=dark

" Stop showing preview
set completeopt-=preview

" Set true color
if !has('nvim') && (v:version > 800)
    " set Vim-specific sequences for RGB colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
elseif has('nvim')
    set termguicolors
endif

"--------------------------------------"
"              Mapping                 "
"--------------------------------------"

" leader mapping
let mapleader = "\\"
let g:mapleader = "\\"

" up/down arrow keys move by screen line
nnoremap <Up> g<Up>
nnoremap <Down> g<Down>

" switch to the next buffer in the buffer list
nnoremap <C-j> :bnext<CR>

" indent and return the same line where you were
map <F7> mzgg=G`z

" d deletes instead of cutting
nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

" leader-d to cut
nnoremap <leader>d "+d
nnoremap <leader>D "+D
vnoremap <leader>d "+d

" indent line multiple times when in visual mode
vnoremap < <gv
vnoremap > >gv

"--------------------------------------"
"              AutoCmd                 "
"--------------------------------------"

" Triger autoread when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

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

"color themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kristijanhusak/vim-hybrid-material'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'lambdalisue/suda.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'ryanoasis/vim-devicons'

if has("nvim")
    Plug 'w0rp/ale'
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
else
    "function! BuildYCM(info)
        "if a:info.status == 'installed' || a:info.force
            "!/usr/bin/python3 install.py --clang-completer
        "endif
    "endfunction
    "Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
endif

call plug#end()

"--------------------------------------"
"           Plugins config             "
"--------------------------------------"

" Color themes

" Gruvbox
" colorscheme gruvbox
" let g:airline_theme='gruvbox'

" Onedark
" colorscheme onedark
" let g:airline_theme='onedark'

" Paper color theme
" colorscheme PaperColor
" let g:airline_theme='wombat'

" Vim hybrid material
" colorscheme hybrid_reverse
" let g:airline_theme = 'hybrid'

" airline
"
" Set the symbol dictionary as the one of powerline
let g:airline_powerline_fonts = 1
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" devicons
"
" Airline configuration
let g:airline_powerline_fonts = 1

" suda
"
" Save readonly file with sudo with:
" :w suda:%
let g:suda#prefix = 'suda:'

" gitgutter
"
" Don't map any keys
let g:gitgutter_map_keys = 0
" Default sign: ~_
let g:gitgutter_sign_modified_removed   = '~'

" nerdcommenter
"
" Toggle comments based on the first line
map <leader>cc :NERDComToggleComment<CR>

" nerdtree
"
" Remove arrows from folders
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"
" enable nerdtree and decorate folders
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:webdevicons_enable_nerdtree = 1
" Open and close nerdtree
map <F2> :NERDTreeToggle<CR>
" Close vim if only nerdtree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf
"
nnoremap <C-p> :FZF<CR>

" vim better whitespace
"
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=1
" strip to any file size
let g:strip_max_file_size=0

" vimwiki
"
" Use markdown syntax
let g:vimwiki_ext2syntax = {'.wiki': 'markdown'}
" Headers with different colors
let g:vimwiki_hl_headers = 1
" Highligh checked [X]
let g:vimwiki_hl_cb_checked = 1
" Add syntax highlight
let wiki = {}
let wiki.path = "$HOME/.vimwiki"
let wiki.nested_syntaxes = {'python': 'py', 'cpp': 'cpp', 'sh': 'sh'}
let g:vimwiki_list = [wiki]

if has("nvim")

    " colorscheme
    "
    colorscheme gruvbox
    let g:airline_theme='gruvbox'

    " coc
    "
    " install nodejs and yarn
    " install plugins:
    " :CocInstall coc-python
    " :CocInstall coc-word
    " pip install 'python-language-server[all]'
    " install clangd and ccls
    " config in ~/.config/nvim/coc-settings.json
    " Use <c-space> for trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()
    " Use enter to confirm complete
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Use Ctrl-] to go to definition
    nmap <silent> <C-]> <Plug>(coc-definition)

    " ale
    "
    " Set this in your vimrc file to disabling highlighting
    let g:ale_set_highlights = 0
    " lint only when saving file
    let g:ale_lint_on_text_changed = 'never'
    " airline integration.
    let g:airline#extensions#ale#enabled = 1
    " message format
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
    let g:ale_sign_column_always = 1
    " custom error and warning signs
    let g:ale_sign_error = "◉"
    let g:ale_sign_warning = "◉"
    " C-e to next message
    nmap <silent> <C-e> <Plug>(ale_next_wrap)
    " <leader> ff to fix file
    nmap <leader>ff <Plug>(ale_fix)
    " linters and fixers
    let g:ale_linters = {}
    let g:ale_fixers = {}
    " python
    let g:ale_linters.python = ['flake8', 'pylint']
    let g:ale_fixers.python = [ 'yapf', 'autopep8', 'isort', 'black']
    " cpp
    " install cppcheck and clang
    let g:ale_linters.cpp = ['clang', 'cppcheck']
    let g:ale_fixers.cpp = [ 'clang-format', 'uncrustify']
    let g:ale_c_clangformat_options = '-style="{IndentWidth: 4, ColumnLimit: 120}"'

else

    " Paper color theme
    colorscheme PaperColor
    let g:airline_theme='wombat'

    " youcompleteme
    "
    " let g:ycm_python_binary_path = '/usr/bin/python3'
    " let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
    " let g:ycm_global_ycm_extra_conf = '$HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
    " nnoremap <silent>  <C-]>  :YcmCompleter GoTo<CR>
endif

