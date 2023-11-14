return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  --{ "Mofiqul/dracula.nvim", name = "dracula", priority = 1000 },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
