;call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/neocomplete.vim'
Plug 'mhartington/oceanic-next'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let mapleader = ","
nmap ; :
set noswapfile

" Mouse controls
set ttyfast
set mouse=a
set ttymouse=xterm2

" Color Stuff
syntax on
set t_Co=256
colorscheme Tomorrow-Night-Eighties
"set background=dark
hi CursorLine cterm=none ctermbg=black

" Soft Wrap
set wrap!
nmap <Leader>w :set wrap!<CR>

" Enable Backspace
set backspace=indent,eol,start

" qq to quit in Insert
imap qq <Esc>
map q <Nop>

" invisibles
set listchars=tab:▸\ ,eol:¬
nmap <Leader>l set list!<CR>

" Show Line Numbers
set nu

" Show cursor line
set cursorline

" Visual clipboard to system
set clipboard=unnamed

" Highlight Whitespace
match ErrorMsg '\s\+$'

" ctrl-p ignore
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]node_modules|\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" neo complete
let g:neocomplete#enable_at_startup = 1

" NERDTree hotkey
map <Leader>t :NERDTreeToggle<CR>

" Airline
set noshowmode
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline_theme = 'base16_eighties'

