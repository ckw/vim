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
set nocompatible

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif


if has("syntax")
  syntax on
endif

set encoding=utf-8

function! ShowColourSchemeName()
  try
    return g:colors_name
  catch /^Vim:E121/
    return "default"
  endtry
endfunction

let g:EasyMotion_leader_key = '<Leader>f'
let g:EasyMotion_keys = 'asdfjklgheiru;'

":::::::::::::::::::::::::Gundo::::::::::::::::::::::::::::::::::::::::::::::::
let g:gundo_help = 0
let g:gundo_preview_bottom = 1
let g:gundo_close_on_revert = 1
let g:gundo_preview_height = 15
let g:gundo_width = 45
":::::::::::::::::::::::::Theme Rotating:::::::::::::::::::::::::::::::::::::::
let themeindex = 0
let c_schemes = ["inkpot",
      \ "slate",
      \ "ron",
      \ "blue",
      \ "elflord",
      \ "evening",
      \ "koehler",
      \ "murphy",
      \ "pablo",
      \ "desert",
      \ "torte",
      \ "vibrantink",
      \ "metacosm",
      \ "jellybeans",
      \ "wombat",
      \ "zenburn",
      \ ]


function! RotateColorTheme()
    let g:themeindex = (g:themeindex + 1) % len(g:c_schemes)
    let newtheme = g:c_schemes[g:themeindex]
    execute ":colorscheme ".newtheme
endfunction
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


call pathogen#infect()

set fillchars+=stl:\ ,stlnc:\
set background=dark

try
  colorscheme inkpot
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme slate
endtry


"set t_Co=256
"set term=screen-256color
"

":::::::::::::::::::::::::::::::::::::::autocommands::::::::::::::::::::::::::

if has("autocmd")
  "jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  "load indentation rules and plugins according to the detected filetype.
  filetype plugin indent on

  " Remove any trailing whitespace
  autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

  autocmd CmdwinEnter * :nmap <CR> <CR>
  autocmd CmdwinLeave * :nmap <CR> @:
  autocmd BufNewFile,BufRead *.json :set ft=json
endif

":::::::::::::::::::::::::::::::::settings::::::::::::::::::::::::::::::::::::
"
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
set visualbell
set cursorline
set ruler
set laststatus=2
set history=1000
set wrap
set textwidth=79
set formatoptions=qrn1
set gdefault
set incsearch
set showmatch
set hlsearch
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set undolevels=2000
set ttyfast
set sw=2
set softtabstop=2
set expandtab
set ls=2

"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set colorcolumn=85
set relativenumber
set undofile

let g:clipbrdDefaultReg = '+'
let undodir = "/home/ckw/undo_dir_vim"

"this is a comment
":::::::::::::::::::::::::::::::::::::::mapping:::::::::::::::::::::::::::::::
let mapleader=" "
inoremap jk  <ESC>

noremap <F4> :set hlsearch! <CR>
noremap / /\v
noremap % v%
noremap <tab> v%
noremap <leader>; ,
noremap <silent> <leader>t :call RotateColorTheme()<CR>

vnoremap <tab> %
vnoremap / /\v
nnoremap <leader>g :GundoToggle<CR>
noremap , "
noremap ; q:i

"was for lusty-juggler; unnecessary if you change default lj invoker
"nmap <leader><leader> <leader>lj

nmap <leader>e @
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l
nmap <leader>v <C-w>v
nmap <leader>s <C-w>s
nmap <leader>q <C-w>q
nmap <CR> @:
nmap <C-b> <esc>:buffers<cr>
nmap n nzz
nmap N Nzz

nmap j gj
nmap k gk
nmap <C-l> $
nmap <C-h> <C-0>
nmap <C-j> 15j
nmap <C-k> 15k

vmap j gj
vmap k gk
vmap <C-l> $
vmap <C-h> <c-0>
vmap <C-j> 15j
vmap <C-k> 15k
":::::::::::::::::::::::::::::::::::::::::::::::;::::::::::::::::::::::::::::::
let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('charcode', 'before', 'fileformat')
call Pl#Theme#InsertSegment('color_scheme', 'before', 'fileformat')

