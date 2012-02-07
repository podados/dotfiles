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
hi Normal       ctermfg=grey cterm=bold
hi NonText      ctermfg=white

" Search
hi Search       ctermfg=white ctermbg=blue
hi IncSearch    ctermfg=yellow ctermbg=green

" Window Elements
hi StatusLineNC   ctermfg=black ctermbg=grey cterm=bold
hi StatusLine   ctermfg=white ctermbg=darkblue cterm=bold
hi Folded       cterm=bold ctermfg=darkmagenta
hi Visual       ctermbg=white ctermfg=yellow

" Specials
hi Todo         ctermfg=white ctermbg=green
hi Title        ctermfg=white cterm=bold
hi MatchParen	term=reverse  ctermbg=DarkYellow

" Syntax
hi Constant     ctermfg=blue cterm=bold
hi Number       ctermfg=red
hi Boolean       ctermfg=red
hi Statement    ctermfg=green cterm=bold
hi Identifier   ctermfg=magenta
hi Function     cterm=bold ctermfg=white 
hi PreProc      ctermfg=green
hi Comment      ctermfg=gray
hi Type         ctermfg=gray cterm=bold
hi Special      ctermfg=magenta
hi Error        ctermfg=white ctermbg=red

" Diff
hi DiffAdd      ctermfg=gray ctermbg=blue cterm=none
hi DiffChange   ctermfg=gray ctermbg=darkgray cterm=none
hi DiffDelete   ctermfg=gray ctermbg=none cterm=none
hi DiffText     ctermfg=gray ctermbg=yellow cterm=none
