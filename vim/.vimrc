;call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'elzr/vim-json'
Plug 'heavenshell/vim-jsdoc'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/jspc.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/BufOnly.vim'
call plug#end()

"
" VIM BASICS
"
" Set leader to ,
:let mapleader = ","

" Set : to ;
:nmap ; :

" Use the mouse
:set ttyfast
:set mouse=a
:set ttymouse=xterm2

" Color Scheme to 256 colors
" :set colorscheme
:set t_Co=256
:colorscheme Tomorrow-Night-Eighties

" Set softwrap to false
" Set wrap toggle to <Leader>w
:set wrap!
:nmap <Leader>w :set wrap!<CR>

" CODE FOLDS
:set foldmethod=indent
:set foldlevelstart=3

" auto complete
:set omnifunc=syntaxcomplete#Complete
let OmniCpp_NamespaceSearch = 2
:imap <Leader><Leader> <C-X><C-O>

" buffnext / buffprevious
:nnoremap <Leader>n :bnext<CR>
:nnoremap <Leader>p :bprev<CR>

" Backspace
:set backspace=indent,eol,start

" SET qq to quit while in Insert mode
:imap qq <Esc>
:map q <Nop>

" Open NERDTree with ,.
:nmap .<Leader> :NERDTreeToggle<CR>

" Show invisibles
:set listchars=tab:▸\ ,eol:¬
:nmap <Leader>l :set list!<CR>

" Show Line Numbers
:set nu

"Show CursorLine
:set cursorline

" Bind $$ to end of line
:imap $$ <Esc>$a

" Set Split stuff
:set splitbelow
:set splitright

" CtrlP Excludes
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules'
  \ }

" Clipboard visual to system
:set clipboard=unnamed

" STATUSLINE STUFF
:set laststatus=2
:set statusline=%f
:set statusline+=%=FileType:\ %y\ \|\ %l/%L\ -\ %c

" Highlight Whitespace
match ErrorMsg '\s\+$'

" Remove White Space
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

