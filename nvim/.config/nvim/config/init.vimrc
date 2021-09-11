call plug#begin('~/.local/share/nvim/plugged')
" General
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'diepm/vim-rest-console'
Plug 'beauwilliams/focus.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" " python
Plug 'davidhalter/jedi-vim'
Plug 'fannheyward/coc-pyright'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" rust
Plug 'sebastianmarkow/deoplete-rust'

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

" Dart/Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

call plug#end()
