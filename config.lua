-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

--Unmap arrow keys in normal mode
lvim.keys.normal_mode["<Up>"] = ""
lvim.keys.normal_mode["<Down>"] = ""
lvim.keys.normal_mode["<Left>"] = ""
lvim.keys.normal_mode["<Right>"] = ""

--Unmap arrow keys in normal mode
lvim.keys.visual_mode["<Up>"] = ""
lvim.keys.visual_mode["<Down>"] = ""
lvim.keys.visual_mode["<Left>"] = ""
lvim.keys.visual_mode["<Right>"] = ""

lvim.colorscheme = "dracula"

-- Ensure Treesitter parsers are installed for additional languages
--lvim.builtin.treesitter.ensure_installed = {
  --"python",
  --"javascript",
  --"java",
  --"html",
 -- "css",
  --"django-html",
--}


-- Set up formatters for different languages
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black", filetypes = { "python" } },
  { name = "prettier", filetypes = { "javascript", "html", "css", "json" } },  -- For JS, HTML, CSS
}
-- Set up linters for different languages
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", args = { "--ignore=E203" }, filetypes = { "python" } },
  --{ command = "eslint", filetypes = { "javascript" } },  -- For JavaScript
  --{ command = "htmlhint", filetypes = { "html" } },      -- For HTML
}
lvim.plugins = {
  "AckslD/swenv.nvim",
  "stevearc/dressing.nvim",
  "Mofiqul/dracula.nvim",

}

require('swenv').setup({
  post_set_venv = function ()
    vim.cmd("LspRestart")
  end,
})

lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd> lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}

