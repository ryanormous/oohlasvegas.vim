
" Ooh Las Vegas
" Aint no place for a poor boy like me
"  —Gram Parsons

" ┌────────────────────────────────────────────────────────┐
" │  SETUP                                                 │
" └────────────────────────────────────────────────────────┘

" @defaults.vim
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" USE CTRL-L TO REMOVE SEARCH HIGHLIGHT
nnoremap <C-l> :nohlsearch<CR><C-l>

" @defaults.vim
" DO NOT USE ‘Q’ FOR Ex MODE, USE IT FOR FORMATTING.  EXCEPT FOR Select MODE.
" REVERT WITH ":unmap Q".
"map Q gq
"sunmap Q

" CLEAR PREVIOUS SEARCH PATTERN ON STARTP
let @/ = ""

" DISABLE NETRW BANNER
let g:netrw_banner=0

" BACKSPACE KEY FUNCTIONALITY, default ""
set backspace=indent,eol,start

" @defaults.vim
" SHOW @@@ IN LAST LINE IF TRUNCATED
set display=truncate

" DISABLE CURSOR STYLING
set guicursor=""

" ADD TAB PAGES AS INDICATED BY ‘showtabline’.
" WHEN "e" OPTION IS NOT PRESENT A NON-GUI TAB PAGES LINE
" MAY BE USED TO CHANGE TEXT IN ‘guitablabel’ LABELS.
set guioptions-=e

" @defaults.vim
" KEEP <n> LINES OF HISTORY
set history=1024

" HIGHLIGHT SEARCH
set hlsearch

" ENABLE STATUS LINE FOR LAST WINDOW
"  0) never
"  1) only if there are at least two windows
"  2) always
set laststatus=2

" NO MOUSE FUNCTIONALITY
set mouse="n"

" USE vim DEFAULTS INSTEAD OF TRUE vi COMPATIBILITY
set nocompatible

" DISABLE FOLDING
set nofoldenable

" NO MODELINES
set nomodeline

" KEEP CURSOR AT BEGINNING OF LINE WHEN SCROLLING
set nostartofline

" @defaults.vim
" DO NOT RECOGNIZE OCTAL NUMBERS FOR Ctrl-A AND Ctrl-X
set nrformats-=octal

" LINE NUMBERS, default off
set number

" RULER, default off
set ruler

" RULER FORMAT
"set rulerformat=%3l/%L,\ %3c

" @defaults.vim
" SHOW (PARTIAL) COMMAND AT LAST LINE OF SCREEN
set showcmd

" SPECIFY WHEN TO DISPLAY LINE WITH TAB PAGE LABELS
"  0) never
"  1) only if there are at least two tab pages
"  2) always
set showtabline=1

" STATUS LINE
set statusline=\ %f\ %m%r\ %=\ %l/%L,\ %3c

" ALWAYS ENABLE STATUS LINE, default 1 (only enable with additional windows)
set laststatus=2

" SPECIFY viminfo WRITE PATH
set viminfo+=n~/.vim/viminfo

" IGNORE FILES WHEN USING TAB-COMPLETE
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" ENABLE WILD MENU, USE POP-UP
set wildmenu wildoptions=pum

" WILDCARD EXPANSION (FOR TAB-COMPLETE)
set wildmode=longest:full,full

" ENABLE filetype PLUGIN
"filetype plugin on

" DISABLE filetypeindent AUTOGROUP
"augroup filetypeindent
"    autocmd!
"augroup END

" DISABLE PARENTHESIS MATCHING IN INSERT MODE
augroup insertIO
    autocmd!
    autocmd InsertEnter * :NoMatchParen
    autocmd InsertLeave * :DoMatchParen
augroup END

" ENABLE LINE NUMBERS FOR HELP DOCUMENTATION
augroup vim help
    autocmd!
    autocmd filetype help setlocal number
augroup END


" ┌────────────────────────────────────────────────────────┐
" │  AUTO-FORMAT                                           │
" └────────────────────────────────────────────────────────┘

" MAXIMUM WIDTH OF TEXT THAT IS BEING INSERTED, default 0
"set textwidth=0

" DISABLE AUTO-FORMATTING
augroup mofo
    autocmd!
    autocmd BufWinEnter * set formatoptions=""
augroup END


" ┌────────────────────────────────────────────────────────┐
" │  CURSOR LINE                                           │
" └────────────────────────────────────────────────────────┘

" CURSOR LINE HIGHLIGHTING, default off
set cursorline

" DISABLE CURSORLINE HIGHLIGHT WHEN RUNNING DIFF
augroup nocul
    autocmd!
    autocmd OptionSet diff let &cursorline=!v:option_new
augroup END


" ┌────────────────────────────────────────────────────────┐
" │  WHITESPACE                                            │
" └────────────────────────────────────────────────────────┘

let _curfile = expand("%:t")

if _curfile =~ 'Makefile' || _curfile =~ 'makefile' || _curfile =~ ".*\.mk"
    " INDENTATION SETTINGS FOR USING TAB WITH MAKEFILES
    set autoindent
    set noexpandtab
    set smarttab
else
    " INDENTATION SETTINGS FOR USING 4 SPACES INSTEAD OF TAB
    set noautoindent
    set expandtab
    set indentexpr=""
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
    filetype indent off
endif


" ┌────────────────────────────────────────────────────────┐
" │  COLOR                                                 │
" └────────────────────────────────────────────────────────┘

" SYNTAX, default 'vim'
syntax on

" CLEAR HIGHLIGHT COLORS
highlight clear

" TRY TO CORRECTLY HIGHLIGHT THINGS FOUND IN filetype=sh.
if !exists('g:is_posix') && !exists('g:is_bash') && !exists('g:is_dash')
    let g:is_posix = 1
endif

" COLOR CAPABILITY
if &t_Co == 0
    " ┌────────────────────────────────────────────────────┐
    " │  SYNTAX GROUP, NO COLOR                            │
    " └────────────────────────────────────────────────────┘

    " COMMENT
    hi Comment                 term=italic
    " CONSTANT
    hi Character               term=NONE
    hi! link Constant          Character
    hi! link Boolean           Character
    hi! link Float             Character
    hi! link Number            Character
    hi! link String            Character
    " IDENTIFIER
    hi Identifier              term=bold
    hi! link Function          Identifier
    " STATEMENT
    hi Statement               term=NONE
    hi! link Conditional       Statement
    hi! link Keyword           Statement
    hi! link Label             Statement
    hi! link Operator          Character
    hi! link Repeat            Statement
    " PREPROC
    hi Macro                   term=NONE
    hi PreProc                 term=NONE
    hi! link Define            PreProc
    hi! link Include           PreProc
    hi! link PreCondit         Macro
    " SPECIAL
    hi! link Delimiter         Statement
    hi! link Special           Constant
    hi! link SpecialChar       Constant
    hi! link SpecialComment    Constant
    hi! link SpecialKey        Constant
    hi! link Tag               Statement
    " TYPE
    hi! link StorageClass      Constant
    hi! link Structure         Constant
    hi! link Type              Constant
    hi! link Typedef           Constant

    " ┌────────────────────────────────────────────────────┐
    " │  HIGHLIGHT GROUP, NO COLOR                         │
    " └────────────────────────────────────────────────────┘

    " CURSOR
    hi Cursor                  term=NONE
    hi! link CursorColumn      Cursor
    hi! link CursorLine        Cursor
    hi! link CursorLineFold    Folded
    hi! link CursorLineSign    Visual
    " DIFF
    hi DiffAdd                 term=reverse
    hi DiffChange              term=underline
    hi DiffDelete              term=underline
    hi DiffText                term=bold
    hi! link Added             DiffAdd
    hi! link Changed           DiffChange
    hi! link Removed           DiffDelete
    hi! link diffAdded         DiffAdd
    hi! link diffRemoved       DiffDelete
    hi! link diffSubname       DiffText
    " LINE NUMBER
    hi CursorLineNr            term=underline
    hi LineNr                  term=NONE
    " MENU
    hi Pmenu                   term=reverse
    hi PmenuSbar               term=NONE
    hi PmenuSel                term=underline
    hi PmenuThumb              term=reverse
    hi! link MessageWindow     Pmenu
    hi! link PmenuExtra        Pmenu
    hi! link PmenuExtraSel     PmenuSel
    hi! link PmenuKind         Pmenu
    hi! link PmenuKindSel      PmenuSel
    hi! link WildMenu          Visual
    " MESSAGE
    hi Error                   term=standout
    hi ModeMsg                 term=NONE
    hi Todo                    term=bold,reverse
    hi! link Debug             Todo
    hi! link ErrorMsg          Error
    hi! link Exception         Error
    hi! link MoreMsg           ModeMsg
    hi! link PopupNotification Todo
    hi! link Question          ModeMsg
    hi! link WarningMsg        Error
    " NON-TEXT
    hi ColorColumn             term=reverse
    hi Ignore                  term=italic
    hi NonText                 term=reverse
    hi ToolbarButton           term=bold,reverse
    hi VertSplit               term=reverse
    hi! link Conceal           Ignore
    hi! link EndOfBuffer       NonText
    hi! link SignColumn        ColorColumn
    hi! link ToolbarLine       StatusLine
    " PARENTHESES
    hi MatchParen              term=reverse
    " SEARCH
    hi Search                  term=reverse
    hi! link CurSearch         Search
    hi! link IncSearch         Search
    " SPELL
    hi SpellBad                term=bold,underline
    hi! link SpellCap          SpellBad
    hi! link SpellLocal        SpellBad
    hi! link SpellRare         SpellBad
    " STATUSLINE, ‘NC’ NOT CURRENT
    hi StatusLine              term=reverse
    hi StatusLineNC            term=bold
    hi! link StatusLineTerm    StatusLine
    hi! link StatusLineTermNC  StatusLineNC
    " TABLINE
    hi TabLineSel              term=bold,reverse
    hi! link TabLine           StatusLine
    hi! link TabLineFill       StatusLine
    " TEXT
    hi Normal                  term=NONE
    hi Underlined              term=underline
    hi! link Terminal          Normal
    hi! link Title             Normal
    hi! link gitCommitSummary  Normal
    hi! link markdownUrl       Underline
    " VISUAL
    hi Visual                  term=bold,reverse
    hi! link VisualNOS         Visual
    " DONE
    finish
endif

if &t_Co < 17
    " ┌────────────────────────────────────────────────────┐
    " │  SYNTAX GROUP, 8 COLOR                             │
    " └────────────────────────────────────────────────────┘

    " COMMENT
    hi Comment                    ctermfg=0    ctermbg=NONE cterm=bold
    " CONSTANT
    hi Character                  ctermfg=7    ctermbg=NONE cterm=NONE
    hi Constant                   ctermfg=2    ctermbg=NONE cterm=NONE
    hi! link Boolean              Character
    hi! link Float                Character
    hi! link Number               Character
    hi! link String               Character
    " IDENTIFIER
    hi Identifier                 ctermfg=4    ctermbg=NONE cterm=bold
    hi! link Function             Identifier
    " STATEMENT
    hi Statement                  ctermfg=6    ctermbg=NONE cterm=NONE
    hi! link Conditional          Statement
    hi! link Keyword              Statement
    hi! link Label                Statement
    hi! link Operator             Character
    hi! link Repeat               Statement
    " PREPROC
    hi Macro                      ctermfg=3    ctermbg=NONE cterm=NONE
    hi PreProc                    ctermfg=6    ctermbg=NONE cterm=NONE
    hi! link Define               PreProc
    hi! link Include              PreProc
    hi! link PreCondit            Macro
    " SPECIAL
    hi! link Delimiter            Statement
    hi! link Special              Constant
    hi! link SpecialChar          Constant
    hi! link SpecialComment       Constant
    hi! link SpecialKey           Constant
    hi! link Tag                  Statement
    " TYPE
    hi! link StorageClass         Constant
    hi! link Structure            Constant
    hi! link Type                 Constant
    hi! link Typedef              Constant
    " EXTRA
    hi! link gitCommitSummary     Normal
    hi! link javaScriptFunction   Statement
    hi! link javaScriptIdentifier Statement
    hi! link markdownUrl          Underline
    hi! link pythonDecorator      Statement
    hi! link pythonException      Statement
    hi! link pythonExceptions     Statement
    hi! link pythonInclude        Statement
    hi! link rustAssert           Statement
    hi! link rustPanic            Statement
    hi! link sqlKeyword           Statement
    hi! link yamlBlockMappingKey  Statement
    hi! link yamlFlowMappingKey   Statement

    " ┌────────────────────────────────────────────────────┐
    " │  HIGHLIGHT GROUP, 8 COLOR                          │
    " └────────────────────────────────────────────────────┘

    " CURSOR
    hi Cursor                     ctermfg=NONE ctermbg=NONE cterm=NONE
    hi! link CursorColumn         Cursor
    hi! link CursorLine           Cursor
    hi! link CursorLineFold       Folded
    hi! link CursorLineSign       Visual
    " DEBUG
    hi Debug                      ctermfg=5    ctermbg=7    cterm=bold,reverse
    hi QuickFixLine               ctermfg=NONE ctermbg=NONE cterm=underline
    hi! link debugBreakpoint      Debug
    hi! link debugPC              Debug
    " DIFF
    hi DiffAdd                    ctermfg=7*   ctermbg=5    cterm=NONE
    hi DiffChange                 ctermfg=2*   ctermbg=5    cterm=NONE
    hi DiffDelete                 ctermfg=1    ctermbg=5    cterm=NONE
    hi DiffText                   ctermfg=0    ctermbg=5    cterm=NONE
    hi! link Added                DiffAdd
    hi! link Changed              DiffChange
    hi! link Removed              DiffDelete
    hi! link diffAdded            DiffAdd
    hi! link diffRemoved          DiffDelete
    hi! link diffSubname          DiffText
    " FOLD
    hi Folded                     ctermfg=7    ctermbg=7    cterm=bold,reverse
    hi! link FoldColumn           Folded
    " LINE NUMBER
    hi CursorLineNr               ctermfg=7    ctermbg=NONE cterm=bold
    hi LineNr                     ctermfg=0    ctermbg=NONE cterm=bold
    hi! link LineNrAbove          LineNr
    hi! link LineNrBelow          LineNr
    " MENU
    hi Pmenu                      ctermfg=7    ctermbg=4    cterm=NONE
    hi PmenuSbar                  ctermfg=NONE ctermbg=0    cterm=NONE
    hi PmenuSel                   ctermfg=7    ctermbg=4    cterm=bold,underline
    hi PmenuThumb                 ctermfg=7    ctermbg=0    cterm=NONE
    hi! link MessageWindow        Pmenu
    hi! link PmenuExtra           Pmenu
    hi! link PmenuExtraSel        PmenuSel
    hi! link PmenuKind            Pmenu
    hi! link PmenuKindSel         PmenuSel
    hi! link WildMenu             Visual
    " MESSAGE
    hi Error                      ctermfg=1    ctermbg=NONE cterm=bold
    hi ModeMsg                    ctermfg=5    ctermbg=NONE cterm=bold
    hi Todo                       ctermfg=3    ctermbg=NONE cterm=bold
    hi WarningMsg                 ctermfg=3    ctermbg=NONE cterm=bold
    hi! link ErrorMsg             Error
    hi! link Exception            Error
    hi! link MoreMsg              ModeMsg
    hi! link PopupNotification    Todo
    hi! link Question             ModeMsg
    " NETRW
    hi Directory                  ctermfg=4    ctermbg=NONE cterm=bold
    hi netrwExe                   ctermfg=2    ctermbg=NONE cterm=bold
    " NON-TEXT
    hi ColorColumn                ctermfg=NONE ctermbg=NONE cterm=reverse
    hi Ignore                     ctermfg=7    ctermbg=NONE cterm=NONE
    hi NonText                    ctermfg=3    ctermbg=NONE cterm=NONE
    hi ToolbarButton              ctermfg=7    ctermbg=NONE cterm=bold
    hi VertSplit                  ctermfg=0    ctermbg=3    cterm=reverse
    hi! link Conceal              Ignore
    hi! link EndOfBuffer          NonText
    hi! link SignColumn           ColorColumn
    hi! link ToolbarLine          StatusLine
    " PARENTHESES
    hi MatchParen                 ctermfg=5    ctermbg=2    cterm=bold
    " SEARCH
    hi Search                     ctermfg=3    ctermbg=0    cterm=bold
    hi! link CurSearch            Search
    hi! link IncSearch            Search
    " SPELL
    hi SpellBad                   ctermfg=1    ctermbg=NONE cterm=bold
    hi SpellCap                   ctermfg=3    ctermbg=NONE cterm=bold
    hi! link SpellLocal           SpellCap
    hi! link SpellRare            SpellCap
    " STATUSLINE, ‘NC’ NOT CURRENT
    hi StatusLine                 ctermfg=7    ctermbg=3    cterm=bold
    hi StatusLineNC               ctermfg=3    ctermbg=0    cterm=NONE
    hi! link StatusLineTerm       StatusLine
    hi! link StatusLineTermNC     StatusLineNC
    " TABLINE
    hi TabLineSel                 ctermfg=7    ctermbg=NONE cterm=bold
    hi! link TabLine              StatusLine
    hi! link TabLineFill          StatusLine
    " TEXT
    hi Normal                     ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Title                      ctermfg=7    ctermbg=NONE cterm=bold
    hi Underlined                 ctermfg=NONE ctermbg=NONE cterm=underline
    hi! link Terminal             Normal
    hi! link gitCommitSummary     Normal
    hi! link markdownUrl          Underline
    " VISUAL
    hi Visual                     ctermfg=7    ctermbg=4    cterm=bold
    hi! link VisualNOS            Visual
    " DONE
    finish
endif

function! s:hl(group, guisp, guifg, guibg, gui, cterm)
    let cmd = ""

    if a:guisp == ""
        let cmd = cmd . " guisp=NONE"
    else
        let cmd = cmd . " guisp=" . a:guisp
    endif

    if a:guifg == ""
        let cmd = cmd . " guifg=NONE"
    else
        let cmd = cmd . " guifg=" . a:guifg
    endif

    if a:guibg == ""
        let cmd = cmd . " guibg=NONE"
    else
        let cmd = cmd . " guibg=" . a:guibg
    endif

    if a:gui == ""
        let cmd = cmd . " gui=NONE"
    else
        let cmd = cmd . " gui=" . a:gui
    endif

    if a:cterm == ""
        let cmd = cmd . " cterm=NONE"
    else
        let cmd = cmd . " cterm=" . a:cterm
    endif

    exec "highlight " . a:group . cmd . " ctermfg=NONE ctermbg=NONE term=nocombine"
endfunction

if (has('termguicolors') && &t_Co >= 256)
    set termguicolors

    let s:coral    = "#FAB8B8" " HUE:     0 LIGHTNESS: 80.78
    let s:gold     = "#D6BCA2" " HUE:  30.0 LIGHTNESS: 77.80
    let s:yellow   = "#D6BA66" " HUE:  45.0 LIGHTNESS: 76.30
    let s:cyan     = "#8AD6D6" " HUE: 180.0 LIGHTNESS: 80.93
    let s:violet   = "#DABCF8" " HUE: 270.0 LIGHTNESS: 80.54
    let s:pink     = "#F078D2" " HUE: 315.0 LIGHTNESS: 66.98
    let s:red      = "#EC5C68" " HUE: 355.0 LIGHTNESS: 58.50

    let s:white    = "#F2F2F2" " HUE:     0 LIGHTNESS: 95.49
    let s:grey1    = "#484848" " HUE:     0 LIGHTNESS: 30.59
    let s:grey2    = "#565656" " HUE:     0 LIGHTNESS: 36.57
    let s:grey3    = "#989690" " HUE:  45.0 LIGHTNESS: 62.08
    let s:grey4    = "#B4B4B4" " HUE:     0 LIGHTNESS: 73.31
    let s:grey5    = "#C2C2C2" " HUE:     0 LIGHTNESS: 78.43
    let s:contrast = "#004040" " HUE: 180.0 LIGHTNESS: 23.79

    let s:comment  = "#6E7A7A" " HUE: 180.0 LIGHTNESS: 50.26
    let s:curline  = "#201A18" " HUE:  15.0 LIGHTNESS:  9.89
    let s:folded   = "#90867C" " HUE:  30.0 LIGHTNESS: 56.52
    let s:nontext  = "#641400" " HUE:  12.0 LIGHTNESS: 20.86
    let s:text     = "#BCD4DC" " HUE: 195.0 LIGHTNESS: 83.41

    let s:diff     = "#2E1C2E" " HUE: 300.0 LIGHTNESS: 13.28
    let s:diffadd  = "#BAE2C4" " HUE: 135.0 LIGHTNESS: 86.41
    let s:diffblue = "#A8A8C2" " HUE: 240.0 LIGHTNESS: 69.63
    let s:difftext = "#E8E8E8" " HUE:     0 LIGHTNESS: 92.00

    let s:menu     = "#360E2C" " HUE: 315.0 LIGHTNESS: 11.14
    let s:menubar  = "#2C282A" " HUE: 330.0 LIGHTNESS: 16.60
    let s:menusel  = "#4E263A" " HUE: 330.0 LIGHTNESS: 21.25

    let s:normalbg = "#1A1212" " HUE:     0 LIGHTNESS:  6.29
    let s:normalfg = "#D2CECC" " HUE:  20.0 LIGHTNESS: 83.02

    let s:searchbg = "#36343C" " HUE: 255.0 LIGHTNESS: 22.18
    let s:searchfg = "#D6FE5E" " HUE:  75.0 LIGHTNESS: 94.31

    let s:statusbg = "#363636" " HUE:     0 LIGHTNESS: 22.62
    let s:statusfg = "#BCBAB6" " HUE:  40.0 LIGHTNESS: 75.57
    let s:statusnc = "#1A2222" " HUE: 180.0 LIGHTNESS: 12.47

    let s:visualbg = "#14265C" " HUE: 225.0 LIGHTNESS: 17.03
    let s:visualfg = "#B2B2CA" " HUE: 240.0 LIGHTNESS: 73.27

    let s:dir      = "#56A8FA" " HUE: 210.0 LIGHTNESS: 67.19
    let s:exe      = "#6ABE6A" " HUE: 120.0 LIGHTNESS: 70.13

    " ┌────────────────────────────────────────────────────┐
    " │  SYNTAX GROUP, 256 COLOR                           │
    " └────────────────────────────────────────────────────┘

    " COMMENT
    call s:hl("Comment", "NONE", s:comment, "NONE", "NONE", "NONE")
    " CONSTANT
    call s:hl("Character", "NONE", s:text, "NONE", "NONE", "NONE")
    call s:hl("Constant", "NONE", s:gold, "NONE", "NONE", "NONE")
    hi! link Boolean              Character
    hi! link Float                Character
    hi! link Number               Character
    hi! link String               Character
    " IDENTIFIER
    call s:hl("Identifier", "NONE", s:coral, "NONE", "NONE", "NONE")
    hi! link Function             Identifier
    " STATEMENT
    call s:hl("Statement", "NONE", s:cyan, "NONE", "NONE", "NONE")
    hi! link Conditional          Statement
    hi! link Keyword              Statement
    hi! link Label                Statement
    hi! link Operator             Statement
    hi! link Repeat               Statement
    " PREPROC
    call s:hl("PreProc", "NONE", s:violet, "NONE", "NONE", "NONE")
    hi! link Define               PreProc
    hi! link Include              PreProc
    hi! link Macro                Identifier
    hi! link PreCondit            Identifier
    " SPECIAL
    hi! link Delimiter            Statement
    hi! link Special              Constant
    hi! link SpecialChar          Constant
    hi! link SpecialComment       Comment
    hi! link SpecialKey           Statement
    hi! link Tag                  Statement
    " TYPE
    hi! link StorageClass         Constant
    hi! link Structure            Constant
    hi! link Type                 Constant
    hi! link Typedef              Constant
    " EXTRA
    hi! link gitCommitSummary     Normal
    hi! link javaScriptFunction   Identifier
    hi! link javaScriptIdentifier Identifier
    hi! link markdownUrl          Underline
    hi! link pythonDecorator      Statement
    hi! link pythonException      Statement
    hi! link pythonExceptions     Statement
    hi! link pythonInclude        Statement
    hi! link rustAssert           Statement
    hi! link rustPanic            Statement
    hi! link sqlKeyword           Statement
    hi! link yamlBlockMappingKey  Statement
    hi! link yamlFlowMappingKey   Statement

    " ┌────────────────────────────────────────────────────┐
    " │  HIGHLIGHT GROUP, 256 COLOR                        │
    " └────────────────────────────────────────────────────┘

    " CURSOR
    call s:hl("CursorLine", "NONE", "NONE", s:curline, "NONE", "NONE")
    call s:hl("Cursor", "NONE", "NONE", "NONE", "NONE", "NONE")
    hi! link CursorColumn         Cursor
    hi! link CursorLineFold       Folded
    hi! link CursorLineSign       Visual
    " DEBUG
    call s:hl("Debug", "NONE", s:exe, "NONE", "NONE", "NONE")
    hi! link QuickFixLine         Debug
    hi! link debugBreakpoint      Debug
    hi! link debugPC              Debug
    " DIFF
    call s:hl("DiffAdd", "NONE", s:diffadd, s:diff, "NONE", "NONE")
    call s:hl("DiffChange", "NONE", s:diffblue, s:diff, "NONE", "NONE")
    call s:hl("DiffDelete", "NONE", s:red, s:diff, "NONE", "NONE")
    call s:hl("DiffText", "NONE", s:difftext, s:diff, "NONE", "NONE")
    hi! link Added                DiffAdd
    hi! link Changed              DiffChange
    hi! link Removed              DiffDelete
    hi! link diffAdded            DiffAdd
    hi! link diffRemoved          DiffDelete
    hi! link diffSubname          DiffText
    " FOLD
    call s:hl("Folded", "NONE", s:folded, s:diff, "NONE", "NONE")
    hi! link FoldColumn           Folded
    " LINE NUMBER
    call s:hl("CursorLineNr", "NONE", s:grey3, "NONE", "NONE", "NONE")
    call s:hl("LineNr", "NONE", s:grey1, "NONE", "NONE", "NONE")
    hi! link LineNrAbove          LineNr
    hi! link LineNrBelow          LineNr
    " MENU
    call s:hl("Pmenu", "NONE", s:grey5, s:menu, "NONE", "NONE")
    call s:hl("PmenuSbar", "NONE", s:menubar, "NONE", "NONE", "reverse")
    call s:hl("PmenuSel", "NONE", s:white, s:menusel, "NONE", "NONE")
    call s:hl("PmenuThumb", "NONE", s:grey2, "NONE", "NONE", "reverse")
    hi! link MessageWindow        Pmenu
    hi! link PmenuExtra           Pmenu
    hi! link PmenuExtraSel        PmenuSel
    hi! link PmenuKind            Pmenu
    hi! link PmenuKindSel         PmenuSel
    hi! link WildMenu             Visual
    " MESSAGE
    call s:hl("Error", "NONE", s:red, "#000000", "NONE", "NONE")
    call s:hl("ErrorMsg", "NONE", s:red, "NONE", "NONE", "NONE")
    call s:hl("ModeMsg", "NONE", s:pink, "NONE", "NONE", "NONE")
    call s:hl("Todo", "NONE", s:exe, "NONE", "NONE", "bold")
    call s:hl("WarningMsg", "NONE", s:yellow, "NONE", "NONE", "NONE")
    hi! link Exception            ErrorMsg
    hi! link MoreMsg              ModeMsg
    hi! link PopupNotification    Todo
    hi! link Question             ModeMsg
    " NETRW
    call s:hl("Directory", "NONE", s:dir, "NONE", "NONE", "NONE")
    call s:hl("netrwExe", "NONE", s:exe, "NONE", "NONE", "NONE")
    call s:hl("netrwSymLink", "NONE", s:text, "NONE", "NONE", "NONE")
    " NON-TEXT
    call s:hl("ColorColumn", "NONE", s:diff, "NONE", "NONE", "reverse")
    call s:hl("NonText", "NONE", s:nontext, "NONE", "NONE", "NONE")
    hi! link Conceal              Comment
    hi! link EndOfBuffer          NonText
    hi! link Ignore               Comment
    hi! link SignColumn           ColorColumn
    hi! link ToolbarButton        PmenuSel
    hi! link ToolbarLine          StatusLine
    hi! link VertSplit            NonText
    " PARENTHESES
    call s:hl("MatchParen", "NONE", s:white, s:contrast, "NONE", "bold")
    " SEARCH
    call s:hl("Search", "NONE", s:searchfg, s:searchbg, "NONE", "NONE")
    hi! link CurSearch            Search
    hi! link IncSearch            Search
    " SPELL
    call s:hl("SpellBad", s:red, "NONE", "NONE", "underline", "underline")
    call s:hl("SpellCap", s:yellow, "NONE", "NONE", "underline", "underline")
    hi! link SpellLocal           SpellCap
    hi! link SpellRare            SpellCap
    " STATUSLINE, ‘NC’ NOT CURRENT
    call s:hl("StatusLine", "NONE", s:statusfg, s:statusbg, "NONE", "NONE")
    call s:hl("StatusLineNC", "NONE", s:grey3, s:statusnc, "NONE", "NONE")
    hi! link StatusLineTerm       StatusLine
    hi! link StatusLineTermNC     StatusLineNC
    " TABLINE
    hi! link TabLine              StatusLineNC
    hi! link TabLineFill          StatusLine
    hi! link TabLineSel           StatusLine
    " TEXT
"    call s:hl("Normal", "NONE", "NORMAL", "NORMAL", "NONE", "NONE")
    call s:hl("Normal", "NONE", s:normalfg, s:normalbg, "NONE", "NONE")
    call s:hl("Underlined", "NONE", "NONE", "NONE", "NONE", "underline")
    hi! link Terminal             Normal
    hi! link Title                Constant
    " VISUAL
    call s:hl("Visual", "NONE", s:visualfg, s:visualbg, "NONE", "NONE")
    hi! link VisualNOS            Visual
endif


