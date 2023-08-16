require("auto-session").setup()
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- vim.g.auto_session_pre_save_cmds = vim.api.nvim_eval('["tabdo NERDTreeClose"]')
vim.api.nvim_exec(
[[
let g:auto_session_pre_save_cmds = ["NERDTreeClose"]
]],
true)