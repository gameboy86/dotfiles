--local i = require("user.lsp.handlers")
--
--require("flutter-tools").setup{
--  lsp = {
--    color = { -- show the derived colours for dart variables
--      enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
--      background = false, -- highlight the background
--      foreground = false, -- highlight the foreground
--      virtual_text = true, -- show the highlight using virtual text
--      virtual_text_str = "■", -- the virtual text character to highlight
--    },
--    on_attach=i.on_attach,
--    capabilities=i.capabilities,
--  }
--} -- use defaults
