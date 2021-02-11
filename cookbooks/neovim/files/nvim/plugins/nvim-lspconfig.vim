lua << EOF
  local lspconfig = require'lspconfig'
  local completion = require'completion'

  lspconfig.gopls.setup{on_attach=completion.on_attach}
  lspconfig.rust_analyzer.setup{on_attach=completion.on_attach}
  lspconfig.terraformls.setup{on_attach=completion.on_attach}
  lspconfig.yamlls.setup{
    on_attach = completion.on_attach;
    settings = {
      yaml = {
        schemas = {
          kubernetes = 'kubernetes/*';
        }
      }
    }
  }
EOF

augroup nvim-lspconfig
  autocmd!
  autocmd BufWritePre *.rs,*.tf lua vim.lsp.buf.formatting()
augroup END

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <C-t> <C-o>
