local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')

lsp_status.register_progress()

local on_attach = function(client, bufnr)
  if client.resolved_capabilities.hover then
    vim.api.nvim_exec([[
      augroup lsp_hover
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.hover()
      augroup END
    ]], false)
  end

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
      augroup lsp_document_formatting
        autocmd!
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
      augroup END
    ]], false)
  end

  if client.resolved_capabilities.definition then
    vim.api.nvim_set_keymap('n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-t>', '<C-o>', { noremap = true, silent = true })
  end

  lsp_status.on_attach(client)
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
}

lspconfig.terraformls.setup {
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      }
    }
  }
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
  settings = {
    yaml = {
      schemas = {
        kubernetes = 'kubernetes/*',
      }
    }
  }
}

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
  cmd = { 'lua-langserver' },
  settings = {
    Lua = {
      diagnostics = {
        -- Suppress "Undefined global `vim`" error for neovim lua
        globals = { 'vim' }
      }
    }
  }
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
}
