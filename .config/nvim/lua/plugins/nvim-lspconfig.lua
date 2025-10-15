return {
  "neovim/nvim-lspconfig",
  opts = {
    -- diagnostics = {
    --   virtual_text = false,
    -- },
    ---@type lspconfig.options
    servers = {
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        -- Use this to add any additional keymaps
        -- for specific lsp servers
        ---@type LazyKeysSpec[]
        -- keys = {},
        settings = {
          Lua = {
            diagnostics = { globals = { "vim", "love", "busted" } },
          },
        },
      },
      glsl_analyzer = {
        filetypes = { "glsl", "vert", "frag" },
      },
    },
  },
}
