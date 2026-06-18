---
---        ████ ██████
---       ███████████
---       █████████ ███████████████████████████████████████  ████████████████████
---      █████████  ███    █████      ███       ███    ███  ██████           ███
---     █████████ ██████████ ██    ███      ███████████  ███████████  █████
---   ███████████ ███    ███ ███  ███       ███    ███  ███     ██████
---  ██████  ██████████████████████████████████████████████████████████████████
---
--- version : v1.0.0
--- NOTE    : Comments have been extended by the use of `folke/todo-comments.nvim`. comments are enriched with color highlighting, distinct icons and are searchable via commands and key-bindings, throughout open buffers and
---           the entire project workspace.
---
---           [LEGEND]:
---             - IMPORTANT:
---               - Important information which should be understood
---             - NOTE:
---               - Information that is considered to be noteworthy
---             - TODO:
---               - More stuff to do
---             - HACK:
---               - Sus code (smooth brain stuff)
---             - BUG:
---               - Logical bug (also can be commitged using FIX)
---             - WARN:
---               - Possible issues or concerns
---             - TEST:
---               - Testing
---             - PERF:
---               - Performance optimization
---             - --:
---               - Regular Comment
---

-- clone lazy.nvim to the standard data path (e.g. ~/.local/share/nvim) under lazy/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- IMPORTANT: load core first and foremost
require("core")
-- load neoteusz specific configs prior to lazy.nvim loading any plugins
require("utils.config-loader")
-- lazy.nvim startup configuration, including plugin bootstrapping
require("lazy").setup({
  spec = {
    {
      "folke/lazy.nvim",
      opts = { rocks = { enabled = false, hererocks = false }
      }
    },
    -- import plugin
    { import = "plugins.ui" }, -- IMPORTANT: load ui components first
    { import = "plugins.lsp" },
    { import = "plugins.general" },
    { import = "plugins.experimental" },
  },
})
-- post initialization
require("post-init")
-- load extensions like terminal ui apps (e.g. lazygit and k9s)
require("extensions")
