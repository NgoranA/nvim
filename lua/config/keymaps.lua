-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--undotree
vim.keymap.set("n", "<leader>ut", "<cmd> UndotreeToggle <CR>")

--git fugitive
vim.keymap.set("n", "<leader>gf", "<cmd> Git <CR>")

-- harpoon remaps start
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>v", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>vj", function()
  ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>vk", function()
  ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>vf", function()
  ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>vd", function()
  ui.nav_file(4)
end)
-- harpoon remaps end
