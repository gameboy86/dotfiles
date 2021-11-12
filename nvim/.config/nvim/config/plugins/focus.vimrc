lua require("focus").setup({width=80, winhighlight=false, treewidth=10, bufnew=true})

lua <<EOF
vim.api.nvim_set_keymap('n', '<c-j>', ':FocusSplitDown<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', ':FocusSplitRight<CR>', { silent = true })
EOF

