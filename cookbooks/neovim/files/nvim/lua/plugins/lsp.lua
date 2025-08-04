return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable('terraformls')
    vim.lsp.enable('tflint')
    vim.lsp.enable('bashls')

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            -- Suppress "Undefined global `vim`" error for neovim lua
            globals = { 'vim' },
          },
        },
      },
    })
    vim.lsp.enable('lua_ls')

    vim.lsp.config('yamlls', {
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
    })
    vim.lsp.enable('yamlls')

    -- Formatting
    -- See https://neovim.io/doc/user/lsp.html#lsp-config
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000, async = true })
            end,
          })
        end
      end
    })

    -- Diagnostics
    vim.diagnostic.config({
      virtual_lines = true,
    })
  end,
}
