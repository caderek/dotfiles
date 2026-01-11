return {
  "stevearc/conform.nvim",
  opts = function()
    local opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        ["javascript"] = { "biome" },
        ["javascriptreact"] = { "biome" },
        ["typescript"] = { "biome" },
        ["typescriptreact"] = { "biome" },
        ["css"] = { "prettier" },
        ["scss"] = { "prettier" },
        ["less"] = { "prettier" },
        ["html"] = { "prettier" },
        ["json"] = { "biome" },
        ["jsonc"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },
        ["c"] = { "indent" },
      },
      formatters = {
        indent = {
          -- This tells conform to look for the "indent" command on your system
          command = "indent",
          -- Optional: Add flags to make it behave more like C for your bc files
          -- "-linux" is a popular preset that handles braces well
          args = { "-br", "-ce", "-cdw", "-nbc" },
          stdin = true,
        },
      },
    }
    return opts
  end,
}
