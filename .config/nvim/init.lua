-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Create an augroup to manage your autocmd
local lsp_formatting_group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

-- Create an autocmd to format the buffer before saving
vim.api.nvim_create_autocmd("BufWritePre", {
  group = lsp_formatting_group,
  pattern = { "*.glsl", "*.vert", "*.frag" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
