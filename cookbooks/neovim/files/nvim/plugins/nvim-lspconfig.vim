lua << EOF
  local lspconfig = require'lspconfig'

  lspconfig.gopls.setup{}
  lspconfig.rust_analyzer.setup{}
  lspconfig.terraformls.setup{}
  lspconfig.yamlls.setup{
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
