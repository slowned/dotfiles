" set runtimepath^=~/.vim/bundle/ctrlp.vim
"----------------------plugins--------------------"
set nocompatible              " be iMproved, required
filetype off                  " required

" Change Leader
let mapleader=','
let maplocalleader='\'

" Disable backups and swap files
set noshowmode     " Hide modes status bar
set noswapfile
set nobackup
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
set ignorecase     " ignore case from / search
set nowrap         " do not cut the line with vs window
set nowritebackup  " do not cut the line with vs window

set wildignore+=*.meta

" Open terminal with F10: ------------------------------
" if has('nvim')
"     tmap <Esc> <C-\><C-n>
" endif

let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
nnoremap <f10> :call Term_toggle(10)<cr>
tnoremap <f10> <C-\><C-n>:call Term_toggle(10)<cr>
" --------------------------------------------------------

call plug#begin('~/.vim/plugged')
" General:
Plug 'vimlab/split-term.vim' " change terminal :7Term
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with .
Plug 'tpope/vim-fugitive' " to blame em all, Gdiff with origin 
Plug 'stephpy/vim-yaml' " yaml linter

" Editing Plugins: ----------------------------------------
" OmniShardConfigs  ---
Plug 'omnisharp/omnisharp-vim'      " abilities for C#  OmniSharpInstall  OmniSharpStartServer
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Conquer of Completion  :CocInstall
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'onsails/lspkind-nvim'
" OmniShardConfigs  ---
Plug 'tpope/vim-surround'           " easy pair characters manipulation
Plug 'Lokaltog/vim-easymotion'      " jump, jump, jump around
Plug 'ludovicchabant/vim-gutentags' " jump to function declaration


Plug 'mattn/emmet-vim'              " vim-emmet html complete i.e html:5_ ('_' cursosr position) Ctrl y ,
" create an html element h3_ctrl+t
imap <C-t> <></><Esc>5hdiwp3lpT>i

" Code Formatting:---------------------------------------------------------------{{{
" Plug 'valloric/youcompleteme' " Autocompletado wacho nunca me funko
Plug 'marijnh/tern_for_vim'  "  Tern-based JavaScript editing support @npm install -g tern
Plug 'joom/vim-commentary' " COmmentary gc
Plug 'psf/black' " Python auto styling code XD supa cheater NO LO USO
Plug 'godlygeek/tabular'
Plug 'mgedmin/python-imports.vim' "Vim script to help adding import statements in Python modules.

" Usage 
" Type ``:ImportName [<name>]`` to add an import statement at the top of the file.
map <F5>    :ImportName<CR>
" Type ``:ImportNameHere [<name>]`` to add an import statement above the current line.
map <C-F5>  :ImportNameHere<CR>

" Syntax Plugins:-------------------------------------------
Plug 'cburroughs/pep8.py'
" Plug 'scrooloose/syntastic' " Syntax check
Plug 'w0rp/ale'  " Syntax check ASYNCHRONOUS LINT ENGINE
Plug 'nvie/vim-flake8'


" Syntax Highlight:-------------------------------------------
Plug 'tomlion/vim-solidity'  " Solidity Syntax Highlight Plug 'posva/vim-vue' " Vue.js Syntax Highlight
Plug 'beyondwords/vim-twig' " Twig Syntax Highlight
autocmd FileType vue syntax sync fromstart

" VIM ENCHETING 
" footer [MODE]
" vim-airline puede ser una alternativa al lightline
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

Plug 'Yggdroot/indentLine' " Indent Line guide
let g:indentLine_setColors = 5
" let g:indentLine_char = 'c'

" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char_list = ['|']

" Files:---------------------------------------------------------------{{{

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit'}

let g:fzf_layout = { 'down': '~30%' }
nmap <c-p> :Files<cr>

Plug 'scrooloose/nerdtree'
map <Leader>n :NERDTreeToggle<CR> " Show/Hide NerdTree
noremap <Leader>r :NERDTreeFind<CR>  " Find current buffer in nerdtree
let g:NERDTreeMapOpenVSplit='v'      " keep mappings between ctrlp and nerdtree concise
let NERDTreeIgnore=['\.pyc$', '\~$'] " Ignore irrelevant files like pyc and swap files

" Plug 'rking/ag.vim' " :Ag [options] {pattern} [{directory}]
Plug 'christoomey/vim-tmux-navigator' " seamless vim/tmux navigation

" Window Navigation:
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" sane splitting
set splitbelow            " hsplits below by default
set splitright            " vsplits right by default
" au VimResized * :wincmd = " Resize splits when the window is resized


" Short cuts
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>tn :tabnew<CR>

" Escape with jk
inoremap jk <ESC>

" Insert mode Movements
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>l
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za


set clipboard=unnamedplus,unnamed " Use system wide clipboard by default


" Indentation:------------------------------------{{{

" Smart indentation of new lines
set autoindent
set smartindent

" Tab expansion settings
let tabsize = 2
execute "set tabstop=".tabsize
" indentation amount for flechitas
execute "set shiftwidth=".tabsize  
execute "set softtabstop=".tabsize  
set expandtab   " Use spaces instead of tabs


let python_highlight_all=1
syntax on " Enable syntax highligting
colorscheme default

" Clean highlight after search
nnoremap <F3> :noh<CR> 

" Plug End: ---------------------------------------------
call plug#end()            " required
filetype plugin indent on    " required

" no background for those vertical splits, they look ugly
hi VertSplit guibg=NONE ctermbg=NONE gui=NONE
