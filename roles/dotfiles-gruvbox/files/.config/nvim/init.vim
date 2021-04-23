" Set Python
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Set mapleader key
let mapleader = ","

" Set Encode
" set encoding=UFT-8

" Enable guicolors for neovim
set termguicolors

call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'kassio/neoterm'
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
" Plug 'SirVer/ultisnips'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'jubnzv/virtual-types.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lewis6991/spellsitter.nvim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'mfussenegger/nvim-dap'

call plug#end()

"lua config files
luafile ~/.config/nvim/lua/compe-config.lua
luafile ~/.config/nvim/lua/bash-lsp.lua
luafile ~/.config/nvim/lua/css-lsp.lua
luafile ~/.config/nvim/lua/python-lsp.lua
luafile ~/.config/nvim/lua/rust-lsp.lua

"Set preferences for gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
colorscheme gruvbox

" Highlight column
highlight ColorColumn ctermbg=236 guibg=#303030
let &colorcolumn=join(range(80,999),',')

" Navigate neovim + neovim terminal emulator with alt+direction
tnoremap <c-h> <C-\><C-n><C-w>h
tnoremap <c-j> <C-\><C-n><C-w>j
tnoremap <c-k> <C-\><C-n><C-w>k
tnoremap <c-l> <C-\><C-n><C-w>l

" Easily escape terminal
tnoremap <leader><esc> <C-\><C-n><esc><cr>
tnoremap <C-o> <C-\><C-n><esc><cr>

" Quickly toggle term
nnoremap <silent> <leader>o :vertical botright Ttoggle<cr><C-w>l
nnoremap <silent> <leader>O :horizontal rightbelow Ttoggle<cr><C-w>j
nnoremap <silent> <leader><space> :vertical botright Ttoggle<cr><C-w>l

" Interactive find replace preview
set inccommand=nosplit

" Replace word under cursor, globally, with confirmation
nnoremap <leader>k :%s/\<<C-r><C-w>\>//gc<left><left><left>
vnoremap <leader>k y :%s/<C-r>"//gc<left><left><left>

" To enable mode shapes, "Cursor" highlight, and blinking: >
set guicursor=n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

" Required for operations modifying multiple buffers like rename.
set hidden

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Maintain indent of current line
set autoindent

" When indenting with '>', use 4 spaces width
set shiftwidth=2

" Always use spaces instead of tabs
set expandtab

" Spaces per tab
set tabstop=2

" Turn off expandtab for makefiles
autocmd FileType make setlocal noexpandtab

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" Show line numbers in gutter
set number

"Show relative numbers in gutter
if exists('+relativenumber')
  set relativenumber
endif

" Highlight current line
set cursorline

" Tagbar keyword set
nmap <F8> :TagbarToggle<CRu>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
