"
" Use pathogen to easily modify the runtime path to include all plugins under the ~/.vim/bundle directory
"
call pathogen#helptags()
call pathogen#infect()

"
" FUGITIVE GBLAME FIX
"
au BufReadPost fugitive://* set bufhidden=delete

"
" 'must haves'
"
set hidden
set wrap
set linebreak
set nolist
set backspace=indent,eol,start 	" allow backspacing in insert mode
set autoindent 			" autoindent
set copyindent 			" use last indentation for this one
set number 			" show line numbers
set showmatch     		" set show matching parenthesis
set ignorecase    		" ignore case when searching
set smartcase     		" ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch      		" highlight search terms
set incsearch     		" show search matches as you type
set mouse=a			" enable the mouse
set laststatus=2
set t_Co=256
set clipboard=unnamed
"set so=999
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
scriptencoding utf-8
set encoding=utf-8

"
" GLOBAL REMAPS
"
nmap ; :

"
"CHANGE THE LEADER
"
let mapleader=","

"
" helpful bits
"
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile

"
" File Type Plugin
"
filetype plugin indent on
filetype plugin on
"
" RUBIX SPECIFIC FILE TYPES
"
au BufRead,BufNewFile *.rbx setfiletype json
au BufRead,BufNewFile *.hbs setfiletype html
au BufRead,BufNewFile *.phtml setfiletype html
au BufRead,BufNewFile *.es6 setfiletype javascript

"
" GUI RUNNING OPTIONS
"
if &t_Co>=256 || has("gui_running")
  syntax enable
  "let g:hybrid_use_iTerm_colors = 1
  set cursorline
  colorscheme railscasts
  set background=light
endif

nmap <leader>dd :colorscheme railscasts \| :set background=dark<CR>
nmap <leader>ll :colorscheme summerfruit256 \| set background=light<CR>

"
" SYNTAX HIGHLIGHTING
"
if &t_Co >= 2
  syntax on
endif

"
" WHITESPACE HIGHLIGTING
"
set listchars=tab:▸\ ,eol:¬,trail:•,extends:»,precedes:«
nmap <leader>l :set list!<CR>

"
" NERDTREE
"
autocmd vimenter * NERDTree
map <leader>t :NERDTreeToggle<CR>

"
" airline
"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'powerlineish'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

"
" SPLITS
"
set splitbelow
set splitright
"SPLIT NAVIGATION [kjhl]
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>v= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>v- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

"
" BUFFER
"
nmap <leader>b :bnext<CR>
nmap <leader>n :bprevious<CR>

"
" EMMIT REMAP
"
imap <leader><Tab> <c-y>,
nmap <leader><Tab> <c-y>,

"
" CODE FOLDING
"
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=4         "this is just what i use
set foldcolumn=4

"
" JAVASCRIPT SPECIFIC CODE FOLDING
"
" au FileType javascript call JavaScriptFold()

"
" TRIM TRAILING WHITESPACE
"
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

"
" REMAP THE CAPSLOCK KEY TO ESCAPE
" turn off recording first
map q <Nop>
imap qq <Esc>
vmap qq <Esc>
imap $$ <C-o>$

set autoread
nmap <Leader>f :set foldenable!<CR>

"
" EMMET
"
let g:user_emmet_mode='a'
let g:user_emmet_leader_key=',,'

"
" SYNTASTIC
"
let g:syntastic_javascript_checkers = ['eslint']
