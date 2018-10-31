let g:ale_lint_on_text_changed = 0
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
      \ 'ruby': ['solargraph', 'rubocop'],
      \ 'go': ['golangserver', 'gofmt', 'golint', 'go vet', 'go build'],
      \ 'rust': ['rls', 'cargo', 'rustfmt'],
      \ 'javascript': ['prettier-eslint', 'eslint', 'flow'],
      \ 'typescript': ['prettier', 'tslint', 'tsserver'],
      \ 'python': ['flake8']
      \ }

let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'go': ['goimports'],
      \ 'rust': ['rustfmt'],
      \ 'javascript': ['prettier-eslint', 'eslint'],
      \ 'typescript': ['prettier', 'tslint'],
      \ 'python': ['autopep8']
      \ }

let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '⚠'
