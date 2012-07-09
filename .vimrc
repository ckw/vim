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

"redundant?
set nocompatible

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

colors slate
set term=screen-256color
set encoding=utf-8
call pathogen#infect()
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'fancy'
"let g:Powerline_colorscheme ='default'
"let g:Powerline_theme ='default'

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
set cmdheight=4
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"security
set modelines=0
set shellcmdflag=-ic

set scrolloff=5
set hidden
set showmode
set autoindent
set wildmenu
"set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set laststatus=2
set history=1000

set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

"set relativenumber
"set undofile

nnoremap / /\v
vnoremap / /\v
set gdefault
set incsearch
set showmatch
set hlsearch
noremap <F4> :set hlsearch! <CR>
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

set undolevels=2000
set ttyfast


"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

set sw=2
set softtabstop=2
set expandtab
set ls=2

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
noremap <tab> v%
"(foobarbaz)
vnoremap <tab> %

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

nmap <C-j> 15gj
nmap <C-k> 15gk
nmap j gj
nmap k gk

nmap n nzz
nmap N Nzz


"autocmd BufNewFile,BufRead *.hs ~/.vim/ftplugin/haskell.hs
"autocmd bufwritepost .vimrc call Pl#Load()
