local Util = require("lazyvim.util")
local wk = require("which-key")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "i", "x", "n", "s" }, "<C-m>", "<cmd>DevdocsOpenFloat<cr>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--Remap Tab as Esc
--vim.keymap.set({ "i", "x", "n", "s" }, "kj", "<Esc>")

-- Add shortcuts to open TUI file manager in the built-in terminal
vim.keymap.set("n", "<leader>fm", function()
  Util.terminal({ "vifm", Util.root(), vim.loop.cwd() }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "File manager (root dir + cwd)" })

vim.keymap.set("n", "<leader>fM", function()
  Util.terminal(
    { "vifm", os.getenv("HOME"), vim.loop.cwd() },
    { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false }
  )
end, { desc = "File manager (home dir + cwd)" })

-- Add shortcuts to open TUI music player in the built-in terminal
vim.keymap.set("n", "<leader>m", function()
  Util.terminal({ "cmus" }, { cwd = Util.root(), esc_esc = true, ctrl_hjkl = false })
end, { desc = "Music player" })

-- Add shortcuts to open TUI typing test in the built-in terminal
vim.keymap.set("n", "<leader>t", function()
  Util.terminal({ os.getenv("HOME") .. "/.cargo/bin/toipe" }, { cwd = Util.root(), esc_esc = true, ctrl_hjkl = false })
end, { desc = "Typing test" })
-- Set the standard Ctrl+Backspace to delete a word
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word backward" })
