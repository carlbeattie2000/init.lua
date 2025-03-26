local options = {
  diagnostics = {
    virtual_text = {
      source = "if_many",
      prefix = "●"
    },
    virtual_lines = false,
    severity_sort = true,
    underline = false,
    update_in_insert = false,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    }
  },
  servers = {
    lua_ls = {
      settings = {
        Lua = {
          runtime = {
            version = "Lua 5.1"
          },
          workspace = {
            checkThirdParty = false,
          },
          codeLens = {
            enable = true
          },
          completion = {
            callSnippet = "Replace",
            displayContext = 40,
            keywordSnippet = "Both"
          },
          doc = {
            privateName = { "^_^" },
          },
          hint = {
            enable = true,
            setType = false,
            semicolon = "Disable",
            arrayIndex = "Disable",
          },
        },
      },
    },
  },
}

return options
