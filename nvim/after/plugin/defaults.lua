-- disable splash screen
vim.o.shortmess = vim.o.shortmess .. 'I'

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
	open_on_setup = true,
	open_on_setup_file = true
})

vim.opt.clipboard = "unnamedplus"

vim.opt.listchars = "tab:» ,trail:·,nbsp:⎵,precedes:<,extends:>"
vim.opt.list = true
