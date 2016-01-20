set nocompatible
filetype off
"Must be disabled for :BundleInstall
set shellslash

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'plasticboy/vim-markdown'
Bundle 'jnurmine/Zenburn'
Bundle 'othree/xml.vim'
Bundle 'othree/html5.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'ack.vim'
Bundle 'paredit.vim'
Bundle 'tpope/vim-fireplace'
Bundle 'jiangmiao/simple-javascript-indenter'
Bundle 'pangloss/vim-javascript'
Bundle 'SirVer/ultisnips'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'vim-scripts/tComment'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tommcdo/vim-exchange'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'b4winckler/vim-angry'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'reedes/vim-wordy'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'Shougo/vimproc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'lambdatoast/elm.vim'

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
let g:airline_theme = 'solarized'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
if s:os == "osx"
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
endif
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#right_sep = '⮂'
if s:os == "osx"
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
endif
let g:airline#extensions#branch#enabled = 1

set t_Co=16
syntax enable
"Colorscheme settings
set background=dark
colorscheme solarized

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

nmap <F2> :NERDTreeToggle<CR>
nmap <leader><F2> :NERDTreeFind<CR>

function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Gstatus
    endif
endfunction
command ToggleGStatus :call ToggleGStatus()
nmap <F3> :ToggleGStatus<CR>

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

let g:ctrlp_root_markers = ['.ctrlp_root']
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|build|out|(resources\/public\/(out|css)))$'

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
noremap <leader>ea :silent %Eval<CR>:Last!<CR>
noremap <leader>ec :silent Eval<CR>:Last!<CR>
command WeaselConnect :Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001)<CR>

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_python_checkers = ['python', 'pyflakes']
au BufNewFile,BufRead *.jsx let b:syntastic_checkers = ['jsxhint']
au BufNewFile,BufRead *.hs let b:syntastic_checkers = ['hdevtools', 'hlint']

noremap ,t :GhcModType<CR>
noremap ,T :GhcModTypeInsert<CR>

set iskeyword+=-

set exrc
set secure
