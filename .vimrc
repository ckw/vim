runtime! debian.vim
set nocompatible

if has("syntax")
  syntax on
endif

set encoding=utf-8

let g:EasyMotion_leader_key = '<Leader>f'
let g:EasyMotion_keys = 'asdfjkl;eirughwptyo'
"
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

  autocmd CmdwinEnter * :nmap <CR> <CR> | inoremap <leader>dq <esc>o<cr>
  autocmd CmdwinLeave * :nmap <CR> @: | iunmap <leader>dq
  autocmd BufNewFile,BufRead *.json :set ft=json

  " Enable neocomplcache omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

endif

":::::::::::::::::::::::::::::::::settings::::::::::::::::::::::::::::::::::::
"
set clipboard=unnamed
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
"set hlsearch
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set undolevels=2000
set ttyfast
set sw=2
set softtabstop=2
set expandtab
set ls=2
set synmaxcol=2048      " Syntax coloring too-long lines is slow

"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set colorcolumn=85
"set relativenumber
set undofile
set lazyredraw
set noswapfile

"let g:clipbrdDefaultReg = '+'
let undodir = "/home/ckw/undo_dir_vim"

":::::::::::::::::::::::::::::::::::::::mapping:::::::::::::::::::::::::::::::
let mapleader=" "
inoremap jk  <ESC>

" Create Blank Newlines and stay in Normal mode, in same place
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j

noremap <F4> :set hlsearch! <CR>
noremap / /\v
noremap % v%
noremap <tab> v%
noremap <leader>; ,
noremap <leader>n q:inorm<space>
noremap <leader>r q:is/
noremap <leader>R q:i% s/
noremap <silent> <leader>t :call RotateColorTheme()<CR>

vnoremap <tab> %
vnoremap / /\v
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
nnoremap <leader>gj :GitGutterNextHunk<CR>
nnoremap <leader>gk :GitGutterPrevHunk<CR>
nnoremap <leader>ag :GundoToggle<CR>
noremap , "
noremap ; q:i
nnoremap / q/i\v
nnoremap ? q?i


map <C-l> $
map <C-h> 0

noremap <leader>dd <C-^>
nmap <leader>e @
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l
nmap <leader>v <C-w>v
nmap <leader>s <C-w>s
noremap <leader>q :q<cr>
nmap <CR> @:
nmap <C-b> <esc>:buffers<cr>
nmap n nzz
nmap N Nzz

nmap j gj
nmap k gk
nmap <C-j> 15j
nmap <C-k> 15k

omap <C-j> 15j
omap <C-k> 15k

vmap j gj
vmap k gk
vmap <C-j> 15j
vmap <C-k> 15k
noremap f <esc>:call FindAllChars()<cr>

noremap <leader>w :w<CR>

":::::::::::::::::::::::::::::::::::::::::::::::;::::::::::::::::::::::::::::::
let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('charcode', 'before', 'fileformat')
call Pl#Theme#InsertSegment('color_scheme', 'before', 'fileformat')

":::::::::::::::::::::::::Gundo::::::::::::::::::::::::::::::::::::::::::::::::
let g:gundo_help = 0
let g:gundo_preview_bottom = 1
let g:gundo_close_on_revert = 1
let g:gundo_preview_height = 15
let g:gundo_width = 45
":::::::::::::::::::::::::Gundo::::::::::::::::::::::::::::::::::::::::::::::::
"
":::::::::::::::::::::::::CTRLP::::::::::::::::::::::::::::::::::::::::::::::::
"Use this option to change the mapping to invoke CtrlP in |Normal| mode: >
let g:ctrlp_map = '<c-p>'

"Set the default opening command to use when pressing the above mapping: >
let g:ctrlp_cmd = 'CtrlPMixed'

"Set the maximum height of the match window: >
let g:ctrlp_max_height = 20

"When opening a file with <cr> or <c-t>, if the file's already opened somewhere
"CtrlP will try to jump to it instead of opening a new instance: >
let g:ctrlp_switch_buffer = 1

"When starting up, CtrlP sets its local working directory according to this
"variable: >
let g:ctrlp_working_path_mode = 'rc'


let g:ctrlp_root_markers = ['.cabal', 'Gemfile', '.git']

"Set this to 0 to enable cross-session caching by not deleting the cache files
"upon exiting Vim: >
let g:ctrlp_clear_cache_on_exit = 0

"Set the directory to store the cache files: >
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

"The maximum number of files to scan, set to 0 for no limit: >
let g:ctrlp_max_files = 10000

"The maximum depth of a directory tree to recurse into: >
let g:ctrlp_max_depth = 40

"Use this option to specify how the newly created file is to be opened when
"pressing <c-y>:
"  t - in a new tab
"  h - in a new horizontal split
"  v - in a new vertical split
"  r - in the current window
let g:ctrlp_open_new_file = 'r'

let g:ctrlp_open_multiple_files = 'ri'

"If non-zero, CtrlP will follow symbolic links when listing files: >
let g:ctrlp_follow_symlinks = 0



let g:ctrlp_prompt_mappings = {
      \ 'PrtBS()':              ['<bs>', '<c-]>'],
      \ 'PrtDelete()':          ['<del>'],
      \ 'PrtDeleteWord()':      ['<c-w>'],
      \ 'PrtClear()':           ['<c-u>'],
      \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
      \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
      \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
      \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
      \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
      \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
      \ 'PrtHistory(-1)':       ['<c-n>'],
      \ 'PrtHistory(1)':        ['<c-p>'],
      \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
      \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
      \ 'AcceptSelection("t")': ['<c-t>'],
      \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
      \ 'ToggleFocus()':        ['<c-j><k>'],
      \ 'ToggleRegex()':        ['<c-r>'],
      \ 'ToggleByFname()':      ['<c-d>'],
      \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
      \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
      \ 'PrtExpandDir()':       ['<tab>'],
      \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
      \ 'PrtInsert()':          ['<c-\>'],
      \ 'PrtCurStart()':        ['<c-a>'],
      \ 'PrtCurEnd()':          ['<c-e>'],
      \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
      \ 'PrtCurRight()':        ['<c-l>', '<right>'],
      \ 'PrtClearCache()':      ['<F5>'],
      \ 'PrtDeleteEnt()':       ['<F7>'],
      \ 'CreateNewFile()':      ['<c-y>'],
      \ 'MarkToOpen()':         ['<c-o>'],
      \ 'OpenMulti()':          ['<c-u>'],
      \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
      \ }
":::::::::::::::::::::::::CTRLP::::::::::::::::::::::::::::::::::::::::::::::::
"
":::::::::::::::::::::::::NEOCOMPL:::::::::::::::::::::::::::::::::::::::::::::
let g:neocomplcache_enable_at_startup = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"" imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"" smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"" inoremap <expr><C-g>     neocomplcache#undo_completion()
"" inoremap <expr><C-l> neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"""" inoremap <expr><C-y>  neocomplcache#close_popup()
"" inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^.  *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^.  \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'


":::::::::::::::::::::::::NEOCOMPL:::::::::::::::::::::::::::::::::::::::::::::
":::::::::::::::::::::::::helper functions:::::::::::::::::::::::::::::::::::::
function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

function! ShowColourSchemeName()
  try
    return g:colors_name
  catch /^Vim:E121/
    return "default"
  endtry
endfunction

function! FindAllChars()
  set scrolloff=0
  call setpos('.',[0,line('w0'),0,0])
  call EasyMotion#F('f',0)
  set scrolloff=5
endfunction

function! RotateColorTheme()
  let g:themeindex = (g:themeindex + 1) % len(g:c_schemes)
  let newtheme = g:c_schemes[g:themeindex]
  execute ":colorscheme ".newtheme
endfunction

