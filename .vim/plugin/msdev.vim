"**************************************
" Visual Studio commands
"
" History:
"    17 Feb 07 - Created. BPHester
"
"**************************************

if exists("g:loaded_msdev")
   finish
endif
let g:loaded_msdev = 1

" Remove the Buffers menu item (it will be replaced)
let no_buffers_menu=1

let g:msdev = 2005

" Setup for Visual Studio 2005
func RemoteIt2k5()
   " Add the keyboard mappings
   nmap <F4> :!start remoteit2k5 Edit.GoToNextLocation<CR>
   nmap <C-F5> :!start remoteit2k5 Debug.StartWithoutDebugging<CR>
   nmap <F7> :!start remoteit2k5 Build.BuildSolution<CR>
   nmap "99 <F7>

   " Add the menu items
   55amenu &Build.&Build\ Solution <F7>
   55amenu &Build.&Rebuild\ Solution :!start remoteit2k5 Build.RebuildSolution<CR>
   55amenu &Build.&Clean\ Solution :!start remoteit2k5 Build.CleanSolution<CR>
   55amenu &Build.-Sep1- :
   55amenu &Build.B&uild\ Project\ of\ Current\ Document :!start remoteit2k5 Build.BuildOnlyProject<CR>
   55amenu &Build.R&ebuild\ Project\ of\ Current\ Document :!start remoteit2k5 Build.RebuildOnlyProject<CR>
   55amenu &Build.Clea&n\ Project\ of\ Current\ Document :!start remoteit2k5 Build.CleanOnlyProject<CR>
   55amenu &Build.-Sep2- :
   55amenu &Build.Start\ Wit&hout\ Debugging <C-F5>
   55amenu &Build.C&ancel :!start remoteit2k5 Build.Cancel<CR>
endfunc

" Setup for Visual Studio 6.0
func RemoteIt()
   " Add the keyboard mappings
   nmap <F4> :!start remoteit GoToNextErrorTag:sync<CR>
   nmap <C-F5> :!start remoteit BuildExecute<CR>
   nmap <F7> :!start remoteit Build<CR>
   nmap "99 <F7>

   " Add the menu items
   55amenu &Build.&Build <F7>
   55amenu &Build.Cl&ean :!start remoteit BuildClean<CR>
   55amenu &Build.E&xectue <C-F5>
   55amenu &Build.&Rebuild\ All :!start remoteit BuildRebuildAll<CR>
   55amenu &Build.&Stop :!start remoteit BuildStop<CR>
endfunc

if g:msdev == 2005
   call RemoteIt2k5()
elseif
   call RemoteIt()
endif

