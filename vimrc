"################### Magic vimrc ###################
" ctrl+t : Convert tab to spaces
" F3     : tabprevious<cr>
" F4     : tabnext<cr>
"#######################################################

"vim plug :! PlugInstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"theme
Plug 'dracula/vim',{ 'as': 'dracula' }
"tools
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'valloric/youcompleteme'
Plug 'mileszs/ack.vim'
call plug#end()

"about tab 
set showtabline=2
set splitbelow
set splitright

"about space
set expandtab
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

"about scheme & color
syntax on

try
	colorscheme default
catch
	colorscheme default
endtry

"about filetype
filetype on
filetype indent on
filetype plugin on

"ctags bug setting
set tags=tags;

map <F3> :tabprevious<cr>
map <F4> :tabnext<cr>
nmap <F5> :NERDTreeToggle<CR>
"Ctrl + ] to function , Ctrl + t back to position
map <F6> :TagbarToggle<CR>

vmap <Tab> >>
vmap <S-Tab> <
imap qq <Esc>
nmap <enter> o



" Convert tab to spaces
map <C-t> :call TabToSpaces()<CR>
map! <C-t> <Esc>:call TabToSpaces()<CR>
function TabToSpaces()
    retab
    echo "Convert tab to spaces."
endfunction


" autocmd 
if executable("ruby")
	autocmd BufRead, BufNewFile *.rb noremap <F5> :% w !ruby -w<Enter>
else
	autocmd BufRead, BufNewFile *.rb noremap <F5> :echo "you need to install Ruby first!"
endif 