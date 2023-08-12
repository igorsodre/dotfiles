vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeIgnore = { '\\.rbc$', '\\~$', '\\.pyc$', '\\.db$', '\\.sqlite$', '__pycache__' }
vim.g.NERDTreeSortOrder = { '^__\\.py$', '\\/$', '*', '\\.swp$', '\\.bak$', '\\~$' }
vim.g.NERDTreeShowBookmarks = 1
vim.g.nerdtree_tabs_focus_on_files = 1
vim.g.NERDTreeMapOpenInTabSilent = '<RightMouse>'
vim.g.NERDTreeWinSize = 50
vim.g.NERDTreeFileExtensionHighlightFullName = 1
vim.g.NERDTreeExactMatchHighlightFullName = 1
vim.g.NERDTreePatternMatchHighlightFullName = 1

vim.keymap.set('n', '<C-e>', ':NERDTreeToggle<CR>', { desc = 'Open file explorer', silent = true })
vim.keymap.set('n', 'A-e', ':NERDTreeFind<CR>', { desc = 'Open file explorer in current file', silent = true })
vim.keymap.set('i', 'C-e', '<Esc>:NERDTreeFind<CR><C-w>li', { desc = 'Open file explorer in current file when in edit mode', silent = true })
