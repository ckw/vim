" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

call pathogen#infect()

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set modeline
set shellcmdflag=-ic

"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

set sw=2
set softtabstop=2
set expandtab
set ls=2
set showcmd

let mapleader=" "

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


filetype plugin indent on

inoremap jk  <ESC>
map <C-l> $
map <C-h> <C-0>

noremap % v%

"nmap <CR> :b<space>
"nmap <space> q:
nmap <leader>f q:
nmap <leader>sl <C-w>l
nmap <leader>sh <C-w>h
nmap <leader>sj <C-w>j
nmap <leader>sk <C-w>k
nmap <leader>v <C-w>v
nmap <leader>h <C-w>s
nmap <leader>q <C-w>q
nmap <leader><leader> <leader>lj
nmap <CR> <CR>
"map  <C-f> :tabn<CR>
"map  <C-d> :tabp<CR>
"map  <C-n> :tabnew<CR>

":set scrolloff=1000

" CTRL+b opens the buffer list
map <C-b> <esc>:buffers<cr>

nmap <C-j> 15j
nmap <C-k> 15k
nmap n nzz
nmap N Nzz

colors slate

"autocmd BufNewFile,BufRead *.hs ~/.vim/ftplugin/haskell.hs

