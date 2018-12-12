" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'tpope/vim-fugitive'

Plugin 'morhetz/gruvbox'
Plugin 'Shougo/deoplete.nvim'
Plugin 'w0rp/ale'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'jalvesaq/Nvim-R'
Plugin 'gaalcaras/ncm-R'
Plugin 'lervag/vimtex'
Plugin 'reedes/vim-pencil'
Plugin 'kovisoft/slimv'
Plugin 'ludovicchabant/vim-gutentags'

if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'

call vundle#end()            " required
filetype plugin indent on    " required
