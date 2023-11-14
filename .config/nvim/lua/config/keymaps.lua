local Util = require("lazyvim.util")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "i", "x", "n", "s" }, "<C-m>", "<cmd>DevdocsOpenFloat<cr>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Add shortcuts to open TUI file manager in the built-in terminal
vim.keymap.set("n", "<leader>fm", function()
  Util.terminal({ "vifm", ".", "." }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "File manager" })

vim.keymap.set("n", "<leader>fM", function()
  Util.terminal({ "vifm", "/home/caderek/", "." }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "File manager (with home)" })
