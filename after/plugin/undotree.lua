vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- See https://github.com/mbbill/undotree/blob/master/plugin/undotree.vim#L15
-- Following is a vim package
vim.cmd([[
    if !exists('g:undotree_WindowLayout')
        let g:undotree_WindowLayout = 4
    endif
    
    if !exists('g:undotree_SplitWidth')
        let g:undotree_SplitWidth = 30
    endif

    if !exists('g:undotree_SetFocusWhenToggle')
        let g:undotree_SetFocusWhenToggle = 1
    endif
]])
