if exists("b:current_syntax")
   finish
endif

" Matchings
syn match CnxMsn      "^CNXMSN"
syn match Statement   "^AMSNDAT"
syn match String      "^TASKUNIT"
syn match Number      "^MTGTLOC"
"syn match Error       "[^\/]\/$"
"syn match Error       "[^\/]\n^[^\/]"

let b:current_syntax = "ato"
