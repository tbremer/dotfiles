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
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-two-firewatch'
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
let g:two_firewatch_italics=1
colo two-firewatch
hi CursorLine cterm=none ctermbg=238
if strftime("%H") < 15
  set background=light
else
  set background=dark
endif

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

" leader number for buffers
nnoremap <Leader>1 :b1<CR>
nnoremap <Leader>2 :echo "This buffer is reserved for NERDTree"<CR>
nnoremap <Leader>3 :b3<CR>
nnoremap <Leader>4 :b4<CR>
nnoremap <Leader>5 :b5<CR>
nnoremap <Leader>6 :b6<CR>
nnoremap <Leader>7 :b7<CR>
nnoremap <Leader>8 :b8<CR>
nnoremap <Leader>9 :b9<CR>
nnoremap <Leader>0 :b10<CR>

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
"let g:airline_theme = 'base16_eighties'
let g:airline_theme='twofirewatch'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Syntasttic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

" JSX
let g:jsx_ext_required = 0
