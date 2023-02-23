-- NeoVim Options File
-- Vivek Ivaturi
--

-- Setting Preferences for Line Numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Stop new line for autocommenting
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})

-- Tabs and Indentations
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Line Wrapping
vim.opt.wrap = false

-- Search Settings
-- Here, if you use lower case it will match with all upper/lower case
-- If you use uppercase it will only match with upper case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- Backspace
vim.opt.backspace = "indent,eol,start"

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Splitting Windows
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.iskeyword:append("-")

-- Undo Tree Settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scrolloff
vim.opt.scrolloff = 8
