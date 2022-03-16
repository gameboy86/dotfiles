vim.cmd[[
    augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 colorcolumn=79 formatoptions+=croq softtabstop=4 autoindent
]]
