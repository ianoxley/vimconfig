set nocompatible
set modelines=0

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

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
"" Font and colours
"" default font set in _gvimrc file
"" set guifont=Ubuntu Mono:h12:cANSI
colorscheme koehler

"" tmp and backup files
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//

"" leader mappings from http://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader
"" Sort CSS selectors
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
"" Reselect text after paste
nnoremap <leader>v V`]

"" Pathogen
call pathogen#infect()

"" NERDTree
map <F2> :NERDTreeToggle<CR>

"" Custom keybindings
inoremap jk <Esc>

"" Enable word wrapping in a single command a la http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist

