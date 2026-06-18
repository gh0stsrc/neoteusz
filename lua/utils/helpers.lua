--* --------------------------------------------------------------- *--
--?                      	  Helper Functions                        ?--
--* --------------------------------------------------------------- *--

-- define a table to represent the module
local M = {}

-- helper func used to see if a particular command exists on the system (i.e. is reachable via $PATH)
function M.command_exists(cmd)
  -- vim.fn.executable is native and synchronous (no shell subprocess), returning 1 when the
  -- command is reachable via $PATH and 0 otherwise.
  return vim.fn.executable(cmd) == 1
end

-- helper func to convert strings to booleans - primarily for env var comparison
function M.to_boolean(str)
  local bool = false
  if str == "true" then
    bool = true
  end
  return bool
end

-- function to see if a table contains a particular value
function M.contains(table, element)
  for _, value in ipairs(table) do
    if type(value) == "string" then
      if string.upper(value) == string.upper(element) then
        return true
      end
    elseif value == element then
      return true
    end
  end
  return false
end

-- function to see if a table only contains a particular value
function M.onlyContains(table, element)
  if #table > 1 then
    return false
  else
    return M.contains(table, element)
  end
end

-- helper func to check if Neovim compatible clipboard providers are currently installed
function M.check_clipboard_providers()
  local compatible_providers = { "pbcopy", "pbpaste", "wl-copy", "wl-paste", "waycopy", "xclip", "xsel", "lemonade",
    "doitclient", "win32yank", "termux", "tmux" }
  local found_providers = {}

  -- iterate over each provider in the table of compatible_providers and check if there is a present provider installed for Neovim to leverage
  for _, provider in ipairs(compatible_providers) do
    -- check if the provider is executable using Neovim’s vim.fn.executable function
    if vim.fn.executable(provider) == 1 then
      -- if the provider is executable, add it to the found_providers table
      table.insert(found_providers, provider) -- Insert the provider to the found_providers table
    end
  end
  -- return the table of found providers
  return found_providers
end

-- helper to issue a notification via the configured notifier, titled with the neoteusz name.
-- wrapped in plenary.async.run to match the existing notification dispatch pattern.
function M.notify(msg, level)
  local async = require("plenary.async")
  async.run(function()
    vim.notify(msg, level or vim.log.levels.INFO, { title = vim.g.neoteusz_name })
  end, function() end)
end

-- return the module as a table
return M
