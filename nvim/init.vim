" Plug!
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-buftabline'
Plug 'pangloss/vim-javascript'
Plug 'git@github.com:tbremer/dracula-pro-vim.git', { 'branch': 'main' }
call plug#end()

"""""""""""""""""
" UNSORTED MAPS "
"""""""""""""""""

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

" netrw support
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
"nmap <Leader>t QuitOrOpenNetrw()
nmap <silent> <Leader>t :call QuitOrOpenNetrw()<cr>

function! QuitOrOpenNetrw()
  for i in range(1, bufnr('$'))
    if getbufvar(i, '&filetype') == "netrw"
      silent exe 'bwipeout ' . i
      return
    endif
  endfor

  execute 'Lexplore ' . getcwd()

endfunction

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
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<
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

" coc-prettier setup
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" CtrlP
nmap <Leader>p :CtrlP<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
