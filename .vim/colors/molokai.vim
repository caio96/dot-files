"let g:molokai_alternate_comments = 1
"let g:rehash256 = 1
let g:nobg256 = 1

so ~/.vim/bundle/molokai/colors/molokai.vim

" Molokai overrides for transparent terminals (for elite hackers)
if &t_Co > 255
	" visual tweaks
	hi Identifier      cterm=bold
	hi MatchParen      ctermfg=229

	" turn off all background colors
	if exists("g:nobg256") && g:nobg256 == 1
		hi Normal          ctermbg=none
		hi NonText         ctermbg=none
		hi Todo            ctermbg=none
		hi LineNr          ctermbg=none

		hi Cursor          ctermbg=none
		hi CursorLine      ctermbg=none

		hi DiffAdd         ctermbg=none
		hi DiffChange      ctermbg=none
		hi DiffDelete      ctermbg=none
		hi DiffText        ctermbg=none

		hi Error           ctermbg=none
		hi ErrorMsg        ctermbg=none
		hi WarningMsg      ctermbg=none

		hi FoldColumn      ctermbg=none
		hi Folded          ctermbg=none

		hi Ignore          ctermbg=none

		hi Search          ctermbg=none
		hi IncSearch       ctermbg=none
		hi MatchParen      ctermbg=none

		hi SpellBad        ctermbg=none
		hi SpellCap        ctermbg=none
		hi SpellLocal      ctermbg=none
		hi SpellRare       ctermbg=none

		hi VertSplit       ctermbg=none

		" leave these, changing them is silly and weird
		"hi StatusLine      ctermbg=none
		"hi StatusLineNC    ctermbg=none

		" keep selection hilighting
		"hi Visual          ctermbg=none
		"hi VisualNOS       ctermbg=none

		hi WildMenu        ctermbg=none

		hi CursorColumn    ctermbg=none
		hi ColorColumn     ctermbg=none

		hi Pmenu           ctermbg=none
		hi PmenuSel        ctermbg=none
		hi PmenuSbar       ctermbg=none
		hi SignColumn      ctermbg=none
		hi Special         ctermbg=none
	endif
endif
