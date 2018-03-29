" Plug!
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'ap/vim-buftabline'
Plug 'plasticboy/vim-markdown'
Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug '~/Documents/dotfiles/vim/GitWildIgnore'
Plug 'ryanoasis/vim-devicons'
Plug 'hhsnopek/vim-sugarss'
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
map qq <Nop>

" Turn off .swp files
set noswapfile

" Split to right and below
set splitright
set splitbelow

" Enable Syntax Highlighting
syntax on
set t_Co=256
set encoding=utf-8

" Set babelrc as json filetype
au BufNewFile,BufRead .babelrc set filetype=json

" GUI Font settings
set guifont=FuraCode\ Nerd\ Font:h12

" Cursor line color
hi CursorLine cterm=none ctermbg=008
set cursorline

" ColumnColor
hi ColorColumn cterm=none ctermbg=256
set colorcolumn=80

" Cursor match color
hi MatchParen cterm=bold ctermbg=0 ctermfg=3

" Change CursorLine on enter and leave InsertMode
autocmd InsertEnter * :hi CursorLine cterm=none ctermbg=none
autocmd InsertLeave * :hi CursorLine cterm=none ctermbg=008

" StatusLine Setup and Colors
set laststatus=2

" StatusLine Highlighting
hi StatusLine cterm=bold ctermfg=008 ctermbg=006
hi StatusLineNC cterm=none ctermfg=008 ctermbg=006
au InsertEnter * hi StatusLine cterm=bold
au InsertLeave * hi StatusLine cterm=none

" Syntastic statusline
hi SynWarn cterm=none,bold ctermfg=256 ctermbg=001
hi SynWarnInvert cterm=none,bold ctermfg=001 ctermbg=006
hi SLFileInfo cterm=none ctermfg=015 ctermbg=008
hi SLBoldGreen cterm=bold ctermfg=006 ctermbg=008

" setup current modes
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

" Build statusline
set stl=%#SynWarn# " Warning highlight group
set stl+=%{SyntasticStatuslineFlag()} " get syntastic flag
set stl+=%#SynWarnInvert# " invert group
set stl+=%{empty(SyntasticStatuslineFlag())?'':''} " apply separator
set stl+=%* " reset color
set stl+=\ %M " modified?
set stl+=%<%f " relative file path
set stl+=\ %* " reset color
set stl+=%= " Move to end of statusline
set stl+=%#SLBoldGreen#\\ " separator
set stl+=%#SLFileInfo# " SLFileInfo color group
set stl+=\ %Y " filetype with brackets
set stl+=\ ( " open paren
set stl+=%l,%c\/ " line,column
set stl+=%P " percentage through file
set stl+=) " close paren
set stl+=%* " rest color
set stl+=%#SLBoldGreen#
set stl+=\ %{toupper(get(g:currentmode,mode(),'V-Block'))}
set stl+=\ %*"

"SignColumn Color
hi clear SignColumn
hi SignColumn cterm=bold

" Enable Backspace
set backspace=indent,eol,start

" Invisibles
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<
set list

"Invisible character colors
highlight NonText ctermfg=015
highlight SpecialKey ctermfg=015

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

" Markdown Plugin
let g:vim_markdown_folding_disabled = 1

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

" Typescript Syntastic
let local_tslint = finddir('node_modules', 'packages/ordering') . '/.bin/tslint'

if matchstr(local_tslint, "^\/\\w") == ''
	let local_tslint = getcwd() . "/" . local_tslint
endif

if executable(local_tslint)
	let g:syntastic_typescript_tslint_exec = local_tslint
	let g:syntastic_typescript_checkers = ['tslint', 'tsc']
endif

" Syntastic Symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = ''
let g:syntastic_warning_symbol = ''
let g:syntastic_style_warning_symbol = ''

"highlight SyntasticErrorSign ctermfg=1

" NeoComplete
let g:neocomplete#enable_at_startup = 1

" devicons
let g:webdevicons_enable_ctrlp = 1

" ctrl-p config
let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\|\.svn$\|.rvm$|.bundle$\|vendor|node_modules'

" sugarss
autocmd BufReadPre,FileReadPre *.sss call SetSugarOptions()

function! SetSugarOptions()
	setlocal foldmethod=indent
	setlocal foldlevelstart=1
endfunction

function! SetTypeScriptOptions()
	setl shiftwidth=2
	setl expandtab
endfunction


" Nerdtree Brackets
let g:webdevicons_conceal_nerdtree_brackets = 1

