set nocompatible

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
  call dein#add('Shougo/denite.nvim', {'do' : 'UpdateRemotePlugins'})
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deol.nvim')
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
  call dein#add('idanarye/vim-vebugger')
  call dein#add('python-mode/python-mode')
  call dein#add('sillybun/vim-repl', {'do' : './install.sh'})
  call dein#add('sillybun/vim-async', {'do' : './install.sh'})
  call dein#add('sillybun/zytutil', {'do' : './install.sh'})
  call dein#add('jpalardy/vim-slime')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('simnalamburt/vim-mundo', {'on': 'MundoToggle'})
  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('prettier/vim-prettier', {'do': 'yarn install'})
  call dein#add('wokalski/autocomplete-flow')
  call dein#add('ekalinin/Dockerfile.vim')

  call dein#end()
  call dein#save_state()
endif
