" Use Vim settings, rather than Vi settings.
set nocompatible

"
syntax on

if has("+termguicolors")
   let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
   let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
   set termguicolors
endif

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'
set background=dark

if has("gui_running")

   set guifont=Consolas:h12
   set lines=38
   set columns=100
   set guioptions-=T

else

   " Block cursor in Gitbash / Cygwin terminal
   let &t_ti.="\e[1 q"
   let &t_SI.="\e[5 q"
   let &t_EI.="\e[1 q"
   let &t_te.="\e[0 q"

endif

" Tabbing
set expandtab
set tabstop=3 softtabstop=3
set shiftwidth=3
set smartindent

" Search
set incsearch
set hlsearch

" Show matching brackets
set showmatch

" When using 'w!' on readonly files, don't reset readonly flag
set cpoptions+=Z

" Show the cursor position all the time.
set ruler

" Display incomplete commands
set showcmd

"
set wildmenu
set wildmode=full

"
set ignorecase
set smartcase

" Splits should open below and to the right
set splitbelow splitright

"
let mapleader = ","
nnoremap <Leader>c :q<cr>
nnoremap <Leader>C :on<cr>

if v:version >= 800
   nnoremap <Leader>f :cd %:p:h<cr>:30Lex<cr>
else
   nnoremap <Leader>f :cd %:p:h<cr>:30Vex<cr>
endif

" Vim file explorer options
"set nopvw
let g:netrw_banner = 0
"let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 30
"let g:netrw_keepdir=0
let g:netrw_preview = 1
let g:netrw_alto = 0

" ************* Mappings ******************

" Remap splits navigation to just CTRL + hjkl
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Toggle windows
nmap <Leader>w <C-w><C-w>

" Open a new tab and tag to the current selection
nmap <Leader> :call OPEN_TAG_IN_TAB()<CR>zz

" Search for the current selection
"nmap <Leader>* :call SEARCH_FOR_SELECTION()<CR>zz

" Jump to the next tag in the list
nmap <F2> :tn<CR>zz
nmap <S-F2> :tp<CR>zz

" Jump to the next GREP result in the list
nmap <F3> :cn<CR>zz
nmap <S-F3> :cp<CR>zz

" Toggle case sensitivity
nmap <C-I> :call ToggleIgnoreCase()<CR>

" Shortcut to show the current function name
nmap "F :call ShowFuncName()<CR>

" Remove whitespace at the end of lines
nmap <F10> mz:%s/\s\+$//g<CR>'z:echo "End of Line Whitespace Removed."<CR>zz

" Toggle between file formats
nmap <F11> :call SetEOL()<CR>

" Replace tabs with 3 spaces
nmap <F12> mz:%s/\t/   /g<CR>'z:echo "All Tabs Replaced with 3 Spaces."<CR>zz

" ************* Commands ******************

" Open a new tab and then tag to the argument
com -nargs=1 -complete=tag TT tab tag <args>

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

" Open a new tab and tag to the current selection
fun! OPEN_TAG_IN_TAB()
   exe "tab tag ". expand("<cword>")
endfun

fun! SEARCH_FOR_SELECTION()
   exe "vim /".expand("<cword>")."/ ".expand("%:p:h")."/*"
endfun

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" Only xterm can grab the mouse events when using the shift key, for other
" terminals use ":", select text and press Esc.
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif
