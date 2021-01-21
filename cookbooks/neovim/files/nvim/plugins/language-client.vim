let g:LanguageClient_serverCommands = {
\   'go': ['bingo', '-mode', 'stdio'],
\   'rust': ['rustup', 'run', 'nightly', 'rls'],
\   'yaml': ['yaml-language-server', '--stdio'],
\   'terraform': ['terraform-ls', 'serve'],
\ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '~/.config/nvim/plugins/language-client-settings.json'

augroup LanguageClient_config
  autocmd!
  autocmd BufWritePre *.yaml,*.yml,*.go,*.rs,*.tf :call LanguageClient#textDocument_formatting()
augroup END

noremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
noremap <silent> <C-t> <C-o>
