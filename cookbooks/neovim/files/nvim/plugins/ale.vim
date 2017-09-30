let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0

let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'go': ['gofmt', 'golint', 'go vet', 'go build']
      \ }
let g:ale_rust_cargo_use_check = 1

let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '⚠'
