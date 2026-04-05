" vim-airline template by chartoin (http://github.com/chartoin)
" Base 16 Flat Scheme by Chris Kempson (http://chriskempson.com)
let g:airline#themes#flat_remix_1#palette = {}
let s:gui00 = "#000000"
let s:gui01 = "#d41919"
let s:gui02 = "#5ebdab"
let s:gui03 = "#fea44c"
let s:gui04 = "#367bf0"
let s:gui05 = "#9855b3"
let s:gui06 = "#49aee6"
let s:gui07 = "#e6e6e6"
let s:gui08 = "#198388"
let s:gui09 = "#ec0101"
let s:gui0A = "#47d4b9"
let s:gui0B = "#ff8a18"
let s:gui0C = "#277fff"
let s:gui0D = "#962ac3"
let s:gui0E = "#05a1f7"
let s:gui0F = "#ffffff"

let s:cterm00 = 0
let s:cterm01 = 1
let s:cterm02 = 2
let s:cterm03 = 3
let s:cterm04 = 4
let s:cterm05 = 5
let s:cterm06 = 6
let s:cterm07 = 7
let s:cterm08 = 8
let s:cterm09 = 9
let s:cterm0A = 10
let s:cterm0B = 11
let s:cterm0C = 12
let s:cterm0D = 13
let s:cterm0E = 14
let s:cterm0F = 15

let s:N1   = [ s:gui00, s:gui06, s:cterm00, s:cterm06 ]
let s:N2   = [ s:gui06, s:gui00, s:cterm06, s:cterm00 ]
let s:N3   = [ s:gui06, s:gui00, s:cterm06, s:cterm00 ]
let g:airline#themes#flat_remix_1#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1   = [ s:gui00, s:gui0A, s:cterm00, s:cterm0A ]
let s:I2   = [ s:gui0A, s:gui00, s:cterm0A, s:cterm00 ]
let s:I3   = [ s:gui0A, s:gui00, s:cterm0A, s:cterm00 ]
let g:airline#themes#flat_remix_1#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:R1   = [ s:gui00, s:gui0B, s:cterm00, s:cterm0B ]
let s:R2   = [ s:gui0B, s:gui00, s:cterm0B, s:cterm00 ]
let s:R3   = [ s:gui0B, s:gui00, s:cterm0B, s:cterm00 ]
let g:airline#themes#flat_remix_1#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:V1   = [ s:gui0F, s:gui0D, s:cterm0F, s:cterm0D ]
let s:V2   = [ s:gui0D, s:gui00, s:cterm0D, s:cterm00 ]
let s:V3   = [ s:gui0D, s:gui00, s:cterm0D, s:cterm00 ]
let g:airline#themes#flat_remix_1#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:IA1   = [ s:gui0F, s:gui08, s:cterm0F, s:cterm08 ]
let s:IA2   = [ s:gui08, s:gui0F, s:cterm08, s:cterm0F ]
let s:IA3   = [ s:gui08, s:gui0F, s:cterm08, s:cterm0F ]
let g:airline#themes#flat_remix_1#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#flat_remix_1#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:gui07, s:gui02, s:cterm07, s:cterm02, '' ],
      \ [ s:gui07, s:gui04, s:cterm07, s:cterm04, '' ],
      \ [ s:gui05, s:gui01, s:cterm05, s:cterm01, 'bold' ])
