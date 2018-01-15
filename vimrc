set nocompatible
filetype off
"Must be disabled for :BundleInstall
set shellslash

set rtp+=~/.vim/bundle/Vundle.vim

let mapleader = "\<Space>"

call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'scrooloose/nerdtree'
Bundle 'plasticboy/vim-markdown'
Bundle 'jnurmine/Zenburn'
Bundle 'othree/xml.vim'
Bundle 'othree/html5.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'paredit.vim'
Bundle 'tpope/vim-fireplace'
Bundle 'jiangmiao/simple-javascript-indenter'
Bundle 'pangloss/vim-javascript'
Bundle 'SirVer/ultisnips'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'vim-scripts/tComment'
Bundle 'tommcdo/vim-exchange'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'b4winckler/vim-angry'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'reedes/vim-wordy'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'Shougo/vimproc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'lambdatoast/elm.vim'
Bundle 'actionshrimp/vim-xpath'
Bundle 'avakhov/vim-yaml'
Bundle 'fatih/vim-go'

Bundle 'junegunn/fzf'
Bundle 'junegunn/fzf.vim'

Bundle 'easymotion/vim-easymotion'


call vundle#end()

let s:os = "windows"
if has("unix")
    let s:os = "unix"
    let s:uname = system("uname -s")
    if s:uname =~ "Darwin"
        let s:os = "osx"
    endif
endif

"Indentation
filetype plugin indent on
set autoindent

set fileformats=unix,dos
set fileformat=unix
set backspace=indent,eol,start
set hidden
set ruler
set number
set colorcolumn=80

set ignorecase
set smartcase

set incsearch
set hlsearch

"Use console dialogs instead of popup for simple choices
set guioptions+=c
"Remove toolbars, tearoffs and tabs
set guioptions-=t
set guioptions-=T
set guioptions-=e

"Statusline (and powerline) config
set laststatus=2
"let g:airline_theme = 'solarized'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"" airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '*'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#branch#enabled = 1

set t_Co=256
syntax enable
"Colorscheme settings
set background=dark
"colorscheme afterglow

set foldmethod=syntax
let g:xml_syntax_folding=1
set foldlevelstart=99

"Make :W typo do what you want
command W :w
command Q :q
command Qa :qa
command Wqa :wqa

"Print directory of current file
command Pfd echo expand('%:p:h')


"Folding - unfold everything by default
au BufRead * normal zR
au FileType gitcommit setlocal foldlevel=99

set completeopt+=longest
set completeopt+=menuone
set wildmenu

set path+=**
set suffixesadd+=.js,.rb,.cs,.py

set encoding=utf8

set list
set listchars=tab:›\ ,eol:¬

"Maps space to clear search highlighting
nmap <SPACE> <SPACE>:noh<CR>:silent! HdevtoolsClear<CR>:echo<CR>

set gfn=Droid_Sans_Mono_for_Powerline:h9:cANSI

set backupdir=~/.backups/vim

autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost /tmp*clj set bufhidden=delete
noremap <leader>bo :BufOnly<CR>

"Fullscreen when entering the gui
if has('gui')
    au GUIEnter * simalt ~x
endif

"Make incsearch more readable
hi! IncSearch term=standout,reverse cterm=standout,reverse ctermbg=NONE

"Use local vimrc to change this per-project
set ts=4 sw=4 sts=4 et

"Use js-beautify for gq in js files
function! BeautifyJs()
    echo "calling js beautify"
    let currentET = &et
    set et
    let startline = v:lnum
    let endline = v:lnum + v:count - 1
    exe startline . "," . endline . "retab!"
    exe startline . "," . endline . " ! js-beautify -j -w 80 -f -"
    let &et = currentET
    retab!
endfunction

au FileType javascript setl formatexpr=BeautifyJs()
let g:SimpleJsIndenter_BriefMode = 1

"Allow multiple visual indents
vnoremap < <gv
vnoremap > >gv

let g:rainbows=0
function! ToggleRainbows()
    let g:rainbows = !g:rainbows
    echo g:rainbows
    RainbowParenthesesToggle
    RainbowParenthesesLoadRound
    RainbowParenthesesLoadSquare
    RainbowParenthesesLoadBraces
    if !g:rainbows
        "required to get built in syntax highlighting back on parens
        syn on
    endif
endfunction
command ToggleRainbows :call ToggleRainbows()
noremap <leader>r :ToggleRainbows<CR>

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:paredit_electric_return = 0

if filereadable(glob('~/.vimrc.local'))
    source ~/.vimrc.local
endif

noremap <leader>d :windo ToggleDiff<CR>
function! ToggleDiff()
    if &diff
        set nodiff noscrollbind
    else
        set diff scrollbind
    endif
endfunction
command ToggleDiff :call ToggleDiff()

"Vim fireplace bindings
"noremap <leader>ea :silent %Eval<CR>:Last!<CR>
"noremap <leader>ec :silent Eval<CR>:Last!<CR>

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['jshint', 'jscs', 'eslint', 'flow']
let g:syntastic_python_checkers = ['python', 'pyflakes']
au BufNewFile,BufRead *.jsx let b:syntastic_checkers = ['jsxhint']
au BufNewFile,BufRead *.hs let b:syntastic_checkers = ['hdevtools', 'hlint']

noremap ,t :GhcModType<CR>
noremap ,T :GhcModTypeInsert<CR>

set iskeyword+=-

set exrc
set secure

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! AgCurrentWord()
    exec "Ag " . expand("<cword>")
endfunction

function! ToggleExplorerAtRoot()
  if exists(':ProjectRootExe')
    exe "ProjectRootExe NERDTreeToggle"
  else
    exe "NERDTreeToggle"
  endif
endfunction

" errors (syntastic integration)
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    SyntasticToggleMode
    " lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        " Errors
        SyntasticCheck
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Alphabetical and avoid <SILENT> for now.
nmap <LEADER><TAB> <C-^>
nmap <Leader>? :Unite output:nmap\ \<Leader\><CR>
nmap <Leader>;  <Plug>Commentary
nmap <Leader>;; <Plug>CommentaryLine
omap <Leader>;  <Plug>Commentary
vmap <Leader>;  <Plug>Commentary
nmap <Leader>au :UndotreeToggle<CR>
nmap <LEADER>bb :buffers<CR>
nmap <LEADER>bd :bdelete<CR>
nmap <LEADER>bn :bn<CR>
nmap <LEADER>bp :bp<CR>
nmap <LEADER>bR :e<CR>
nmap <silent> <Leader>el :<C-u>call ToggleErrors()<CR>
nmap <silent> <Leader>en :lnext<CR>
nmap <silent> <Leader>ep :lprev<CR>
nmap <LEADER>fed :e ~/.vimrc<CR>
nmap <LEADER>feR :source ~/.vimrc<CR>
"nmap <LEADER>ff :CtrlPCurFile<CR>
"nmap <LEADER>fr :CtrlPMRU<CR>
nmap <LEADER>fs :w<CR>
nmap <LEADER>fS :wa<CR>
nmap <LEADER>ft :NERDTreeToggle<CR>
nmap <LEADER>gb :Gblame<CR>
nmap <LEADER>gd :Gdiff<CR>
nmap <LEADER>gs :Gstatus<CR>
nmap <Leader>j= mzgg=G`z
"nmap <LEADER>pf :CtrlPRoot<CR>
nmap <LEADER>pt :call ToggleExplorerAtRoot()<CR>
nmap <LEADER>qq :qa<CR>
nmap <Leader>qQ :qa!<CR>
nmap <Leader>qs :xa<CR>
nmap <Leader>sc :noh<CR>
nmap <LEADER>sp :Ag<SPACE>
nmap <LEADER>tn :set number!<CR>
nmap <LEADER>tl :set wrap!<CR>
nmap <Leader>Td :GitGutterToggle<CR>
nmap <LEADER>w- :sp<CR>
nmap <LEADER>w/ :vsp<CR>
nmap <LEADER>w= <C-W>=
nmap <LEADER>wc :q<CR>
nmap <LEADER>wh <C-W>h
nmap <LEADER>wj <C-W>j
nmap <LEADER>wk <C-W>k
nmap <LEADER>wl <C-W>l
nmap <LEADER>ws <C-W>s
nmap <LEADER>wv <C-W>v
nmap <LEADER>wm :MaximizerToggle<CR>
nmap <LEADER>ww <C-W><C-W>
nmap <Leader>y <Plug>(easymotion-bd-jk)

nmap <LEADER>pf :Files<CR>
nmap <Leader>/ :Ag<CR>
nmap <Leader>* :call AgCurrentWord()<CR>
nmap <Leader>jj <Plug>(easymotion-overwin-f)

autocmd FileType clojure nmap <buffer> <Leader>ee 

"Fix the left window binding in neovim
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
