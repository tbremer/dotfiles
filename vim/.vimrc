" Plug!
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-buftabline'
Plug 'plasticboy/vim-markdown'
Plug 'vim-syntastic/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'shougo/neocomplete.vim'
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

" `$$` to EOL in insert
imap $$ <Esc>$a

" `qq` to quit in Insert
imap qq <Esc>
map q <Nop>

" Turn off .swp files
set noswapfile

" Enable Syntax Highlighting
syntax on
set t_Co=256
set encoding=utf-8
au BufNewFile,BufRead .babelrc set filetype=json

" Cursor line color
hi CursorLine cterm=none ctermbg=8
set cursorline

" Enable Backspace
set backspace=indent,eol,start

" Invisibles
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<
set list

"Invisible character colors
highlight NonText ctermfg=208 guifg=#4a4a59

" Folding
set fdm=syntax
set foldlevelstart=99


" NERDTree
map <Leader>t :NERDTreeToggle<enter>

" JSX Plugin
let g:jsx_ext_required = 0

" BuffTabLine Plugin
let g:buftabline_numbers = 1
let g:buftabline_separators = 1
hi TabLineSel cterm=none ctermbg=98 ctermfg=15
hi TabLine cterm=none ctermbg=236
hi TabLineFill cterm=none ctermfg=236
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Markdown Plugin
let g:vim_markdown_folding_disabled = 1

" Syntastic (http://usevim.com/2016/03/07/linting/)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" NeoComplete
let g:neocomplete#enable_at_startup = 1

