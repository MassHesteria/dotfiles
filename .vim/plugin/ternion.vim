"******************************************************************************
"
"  Code Generation Following the Ternion coding standard.
"
"  History:
"     21 Feb 07 - Created. BPHester
"
"******************************************************************************

if exists("g:loaded_ternion")
   finish
endif
let g:loaded_ternion = 1

" Enclosed the current word in parentheses
"nmap "( wbi(<ESC>lea)<ESC>b
nmap "( wbi(<ESC>lwi)<ESC>b

" Main
nmap <C-F8> <F9>+iint main (int argc, char **argv)<ESC>+<F9>+i   {<ESC>++i   return (0);<ESC>++i   } /* main */<ESC>kk0w

" Insert comment
nmap <F9> :call COMMENT_LINE()<CR>

" Generates function prototype
nmap <F8> o<ESC>:call FUNCTION_TEMPLATE()<CR>
nmap <S-F8> O<ESC>:call FUNCTION_TEMPLATE()<CR>

" Put function name at end of function
nmap "00 :call COMMENT_FUNCTION_END()<CR>

"
nmap "<F8> :call COMMENT_WHOLE_FUNCTION()<CR>

" Puts date and created by information
nmap <C-F9> :call CREATED_BY()<CR>

"
nmap "A :call GENERATE_ALTER()<CR>A
nmap "C :call GENERATE_CONTROL()<CR>A
nmap "Q :call GENERATE_QUERY()<CR>A

func GENERATE_ALTER()
   execute "normal oAlterMAL = FMALCreate ();"
   execute "normal oFMALAddF"
   execute "normal oFEntityAlter ("
   execute "normal k"
endfunc

func GENERATE_CONTROL()
   execute "normal oControlMAL = FMALCreate ();"
   execute "normal oFMALAddF"
   execute "normal oFEquipmentControl ("
   execute "normal k"
endfunc

func GENERATE_QUERY()
   execute "normal oQueryMAL = FMALCreate ();"
   execute "normal oFMALDestroy (QueryMAL);"
   execute "normal o"
   execute "normal kOFMALGetF"
   execute "normal OFEntityQuery ("
   execute "normal OFMALAddF"
endfunc

func COMMENT_FUNCTION_END()
   execute "normal 0f(b\"+yw"
   call search('{')
   execute "normal %S} /* "
   execute "normal \"+pA "
   execute "normal geld$"
   execute "normal A */"
   call search('1311wuzhere')
   echo 'Done'
endfunc

func COMMENT_LINE()
   execute "normal 0d$i/*"
   execute "normal x78pA/"
endfunc

func COMMENT_WHOLE_FUNCTION()
   execute "normal O"
   call COMMENT_LINE()
   execute "normal jo"
   call COMMENT_LINE()
   call search('{')
   execute "0d$i   {"
   execute "normal o"
   execute "normal 0d$i   /*"
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i      History:"
   execute "normal o"
   call CREATED_BY()
   execute "normal o"
   execute "normal 0d$i   */"
   execute "normal o"
   execute "normal 0d$"
   execute "normal $k%3k"
   call COMMENT_FUNCTION_END()
endfunc

func CREATED_BY()
   let name = "BPHester"
   let form_date = strftime("%d %b %y")
   execute "normal 0d$i".form_date." - Created. ".name
   execute "normal V3>$bbb"
endfunc

func FUNCTION_TEMPLATE()
   call COMMENT_LINE()
   execute "normal o"
   execute "normal 0d$o"
   call COMMENT_LINE()
   execute "normal o"
   execute "normal 0d$i   {"
   execute "normal o"
   execute "normal 0d$i   /*"
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i      History:"
   execute "normal o"
   call CREATED_BY()
   execute "normal o"
   execute "normal 0d$i   */"
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i   } /* */"
   execute "normal ^%kk0"
endfunc

func OPEN_EXTERN_C()
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i#ifdef __cplusplus"
   execute "normal o"
   execute "normal 0d$iextern \"C\" {"
   execute "normal o"
   execute "normal 0d$i#endif"
endfunc

func CLOSE_EXTERN_C()
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i#ifdef __cplusplus"
   execute "normal o"
   execute "normal 0d$i}"
   execute "normal o"
   execute "normal 0d$i#endif"
endfunc

func CLASS_DEFINITION(full)
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i/* Class definition. */"
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$itypedef struct ".a:full."Def"
   execute "normal o"
   execute "normal 0d$i   {"
   execute "normal o"
   execute "normal 0d$i   /* Inherited class. */"
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i   /* Attributes. */"
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i   /* Methods. */"
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i   } ".a:full."Def;"
endfunc

func OBJECT_REFERENCE(full)
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i/* Object reference. */"
   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$itypedef struct ".a:full."Def *".a:full."Obj;"
endfunc

func PRV_HEADER(abv,full)
   let name = "BPHester"
   let form_date = strftime("%d %b %y")
   let lower_abv = tolower(a:abv)
   execute "normal o/*"
   execute "normal vl\"+y77\"+po"
   execute "normal 0d$\"+Po"
   execute "normal 0d$\"+PA   File: ".lower_abv.".prv"
   execute "normal o"
   execute "normal 0d$\"+Po"
   execute "normal 0d$\"+PA   Abstract: Private file for the ".a:full." class."
   execute "normal o"
   execute "normal 0d$\"+Po"
   execute "normal 0d$\"+PA   History:"
   execute "normal o"
   execute "normal 0d$\"+PA      ".form_date." - Created. ".name
   execute "normal o"
   execute "normal 0d$\"+Po"
   execute "normal 0d$79\"+PA/"
endfunc

func SPC_HEADER(abv,full)
   let name = "BPHester"
   let form_date = strftime("%d %b %y")
   let lower_abv = tolower(a:abv)
   execute "normal o/*"
   execute "normal vl\"+y77\"+po"
   execute "normal 0d$\"+Po"
   execute "normal 0d$\"+PA   File: ".lower_abv.".spc"
   execute "normal o"
   execute "normal 0d$\"+Po"
   execute "normal 0d$\"+PA   Abstract: Public file for the ".a:full." class."
   execute "normal o"
   execute "normal 0d$\"+Po"
   execute "normal 0d$\"+PA   History:"
   execute "normal o"
   execute "normal 0d$\"+PA      ".form_date." - Created. ".name
   execute "normal o"
   execute "normal 0d$\"+Po"
   execute "normal 0d$79\"+PA/"
endfunc

func SRC_HEADER(file,desc)
   execute "normal GS/*"
   execute "normal vl\"+y77\"+po"
   execute "normal 0d$\"+Po"
   execute "normal 0d$\"+PA   File: ".a:file
   execute "normal o"
   execute "normal 0d$\"+Po"
   execute "normal 0d$\"+PA   Abstract: ".a:desc
   execute "normal o"
   execute "normal 0d$\"+Po"
   execute "normal 0d$79\"+PA/"
   execute "normal o"
endfunc

func PRV(abv,full)
   call PRIVATE(a:abv,a:full)
endfunc

func PRIVATE(abv,full)
   let upper_abv = toupper(a:abv)
   execute "normal 0i#ifndef ".upper_abv."_PRV"
   execute "normal o#define ".upper_abv."_PRV"

   call PRV_HEADER(a:abv,a:full)

   call OPEN_EXTERN_C()

   call CLASS_DEFINITION(a:full)

   call CLOSE_EXTERN_C()

   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i#endif"
endfunc

func SPC(abv,full)
   call PUBLIC(a:abv,a:full)
endfunc

func PUBLIC(abv,full)
   let upper_abv = toupper(a:abv)
   execute "normal 0i#ifndef ".upper_abv."_SPC"
   execute "normal o#define ".upper_abv."_SPC"

   call SPC_HEADER(a:abv,a:full)

   call OPEN_EXTERN_C()

   call OBJECT_REFERENCE(a:full)

   call CLOSE_EXTERN_C()

   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i#endif"
endfunc

func SHARE(abv,full)
   let upper_abv = toupper(a:abv)
   execute "normal 0i#ifndef ".upper_abv."_PRV"
   execute "normal o#define ".upper_abv."_PRV"

   call PRV_HEADER(a:abv,a:full)

   call OPEN_EXTERN_C()

   call OBJECT_REFERENCE(a:full)

   call CLASS_DEFINITION(a:full)

   call CLOSE_EXTERN_C()

   execute "normal o"
   execute "normal 0d$o"
   execute "normal 0d$i#endif"
endfunc

func SRC(file,desc)
   call SRC_HEADER(a:file,a:desc)
endfunc
