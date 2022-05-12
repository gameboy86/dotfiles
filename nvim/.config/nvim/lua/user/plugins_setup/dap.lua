local cmp_status_ok, dap = pcall(require, "dap")
if not cmp_status_ok then
  return
end

require('telescope').load_extension('dap')

dap.defaults.fallback.terminal_win_cmd = '10split new'

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🐞', texthl='', linehl='', numhl=''})

-- dap.adapters.codelldb = {
--   type = 'server',
--   host = '127.0.0.1',
--   port = 13000 -- 💀 Use the port printed out or specified with `--port`
-- }

dap.adapters.rust = {
    type = 'executable',
    attach = {
        pidProperty = "pid",
        pidSelect = "ask"
    },
    command = 'lldb-vscode',
    env = {
        LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
    },
    name = "lldb"
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "rust",
    request = "launch",
    program = function()
      local bin = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      return vim.fn.getcwd() .. '/target/debug/' .. bin
      -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/' , 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}


local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>dh', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map('n', '<A-k>', ':lua require"dap".step_out()<CR>')
map('n', "<A-l>", ':lua require"dap".step_into()<CR>')
map('n', '<A-j>', ':lua require"dap".step_over()<CR>')
map('n', '<A-h>', ':lua require"dap".continue()<CR>')
map('n', '<leader>dn', ':lua require"dap".run_to_cursor()<CR>')
map('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
map('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
map('n', '<leader>dc', ':lua require"dap".terminate()<CR>')
map('n', '<leader>dr', ':lua require"dap".repl.toggle({height=10})<CR>')
map('n', '<leader>dR', ':lua require"dap".clear_breakpoints()<CR>')
map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')
map('n', '<leader>ds', ':Telescope dap frames<CR>')
-- map('n', '<leader>dc', ':Telescope dap commands<CR>')
map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')

-- nvim-dap-ui
map('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')

require('dap-python').setup('/usr/bin/python')
require('dap-python').test_runner = 'pytest'

require('dap-go').setup()

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})
