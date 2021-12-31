if exists("b:current_syntax")
   finish
endif

" Matchings
syn match Constant  "^ACMSTAT"
syn match Statement "^POLYARC\|^RADARC\|^1TRACK\|^POLYGON\|^CIRCLE"
syn match Statement "^CORRIDOR\|^APOINT\|^AORBIT\|^GEOLINE"
syn match String    "^ACMID"
syn match Error       "[^\/]\/$"
"syn match Error       " \/"
"syn match Error       "[^\/]\n^[^\/]"

let b:current_syntax = "aco"
