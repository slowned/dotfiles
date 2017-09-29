set runtimepath^=~/.vim/bundle/ctrlp.vim
"----------------------plugins--------------------"
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Change Leader
let mapleader=','
let maplocalleader='\'

" Disable backups and swap files
set noswapfile
set nobackup
set nowritebackup

set shortmess=at   " Don't show 'Hit ENTER to continue' message
set mouse=a        " Enable mouse in all modes
set noerrorbells   " Disable error bells
set number         " Use normal numbers
set relativenumber " and relative line numbers
set autoread       " Automatically read a file when it is changed from the outside
set autowriteall   " Write all buffers
set lazyredraw     " Don't redraw while executing macros
set showcmd        " Show commands as you type them
set scrolloff=3    " Start scrolling three lines before the horizontal window border

" General:
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with .

" Editing Plugins: ----------------------------------------
Plug 'tpope/vim-surround'           " easy pair characters manipulation
Plug 'jiangmiao/auto-pairs'         " easy quoting, etc. ie: insert ' -> ''; [ -> []
Plug 'Lokaltog/vim-easymotion'      " jump, jump, jump around

" Code Formatting:---------------------------------------------------------------{{{
Plug 'godlygeek/tabular'

" Syntax Plugins:-------------------------------------------
Plug 'scrooloose/syntastic' " Syntax check

" Files:---------------------------------------------------------------{{{

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit'}

" let g:fzf_layout = { 'right': '~40%' }
nmap <c-p> :Files<cr>


Plug 'scrooloose/nerdtree'

" Show/Hide NerdTree
map <Leader>n :NERDTreeToggle<CR>
" Find current buffer in nerdtree
noremap <Leader>r :NERDTreeFind<CR>
let g:NERDTreeMapOpenVSplit='v'      " keep mappings between ctrlp and nerdtree concise
let NERDTreeIgnore=['\.pyc$', '\~$'] " Ignore irrelevant files like pyc and swap files


Plug 'christoomey/vim-tmux-navigator' " seamless vim/tmux navigation
"
" Window Navigation:
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" sane splitting
set splitbelow            " hsplits below by default
set splitright            " vsplits right by default
" au VimResized * :wincmd = " Resize splits when the window is resized
"
" Faster save
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>tn :tabnew<CR>

" Escape with jj
inoremap jj <ESC>

" Insert mode Movements
inoremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>l
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" Indentation:------------------------------------{{{

" Smart indentation of new lines
set autoindent
set smartindent

" Tab expansion settings
let tabsize = 2
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize
set expandtab " Use spaces instead of tabs


syntax on " Enable syntax highligting


" Plug End: ---------------------------------------------
call plug#end()            " required
filetype plugin indent on    " required

" no background for those vertical splits, they look ugly
hi VertSplit guibg=NONE ctermbg=NONE gui=NONE
