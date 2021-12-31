"********************************************************
" Abstract: Syntax for FLAMES database files            *
" Maintainer: Brad Hester                               *
" Last Change: July 16, 2007                            *
" Version: 1.0                                          *
"********************************************************

if exists("b:current_syntax")
   finish
endif

" Matchings
"syn match Statement   " [0-9][0-9]*:\|^[0-9][0-9]*:"
syn match String      "^#BEGIN#\|^#END#"
syn match Type        "^[A-Za-z0-9_][A-Za-z0-9_]*:[0-9][0-9]*\n"

let b:current_syntax = "fdb"
