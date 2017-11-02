" Plug!
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-buftabline'
Plug 'plasticboy/vim-markdown'
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
Plug 'shougo/neocomplete.vim'
Plug 'guns/xterm-color-table.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug '~/Documents/dotfiles/vim/GitWildIgnore'
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

" `$$` to EOL in insert
imap $$ <Esc>$a

" `00` to BOL in insert
imap 00 <Esc>0i

" `qq` to quit in Insert
imap qq <Esc>
map q <Nop>

" Turn off .swp files
set noswapfile

" Split to right and below
set splitright
set splitbelow

" Enable Syntax Highlighting
syntax on
set t_Co=256
set encoding=utf-8
au BufNewFile,BufRead .babelrc set filetype=json

" Cursor line color
hi CursorLine cterm=none ctermbg=008
set cursorline

" ColumnColor
hi ColorColumn cterm=none ctermbg=256
set colorcolumn=80

" Cursor match color
hi MatchParen cterm=bold ctermbg=0 ctermfg=3

" Change Cursor Shape
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"inoremap <special> <Esc> <Esc>hl


" StatusLine Setup and Colors
set laststatus=2
set statusline=%M\ -\ %f\ %y\

hi StatusLine ctermfg=0 ctermbg=6
hi StatusLineNC ctermfg=0 ctermbg=244
au InsertEnter * hi StatusLine ctermfg=6 ctermbg=0
au InsertLeave * hi StatusLine ctermfg=0 ctermbg=6

"SignColumn Color
hi clear SignColumn
hi SignColumn cterm=bold

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
hi Folded cterm=bold ctermbg=256 ctermfg=007

" Trim White Space on Save
" Remove White Space
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" NERDTree
map <Leader>t :NERDTreeToggle<enter>
let loaded_netrwPlugin=1
let NERDTreeRespectWildIgnore=1

" JSX Plugin
let g:jsx_ext_required = 0

" BuffTabLine Plugin
let g:buftabline_numbers = 1
let g:buftabline_separators = 1
hi TabLineSel cterm=none ctermbg=000 ctermfg=098
hi TabLine cterm=none ctermbg=236
hi TabLineFill cterm=none ctermfg=236
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Markdown Plugin
let g:vim_markdown_folding_disabled = 1

" Syntastic (http://usevim.com/2016/03/07/linting/)

" Syntastic statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

" Point syntastic checker at locally installed `eslint_d` if it exists.
if executable('node_modules/.bin/eslint_d')
  let g:syntastic_javascript_eslint_exec = 'node_modules/.bin/eslint_d'
  autocmd VimLeave * !node_modules/.bin/eslint_d stop
elseif executable('node_modules/.bin/eslint')
  let g:syntastic_javascript_eslint_exec = 'node_modules/.bin/eslint'
endif

let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight SyntasticErrorSign ctermfg=1
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn

" NeoComplete
let g:neocomplete#enable_at_startup = 1

" end of default statusline (with ruler)
set statusline+=%=%(%l,%c%V\ %=\ %P%)

" emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
