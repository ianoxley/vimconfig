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
"" set number turn off if using relativenumber
set pastetoggle=<F5>
set relativenumber
set number


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
nnoremap <leader>2 yypVr-

"" Font and colours
set guifont=Anonymous\ Pro:h16
colorscheme afterglow

"" tmp, backup, and undo files
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/undo
set undofile
set undolevels=1000

set laststatus=2
set statusline=%{fugitive#statusline()}\ %f\ (%p%%) "tail of the filename

"" use my bash login profile when using :shell
set shell=bash\ -l

set mouse=a

"" Pathogen
execute pathogen#infect()

"" NERDTree
map <F2> :NERDTreeToggle<CR>

"" Custom keybindings
inoremap jk <Esc>

"" Find / replace the word under the cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

"" less -> css
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

"" Enable word wrapping in a single command a la http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist

"" Open todo.txt files in todo mode
au BufRead,BufNewFile todo.txt set filetype=xml
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.less set filetype=css

"" Open .config files as XML
au BufRead,BufNewFile *.config set filetype=xml

"" Python settings from http://www.jedberg.net/jedberg_vimrc

""
"" Python specific settings
""

" Full Python syntax highlighting, when combined with 'syntax on' above
let python_highlight_all=1

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py set tabstop=4

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set expandtab

" Make backspacing easier
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py set textwidth=79

" Use UNIX (\n) line endings.
au BufRead,BufNewFile *.py set fileformat=unix

" The following line sets the smartindent mode for *.py files. It means that
" after typing lines which start with any of the keywords in the list (ie.
" def, class, if, etc) the next line will automatically indent itself to the
" next level of indentation:
au BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Remove any extra whitespace from the ends of lines when saving a file
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" Expression register
imap <C-i>u <C-r>=system(expand('~/vimconfig/scripts/insert_uuid.py'))<cr>

" Git commit messages
au FileType gitcommit setlocal spell tw=72

inoremap <F5> <C-R>=strftime('%Y-%m-%d')<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['javascript'],'passive_filetypes': [] }
nnoremap <leader>e :SyntasticToggleMode<CR>

" Taskwiki
let g:taskwiki_use_python2=1
let g:taskwiki_data_location="~/.task"
