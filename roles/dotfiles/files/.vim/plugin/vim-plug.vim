set nocompatible

" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/autoload/plug.vim

call plug#begin('~/.vim/bundle')

Plug 'Shougo/deoplete.nvim'

if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/vimproc.vim', {'build' : 'make'}
Plug 'Shougo/denite.nvim', {'do' : 'UpdateRemotePlugins'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deol.nvim'
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'lervag/vimtex'
Plug 'reedes/vim-pencil'
Plug 'kovisoft/slimv'
Plug 'ludovicchabant/vim-gutentags'
Plug 'idanarye/vim-vebugger'
Plug 'python-mode/python-mode'
Plug 'sillybun/vim-repl', {'do' : './install.sh'}
Plug 'sillybun/vim-async', {'do' : './install.sh'}
Plug 'sillybun/zytutil', {'do' : './install.sh'}
Plug 'jpalardy/vim-slime'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'wsdjeg/dein-ui.vim'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {'do': 'yarn install'}
Plug 'wokalski/autocomplete-flow'
Plug 'ekalinin/Dockerfile.vim'

call plug#end()
