if has('nvim')
" Set mapleader key
let mapleader = ","

" Set Encode
" set encoding=UFT-8

" Enable guicolors for neovim
set termguicolors

call plug#begin('~/.local/share/nvim/plugged')

" Theme gruvbox
Plug 'morhetz/gruvbox'

" NERDTree
Plug 'scrooloose/nerdtree'

" Commenting things in and out
Plug 'scrooloose/nerdcommenter'

" Move to and from Tmux panes and Vim panes
Plug 'christoomey/vim-tmux-navigator'

" Improve status bar
Plug 'vim-airline/vim-airline'

" Auto close parents, brakets and others
Plug 'jiangmiao/auto-pairs'

" Add devicons
Plug 'ryanoasis/vim-devicons'

" Wrapper of some vim/neovim's :terminal funcions
Plug 'kassio/neoterm'

" Language Server Protocol Client
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Async completation
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Languafe package syntax
Plug 'sheerun/vim-polyglot'

call plug#end()

" Start deoplete at startup
let g:deoplete#enable_at_startup = 1

" Set preferences for gruvbox
let g:gruvbox_constrast_dark = 'hard'
colorscheme gruvbox

" Toggle NerdTree
nnoremap <leader>a :NERDTreeToggle<cr>

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

let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

endif
