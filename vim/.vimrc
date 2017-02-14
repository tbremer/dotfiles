" Plug!
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Enable Line Numbers
set number

" Mouse support
set mouse=a

" Clipboard
set clipboard=unnamed

" Leader override
let mapleader=","

" Remap colon to semi
nmap ; :

" Turn off .swp files
set noswapfile

" Enable Syntax Highlighting
syntax on
set t_Co=256
set encoding=utf-8

" Cursor line color
hi CursorLine cterm=none ctermbg=8
set cursorline

" `qq` to quit in Insert
imap qq <Esc>
map q <Nop>

" Enable Backspace
set backspace=indent,eol,start

" Invisibles
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<
set list
"Invisible character colors
highlight NonText ctermfg=208 guifg=#4a4a59

" NERDTree
map <Leader>t :NERDTreeToggle<enter>

