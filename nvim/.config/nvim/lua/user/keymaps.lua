local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

keymap("n", "<leader>cd", ":cd %:p:h<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers

keymap("n", "<leader>c", ":Bdelete<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opts)
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", opts)


-- My
keymap("n", "<leader><space>", ":noh<cr>", term_opts)
keymap("n", "oo", "o<Esc>", term_opts)
keymap("n", "OO", "O<Esc>", term_opts)

keymap("n", "sa", "i<space>", term_opts)
keymap("n", "ss", "i<space><Esc>", term_opts)
keymap("n", "a<cr>", "i<cr><Esc>", term_opts)

keymap("n", "<leader>h", ":<C-u>split<cr>", term_opts)
keymap("n", "<leader>v", ":<C-u>vsplit<cr>", term_opts)

keymap("n", "<space>", "za", term_opts)

keymap("n", "<leader>,", "<Plug>RestNvim", {})

vim.cmd[[
    augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 colorcolumn=79 formatoptions+=croq softtabstop=4
]]

vim.cmd[[
    augroup vimrc-go
    autocmd!
    " autocmd FileType go setlocal expandtab tabstop=4 colorcolumn=79 smartindent shiftwidth=4 shiftround softtabstop=-1
    autocmd FileType go setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
]]
