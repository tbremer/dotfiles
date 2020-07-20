" coc setup -- needs to be before Plug for install to work
let g:coc_global_extensions = ['coc-prettier', 'coc-jest', 'coc-tsserver', 'coc-json']
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Plug!
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-buftabline'
Plug 'preservim/nerdtree'

" Javascript & Typescript Specific
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

" Colorscheme Stuff
Plug 'git@github.com:tbremer/dracula-pro-vim.git', { 'branch': 'main' }
call plug#end()

""""""""""""""""
" TESTING AREA "
""""""""""""""""
"function! SyntaxItem()
"  return synIDattr(synID(line("."),col("."),1),"name")
"endfunction
"set statusline+=%{SyntaxItem()}


"""""""""""""""""
" UNSORTED MAPS "
"""""""""""""""""

" Y to yank to clipboard
vmap Y "*y

" set certain files as types
autocmd BufRead,BufNewFile */pages/*.js set syntax=javascriptreact
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .prettierrc set filetype=json

" Split to right and below
set splitright
set splitbelow

" Enable Syntax Highlighting
syntax on
set t_Co=256
set encoding=utf-8

" Vertical splits resize with + / _
nn = 5<C-W>>
nn - 5<C-W><

" Horizontal splits resize with - / =
nn + 5<C-W>+
nn _ 5<C-W>-

" Turn on mouse support
set mouse=a

" Map leader and semicolon
let mapleader=","
nmap ; :

" $$ to eol when in insertmode
imap $$ <Esc>$a

"""""""""""""""""""""
" END UNSORTED MAPS "
"""""""""""""""""""""

" Colorscheme info
set bg=dark
silent! colorscheme dracula_pro_van_helsing

" No swap files
set noswapfile

" Default to linenubmers on
set number

" allow splits to be unequal sizes.
set noequalalways

" with popup visible we can use <Tab> to navigate
inoremap <expr> <Tab> pumvisible() ? "\<Down>" : "\<Tab>"

" netrw support
nmap <silent> <Leader>t :NERDTreeToggle<CR>
"let g:netrw_banner = 0
"let g:netrw_winsize = 20
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"hi netrwTreeBar ctermfg=242
"autocmd filetype netrw  noremap <buffer> - 5<C-W><
"nmap <silent> <Leader>t :call QuitOrOpenNetrw()<cr>
"
"function! QuitOrOpenNetrw()
"  for i in range(1, bufnr('$'))
"    if getbufvar(i, '&filetype') == "netrw"
"      silent exe 'bwipeout ' . i
"      return
"    endif
"  endfor
"
"  execute 'Lexplore ' . getcwd()
"endfunction

" Buffer stuff
set hidden
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1
hi TabLineFill cterm=none ctermbg=0
hi TabLineSel ctermbg=White ctermfg=0
hi TabLine cterm=none ctermfg=246 ctermbg=0

" Folding
set foldmethod=indent
set foldcolumn=2
set shiftwidth=2
hi Folded cterm=italic ctermfg=Grey ctermbg=0
autocmd BufRead,BufNewFile *.vim set nofoldenable

" Invisibles
set noeol
set listchars=eol:¬,tab:▸\ ,trail:•,extends:>,precedes:<
set list
set cc=80
highlight NonText ctermfg=242
highlight SpecialKey ctermfg=242

"""""""""""""""""""
" UNSORTED COLORS "
"""""""""""""""""""
hi Pmenu ctermfg=248 ctermbg=0
hi PmenuSel ctermfg=White ctermbg=DarkGrey
hi MatchParen ctermbg=DarkGrey
hi StatusLine cterm=none ctermfg=4 ctermbg=238
hi StatusLineNC cterm=none ctermfg=244 ctermbg=238
hi ColorColumn ctermbg=0


" CtrlP
nmap <Leader>p :CtrlP<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
