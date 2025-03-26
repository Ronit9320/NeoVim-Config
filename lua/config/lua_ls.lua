require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'love'},
      },
      workspace = {
        library = {
          vim.env.HOME .. '/.local/share/love2d-api',
        },
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
