" Use Vim settings, rather than Vi settings.
set nocompatible

" Syntax Editing setup
au BufNewFile,BufReadPost *.aco set ft=aco
au BufNewFile,BufReadPost *.ato set ft=ato
au BufNewFile,BufReadPost *.prv set ft=c
au BufNewFile,BufReadPost *.spc set ft=c
au BufNewFile,BufReadPost *.typ set ft=c
au BufNewFile,BufReadPost *.tpp set ft=c
au BufNewFile,BufReadPost *.tp set ft=c

"
"packadd! dracula
"syntax enable
"colorscheme dracula

" Personal settings
colorscheme brad
set lines=40
set expandtab
set tabstop=3
"set guifont=Courier
set guifont=Consolas:h12
set shiftwidth=3
set sw=3
set noai
set autochdir
set nopvw
set guioptions-=T
set ignorecase
set cpoptions+=Z
set showmatch
set nospell
set columns=100

" Vim file explorer options
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 30

" C indent settings
"set cindent
"set cino=f3,{3,U3
"set cino=f3,{3,U3

" EOL settings
set ffs=dos,unix

" *****************************

" Default tags
set tags=d:/work/flames20/tags

" Fold regions
"syn region cRegion start="#region" end="#endregion" fold
"set foldmethod=syntax
"set nofoldenable

" *************** Mappings ***************

" Insert a blank line
nmap <CR> o<ESC>0d$
nmap <S-CR> O<ESC>0d$

" Replace tabs with 3 spaces
nmap <F12> :SALI<CR>:%s/\t/   /g<CR>:RELI<CR>:echo "All Tabs Replaced with 3 Spaces."<CR>zz

" ************************

" Remove whitespace at the end of lines
nmap <F10> :SALI<CR>:%s/\s\+$//g<CR>:RELI<CR>:echo "End of Line Whitespace Removed."<CR>zz

" Remove carriage returns
nmap <C-F11> :SALI<CR>:%s/\r//g<CR>:RELI<CR>:echo "Removed Carriage Returns."<CR>zz

" Jump to the next tag in the list
nmap <F2> :tn<CR>zz
nmap <S-F2> :tp<CR>zz

" Jump to the next GREP result in the list
nmap <F3> :cn<CR>zz
nmap <S-F3> :cp<CR>zz

" Insert a space
nmap <S-Space> i<space><esc>

" Open a new tab and tag to the current selection
nmap " :call OPEN_TAG_IN_TAB()<CR>zz

" Search for the current selection
nmap <C-F3> :call SEARCH_FOR_SELECTION()<CR>zz

" Open / Close Tag List
let g:Tlist_WinWidth=50
nmap "T :TlistToggle<CR><C-W>h

" ************* Commands *******************

" Open a new tab and then tag to the argument
com -nargs=1 -complete=tag TT tab tag <args>

" Toggle case sensitivity
nmap <C-I> :call ToggleIgnoreCase()<CR>

" Toggle between file formats
nmap <F11> :call SetEOL()<CR>

" Change to the directory of the current file
com CD cd %:p:h

" Save & Restore the cursor position
com SALI let g:curcol=col(".")|let g:curlin=line(".")
com RELI call cursor(g:curlin,g:curcol)

"
com Q q!
com W w!
com Wq wq!
com WQ wq!
com -nargs=1 -complete=file E e! <args>

" ************* Functions ******************

let myCaseToggle=0

func ToggleIgnoreCase()
   if g:myCaseToggle==1
      set ignorecase
      let g:myCaseToggle=0
      echo "Case Sensitivity Disabled."
   else
      set noignorecase
      let g:myCaseToggle=1
      echo "Case Sensitivity Enabled."
   endif
endfunc

" Toggle between file formats
func SetEOL()
   if &ffs=='dos'
      set ffs=unix
   else
      set ffs=dos
   endif
   execute ":e"
endfunc

" Show the current function name
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun

" Shortcut to show the current function name
nmap "F :call ShowFuncName()<CR>

" Open a new tab and tag to the current selection
fun! OPEN_TAG_IN_TAB()
   exe "tab tag ". expand("<cword>")
endfun

fun! SEARCH_FOR_SELECTION()
   exe "vim /".expand("<cword>")."/ *"
endfun

" When started as "evim", evim.vim will configure the settings.
if v:progname =~? "evim"
   finish
endif

" Do not create backup files.
set nobackup

" Create a backup file and delete it after writing is done.
set writebackup

" Number of commands to keep in history.
set history=50

" Show the cursor position all the time.
set ruler

" Display incomplete commands
set showcmd

" Perform incremental searching.
set incsearch

" Don't use Ex mode, use Q for formatting
map Q gq

" Turn on highlighting search items
syntax on
set hlsearch

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
   "syntax on
   "set hlsearch
"endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent      " always set autoindenting on

endif " has("autocmd")
