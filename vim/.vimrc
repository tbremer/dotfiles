" Plug!
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'rust-lang/rust.vim'
Plug 'w0rp/ale'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug '~/Documents/dotfiles/vim/GitWildIgnore'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Background
set background=dark

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

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

" ALE Config
let g:ale_linters = {
\ 'rust': ['rls']
\}
let g:ale_fixers = {
\'javascript': ['prettier', 'eslint'],
\'css': ['prettier']
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

" Deoplete Config
let g:deoplete#enable_at_startup = 1
let g:tern_path = StrTrim(system('PATH=$(npm bin):$PATH && which tern'))
if g:tern_path != 'tern not found'
  let g:deoplete#sources#ternjs#tern_bin = g:tern_path
endif
" <TAB /> completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" NERDTree
map <Leader>t :NERDTreeToggle<enter>
let loaded_netrwPlugin=1
let NERDTreeStatusline = "NERD"

" Set babelrc as json filetype
au BufNewFile,BufRead .babelrc set filetype=json
au BufNewFile,BufRead .eslintrc set filetype=json
au BufNewFile,BufRead .prettierrc set filetype=json

" Cursor line color
function! SetCursorLineBasedOnBG() abort
  if &bg=="light"
    hi CursorLine cterm=none ctermbg=253
  else
    hi CursorLine cterm=none ctermbg=008
  endif
endfunction
autocmd OptionSet * :call SetCursorLineBasedOnBG()
call SetCursorLineBasedOnBG()
set cursorline

" ColumnColor
hi ColorColumn cterm=none ctermbg=253
hi Visual cterm=none ctermbg=253
"set colorcolumn=80

" Cursor match color
hi MatchParen cterm=bold ctermbg=008 ctermfg=003

" Change CursorLine on enter and leave InsertMode
"autocmd InsertEnter * :hi CursorLine cterm=none ctermbg=none
"autocmd InsertLeave * :hi CursorLine cterm=none ctermbg=253

" StatusLine Setup and Colors
set laststatus=2

" StatusLine Highlighting
hi StatusLine cterm=none ctermfg=255 ctermbg=006
hi StatusLineNC cterm=none ctermfg=250 ctermbg=006
au InsertEnter * hi StatusLine cterm=bold
au InsertLeave * hi StatusLine cterm=none
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
function! LinterCount() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  "echo l:counts

  return l:counts.total
endfunction

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '' : printf(
        \   '%dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

" Build statusline
set stl=%#SynWarn# " Warning highlight group
set stl+=%{LinterCount()==0?'':'\ '}
set stl+=%{LinterCount()==0?'':LinterStatus()} " get ALE status
set stl+=%{LinterCount()==0?'':'\ '}
set stl+=%#SynWarnInvert# " invert group
set stl+=%{LinterCount()==0?'':''} " apply separator
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

" SignColumn Color
hi clear SignColumn
hi SignColumn cterm=bold

" Enable Backspace
set backspace=indent,eol,start

" Invisibles
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<
set list

" Invisible character colors
highlight NonText ctermfg=015
highlight SpecialKey ctermfg=015

" Trim White Space on Save
" Remove White Space
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" BuffTabLine Plugin
let g:buftabline_numbers = 1
"let g:buftabline_separators = 1
"hi TabLine cterm=none ctermfg=001 ctermbg=001
":hi TabLineSel cterm=bold ctermfg=255 ctermbg=014
hi TabLineFill ctermfg=006
hi BufTabLineCurrent cterm=bold ctermfg=255 ctermbg=005
hi BufTabLineActive cterm=none ctermfg=250 ctermbg=006
hi BufTabLineHidden cterm=none ctermfg=250 ctermbg=006
hi BuffTabLineFill cterm=none ctermfg=001 ctermbg=001

set hidden

" Nerdtree Brackets
let g:webdevicons_conceal_nerdtree_brackets = 1
