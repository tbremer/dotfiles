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
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
call plug#end()

let mapleader = ","
nmap ; :
set noswapfile
nnoremap Q <nop>
set nu
set cursorline
set clipboard=unnamed
match ErrorMsg '\s\+$'

" Mouse controls
set ttyfast
set mouse=a
set ttymouse=xterm2

" Color Stuff
syntax on
set t_Co=256
colorscheme Tomorrow-Night-Eighties
hi CursorLine cterm=none ctermbg=238

" MacVim work
if has("gui_running")
	set encoding=utf-8
	set guifont=Literation\ Mono\ Powerline:h12
endif

" Fold setup
autocmd FileType javascript,json setlocal foldmethod=indent

" Soft Wrap
set wrap!
nmap <Leader>w :set wrap!<CR>

" Enable Backspace
set backspace=indent,eol,start

" qq to quit in Insert
imap qq <Esc>
map q <Nop>

" Bind $$ to end of line
:imap $$ <Esc>$a

" buffnext / buffprevious
:nnoremap <Leader>n :bnext<CR>
:nnoremap <Leader>p :bprev<CR>

" invisibles
set listchars=tab:▸\ ,eol:¬
nmap <Leader>l :set list!<CR>
set list!

" Remove White Space
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" ctrl-p ignore
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]node_modules|\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" neo complete
let g:neocomplete#enable_at_startup = 1

" NERDTree hotkey
map <Leader>t :NERDTreeToggle<CR>

" Pretty Print JSON
:command JsonPretty :%!python -m json.tool
:command JsonMinify :%!python -c "import json,sys;print(json.dumps(json.load(sys.stdin)))"

" Airline
set noshowmode
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline_theme = 'base16_eighties'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Syntasttic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
