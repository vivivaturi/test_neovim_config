local setup, tree = pcall(require, "nvim-tree")
if not setup then
	return
end

local function open_nvim_tree()
	-- open the tree
	local nvim_tree_api_status, nvim_tree_api = pcall(require, "nvim-tree.api")
	if not nvim_tree_api_status then
		return
	end
	nvim_tree_api.tree.open()
end

-- From nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
	-- change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	view = {
		preserve_window_proportions = true,
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
			resize_window = true,
		},
	},
	git = {
		ignore = false,
	},
})

open_nvim_tree()
