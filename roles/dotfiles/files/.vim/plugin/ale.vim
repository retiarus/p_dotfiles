let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra -Werror'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Wextra -Werror'

let b:ale_linters = {'javascript': ['prettier', 'eslint'],
      \              'python': ['flake8', 'pylama']}
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

" Set sinals that ALE uses
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" Show errors in status line. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Allow information been printed in a balloon
let g:ale_set_balloons = 1

" Apply the linter when the file is open
let g:ale_lint_on_enter = 1
