lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "lunar"

vim.opt.timeoutlen = 0

lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>z"] = ":tabprevious<CR>"
lvim.keys.normal_mode["<leader>x"] = ":tabnext<CR>"

lvim.plugins = {
  { "github/copilot.vim" }
}
    
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"

lvim.builtin.cmp.mapping["<C-A>"] = function(fallback)
  cmp.mapping.abort()
  local copilot_keys = vim.fn["copilot#Accept"]()
  if copilot_keys ~= "" then
    vim.api.nvim_feedkeys(copilot_keys, "i", true)
  else
    fallback()
  end
end

--
--
-- Commands
-- Ctrl + h = Go to the NerdTree(Left Side)
-- Ctrl + l = Go to the code (Right Side)
-- Alt + Right = Screen Resize
-- Alt + Left = Screen Resize
-- Alt + k = Change the position of the line to top
-- Alt + j = Change the position of the line to bottom
-- :20 = Go to line 20
-- V = Select all line
-- fc = You can jump to the character "c"
-- <space>f = Find file
-- gd = Go to definition
-- w = go foward
-- b = go back
-- Ctrl + R = Redo