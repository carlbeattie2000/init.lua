local autocmds = require 'carls.lazy.lsp.autocmds'

local M = {}

M.setup = function(_, opts)
  require('mason').setup {}
  require('fidget').setup {}
  require('conform').setup {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd", "prettier", stop_after_first = true }
    }
  }

  autocmds.on_attach.setup()

  local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    require("blink.cmp").get_lsp_capabilities()
  )

  local servers = opts.servers

  require('mason-lspconfig').setup({
    ensure_installed = {
      "lua_ls",
      "ts_ls"
    },
    automatic_installation = true,
    handlers = {
      function(server_name)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities)
        }, servers[server_name] or {})

        if server_opts.enabled == false then
          return
        end

        require('lspconfig')[server_name].setup(server_opts)
      end,
    }
  })
  vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

  require("lsp_lines").setup()
end

return M
