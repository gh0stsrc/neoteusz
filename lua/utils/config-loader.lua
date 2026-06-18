--* --------------------------------------------------------------- *--
--?                     Neoteusz Config Loader                      ?--
--* --------------------------------------------------------------- *--

-- function to recursively create global variables from nested tables
local function create_global_vars(prefix, tbl)
  for key, value in pairs(tbl) do
    local var_name = prefix .. key
    if type(value) == "table" then
      -- If the value is a table, call the function recursively
      create_global_vars(var_name .. "_", value)
    else
      -- Set the global variable
      vim.g[var_name] = value
    end
  end
end

-- get the path to the root directory (where init.lua is located)
local repo_root = vim.fn.stdpath("config")
-- add the root directory to package.path
package.path = repo_root .. "/?.lua;" .. package.path

-- load neoteusz specific configs
local config = require("config")

-- create global vars based on the loaded config
create_global_vars("neoteusz_", config)


--* ------------------------------------ *--
--?                Example               ?--
--* ------------------------------------ *--
--[[
  Assumption: the prefix will be `neoteusz_`

  [Data Structure]
    {
      clipboard = {
        tmux = { bootstrap = false },
        skip = false
      },
      logging = {
        level = "INFO"
      }
    }

  [Globals Created] (vim.g.*)
    - neoteusz_clipboard_tmux_bootstrap = false
    - neoteusz_clipboard_skip = false
    - neoteusz_logging_level = "INFO"
]] --
