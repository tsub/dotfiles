local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

lsp_status.register_progress()

local on_attach = function(client, bufnr)
  if client.server_capabilities.hoverProvider then
    vim.api.nvim_exec([[
      augroup lsp_hover
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.hover()
      augroup END
    ]], false)
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_exec([[
      augroup lsp_document_format
        autocmd!
        autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })
      augroup END
    ]], false)
  end

  if client.server_capabilities.definitionProvider then
    vim.api.nvim_set_keymap('n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-t>', '<C-o>', { noremap = true, silent = true })
  end

  lsp_status.on_attach(client)
end

local capabilities = lsp_status.capabilities
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.terraformls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.tflint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        kubernetes = { '*deployment.yaml', '*daemonset.yaml', '*service.yaml', '*configmap.yaml', '*pdb.yaml',
          'secret.yaml', '*job.yaml' },
        ['https://json.schemastore.org/kustomization.json'] = 'kustomization.yaml'
      },
      customTags = {
        '!GetAtt scalar', -- for CFn
      },
      schemaStore = {
        enable = false,
      },
    }
  }
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'lua-language-server' },
  settings = {
    Lua = {
      diagnostics = {
        -- Suppress "Undefined global `vim`" error for neovim lua
        globals = { 'vim' }
      }
    }
  }
}

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- See: https://github.com/neovim/nvim-lspconfig/issues/2507
  single_file_support = false,
  init_options = {
    plugins = {
      {
        name = 'typescript-eslint-language-service',
      },
    },
  },
}

lspconfig.denols.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- See: https://github.com/mrjosh/helm-ls
local configs = require('lspconfig.configs')

if not configs.helm_ls then
  configs.helm_ls = {
    default_config = {
      cmd = { "helm-ls", "serve" },
      filetypes = { 'helm' },
      root_dir = lspconfig.util.root_pattern('Chart.yaml'),
    },
  }
end

lspconfig.helm_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
