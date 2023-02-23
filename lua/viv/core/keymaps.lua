-- Set the leader key
vim.g.mapleader = " "

local key = vim.keymap

-- General Keys

-- Quit Current Buffer
key.set("n", "<leader>q", ":q<CR>")

-- Write Current Buffer
key.set("n", "<leader>w", ":w<CR>")

-- Close Current Buffer
key.set("n", "<leader>c", ":bd<CR>")

-- Delete the character but not copy into register
key.set("n", "x", '"_x"')

-- Clear the current search
key.set("n", "<leader>nh", ":nohl<CR>")

-- Keep curson in the middle when jumping
key.set("n", "<C-d>", "<C-d>zz")
key.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle of the page
key.set("n", "n", "nzzzv")
key.set("n", "N", "Nzzzv")

-- Paste without replacing
key.set("x", "<leader>p", '"_dP')

-- Yank into clipboard
key.set({ "n", "v" }, "<leader>y", [["+y]])
key.set("n", "<leader>Y", [["+Y]])

-- Deletes without saving into register
key.set({ "n", "v" }, "<leader>d", [["_d]])

-- Move lines in visual mode
key.set("v", "K", ":m-2<CR>gv=gv")
key.set("v", "J", ":m'>+<CR>gv=gv")

-- When using J, keep cursor in current position
key.set("n", "J", "mzJ`z")

-- Increment and Decrement numbers
key.set("n", "<leader>+", "<C-a>")
key.set("n", "<leader>-", "<C-x>")

-- Window manipulations
key.set("n", "<leader>sv", "<C-w>v") -- split window vertically
key.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
key.set("n", "<leader>se", "<C-w>=") -- set windows equally
key.set("n", "<leader>sx", ":close<CR>") -- close current window

key.set("n", "<leader>to", ":tabnew<CR>") -- opens new tab
key.set("n", "<leader>tx", ":tabclose<CR>") -- closes current tab
key.set("n", "<leader>tn", ":tabn<CR>") -- go to the next tab
key.set("n", "<leader>tp", ":tabp<CR>") -- go to the previous tab

-- Find and replace all words
key.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
key.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Indentation
key.set("v", "<", "<gv")
key.set("v", ">", ">gv")
key.set("n", "<", "v<")
key.set("n", ">", "v>")

-- Plugin Keymaps --
-- vim-maximizer
key.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- Maximize the current window

-- nvim-tree
key.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- Toggles the tree
key.set("n", "<leader>fe", ":NvimTreeFocus<CR>") -- Focuses on the tree

-- telescope
key.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
key.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
key.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
key.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
key.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- Packer
key.set("n", "<leader>ps", ":PackerSync<CR>")
