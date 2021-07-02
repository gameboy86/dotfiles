call plug#begin('~/.local/share/nvim/plugged')
" General
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
" Plug 'dyng/ctrlsf.vim'
Plug 'arcticicestudio/nord-vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/tagbar'
 

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" python
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" go
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" rust
Plug 'sebastianmarkow/deoplete-rust'

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

call plug#end()

