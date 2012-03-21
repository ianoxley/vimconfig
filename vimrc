set nocompatible

syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

if has("autocmd")
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

"" Line nos
set number
set pastetoggle=<F5>

"" Whitespace
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

"" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Font and colours
set guifont=Monaco:h14
colorscheme koehler

"" tmp and backup files
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//

"" Pathogen
call pathogen#infect()

"" NERDTree
map <F2> :NERDTreeToggle<CR>

"" Enable word wrapping in a single command a la http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist
