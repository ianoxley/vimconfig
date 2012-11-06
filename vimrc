set nocompatible

syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

let mapleader = ","
:let maplocalleader = ","

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
"" set relativenumber

set undofile

"" Whitespace
set wrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set wildmenu
set wildmode=list:longest

"" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase
"" Disable search highlighting
nnoremap <leader><space> :noh<cr>

"" leader mappings from http://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader
"" Sort CSS selectors
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
"" Reselect text after paste
nnoremap <leader>v V`]
"" Underline with = or -
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr=

"" Font and colours
set guifont=Monaco:h14
colorscheme koehler

"" tmp, backup, and undo files
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/undo//

"" Pathogen
call pathogen#infect()

"" NERDTree
map <F2> :NERDTreeToggle<CR>

"" Custom keybindings
inoremap jk <Esc>

"" less -> css
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

"" Enable word wrapping in a single command a la http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist

"" Open todo.txt files in todo mode
au BufRead,BufNewFile todo.txt set filetype=xml
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.less set filetype=css
