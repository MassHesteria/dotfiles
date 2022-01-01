"********************************************************
" Abstract: Vim color file                              *
" Maintainer: Brad Hester                               *
" Last Change: December 31, 2021                        *
" Version: 1.6                                          *
"********************************************************

hi clear
if exists("syntax_on")
    syntax reset
endif

" Color Scheme name
let g:colors_name = "brad"

" GUI colors
hi Cursor               guifg=fg guibg=lightBlue
hi CursorIM             guifg=NONE guibg=cornsilk
hi ErrorMsg             gui=bold guifg=White guibg=Red
hi IncSearch            gui=bold guifg=Black guibg=Pink
hi ModeMsg              gui=bold
hi Normal               guibg=#1e1e1e guifg=white
hi Search               gui=bold guifg=Black guibg=Pink
hi StatusLine           guifg=orange1
hi StatusLineNC         guifg=yellow4
hi Visual               guifg=gray35 guibg=fg
hi VisualNOS            gui=bold guifg=black guibg=fg
hi WarningMsg           guifg=White guibg=Tomato

hi Folded               gui=NONE guifg=red guibg=NONE

" Colors for syntax highlighting
hi Comment              gui=NONE guifg=orange

hi Constant             gui=NONE guifg=mediumspringgreen
    hi String           gui=NONE guifg=#F1FA8C
    hi Character        gui=NONE guifg=orange
    hi Number           gui=NONE guifg=mediumspringgreen
    hi Boolean          gui=NONE guifg=mediumspringgreen
    hi Float            gui=NONE guifg=mediumspringgreen

hi Identifier           gui=NONE guifg=lightYellow
    hi Function         gui=NONE guifg=mediumspringgreen

hi Statement            gui=NONE guifg=cyan
    hi Conditional      gui=NONE guifg=cyan
    hi Repeat           gui=NONE guifg=cyan
    hi Label            gui=NONE guifg=cyan
    hi Operator         gui=NONE guifg=cyan

hi PreProc              gui=NONE guifg=LightSteelBlue
    hi Include          gui=NONE guifg=LightSteelBlue
    hi Define           gui=NONE guifg=LightSteelBlue
    hi Macro            gui=NONE guifg=LightSteelBlue
    hi PreCondit        gui=NONE guifg=LightSteelBlue

hi! Type            gui=italic guifg=#ff79c6
hi StorageClass     gui=NONE guifg=cyan1
hi Structure        gui=NONE guifg=cyan1
hi Typedef          gui=NONE guifg=cyan1

hi Underlined           gui=underline
hi Ignore               guifg=bg
hi Error                gui=bold guifg=White guibg=Red
hi Todo                 guifg=green guibg=NONE
