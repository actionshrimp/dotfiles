set nocompatible
filetype off
"Must be disabled for :BundleInstall
set shellslash

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'actionshrimp/vim-xpath'
Bundle 'plasticboy/vim-markdown'
Bundle 'jnurmine/Zenburn'
Bundle 'othree/xml.vim'
Bundle 'othree/html5.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'ack.vim'
Bundle 'paredit.vim'
Bundle 'tpope/vim-fireplace'
Bundle 'pangloss/vim-javascript'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'vim-scripts/tComment'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tommcdo/vim-exchange'

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
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 1
let g:airline#extensions#tabline#enabled = 1

" vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠'
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'

syntax on
set foldmethod=syntax
let g:xml_syntax_folding=1

"Make :W typo do what you want
command W :w

"Indentation
filetype plugin indent on
set autoindent

"Folding - unfold everything by default
au BufRead * normal zR

set completeopt+=longest
set completeopt+=menuone
set wildmenu

set path+=**
set suffixesadd+=.js,.rb,.cs,.py

set encoding=utf8

set list
set listchars=tab:›\ ,eol:¬

"Maps space to clear search highlighting
nmap <SPACE> <SPACE>:noh<CR>

set gfn=Droid_Sans_Mono_for_Powerline:h9:cANSI

set backupdir=~/.backups/vim

autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost /tmp*clj set bufhidden=delete

nmap <F2> :NERDTreeToggle<CR>

function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Gstatus
    endif
endfunction
command ToggleGStatus :call ToggleGStatus()
nmap <F3> :ToggleGStatus<CR>

if has('windows')
    let g:ruby_path = 'C:\TeamCityBuildTools\ruby\1.9.2'
endif

"Fullscreen when entering the gui
if has('gui')
    au GUIEnter * simalt ~x
endif

"Colorscheme settings
set background=dark
colorscheme solarized

"Use local vimrc to change this per-project
set ts=4 sw=4 sts=4 et

"Use js-beautify for gq in js files
au FileType javascript setl formatprg=js-beautify\ -t\ -j\ -w\ 80\ -f\ -
let g:javascript_indent_to_parens = 0

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
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components)$'

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

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

set exrc
set secure
