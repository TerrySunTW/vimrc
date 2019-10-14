"################### Magic vimrc ###################
" ctrl+t : Convert tab to spaces
" F3     : tabprevious<cr>
" F4     : tabnext<cr>
"#######################################################


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

map <F3> :tabprevious<cr>
map <F4> :tabnext<cr>


vmap <Tab> >>
vmap <S-Tab> <
imap jj <Esc>
nmap <enter> o
set noremap


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