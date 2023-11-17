local Util = require("lazyvim.util")
local wk = require("which-key")
local harpoonMark = require("harpoon.mark")
local harpoonUI = require("harpoon.ui")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "i", "x", "n", "s" }, "<C-m>", "<cmd>DevdocsOpenFloat<cr>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

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

-- Add Harpoon shourtcuts
wk.register({
  ["<leader>h"] = { name = "+harpoon" },
})

vim.keymap.set("n", "<leader>ha", harpoonMark.add_file, { desc = "Add" })
vim.keymap.set("n", "<leader>hl", harpoonUI.toggle_quick_menu, { desc = "Quick menu" })
vim.keymap.set("n", "9", harpoonUI.toggle_quick_menu, { desc = "Quick menu" })
vim.keymap.set("n", "<leader>h[", harpoonUI.nav_prev, { desc = "Prev" })
vim.keymap.set("n", "<leader>h]", harpoonUI.nav_next, { desc = "Next" })

for i = 1, 8 do
  vim.keymap.set("n", "<leader>h" .. tostring(i), function()
    harpoonUI.nav_file(i)
  end, { desc = "Jump to file " .. tostring(i) })

  vim.keymap.set("n", tostring(i), function()
    harpoonUI.nav_file(i)
  end, { desc = "Jump to file " .. tostring(i) })
end
