" Plug!
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-buftabline'
Plug 'preservim/nerdtree'
Plug 'uptech/vim-slack-format'
Plug 'dag/vim-fish'

" Javascript & Typescript Specific
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescriptreact', 'typescript'] }
Plug 'pangloss/vim-javascript', { 'for': ['typescript', 'javascript'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['typescriptreact', 'javascriptreact'] }

" Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

autocmd InsertEnter * :hi! link StatusLine SLInsertMode
autocmd InsertLeave * :hi! link StatusLine SLNormalMode

""""""""""""""""
" TESTING AREA "
""""""""""""""""

" Setup current modes
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
set laststatus=2
set stl=
set stl+=%* " reset color
set stl+=\ %M " modified?
set stl+=%<%f " relative file path
set stl+=\ %* " reset color
set stl+=%= " Move to end of statusline
set stl+=\ %Y " filetype with brackets
set stl+=\ ( " open paren
set stl+=%l,%c\/ " line,column
set stl+=%p " percentage through file
set stl+=%{'%'} " percentage through file
set stl+=) " close paren
set stl+=%* " rest color
set stl+=\ %{toupper(get(g:currentmode,mode(),'V-Block'))}
set stl+=\ %*


" Shift-Tab, ("de-tab")
inoremap <S-Tab> <C-d>
nnoremap <S-Tab> i<C-d><Esc>
nnoremap <Tab> <Esc>0i<Tab><Esc>$

" Goyo Stuff
let g:goyo_height = '100%'
function! s:goyo_enter()
  Limelight!!
  set statusline=0
endfunction

function! s:goyo_leave()
  Limelight!!
  set statusline=2
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

function LightsOn()
  set background=light
  silent! colorscheme PaperColor
endfunction

function LightsOut()
  set background=dark
  silent! colorscheme dracula_pro_van_helsing
endfunction

" NERDTree Filetype changes
au FileType nerdtree hi CursorLine cterm=italic ctermbg=0
au FileType nerdtree hi Normal ctermbg=none
au FileType nerdtree hi link Cursor CursorLine

" Cursor Setting
autocmd InsertEnter,InsertLeave * set cul!
hi CursorLine ctermbg=000 guibg=#423146

set guicursor=a:block,i:blinkoff400-blinkon250

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" turn of folds by default
set nofoldenable

""""""""""""""""""""
" END TESTING AREA "
""""""""""""""""""""

" coc setup
let g:coc_global_extensions = ['coc-prettier', 'coc-jest', 'coc-tsserver', 'coc-json', 'coc-deno']
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

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

" Basic Editing configs
set wrap
set linebreak

"""""""""""""""""""""
" END UNSORTED MAPS "
"""""""""""""""""""""

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
set nofoldenable
hi Folded cterm=italic ctermfg=Grey ctermbg=0

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
hi ColorColumn ctermbg=0


" CtrlP
nmap <Leader>p :CtrlP<CR>
nmap <Leader><Leader> :CtrlP<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
