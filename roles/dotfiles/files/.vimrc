set nocompatible
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/bundle/dein.vim

if dein#load_state('~/.vim/bundle/dein')
  call dein#begin('~/.vim/bundle/dein')

  call dein#add('~/.vim/bundle/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('morhetz/gruvbox')
  call dein#add('w0rp/ale')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('benmills/vimux')
  call dein#add('jalvesaq/Nvim-R')
  call dein#add('gaalcaras/ncm-R')
  call dein#add('lervag/vimtex')
  call dein#add('reedes/vim-pencil')
  call dein#add('kovisoft/slimv')
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('Shougo/vimproc.vim')
  call dein#add('idanarye/vim-vebugger')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('python-mode/python-mode')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
