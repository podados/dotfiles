"
"
"
set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "tricolor"

" Default Colors
hi Normal       ctermfg=grey
hi NonText      ctermfg=white

" Search
hi Search       ctermfg=white ctermbg=blue
hi IncSearch    ctermfg=yellow ctermbg=green

" Window Elements
hi StatusLineNC   ctermfg=white ctermbg=black
hi StatusLine   ctermfg=white ctermbg=darkblue cterm=bold
hi Folded       cterm=bold ctermfg=darkmagenta ctermbg=none
hi Visual       ctermbg=white ctermfg=yellow

" Specials
hi Todo         ctermfg=white ctermbg=green
hi Title        ctermfg=white cterm=bold
hi MatchParen	term=reverse  ctermbg=DarkYellow

" Syntax
hi Constant     ctermfg=darkblue
hi Number       ctermfg=red
hi Boolean       ctermfg=red
hi Statement    ctermfg=darkgreen
hi Identifier   ctermfg=magenta
hi Function     ctermbg=darkgreen ctermfg=white cterm=bold
hi PreProc      ctermfg=darkgreen
hi Comment      ctermfg=darkred
hi Type         ctermfg=darkgreen
hi Special      ctermfg=darkmagenta
hi Error        ctermfg=white ctermbg=red

" Diff
hi DiffAdd      ctermfg=gray ctermbg=blue cterm=none
hi DiffChange   ctermfg=gray ctermbg=darkgray cterm=none
hi DiffDelete   ctermfg=gray ctermbg=none cterm=none
hi DiffText     ctermfg=gray ctermbg=yellow cterm=none
