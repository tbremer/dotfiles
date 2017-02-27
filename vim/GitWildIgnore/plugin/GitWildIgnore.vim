" Vim plugin that finds local .gitignore and updates wildignore
" Adapted from RootIgnore <https://github.com/octref/RootIgnore>
" Author: Tom Bremer <https://github.com/tbremer>
" License: MIT

function! s:WildignoreFromGitignore(gitpath, isAtRoot)
  let gitignore = a:gitpath . "/.gitignore"
  if filereadable(gitignore)
    let igstring = ''
    for oline in readfile(gitignore)

      let line = substitute(oline, '\s|\n|\r', '', "g")
      if line =~ '^#' | con | endif
      if line == ''   | con | endif
      if line =~ '^!' | con | endif


      if a:isAtRoot
        " If line starts with a '/', remove it
        if line =~ '^/'
          let line = substitute(line, '/', '', '')
        endif

        if line =~ '/$'

          let igstring .= "," . substitute(line, '/', '', '')
        else
          let igstring .= "," . line
        endif
      else
        let fullPath = a:gitpath . "/" . line

        if line =~ "/"
          if fullPath =~ getcwd()
            let pattern = fnamemodify(fullPath, ":.")
            if pattern =~ "/$"
              let pattern .= "*"
            endif
            let igstring .= "," . pattern
          endif
        else
          let igstring .= "," . line
        endif
      endif

    endfor
    execute "set wildignore+=" . substitute(igstring, '^,', '', "g")

    " Set ag's ignore
    if exists("g:GitWildIgnoreAgignore") && g:GitWildIgnoreAgignore
      let agignore = ''
      for oline in readfile(gitignore)
        let line = substitute(oline, '\s|\n|\r', '', "g")
        if line =~ '^#' | con | endif
        if line == ''   | con | endif
        if line =~ '^!' | con | endif
        if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
        let agignore .= " --ignore '" . line . "'"
      endfor
      let agcommand = 'ag %s -i --nocolor -g ""' . agignore
      let g:ctrlp_user_command = [
          \ '.git', agcommand,
          \ 'find %s -type f'
          \ ]
    endif
  endif

endfunction

function! s:RootIgnore()
  let gitdir = finddir(".git", ";")

  " At root
  if gitdir == ".git"
    call s:WildignoreFromGitignore(getcwd(), 1)
  " Not at root
  elseif filereadable('.gitignore')
    call s:WildignoreFromGitignore(".", 1)
  endif

endfunction

call s:RootIgnore()
