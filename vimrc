"
" ~/.vimrc
"

set nocompatible  	" prevents from original vi's bugs & limitations
set ls=2          	" allways show status line
set tw=78		" textwidth : 78 chars
set scrolloff=4     	" keep 3 lines when scrolling

" expandtab  = All tabs will be spaces.
" softtabstop = How many spaces will a tab take when 'expandtab' is on.
" smarttab   = delete chunks of spaces like tabs.
" tabstop    = How many spaces is a tab (visually).
" shiftwidth = How many spaces will a 'shift' command take.
set autoindent		" auto indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab 

" folding
set foldmethod=indent
set foldnestmax=1 " change to 100 (say) to have manual scrolling only

set mouse=v		" allow copy/paste under X

set showmatch 		" verify brace/parenthes/bracket
set matchpairs+=<:>  " Treat '<','>' as matching braces.

set visualbell t_vb= " disable horrible beep when a command doesn't work

set ruler 	    " display the curent cursor position
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch	    " search letter by letter
set ignorecase      " ignore case when searching
set smartcase       " ignore case unless you type uppercase
"set noignorecase   " don't ignore case

set nobackup        " do not keep a backup file
"set number          " show line numbers
"set virtualedit=all " allow to put the cursor everywhere

"set list	" show tab whith -
"set listchars=tab:>-,trail:-
set pastetoggle=<F12>

set formatprg=par\ -w78q

colorscheme functional

syntax on           " syntax highlighing

" template language support (SGML / XML too)
" ------------------------------------------

fun! s:SelectHTML()
let n = 1
while n < 50 && n < line("$")
  " check for jinja
  if getline(n) =~ '{%\s*\(extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
    set ft=htmljinja
    return
  endif
  " check for mako
    if getline(n) =~ '<%\(def\|inherit\)'
      set ft=mako
      return
    endif
    " check for genshi
    if getline(n) =~ 'xmlns:py\|py:\(match\|for\|if\|def\|strip\|xmlns\)'
      set ft=genshi
      return
    endif
    let n = n + 1
  endwhile
  " go with html
  set ft=html
endfun

if has("autocmd")
	set nocp
	filetype plugin indent on		" enable file type detection
	let g:pydiction_location = '/usr/share/pydiction/complete-dict'

	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
	
    autocmd BufWinEnter,FileType *,python,javascript set expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4
	autocmd FileType python setlocal ts=4 sw=4 sts=4 et textwidth=0 cindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
	let python_no_builtin_highlight=0

	" Autocomplete
	autocmd FileType java setlocal omnifunc=javacomplete#Complete
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

	" for both CSS and HTML, use genuine tab characters for indentation,
	" to make files a few bytes smaller:
	"autocmd FileType html,xhtml,css,scss,xml,xsl,htmldjango setlocal noexpandtab sw=2 ts=2 textwidth=0

	au FileType helpfile setlocal nonumber  " no line numbers when viewing help
    au BufWinEnter,FileType htmldjango colorscheme martin_krischik
	au BufRead,BufNewFile *.html,*.htm,*.xml set filetype=htmldjango
	au BufRead,BufNewFile *.json set filetype=javascript

	"au BufRead,BufNewFile *.html,*.htm call s:SelectHTML()

	au FileType text setlocal nonumber   " no line numbers when viewing text
	au FileType text,rst,tex setlocal textwidth=78 
	au FileType rst setlocal sw=4 ts=4 sts=4

endif

" Keyboard mappings
" ctr+T : newtab, ctr+a/z lefttab & righttab
map <C-t> <Esc>:tabnew<CR> 
map <F5> <Esc>:tabprevious<CR>
map <F6> <Esc>:tabnext<CR>
map <F7> <Esc>:setlocal spell spelllang=en_gb<CR>
map <F8> <Esc>:setlocal nospell<CR>
" move between split panes
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" customize the wildmenu
set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe
" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" taglist plugin
"map <F8> :TlistToggle<CR>

" Autocomplete
iab #i #include
iab #d #define
iab #s #! /bin/sh
iab #r #! /usr/bin/ruby
iab #y #! /usr/bin/python
iab #l #! /usr/bin/perl
ab bl <Esc>bi{% block <Esc>ea %}{% endblock %}<Esc>h%i

let mapleader=","
nmap <leader>l :set list!<CR>
set listchars=tab:➜\ ,eol:¬

" NERDtree on <leader>t
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

