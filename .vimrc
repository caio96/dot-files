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

" Smart tab and indent
set smarttab
set autoindent
set smartindent

" Highlights matching [{()}]
set showmatch

" Enables mouse
set mouse=a

" Enable 256 colors palette
set t_Co=256

" UTF-8 encoding
set encoding=utf-8

" Backspace like most other apps
set backspace=indent,eol,start

" Show invisibles
set list
set showbreak=󱞩
set listchars=tab:›\ ,trail:·,extends:»,precedes:«,nbsp:⣿,eol:¬

" Change line after reaching last character
set whichwrap+=<,>,h,l,[,]

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

" Always show the sign column
set signcolumn=yes

" Show lines bellow or above scrolling
set scrolloff = 2
set sidescrolloff = 5

" Last line will be showed as much as possible
set display+=lastline

" Set true color
if v:version > 800
    " set Vim-specific sequences for RGB colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

"--------------------------------------"
" Avoid scrolling when switch buffers  "
"--------------------------------------"

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

"--------------------------------------"
"              Mapping                 "
"--------------------------------------"

" leader mapping
let mapleader = "<space>"
let g:mapleader = "<space>"

" up/down arrow keys move by screen line
nnoremap <Up> g<Up>
nnoremap <Down> g<Down>
vnoremap <Up> g<Up>
vnoremap <Down> g<Down>
inoremap <Up> <C-o>g<Up>
inoremap <Down> <C-o>g<Down>

" switch to the next buffer in the buffer list
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" indent and return the same line where you were
map <F3> mzgg=G`z

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
vnoremap <C-h> <gv
vnoremap <C-l> >gv

"--------------------------------------"
"              AutoCmd                 "
"--------------------------------------"

" Triger autoread when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"--------------------------------------"
"              Plugins                 "
"--------------------------------------"

" Vim Plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()

"color themes
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'lambdalisue/suda.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'max397574/better-escape.nvim'
Plug 'tpope/vim-sleuth'

call plug#end()

"--------------------------------------"
"           Plugins config             "
"--------------------------------------"

" Color themes options

" Dracula color theme
colorscheme dracula
let g:airline_theme='dracula'

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

" gitgutter
"
" Don't map any keys
let g:gitgutter_map_keys = 0
" Default sign: ~_
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" Make Sign Column color the same color as the background
let g:gitgutter_override_sign_column_highlight = 1

" nerdcommenter
"
let g:NERDCreateDefaultMappings = 0
" Toggle comments based on the first line
nnoremap <leader>cc :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <leader>cc :call nerdcommenter#Comment(0,"toggle")<CR>

" nerdtree
"
" Remove arrows from folders
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"
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

" vim visual multi
"
" mappings
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n


