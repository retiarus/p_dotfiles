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

" Plugin to close tags
Plug 'alvan/vim-closetag'

" Vim-surround
Plug 'tpope/vim-surround'

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
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Jedi plugin for deoplete
" Plug 'deoplete-plugins/deoplete-jedi'

" Snippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" JS/JSX plugin syntax
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Language package syntax
Plug 'sheerun/vim-polyglot'

" Async syntax checking
Plug 'w0rp/ale'

" Plugin to autoformat text
Plug 'Chiel92/vim-autoformat'

" Go to defination and acess documentation
Plug 'davidhalter/jedi-vim'

" Tagbar
Plug 'majutsushi/tagbar'

" Coc plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" Track the engine.
Plug 'SirVer/ultisnips'

"Rust Support
Plug 'rust-lang/rust.vim'

call plug#end()

" Start deoplete at startup
let g:deoplete#enable_at_startup = 1

"Set preferences for gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
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
    \ 'python': ['pyls'],
    \ 'sh': ['bash-language-server', 'start']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Neosnippet configs
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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

" Ale options ofr cpp
let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra -Werror'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Wextra -Werror'

let g:ale_linter_aliases = {'html': ['html', 'javascript', 'css']}

let b:ale_linters = {'javascript': ['prettier', 'eslint'],
      \              'css': ['stylelint'],
      \              'html': ['stylelint', 'fecs'],
      \              'python': ['pylama']}
let b:ale_fixers = {'python': ['remove_trailing_lines',
      \                        'isort',
      \                        'yapf'],
      \             '*': ['remove_trailing_lines', 'trim_whitespace']}

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1

" Show errors in status line. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Allow information been printed in a balloon
let g:ale_set_balloons = 1

" Apply the linter when the file is open
let g:ale_lint_on_enter = 1

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

" Add key to run vim-autoformat
noremap <F3> :Autoformat<CR>

" Disable completation in vim-jedi
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" disable polyglot for jsx (javascritp template)
let g:polyglot_disabled = ['js']
let g:polyglot_disabled = ['jsx']

" Tagbar keyword set
nmap <F8> :TagbarToggle<CRu>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
