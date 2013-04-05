set nocompatible
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

set backspace=indent,eol,start
set hidden
set ruler
set number

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
let g:Powerline_colorscheme='solarized256'

syntax on
set foldmethod=syntax
let g:xml_syntax_folding=1

filetype on
filetype plugin indent on
set autoindent

set completeopt+=longest
set completeopt+=menuone

set encoding=utf8

set list
set listchars=tab:›\ ,eol:¬

set ts=4 sw=4 sts=4 et

"Maps space to clear search highlighting
nmap <SPACE> <SPACE>:noh<CR>

set gfn=Droid_Sans_Mono_for_Powerline:h10:cANSI
colorscheme solarized
set background=dark
set t_Co=256

set backupdir=~/.backups/vim

function! ToggleSemicolon()
    if (mapcheck(';', 'n') != '')
        nun ;
    else
        nnoremap ; :
    endif
endfunction
command ToggleSemicolon :call ToggleSemicolon()

nmap <F2> :NERDTreeToggle<CR>
