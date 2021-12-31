"********************************************************
" Abstract:                                             *
" Maintainer: Brad Hester                               *
" Last Change: June 6, 2007                             *
" Version: 1.0                                          *
"********************************************************

" Has Vim successfully determined a file type?
if did_filetype()
  finish
endif

" Is this a FLAMES database file?
if getline(1)==#"#BEGIN#"
   set ft=fdb
endif
