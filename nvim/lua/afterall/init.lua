-- these binds only work if set after the "after" folder deafult from neovim
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').grep_string, { noremap = true })

vim.keymap.set("i", "<C-w>", "<End>")
vim.keymap.set("i", "<C-b>", "<Home>")