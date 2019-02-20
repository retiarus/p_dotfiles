let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra -Werror'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Wextra -Werror'

let b:ale_linters = ['flake8']
let b:ale_fixers = {'python': ['remove_trailing_lines',
      \                        'isort',
      \                        'ale#fixers#generic_python#BreakUpLongLines',
      \                        'yapf'],
      \             '*': ['remove_trailing_lines', 'trim_whitespace']}

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>

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
