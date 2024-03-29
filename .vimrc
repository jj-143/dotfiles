set nocompatible
syntax on

" Pathogen
filetype plugin indent on
execute pathogen#infect()

" Disable the default Vim startup message.
set shortmess+=I

highlight LineNr ctermfg=red
highlight LineNrBelow ctermfg=blue


set number
set relativenumber

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

set ignorecase
set smartcase
set incsearch
set hlsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

set mouse+=a

set autoindent
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set smarttab

set splitright

" disable safe write for parcel's HMR feature
set backupcopy=yes

set autoread
"autoread when changing buffers (inside vim)
au FocusGained,BufEnter * :checktime

"""
" Powerline
"""

set laststatus=2
set noshowmode


autocmd FileType python setlocal tabstop=2 shiftwidth=2
autocmd FileType *      setlocal shiftwidth=2

map <C-P><C-P> :w<Enter>:! python3 %<Enter>
map <C-P><C-I> :w<Enter>:! python3 -i %<Enter>

"open file with vertical split + place it on right
map <F8> :vertical wincmd f<CR>

set wildignore+=*/node_modules/*

" yy to clipboard
" on Mac (iterm2)

" on Linux
set clipboard=unnamedplus

"""
"  Plugins
"""

" CTRL P
set runtimepath^=~/.vim/bundle/ctrlp.vim


" fast escape
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

"""""""""""""""""""""""
" Legacy Coding Configs
"
"""""""""""""""""""""""

"map <C-N><C-T> :norm 0i  <Enter>w
"map <C-N><C-R> :s@^  @<Enter>0
  
"map <C-N><C-L> :norm I/* <Enter>:norm A */<Enter>
"map <C-N><C-K> :s@\/\* @<Enter>:s@ \*\/@<Enter>

"map <C-N><C-V> :read ~/local/template.vue<Enter>

" vim-markdown
set conceallevel=2
set concealcursor=nc
let g:vim_markdown_folding_disabled = 1
hi Visual ctermfg=NONE ctermbg=0  guibg=Grey40 

call plug#begin(expand("~/.vim/plugged"))
Plug 'arcticicestudio/nord-vim'
call plug#end()

colorscheme nord