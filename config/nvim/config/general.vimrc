let $LANG = 'en'
:autocmd BufEnter * silent! normal! g`"
filetype plugin indent on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

set splitbelow
set splitright

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
" set softtabstop=4
set shiftwidth=4
set expandtab

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase


set fileformats=unix,dos,mac

set shell=/bin/sh
if exists('$SHELL')
    set shell=$SHELL
endif

let mapleader=','

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

set nobackup
set nowritebackup
set nowb
set noswapfile
set undolevels=1000

" Fold
set foldmethod=indent
set foldlevel=99

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

command! FixWhitespace :%s/\s\+$//e
" VISUAL

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

syntax on
set ruler
set number relativenumber

let no_buffers_menu=1

colorscheme nord


set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10


let g:CSApprox_loaded = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
endif

if &term =~ '256color'
  set t_ut=
endif


"" Disable the blinking cursor.
set gcr=a:blinkon0

set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif


set statusline+=%#warningmsg#
set statusline+=%*
