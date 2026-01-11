
" Ooh Las Vegas
" Aint no place for a poor boy like me
"  —Gram Parsons

" ┌────────────────────────────────────────────────────────┐
" │  INSTALL                                               │
" └────────────────────────────────────────────────────────┘

"  Copy the «oohlasvegas.vim» file to one of these paths on Unix/Linux systems …
"    • $HOME/.vimrc
"    • $HOME/.vim/vimrc
"
"  Or …
"    $ mkdir -vp ~/.vim
"    $ [[ -f "~/.netrwhist" ]] && mv -v ~/.netrwhist ~/.vim
"    $ [[ -f "~/.viminfo" ]] && mv -v ~/.viminfo ~/.vim
"    $ git clone https://github.com/ryanormous/oohlasvegas.vim
"    $ mv -vi oohlasvegas.vim/oohlasvegas.vim ~/.vim/vimrc
"
"  Plugins install to these paths (or similar) …
"    $ mkdir -vp ~/.vim/pack/site/start ~/.vim/{autoload,plugin}

" ┌────────────────────────────────────────────────────────┐
" │  OPTIONS                                               │
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

" BACKSPACE KEY FUNCTIONALITY, default ""
set backspace=indent,eol,start

" @defaults.vim
" SHOW @@@ IN LAST LINE IF TRUNCATED
set display=truncate

" ADD TAB PAGES AS INDICATED BY ‘showtabline’.
" WHEN "e" OPTION IS NOT PRESENT A NON-GUI TAB PAGES LINE
" MAY BE USED TO CHANGE TEXT IN ‘guitablabel’ LABELS.
set guioptions-=e

" @defaults.vim
" KEEP <n> LINES OF HISTORY
set history=1024

" HIGHLIGHT SEARCH
set hlsearch

" MOUSE FUNCTIONALITY
set mouse="n"

" USE vim DEFAULTS INSTEAD OF TRUE vi COMPATIBILITY
set nocompatible

" NO MODELINES
set nomodeline

" @defaults.vim
" DO NOT RECOGNIZE OCTAL NUMBERS FOR Ctrl-A AND Ctrl-X
set nrformats-=octal

" SHELL
if has('win32')
    set shell=powershell.exe
endif

" @defaults.vim
" SHOW (PARTIAL) COMMAND AT LAST LINE OF SCREEN
set showcmd

" SPECIFY viminfo WRITE PATH
set viminfo+=n~/.vim/viminfo

" ┌────────────────────────────────────────────────────────┐
" │  AUTO-FORMAT                                           │
" └────────────────────────────────────────────────────────┘

" DISABLE filetypeindent AUTOGROUP
"augroup filetypeindent
"    autocmd!
"augroup END

" MAXIMUM WIDTH OF TEXT THAT IS BEING INSERTED, default 0
"set textwidth=0

" ┌────────────────────────────────────────────────────────┐
" │  CURSOR                                                │
" └────────────────────────────────────────────────────────┘

" DISABLE CURSOR STYLING
set guicursor=""

" KEEP CURSOR AT BEGINNING OF LINE WHEN SCROLLING
set nostartofline

" CURSOR LINE HIGHLIGHTING, default off
set cursorline

" HIGHLIGHT CURSOR LINE BASED ON ACTIVE WINDOW
augroup cursorlinecolor
    autocmd!
    autocmd BufEnter * setlocal cursorline
    autocmd BufLeave * setlocal nocursorline
augroup END

" DISABLE CURSORLINE HIGHLIGHT WHEN RUNNING DIFF
augroup nocursorlinehighlight
    autocmd!
    autocmd OptionSet diff let &cursorline=!v:option_new
augroup END

" ┌────────────────────────────────────────────────────────┐
" │  FILETYPE                                              │
" └────────────────────────────────────────────────────────┘

" ENABLE filetype PLUGIN
"filetype plugin on

" ┌────────────────────────────────────────────────────────┐
" │  FOLD                                                  │
" └────────────────────────────────────────────────────────┘

" DISABLE FOLDING
set nofoldenable

" DISABLE AUTO-FORMATTING
augroup nofold
    autocmd!
    autocmd BufWinEnter * set formatoptions=""
augroup END

" ┌────────────────────────────────────────────────────────┐
" │  LINE NUMBER                                           │
" └────────────────────────────────────────────────────────┘

" LINE NUMBERS, default off
set number

" ENABLE LINE NUMBERS FOR HELP DOCUMENTATION
augroup vim helpnumber
    autocmd!
    autocmd filetype help setlocal number
augroup END

" ┌────────────────────────────────────────────────────────┐
" │  NETRW                                                 │
" └────────────────────────────────────────────────────────┘

" DISABLE NETRW BANNER
let g:netrw_banner=0

" ENABLE DIRECTORY LISTING NUMBER
let g:netrw_bufsettings="noma nomod nu nobl nowrap ro nornu"

" ┌────────────────────────────────────────────────────────┐
" │  PARENTHESIS                                           │
" └────────────────────────────────────────────────────────┘

" DISABLE PARENTHESIS MATCHING IN INSERT MODE
augroup parenno
    autocmd!
    autocmd InsertEnter * :NoMatchParen
    autocmd InsertLeave * :DoMatchParen
augroup END

" ┌────────────────────────────────────────────────────────┐
" │  RULER                                                 │
" └────────────────────────────────────────────────────────┘

" RULER, default off
set ruler

" RULER FORMAT
"set rulerformat=%3l/%L,\ %3c

" ┌────────────────────────────────────────────────────────┐
" │  STATUSLINE                                            │
" └────────────────────────────────────────────────────────┘

" ENABLE STATUS LINE FOR LAST WINDOW
"  0) never
"  1) only if there are at least two windows
"  2) always
set laststatus=2

" STATUS LINE
set statusline=\ %f\ %m%r\ %=\ %l/%L,\ %3c

" ┌────────────────────────────────────────────────────────┐
" │  WHITESPACE                                            │
" └────────────────────────────────────────────────────────┘

let s:curfile = expand("%:t")

if s:curfile =~ 'Makefile' || s:curfile =~ 'makefile' || s:curfile =~ ".*\.mk"
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
" │  WILD                                                  │
" └────────────────────────────────────────────────────────┘

" IGNORE FILES WHEN USING TAB-COMPLETE
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" ENABLE WILD MENU
if has('wildmenu')
    set wildmenu
    if v:version > 900
        " USE POP-UP
        set wildoptions=pum
    endif
endif

" WILDCARD EXPANSION (FOR TAB-COMPLETE)
set wildmode=longest:full,full

" ┌────────────────────────────────────────────────────────┐
" │  COLOR                                                 │
" └────────────────────────────────────────────────────────┘

" SYNTAX, default ‘vim’
syntax on

" CLEAR HIGHLIGHT COLORS
highlight clear

if has('termguicolors')
    set termguicolors
endif

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
    " ‘IncSearch’ HIGHLIGHT ALSO USED FOR REPLACED TEXT
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
    hi! link TabLineFill       StatusLineNC
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

    " EXIT
    finish
endif

if &t_Co < 256
    " CTERM HIGHLIGHT
    function! s:hl(group, ctermfg, ctermbg, cterm) abort
        let l:arg = " guifg=NONE guibg=NONE term=nocombine"

        if a:cterm == ""
            let l:arg = " cterm=NONE" . l:arg
        else
            let l:arg = " cterm=" . a:cterm . l:arg
        endif

        if a:ctermbg == ""
            let l:arg = " ctermbg=NONE" . l:arg
        else
            let l:arg = " ctermbg=" . a:ctermbg . l:arg
        endif

        if a:ctermfg == ""
            let l:arg = " ctermfg=NONE" . l:arg
        else
            let l:arg = " ctermfg=" . a:ctermfg . l:arg
        endif

        exec "highlight " . a:group . l:arg
    endfunction

    " ┌────────────────────────────────────────────────────┐
    " │  SYNTAX GROUP, 8 COLOR                             │
    " └────────────────────────────────────────────────────┘

    " 0 Black    |  0* Bright Black
    " 1 Red      |  1* Bright Red
    " 2 Green    |  2* Bright Green
    " 3 Yellow   |  3* Bright Yellow
    " 4 Blue     |  4* Bright Blue
    " 5 Magenta  |  5* Bright Magenta
    " 6 Cyan     |  6* Bright Cyan
    " 7 White    |  7* Bright White

    " COMMENT
    call s:hl("Comment", "0", "NONE", "bold")
    " CONSTANT
    call s:hl("Character", "7", "NONE", "NONE")
    call s:hl("Constant", "2", "NONE", "NONE")
    hi! link Boolean              Character
    hi! link Float                Character
    hi! link Number               Character
    hi! link String               Character
    " IDENTIFIER
    call s:hl("Identifier", "4", "NONE", "bold")
    hi! link Function             Identifier
    " STATEMENT
    call s:hl("Statement", "6", "NONE", "NONE")
    hi! link Conditional          Statement
    hi! link Keyword              Statement
    hi! link Label                Statement
    hi! link Operator             Character
    hi! link Repeat               Statement
    " PREPROC
    call s:hl("Macro", "3", "NONE", "NONE")
    call s:hl("PreProc", "6", "NONE", "NONE")
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
    call s:hl("Cursor", "NONE", "NONE", "NONE")
    hi! link CursorColumn         Cursor
    hi! link CursorLine           Cursor
    hi! link CursorLineFold       Folded
    hi! link CursorLineSign       Visual
    " DEBUG
    call s:hl("Debug", "5", "7", "bold,reverse")
    call s:hl("QuickFixLine", "NONE", "NONE", "underline")
    hi! link debugBreakpoint      Debug
    hi! link debugPC              Debug
    " DIFF
    call s:hl("DiffAdd", "7*", "5", "NONE")
    call s:hl("DiffChange", "2*", "5", "NONE")
    call s:hl("DiffDelete", "1", "5", "NONE")
    call s:hl("DiffText", "0", "5", "NONE")
    hi! link Added                DiffAdd
    hi! link Changed              DiffChange
    hi! link Removed              DiffDelete
    hi! link diffAdded            DiffAdd
    hi! link diffRemoved          DiffDelete
    hi! link diffSubname          DiffText
    " FOLD
    call s:hl("Folded", "7", "7", "bold,reverse")
    hi! link FoldColumn           Folded
    " LINE NUMBER
    call s:hl("CursorLineNr", "7", "NONE", "NONE")
    call s:hl("LineNr", "0", "NONE", "bold")
    hi! link LineNrAbove          LineNr
    hi! link LineNrBelow          LineNr
    " MENU
    call s:hl("Pmenu", "7", "4", "NONE")
    call s:hl("PmenuSbar", "NONE", "0", "NONE")
    call s:hl("PmenuSel", "7", "4", "bold,underline")
    call s:hl("PmenuThumb", "7", "0", "NONE")
    hi! link MessageWindow        Pmenu
    hi! link PmenuExtra           Pmenu
    hi! link PmenuExtraSel        PmenuSel
    hi! link PmenuKind            Pmenu
    hi! link PmenuKindSel         PmenuSel
    hi! link WildMenu             Visual
    " MESSAGE
    call s:hl("Error", "1", "0", "bold")
    call s:hl("ModeMsg", "5", "0", "bold")
    call s:hl("Todo", "3", "NONE", "bold")
    call s:hl("WarningMsg", "3", "NONE", "bold")
    hi! link ErrorMsg             Error
    hi! link Exception            Error
    hi! link MoreMsg              ModeMsg
    hi! link PopupNotification    Todo
    hi! link Question             ModeMsg
    " NETRW
    call s:hl("Directory", "4", "NONE", "bold")
    call s:hl("netExe", "2", "NONE", "bold")
    " NON-TEXT
    call s:hl("ColorColumn", "NONE", "NONE", "reverse")
    call s:hl("Ignore", "7", "NONE", "NONE")
    call s:hl("NonText", "3", "NONE", "NONE")
    call s:hl("ToolbarButton", "7", "NONE", "bold")
    call s:hl("VertSplit", "0", "3", "reverse")
    hi! link Conceal              Ignore
    hi! link EndOfBuffer          NonText
    hi! link SignColumn           ColorColumn
    hi! link ToolbarLine          StatusLine
    " PARENTHESES
    call s:hl("MatchParen", "5", "2", "bold")
    " SEARCH
    call s:hl("Search", "3", "0", "bold")
    hi! link CurSearch            Search
    " ‘IncSearch’ HIGHLIGHT ALSO USED FOR REPLACED TEXT
    hi! link IncSearch            Search
    " SPELL
    call s:hl("SpellBad", "1", "NONE", "bold")
    call s:hl("SpellCap", "3", "NONE", "bold")
    hi! link SpellLocal           SpellCap
    hi! link SpellRare            SpellCap
    " STATUSLINE, ‘NC’ NOT CURRENT
    call s:hl("StatusLine", "0", "7", "NONE")
    call s:hl("StatusLineNC", "0", "7", "reverse")
    hi! link StatusLineTerm       StatusLine
    hi! link StatusLineTermNC     StatusLineNC
    " TABLINE
    call s:hl("TabLineSel", "7", "NONE", "bold")
    hi! link TabLine              StatusLine
    hi! link TabLineFill          StatusLineNC
    " TEXT
    call s:hl("Normal", "NONE", "NONE", "NONE")
    call s:hl("Title", "7", "NONE", "bold")
    call s:hl("Underlined", "NONE", "NONE", "underline")
    hi! link Terminal             Normal
    hi! link gitCommitSummary     Normal
    hi! link markdownUrl          Underline
    " VISUAL
    call s:hl("Visual", "7", "4", "bold")
    hi! link VisualNOS            Visual

    " EXIT
    finish
endif

" GUI HIGHLIGHT
function! s:hl(group, guifg, guibg, guisp, gui, cterm) abort
    let l:arg = ""

    if a:guifg == ""
        let l:arg .= " guifg=NONE"
    else
        let l:arg .= " guifg=" . a:guifg
    endif

    if a:guibg == ""
        let l:arg .= " guibg=NONE"
    else
        let l:arg .= " guibg=" . a:guibg
    endif

    if a:guisp == ""
        let l:arg .= ' guisp=NONE'
    else
        let l:arg .= " guisp=" . a:guisp
    endif

    if a:gui == ""
        let l:arg .= " gui=NONE"
    else
        let l:arg .= " gui=" . a:gui
    endif

    if a:cterm == ""
        let l:arg .= " cterm=NONE"
    else
        let l:arg .= " cterm=" . a:cterm
    endif

    exec "highlight " . a:group . l:arg . " ctermfg=NONE ctermbg=NONE term=nocombine"
endfunction

" COLOR
let s:coral     = "#eabac6" " HUE: 345 LIGHTNESS: 80.00
let s:gold      = "#e2be9a" " HUE:  30 LIGHTNESS: 79.23
let s:yellow    = "#D0B870" " HUE:  45 LIGHTNESS: 75.36
let s:green     = "#6CC06C" " HUE: 120 LIGHTNESS: 70.85
let s:cyan      = "#98e4e4" " HUE: 180 LIGHTNESS: 85.89
let s:blue      = "#56AAFE" " HUE: 210 LIGHTNESS: 67.93
let s:purple    = "#dabafa" " HUE: 270 LIGHTNESS: 80.14
let s:red       = "#FC5462" " HUE: 355 LIGHTNESS: 59.81

let s:grey17    = "#2a2a2a" " HUE:   0 LIGHTNESS: 17.06
let s:grey33    = "#4E4E4E" " HUE:   0 LIGHTNESS: 33.18
let s:grey44    = "#686868" " HUE:   0 LIGHTNESS: 44.01
let s:grey61    = "#949494" " HUE:   0 LIGHTNESS: 61.32
let s:grey79    = "#c4c4c4" " HUE:   0 LIGHTNESS: 79.16
let s:white     = "#F2F2F2" " HUE:   0 LIGHTNESS: 95.49
let s:contrast  = "#004040" " HUE: 180 LIGHTNESS: 23.79

let s:comment   = "#6C8080" " HUE: 180 LIGHTNESS: 52.05
let s:curline   = "#20181a" " HUE: 345 LIGHTNESS:  9.28
let s:folded    = "#90867C" " HUE:  30 LIGHTNESS: 56.52
let s:linenum   = "#9A8C8C" " HUE:   0 LIGHTNESS: 59.45
let s:nontext   = "#780024" " HUE: 342 LIGHTNESS: 24.07
let s:text      = "#c4d4e4" " HUE: 210 LIGHTNESS: 84.19

let s:diff      = "#2A1E2A" " HUE: 300 LIGHTNESS: 13.16
let s:diffadd   = "#A6E6B6" " HUE: 135 LIGHTNESS: 86.05
let s:diffblue  = "#AAAABE" " HUE: 240 LIGHTNESS: 70.19
let s:difftext  = "#E4E4E4" " HUE:   0 LIGHTNESS: 90.59

let s:menu      = "#401822" " HUE: 345 LIGHTNESS: 14.73
let s:menusel   = "#603842" " HUE: 345 LIGHTNESS: 28.66

let s:normalbg  = "#140e0e" " HUE:   0 LIGHTNESS:  4.47
let s:normalfg  = "#dad4d2" " HUE:  15 LIGHTNESS: 85.32

let s:searchbg  = "#3C3848" " HUE: 255 LIGHTNESS: 24.50
let s:searchfg  = "#CEFC44" " HUE:  75 LIGHTNESS: 93.08

let s:statbg    = "#2e3634" " HUE: 165 LIGHTNESS: 21.83
let s:statbg_nc = "#202C30" " HUE: 195 LIGHTNESS: 17.09
let s:statfg    = "#BEBEA6" " HUE:  60 LIGHTNESS: 76.39
let s:statfg_nc = "#8CA2B8" " HUE: 210 LIGHTNESS: 65.65
let s:stat_mod  = "#8A9C54" " HUE:  75 LIGHTNESS: 61.50

let s:mode_cmd  = "#5A8A9A" " HUE: 195 LIGHTNESS: 54.75
let s:mode_ins  = "#B078A2" " HUE: 315 LIGHTNESS: 57.34
let s:mode_vis  = "#667EC6" " HUE: 225 LIGHTNESS: 53.84

let s:visualbg  = "#1a2c62" " HUE: 225 LIGHTNESS: 19.65
let s:visualfg  = "#a6b8be" " HUE: 195 LIGHTNESS: 73.61

" ┌────────────────────────────────────────────────────┐
" │  SYNTAX GROUP, 256 COLOR                           │
" └────────────────────────────────────────────────────┘

" COMMENT
call s:hl("Comment", s:comment, "NONE", "NONE", "NONE", "NONE")
" CONSTANT
call s:hl("Character", s:text, "NONE", "NONE", "NONE", "NONE")
call s:hl("Constant", s:gold, "NONE", "NONE", "NONE", "NONE")
hi! link Boolean              Character
hi! link Float                Character
hi! link Number               Character
hi! link String               Character
" IDENTIFIER
call s:hl("Identifier", s:coral, "NONE", "NONE", "NONE", "NONE")
hi! link Function             Identifier
" STATEMENT
call s:hl("Statement", s:cyan, "NONE", "NONE", "NONE", "NONE")
hi! link Conditional          Statement
hi! link Keyword              Statement
hi! link Label                Statement
hi! link Operator             Statement
hi! link Repeat               Statement
" PREPROC
call s:hl("PreProc", s:purple, "NONE", "NONE", "NONE", "NONE")
call s:hl("Include", s:cyan, "NONE", "NONE", "NONE", "NONE")
call s:hl("Define", s:white, "NONE", "NONE", "NONE", "NONE")
hi! link Macro                Identifier
hi! link PreCondit            Statement
" SPECIAL
call s:hl("SpecialKey", s:gold, "NONE", "NONE", "NONE", "NONE")
hi! link Delimiter            Statement
hi! link Special              Constant
hi! link SpecialChar          Constant
hi! link SpecialComment       Comment
hi! link Tag                  Statement
" TYPE
call s:hl("Type", s:purple, "NONE", "NONE", "NONE", "NONE")
hi! link StorageClass         Identifier
hi! link Structure            Identifier
hi! link Typedef              Statement
" EXTRA
hi! link gitCommitSummary     Normal
hi! link javaScriptFunction   Identifier
hi! link javaScriptIdentifier Identifier
hi! link markdownUrl          Underline
hi! link pythonDecorator      Statement
hi! link pythonException      Statement
hi! link pythonExceptions     Type
"hi! link pythonExceptions     Statement
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
call s:hl("CursorLine", "NONE", s:curline, "NONE", "NONE", "NONE")
call s:hl("Cursor", "NONE", "NONE", "NONE", "NONE", "NONE")
hi! link CursorColumn         Cursor
hi! link CursorLineFold       Folded
hi! link CursorLineSign       Visual
" DEBUG
call s:hl("Debug", s:green, "NONE", "NONE", "NONE", "NONE")
hi! link QuickFixLine         Debug
hi! link debugBreakpoint      Debug
hi! link debugPC              Debug
" DIFF
call s:hl("DiffAdd", s:diffadd, s:diff, "NONE", "NONE", "NONE")
call s:hl("DiffChange", s:diffblue, s:diff, "NONE", "NONE", "NONE")
call s:hl("DiffDelete", s:red, s:diff, "NONE", "NONE", "NONE")
call s:hl("DiffText", s:difftext, s:diff, "NONE", "NONE", "NONE")
hi! link Added                DiffAdd
hi! link Changed              DiffChange
hi! link Removed              DiffDelete
hi! link diffAdded            DiffAdd
hi! link diffRemoved          DiffDelete
hi! link diffSubname          DiffText
" FOLD
call s:hl("Folded", s:folded, s:diff, "NONE", "NONE", "NONE")
hi! link FoldColumn           Folded
" LINE NUMBER
call s:hl("CursorLineNr", s:linenum, s:curline, "NONE", "NONE", "NONE")
call s:hl("LineNr", s:grey33, "NONE", "NONE", "NONE", "NONE")
hi! link LineNrAbove          LineNr
hi! link LineNrBelow          LineNr
" MENU
call s:hl("Pmenu", s:grey79, s:menu, "NONE", "NONE", "NONE")
call s:hl("PmenuSbar", s:grey17, "NONE", "NONE", "NONE", "reverse")
call s:hl("PmenuSel", s:white, s:menusel, "NONE", "NONE", "NONE")
call s:hl("PmenuThumb", s:grey33, "NONE", "NONE", "NONE", "reverse")
hi! link MessageWindow        Pmenu
hi! link PmenuExtra           Pmenu
hi! link PmenuExtraSel        PmenuSel
hi! link PmenuKind            Pmenu
hi! link PmenuKindSel         PmenuSel
hi! link WildMenu             Visual
" MESSAGE
call s:hl("Error", s:red, "#000000", "NONE", "NONE", "NONE")
call s:hl("ErrorMsg", s:red, "NONE", "NONE", "NONE", "NONE")
call s:hl("ModeMsg", s:white, "NONE", "NONE", "NONE", "NONE")
call s:hl("Todo", s:green, "NONE", "NONE", "NONE", "bold")
call s:hl("WarningMsg", s:yellow, "NONE", "NONE", "NONE", "NONE")
hi! link Exception            ErrorMsg
hi! link MoreMsg              ModeMsg
hi! link PopupNotification    Todo
hi! link Question             ModeMsg
" NETRW
call s:hl("Directory", s:blue, "NONE", "NONE", "NONE", "NONE")
call s:hl("netrwExe", s:green, "NONE", "NONE", "NONE", "NONE")
call s:hl("netrwSymLink", s:text, "NONE", "NONE", "NONE", "NONE")
" NON-TEXT
call s:hl("ColorColumn", s:diff, "NONE", "NONE", "NONE", "reverse")
call s:hl("NonText", s:nontext, "NONE", "NONE", "NONE", "NONE")
hi! link Conceal              Comment
hi! link EndOfBuffer          NonText
hi! link Ignore               Comment
hi! link SignColumn           ColorColumn
hi! link ToolbarButton        PmenuSel
hi! link ToolbarLine          StatusLine
hi! link VertSplit            NonText
" PARENTHESES
call s:hl("MatchParen", s:white, s:contrast, "NONE", "NONE", "bold")
" SEARCH
call s:hl("Search", s:searchfg, s:searchbg, "NONE", "NONE", "NONE")
hi! link CurSearch            Search
" ‘IncSearch’ HIGHLIGHT ALSO USED FOR REPLACED TEXT
hi! link IncSearch            Search
" SPELL
call s:hl("SpellBad", "NONE", "NONE", s:red, "underline", "underline")
call s:hl("SpellCap", "NONE", "NONE", s:yellow, "underline", "underline")
hi! link SpellLocal           SpellCap
hi! link SpellRare            SpellCap
" STATUSLINE
call s:hl("StatusLine", s:statfg, s:statbg, "NONE", "NONE", "NONE")
call s:hl("StatusModified", s:grey17, s:stat_mod, "NONE", "NONE", "bold")
call s:hl("StatusReadonly", s:grey17, s:grey44, "NONE", "NONE", "bold")
" STATUSLINE ‘NC’ NOT CURRENT
call s:hl("StatusLineNC", s:statfg_nc, s:statbg_nc, "NONE", "NONE", "NONE")
hi! link StatusLineTerm       StatusLine
hi! link StatusLineTermNC     StatusLineNC
" STATUSLINE MODE
call s:hl("ModeCmd", s:grey17, s:mode_cmd, "NONE", "NONE", "bold")
call s:hl("ModeIns", s:grey17, s:mode_ins, "NONE", "NONE", "bold")
call s:hl("ModeRep", s:grey17, s:grey61, "NONE", "NONE", "bold")
call s:hl("ModeVis", s:grey17, s:mode_vis, "NONE", "NONE", "bold")
" TABLINE
call s:hl("TablineSel", s:white, s:grey33, "NONE", "NONE", "NONE")
hi! link TabLine              StatusLineNC
hi! link TabLineFill          StatusLineNC
" TEXT
" UNCOMMNET TO USE DEFAULT TERMINAL BACKGROUND COLOR
" call s:hl("Normal", "NORMAL", "NORMAL", "NONE", "NONE", "NONE")
call s:hl("Normal", s:normalfg, s:normalbg, "NONE", "NONE", "NONE")
call s:hl("Underlined", "NONE", "NONE", "NONE", "NONE", "underline")
hi! link Terminal             Normal
hi! link Title                Constant
" VISUAL
call s:hl("Visual", s:visualfg, s:visualbg, "NONE", "NONE", "NONE")
hi! link VisualNOS            Visual

" ┌────────────────────────────────────────────────────┐
" │  TABLINE                                           │
" └────────────────────────────────────────────────────┘

" ~/CONFIG/VIM/doc/notes_vim.txt

" SPECIFY WHEN TO DISPLAY LINE WITH TAB PAGE LABELS
"  0) never
"  1) only if there are at least two tab pages, default
"  2) always
set showtabline=1

"function! SetTabline() abort
"    let s = ''
"    for i in range(tabpagenr('$'))
"        " Highlight the selected tab
"        if i + 1 == tabpagenr()
"            let s .= '%#TabLineSel#'
"        else
"            let s .= '%#TabLine#'
"        endif
"
"        " Add tab number and optionally a custom name
"        let s .= ' ' . (i + 1) . ':'
"        let tabname = get(g:tab_names, i + 1, '')
"        if !empty(tabname)
"            let s .= ' ' . tabname
"        else
"            " Display buffer names in the tab (simplified example)
"            let buflist = tabpagebuflist(i + 1)
"            if !empty(buflist)
"                let s .= ' ' . bufname(buflist[0])
"            endif
"        endif
"        let s .= ' '
"    endfor
"
"    " Fill the rest of the tabline
"    let s .= '%#TabLineFill#%T'
"    return s
"endfunction

" TABLINE
"set tabline=%!SetTabline()

" ┌────────────────────────────────────────────────────┐
" │  STATUSLINE                                        │
" └────────────────────────────────────────────────────┘

function! GetMode() abort
    let l:current_mo = mode()
    if l:current_mo == 'i'
        " ModeIns
        return '%#ModeIns#  insert  %*'
    elseif l:current_mo =~ '[\x16Vv]'
        " ModeVis
        return '%#ModeVis#  visual  %*'
    elseif l:current_mo == 'n'
        " Normal
        return ''
    elseif l:current_mo =~ '[crt]'
        " ModeCmd
        return '%#ModeCmd#  command  %*'
    elseif l:current_mo == 'R'
        " ModeRep
        return '%#ModeRep#  replace  %*'
    else
        return ''
    endif
endfunction

function! SetStatusline() abort
    " window-ID
    if exists('g:statusline_winid')
        let l:windowid = g:statusline_winid
    else
        let l:windowid = win_getid()
    endif
    
    " BUFFER BELONGING TO window-ID
    let l:winbuffer = winbufnr(l:windowid)

    " STATUS LINE
    let l:statline = ' %f%='
  
    " ACTIVE WINDOW
    if l:windowid == win_getid()
        let l:statline .= GetMode()
    endif

    " MODIFIED
    if getbufvar(l:winbuffer, '&modified')  
        let l:statline .= '%#StatusModified#  modified  %*'
    endif

    " READONLY
    if getbufvar(l:winbuffer, '&readonly')
        let l:statline .= '%#StatusReadonly#  readonly  %*'
    endif
    
    return l:statline . ' %l/%L, %3c'
endfunction

" STATUSLINE
set statusline=%!SetStatusline()

