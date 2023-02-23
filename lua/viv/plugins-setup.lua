-- -- Auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- Install Packer
	use("wbthomason/packer.nvim")

	-- Install Lua functions
	use("nvim-lua/plenary.nvim")

	-- Colorscheme
	use("bluz71/vim-nightfly-guicolors")

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	-- Plugin to maximize and restore current window
	use("szw/vim-maximizer")

	-- Essential Plugins
	use("tpope/vim-surround")
	use("inkarkat/vim-ReplaceWithRegister")

	-- Commenting with GC
	use("numToStr/Comment.nvim")

	-- File Explorer
	use("nvim-tree/nvim-tree.lua")

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- Status line
	use("nvim-lualine/lualine.nvim")

	-- Telescope and Fuzzy Finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Managing and Installing LSP servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- Configuring LSP servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		requires = {
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"p00f/nvim-ts-rainbow",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
	})

	-- Auto-Closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- Undo-Tree
	use({
		"mbbill/undotree",
		cmd = { "UndotreeToggle", "UndotreeFocus" },
	})

	-- Command mode autocomplete
	use("gelguy/wilder.nvim")

	-- Startup Page
	-- use({
	-- 	"startup-nvim/startup.nvim",
	-- 	requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		vim.g.startup_disable_on_startup = true
	-- 		require("startup").setup({ theme = "dashboard" })
	-- 	end,
	-- })

	-- use({
	-- 	"goolord/alpha-nvim",
	-- 	config = function()
	-- 		require("alpha").setup()
	-- 	end,
	-- 	event = "VimEnter",
	-- })

	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
