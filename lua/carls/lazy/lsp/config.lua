local autocmds = require 'carls.lazy.lsp.autocmds'

local M = {}

M.setup = function(_, opts)
  require('mason').setup {}
  require('fidget').setup {}
  require('conform').setup {}

  autocmds.on_attach.setup()

  vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

  local servers = opts.servers
  local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    require('blink.cmp').get_lsp_capabilities()
  )

  local function setup(server)
    local server_opts = vim.tbl_deep_extend("force", {
      capabilities = vim.deepcopy(capabilities),
    }, servers[server] or {})

    require('lspconfig')[server].setup(server_opts)
  end

  for server, _ in pairs(opts.servers) do
    setup(server)
  end

  require('mason-lspconfig').setup({
    ensure_installed = {
      "lua_ls",
      "ts_ls"
    },
    automatic_installation = true
  })
end

return M
