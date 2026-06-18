--* --------------------------------------------------------------- *--
--?                  Neovim Clipboard Bootstrapping                 ?--
--* --------------------------------------------------------------- *--

local Helpers = require("utils.helpers")

-- get a table of compatible clipboard providers that are currently installed on the system
local clipboard_providers = Helpers.check_clipboard_providers()

-- check if no clipboard provider has been found AND if the user has NOT explicitly disabled clipboard validation and bootstrapping
if #clipboard_providers == 0 and vim.g.neoteusz_clipboard_skip ~= true then
  -- If no providers were found, notify the user
  Helpers.notify(
    "No clipboard providers found, either install a compatible clipboard provider or set the `clipboard.skip` field within the config.lua file true to ignore clipboard errors. To see compatible clipboards, use the `help: g:clipboard` command (or telescope help search).",
    vim.log.levels.WARN)
end

-- only bootstrap tmux as the clipboard provider if the user explicitly enables bootstrapping OR tmux is the only clipboard provider on the system and there is an active tmux session attached
if (vim.g.neoteusz_clipboard_tmux_bootstrap or Helpers.onlyContains(clipboard_providers, "tmux"))
    and os.getenv("TMUX") ~= nil and vim.fn.executable("tmux") == 1 then
  -- explicitly set tmux as the neovim clipboard provider
  vim.g.clipboard = {
    name = "tmux",
    copy = {
      ["+"] = { "tmux", "load-buffer", "-" },
      ["*"] = { "tmux", "load-buffer", "-" },
    },
    paste = {
      ["+"] = { "tmux", "save-buffer", "-" },
      ["*"] = { "tmux", "save-buffer", "-" },
    },
    cache_enabled = true
  }
end
