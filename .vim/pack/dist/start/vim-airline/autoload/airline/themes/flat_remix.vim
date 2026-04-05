" flat_remix airline theme
" based on alacritty colors
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

let g:airline#themes#flat_remix#palette = {}

" --------------------------------------------------
" Color definitions (from Alacritty)
" --------------------------------------------------

let s:black   = '#1f2229'
let s:white   = '#e6e6e6'

let s:red     = '#ec0101'
let s:green   = '#47d4b9'
let s:yellow  = '#ff8a18'
let s:blue    = '#277fff'
let s:magenta = '#962ac3'
let s:cyan    = '#05a1f7'

" --------------------------------------------------
" Normal mode
" --------------------------------------------------

let s:N1 = [ s:black , s:cyan   , 0 , 33  ]
let s:N2 = [ s:white , s:black  , 255, 16  ]
let s:N3 = [ s:cyan  , s:black  , 81 , 0  ]

let g:airline#themes#flat_remix#palette.normal =
\ airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" --------------------------------------------------
" Insert mode
" --------------------------------------------------

let s:I1 = [ s:black , s:green , 16 , 79 ]

let g:airline#themes#flat_remix#palette.insert =
\ airline#themes#generate_color_map(s:I1, s:N2, s:N3)

" --------------------------------------------------
" Visual mode
" --------------------------------------------------

let s:V1 = [ s:black , s:magenta , 16 , 97 ]

let g:airline#themes#flat_remix#palette.visual =
\ airline#themes#generate_color_map(s:V1, s:N2, s:N3)

" --------------------------------------------------
" Replace mode
" --------------------------------------------------

let s:R1 = [ s:white , s:red , 255 , 160 ]

let g:airline#themes#flat_remix#palette.replace =
\ airline#themes#generate_color_map(s:R1, s:N2, s:N3)

" --------------------------------------------------
" Inactive
" --------------------------------------------------

let s:IA = [ s:white , s:black , 255 , 16 ]

let g:airline#themes#flat_remix#palette.inactive =
\ airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" --------------------------------------------------
" CtrlP (optional)
" --------------------------------------------------

if get(g:, 'loaded_ctrlp', 0)
  let g:airline#themes#flat_remix#palette.ctrlp =
        \ airline#extensions#ctrlp#generate_color_map(
        \ [ s:black , s:blue   , 16 , 33  ],
        \ [ s:white , s:black  , 255, 16  ],
        \ [ s:black , s:cyan   , 16 , 81  ])
endif

