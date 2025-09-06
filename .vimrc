" Auto-install vim-plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Use vim-plug for plugin management
call plug#begin('~/.vim/plugged')

  " Sensible defaults
  Plug 'tpope/vim-sensible'
  " Auto indent default
  Plug 'tpope/vim-sleuth'
  " Better escape from insert mode
  Plug 'jdhao/better-escape.vim'
  " Cutlass for smarter deletion
  Plug 'svermeulen/vim-cutlass'
  " Gruvbox colorscheme
  Plug 'sainnhe/gruvbox-material'

call plug#end()

" Set colorscheme to gruvbox
silent! colorscheme gruvbox-material
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_disable_italic_comment = 1

" Use a dark background
set background=dark

" Enable line numbers
set number

" Enable mouse support
set mouse=a

" Enable clipboard integration (for most systems)
set clipboard=unnamedplus

" Better search
set ignorecase
set smartcase
set hlsearch

" UTF-8 encoding
set encoding=utf-8

" Enable true color support (if your terminal supports it)
if has('termguicolors')
  set termguicolors
endif

"--------------------------------------"
"              Plugins                 "
"--------------------------------------"

" Better escape settings
let g:better_escape_shortcut = ['jk']
let g:better_escape_interval = 200

"--------------------------------------"
"              Mapping                 "
"--------------------------------------"

" leader mapping
let mapleader = "<space>"
let g:mapleader = "<space>"

" switch to the next buffer in the buffer list
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Go to the next tab
nnoremap <leader><Tab> :tabnext<CR>

" Enter command mode
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" Go to the beginning/end of the line
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" Save file
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> <Esc>:w<CR>

" Move highlighted text
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Indent text
vnoremap <C-h> <gv
vnoremap <C-l> >gv

" Go up/down on wrapped lines
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj
inoremap <C-j> <C-O>gj
inoremap <C-k> <C-O>gk
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Paste without copying
vnoremap p P
" Paste copying selected text
vnoremap P p

" Half page jump keeps cursor centered
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Keep search items centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Disable ex mode
nnoremap Q <nop>

" Cut keys
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" Clear search highligh
nnoremap <silent> <cr> :noh<cr><cr>

"--------------------------------------"
"              AutoCmd                 "
"--------------------------------------"

" Guard for distributions lacking the persistent_undo feature.
if has('persistent_undo')    
  " define a path to store persistent_undo files.    
  let target_path = expand('~/.vim/undo/')
    " create the directory and any parent directories    
    " if the location does not exist.    
    if !isdirectory(target_path)        
      call system('mkdir -p ' . target_path)    
    endif
    " point Vim to the defined undo directory.    
    let &undodir = target_path
    " finally, enable undo persistence.    
    set undofile
endif

" When switching buffers, preserve window view.
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

