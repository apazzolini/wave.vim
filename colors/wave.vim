if !has('gui_running') && &t_Co < 256
  finish
endif

"hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'wave'

if &background ==# 'dark'
  if empty($TMUX)
    hi! Normal ctermbg=NONE guibg=#1c2023 guifg=#c7ccd1
  else
    " When we're using vim in tmux, we want the background to be transparent
    " so that the active tmux pane is more readily apparant.
    hi! Normal ctermbg=NONE guibg=NONE guifg=#c7ccd1
  endif

  let g:wRgbBlack     = '#1c2023'
  let g:wRgbRed       = '#d19b9b'
  let g:wRgbGreen     = '#a2c7a9'
  let g:wRgbYellow    = '#dcdcaa'
  let g:wRgbBlue      = '#ae95c7'
  let g:wRgbMagenta   = '#c795ae'
  let g:wRgbCyan      = '#95aec7'
  let g:wRgbWhite     = '#c7ccd1'
  let g:wRgbBrightRed = '#d19b9b'
  let g:wRgb22        = '#a27f74'
  let g:wRgb244       = '#2b3034'
  let g:wRgb245       = '#565e65'
  let g:wRgb246       = '#747c84'
  let g:wRgb247       = '#adb3ba'
  let g:wRgb248       = '#c7ccd1'
  let g:wRgb249       = '#dfe2e5'
else
  hi! Normal ctermbg=NONE guibg=#d5d6d7 guifg=#0c1c2b

  let g:wRgbBlack     = '#f7f9fb'
  let g:wRgbRed       = '#bf5656'
  let g:wRgbGreen     = '#5f8539'
  let g:wRgbYellow    = '#bfbf56'
  let g:wRgbBlue      = '#568bbf'
  let g:wRgbMagenta   = '#bf568b'
  let g:wRgbCyan      = '#56bf8b'
  let g:wRgbWhite     = '#0b1c2c'
  let g:wRgbBrightRed = '#bf8b56'
  let g:wRgb22        = '#a27f74'
  let g:wRgb244       = '#2b3034'
  let g:wRgb245       = '#565e65'
  let g:wRgb246       = '#747c84'
  let g:wRgb247       = '#adb3ba'
  let g:wRgb248       = '#c7ccd1'
  let g:wRgb249       = '#dfe2e5'
endif

" Color definitions
let g:wBlack='ctermfg=0 guifg='.g:wRgbBlack
let g:wRed='ctermfg=1 guifg='.g:wRgbRed
let g:wGreen='ctermfg=2 guifg='.g:wRgbGreen
let g:wYellow='ctermfg=3 guifg='.g:wRgbYellow
let g:wBlue='ctermfg=4 guifg='.g:wRgbBlue
let g:wMagenta='ctermfg=5 guifg='.g:wRgbMagenta
let g:wCyan='ctermfg=6 guifg='.g:wRgbCyan
let g:wWhite='ctermfg=7 guifg='.g:wRgbWhite
let g:wFg22='ctermfg=22 guifg='.g:wRgb22
let g:wFg1='ctermfg=244 guifg='.g:wRgb244
let g:wFg2='ctermfg=245 guifg='.g:wRgb245
let g:wFg3='ctermfg=246 guifg='.g:wRgb246
let g:wFg4='ctermfg=247 guifg='.g:wRgb247
let g:wFg5='ctermfg=248 guifg='.g:wRgb248
let g:wFg6='ctermfg=249 guifg='.g:wRgb249

let g:wBrightRed='ctermfg=9 guifg='.g:wRgbBrightRed

let g:wBlackBg='ctermbg=0 guibg='.g:wRgbBlack
let g:wRedBg='ctermbg=1 guibg='.g:wRgbRed
let g:wGreenBg='ctermbg=2 guibg='.g:wRgbGreen
let g:wYellowBg='ctermbg=3 guibg='.g:wRgbYellow
let g:wBlueBg='ctermbg=4 guibg='.g:wRgbBlue
let g:wMagentaBg='ctermbg=5 guibg='.g:wRgbMagenta
let g:wCyanBg='ctermbg=6 guibg='.g:wRgbCyan
let g:wWhiteFg='ctermbg=7 guibg='.g:wRgbWhite
let g:wBg1='ctermbg=244 guibg='.g:wRgb244
let g:wBg2='ctermbg=245 guibg='.g:wRgb245
let g:wBg3='ctermbg=246 guibg='.g:wRgb246
let g:wBg4='ctermbg=247 guibg='.g:wRgb247
let g:wBg5='ctermbg=248 guibg='.g:wRgb248
let g:wBg6='ctermbg=249 guibg='.g:wRgb249

let g:wItalic='cterm=italic gui=italic'
let g:wNoBg='ctermbg=none guibg=none'
let g:wNoFg='ctermbg=none guibg=none'
let g:wNoCterm='cterm=none gui=none'

function! s:HL(group, ...)
    let i=0
    let cmd=['hi!', a:group]
    while i < a:0
        call add(cmd, a:000[i])
        let i += 1
    endwhile

    execute join(cmd, ' ')
endfunction

" Search and Selection
if &background ==# 'dark'
  call s:HL('Visual', g:wBg2)
  call s:HL('QuickFixLine', g:wBg2, g:wFg5)
  call s:HL('Search', g:wBg2, g:wWhite)
  hi! link IncSearch Search
else
  call s:HL('Visual', g:wBg5)
  call s:HL('QuickFixLine', g:wBg2, g:wFg5)
  call s:HL('Search', g:wBg4)
  hi! link IncSearch Search
endif

call s:HL('Pmenu', g:wBg2, g:wFg5)
call s:HL('PmenuSel', g:wBg1, g:wFg5)

" One-off misc highlightings
call s:HL('ColorColumn', g:wBg1)
call s:HL('Directory', g:wGreen)
call s:HL('Comment', g:wFg3, g:wItalic)
call s:HL('Directory', g:wGreen)
call s:HL('SignColumn', g:wNoBg)
call s:HL('Error', g:wRed, g:wNoBg)
call s:HL('ErrorMsg', g:wRed, g:wNoBg)
call s:HL('DiffText', g:wRed)
call s:HL('Question', g:wGreen)
call s:HL('MoreMsg', g:wGreen)
call s:HL('ModeMsg', g:wGreen, g:wNoCterm)
call s:HL('MatchParen', g:wBlue, g:wNoBg)
call s:HL('Title', g:wBlue)
call s:HL('Special', g:wBlue)
call s:HL('SpecialKey', g:wBlue)
call s:HL('NonText', g:wFg1)
call s:HL('VertSplit', g:wNoBg, g:wFg3, g:wNoCterm)
call s:HL('CursorLine', g:wBg1, g:wNoCterm)
call s:HL('Cursor', g:wNoCterm, g:wRedBg, g:wBlack)
call s:HL('Todo', g:wNoBg, g:wRed, g:wItalic)
call s:HL('TabLineSel', g:wBg1, g:wGreen, g:wNoCterm)
call s:HL('TabLineFill', g:wNoBg, g:wNoFg, g:wNoCterm)
call s:HL('TabLine', g:wNoBg, g:wFg2, g:wNoCterm)
call s:HL('LineNr', g:wFg2)
call s:HL('CursorLineNr', g:wFg4)
call s:HL('qfLineNr', g:wRed)
call s:HL('jsSwitchCase', g:wBlue)
call s:HL('Folded', g:wNoBg)
call s:HL('diffRemoved', g:wRed)
call s:HL('ReactHook', g:wYellow)

call s:HL('jsFlowDefinition', g:wMagenta)
call s:HL('jsFlowType', g:wMagenta)
call s:HL('jsxComponentName', g:wBlue)

" Uncolored
call s:HL('jsGlobalObjects', g:wWhite)
call s:HL('jsGlobalNodeObjects', g:wWhite)
call s:HL('jsBuiltins', g:wWhite)
call s:HL('Whitespace', g:wWhite)
call s:HL('jsFuncCall', g:wWhite)
call s:HL('jsArrowFunction', g:wWhite)
call s:HL('TSPunctDelimiter', g:wWhite)
call s:HL('TSPunctBracket', g:wWhite)
call s:HL('TSPunctSpecial', g:wWhite)
call s:HL('TSConstructor', g:wWhite)
call s:HL('TSParameter', g:wWhite)
call s:HL('TSProperty', g:wWhite)
call s:HL('TSConstant', g:wWhite)

" Keywords
call s:HL('Keyword', g:wCyan)
hi! link jsImport Keyword
hi! link jsFrom Keyword
hi! link jsExport Keyword
hi! link jsExportDefault Keyword
hi! link jsStorageClass Keyword
hi! link jsKeyword Keyword
hi! link jsAsyncKeyword Keyword
hi! link jsReturn Keyword
hi! link jsConditional Keyword
hi! link jsForAwait Keyword
hi! link jsTry Keyword
hi! link jsCatch Keyword
hi! link jsException Keyword
hi! link jsFinally Keyword
hi! link jsRepeat Keyword
hi! link jsOperator Keyword

" Strings
call s:HL('String', g:wGreen)
hi! link jsString String
hi! link Identifier String
hi! link jsTemplateString String
hi! link jsObjectStringKey String

" Symbols and Numbers
call s:HL('Statement', g:wCyan)
hi! link Constant Statement
hi! link PreProc Statement
hi! link Type Statement
hi! link jsNumber Statement
hi! link jsBooleanTrue Statement
hi! link jsBooleanFalse Statement

" Function names
call s:HL('Function', g:wBlue)
hi! link jsFuncAssignment Function
hi! link jsObjectFuncName Function

" Class names
call s:HL('ClassName', g:wYellow)
call s:HL('TSNamespace', g:wCyan)
call s:HL('TSTag', g:wBlue)
call s:HL('jsxAttribute', g:wCyan)

" Etc
hi! link cssBraces Delimiter
hi! link cssClassName Special
hi! link xmlEndTag xmlTag
hi! link jsxCloseTag jsxTag
hi! link jsxCloseString jsxTag
hi! link jsxTagName jsxComponentName
hi! link jsxOpenPunct jsxComponentName
hi! link jsxClosePunct jsxComponentName
hi! link jsxOpenString jsxComponentName
hi! link jsxCloseString jsxComponentName

" Ale
call s:HL('SpellBad', g:wNoBg, g:wBrightRed, g:wNoCterm)
hi! link ALEErrorSign SpellBad
hi! link ALEWarning SpellBad
hi! link ALEInfo SpellBad
hi! link ALEStyleError SpellBad

call s:HL('NoUnderline', g:wNoBg, g:wNoCterm)
hi! link CocUnderline NoUnderline

call s:HL('WaveVirtualText', g:wFg22)
hi! link CocWarningVirtualText WaveVirtualText
hi! link CocErrorVirtualText WaveVirtualText
hi! link CocInfoVirtualText WaveVirtualText
hi! link CocHintVirtualText WaveVirtualText
hi! link CocWarningSign WaveVirtualText

call s:HL('VimWikiLink', g:wNoBg, g:wNoCterm, g:wBlue)
call s:HL('VimWikiHr', g:wNoBg, g:wNoCterm, g:wNoFg)
hi! link VimwikiList Normal

" CoC
"highlight CocErrorHighlight ctermfg=DarkRed cterm=none
"highlight CocErrorSign ctermfg=DarkRed cterm=none
"highlight CocErrorVirtualText ctermfg=Red
"highlight CocFloating ctermbg=244

" NERDTree
" call s:HL('NERDTreeCWD', g:wGreen)
" call s:HL('NERDTreeFile', g:wWhite)
" call s:HL('NERDTreeHelp', g:wWhite)
" call s:HL('NERDTreeDir', g:wCyan, g:wNoCterm)
" hi! link NERDTreeDirSlash NERDTreeDir
" hi! link NERDTreeOpenable NERDTreeDir
" hi! link NERDTreeClosable NERDTreeDir
"
" call s:HL('NERDTreeExecFile', g:wRed)
" call s:HL('NERDTreeUp', g:wRed)
" call s:HL('NERDTreeToggleOn', g:wRed)
" call s:HL('NERDTreeToggleOff', g:wRed)
"
" call s:HL('NERDTreeFlags', g:wMagenta)
" call s:HL('NERDTreeGitStatusModified', g:wMagenta)
" call s:HL('NERDTreeGitStatusStaged', g:wMagenta)
" call s:HL('NERDTreeGitStatusRenamed', g:wMagenta)
" call s:HL('NERDTreeGitStatusUnmerged', g:wMagenta)
" call s:HL('NERDTreeGitStatusUntracked', g:wMagenta)
" call s:HL('NERDTreeGitStatusDirDirty', g:wMagenta)
" call s:HL('NERDTreeGitStatusDirClean', g:wMagenta)
" call s:HL('NERDTreeGitStatusIgnored', g:wMagenta)
