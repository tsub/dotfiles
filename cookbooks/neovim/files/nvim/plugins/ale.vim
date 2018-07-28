let g:ale_lint_on_text_changed = 0

let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'go': ['goimports', 'gofmt', 'golint', 'go vet', 'go build']
      \ }

let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '⚠'
