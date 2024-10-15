" F2     : function lise
" F3     : tabprevious<cr>
" F4     : tabnext<cr>
" Ctrl + E: Nerd-tree
"#######################################################
" sudo apt-get install fonts-powerline
" sudo apt-get install silversearcher-ag
"#######################################################
"vim plug :! PlugInstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"theme
Plug 'dracula/vim', { 'as': 'dracula' }
"tools
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
"Plug 'valloric/youcompleteme'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/bash-support.vim'
call plug#end()
colorscheme dracula

"about tab 
set showtabline=2
set splitbelow
set splitright

"about space
set expandtab "retab to replace all tabs
set softtabstop=4
set shiftwidth=4
set tabstop=4

"vim setting
set nocompatible
set clipboard=unnamed 
set ruler
set number
set autoindent
set wrap
set linebreak
set noshowmode
set showcmd
set scrolloff=3
set cursorline
set cindent
"about search 
set hlsearch 
set ignorecase
set incsearch
set smartcase

"about scheme & color
syntax on
"syntax
au BufNewFile,BufRead *.[Jj]enkinsfile set syntax=groovy

try
	"colorscheme default
catch
	"colorscheme default
endtry

"about filetype
filetype on
filetype indent on
filetype plugin on

"ctags bug setting
set tags=tags;

nmap <C-e> :NERDTreeToggle<CR>
map <F2> :TagbarToggle<CR>
map <F3> :tabprevious<cr>
map <F4> :tabnext<cr>
"Ctrl + ] to function , Ctrl + t back to position
"Clear last search highlighting
map <Space> :noh<cr>

vmap <Tab> >>
vmap <S-Tab> <
imap qq <Esc>
nmap <enter> o

"ack search
nnoremap FF :Ack!<Space>' ' %
nnoremap FA :Ack!<cword> %<CR>
"seach related keywork
nnoremap FFL :Ack!<Space>'^(?!\s*\\#)^(?!\s*\-)^(?!\s*\[)^(?!\s*\()^(?!\s*\if )^(?!\s*elif )^(?!.*echo )^(?!.*make ).*(local \|^declare \|^function \|.*?=.*?)' %<CR> <C-w>L :vert res -40<CR>

"nnoremap FFF :Ack<Space>local |declair |function %
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Convert tab to spaces
map <C-t> :call TabToSpaces()<CR>
map! <C-t> <Esc>:call TabToSpaces()<CR>
function TabToSpaces()
    retab
    echo "Convert tab to spaces."
endfunction


" autocmd 
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

if executable("ruby")
	autocmd BufRead, BufNewFile *.rb noremap <F5> :% w !ruby -w<Enter>
else
	autocmd BufRead, BufNewFile *.rb noremap <F5> :echo "you need to install Ruby first!"
endif

if executable("node")
	autocmd BufRead, BufNewFile *.rb noremap <F5> :% w !node<Enter>
else
	autocmd BufRead, BufNewFile *.rb noremap <F5> :echo "you need to install NodeJs first!"
endif

let tlist_sh_settings = 'sh;f:functions;v:variables;c:constants'
let g:tagbar_sort = 0
let g:tagbar_type_sh = {
    \ 'kinds':[
    \ 'f:functions',
    \ 'c:constants',
    \ 'v:variables'
    \ ]
    \}

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let NERDTreeMinimalUI = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:snipMate = { 'snippet_version' : 1 }

