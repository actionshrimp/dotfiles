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
Bundle 'Lokaltog/vim-powerline'
Bundle 'stephenmckinney/vim-solarized-powerline'
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
let g:Powerline_symbols='fancy'

syntax on
set foldmethod=syntax
let g:xml_syntax_folding=1

"Indentation
filetype plugin indent on
set autoindent

"Filetype specific
au BufEnter *.{rb,feature} setlocal ts=2 sw=2 sts=2 et

set completeopt+=longest
set completeopt+=menuone
set wildmenu

set path+=**
set suffixesadd+=.js,.rb,.cs,.py

set encoding=utf8

set list
set listchars=tab:›\ ,eol:¬

set ts=4 sw=4 sts=4 et

"Maps space to clear search highlighting
nmap <SPACE> <SPACE>:noh<CR>

set gfn=Droid_Sans_Mono_for_Powerline:h9:cANSI
set t_Co=256

set backupdir=~/.backups/vim

nmap <F2> :NERDTreeToggle<CR>

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
let g:is_solarized = 1
let g:Powerline_colorscheme='solarized256'

function! ToggleColours()
    if g:is_solarized
        colorscheme zenburn
        let g:Powerline_colorscheme='default'
        let g:is_solarized = 0
    else
        colorscheme solarized
        let g:Powerline_colorscheme='solarized256'
        let g:is_solarized = 1
        set background=dark
    endif
    PowerlineReloadColorscheme
endfunction
command ToggleColours :call ToggleColours()
noremap <leader>c :ToggleColours<CR>

function! ToggleSemicolon()
    if (mapcheck(';', 'n') != '')
        nun ;
    else
        nnoremap ; :
    endif
endfunction
command ToggleSemicolon :call ToggleSemicolon()

let g:spaces = 1
function! ToggleTabsSpaces()
    if g:spaces
        set ts=4 sw=4 sts=4 noet
        let g:spaces = 0
    else
        set ts=4 sw=4 sts=4 et
        let g:spaces = 1
    endif
endfunction
command ToggleTabsSpaces :call ToggleTabsSpaces()
noremap <leader>t :ToggleTabsSpaces<CR>

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
