lua << EOF
  local lspconfig = require'lspconfig'

  local on_attach = function(client, bufnr)
    if client.resolved_capabilities.hover then
      vim.api.nvim_exec([[
        augroup lsp_hover
          autocmd!
          autocmd CursorHold <buffer> lua vim.lsp.buf.hover()
        augroup END
      ]], false)
    end

    require'completion'.on_attach(client)
  end

  lspconfig.gopls.setup{on_attach=on_attach}
  lspconfig.rust_analyzer.setup{on_attach=on_attach}
  lspconfig.terraformls.setup{on_attach=on_attach}
  lspconfig.yamlls.setup{
    on_attach = on_attach;
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
