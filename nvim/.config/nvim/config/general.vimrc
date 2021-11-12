let $LANG = 'en'

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set scrolloff=5
set cmdheight=1
set shortmess+=c
set signcolumn=yes
set ruler
set number relativenumber

set ttyfast

set splitbelow
set splitright
set hidden

" Set spell checking
set spelllang=en,pl

"" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

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
syntax on

" Fold
set foldmethod=indent
set foldlevel=99
set autoindent
filetype plugin indent on

"" Disable the blinking cursor.
set gcr=a:blinkon0

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

command! FixWhitespace :%s/\s\+$//e

let no_buffers_menu=1
colorscheme nord
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10
let g:CSApprox_loaded = 1
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

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

:autocmd BufEnter * silent! normal! g`"

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
