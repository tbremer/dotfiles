" Cursor Setting
autocmd InsertEnter,InsertLeave * set cul!

" Y to yank to clipboard
vmap Y "*y

" Split to right and below
set splitright
set splitbelow
" Vertical splits resize with + / _
nn <Leader>= 5<C-W>>
nn - 5<C-W><

" Horizontal splits resize with - / =
nn + 5<C-W>+
nn _ 5<C-W>-

" Map leader and semicolon
let mapleader=","
nmap ; :

" $$ to eol when in insertmode
imap $$ <Esc>$a

" No swap files
set noswapfile

" Default to linenubmers on
set number

" allow splits to be unequal sizes.
set noequalalways

" Buffer stuff
set hidden
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

" Invisibles
set noeol
set listchars=eol:¬,tab:▸\ ,trail:•,extends:>,precedes:<
set list
set cc=80
highlight NonText ctermfg=242
highlight SpecialKey ctermfg=242

" Plug!
call plug#begin()
	Plug 'ap/vim-buftabline'
	Plug 'preservim/nerdtree'
	Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

" NERDTree Filetype changes
au FileType nerdtree hi CursorLine cterm=italic ctermbg=0
au FileType nerdtree hi Normal ctermbg=none
au FileType nerdtree hi link Cursor CursorLine
nmap <silent> <Leader>t :NERDTreeToggle<CR>


" IndentGuides
let g:indent_guides_enable_on_vim_startup = 1
