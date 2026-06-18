--* --------------------------------------------------------------- *--
--?                      	     Post Init                            ?--
--* --------------------------------------------------------------- *--

-- welcome the user
require("utils.helpers").notify(string.format("welcome %s ", os.getenv("USER")), vim.log.levels.INFO)

-- NOTE:lazy loaded plugin groups - the group will not be displayed unless the plugin is loaded
-- thus the group creation is done outside the respective plugins and even which-key's setup
local wk = require("which-key")
wk.add({
  -- { "<leader>m", group = "mark", icon = { icon = "", color = "red", } },
  { "<leader>o", group = "opencode", icon = { icon = "󰯉", color = "green", } },
  { "<leader>d", group = "debugger", }, -- using default icon
  { "<leader>e", group = "extensions", icon = { icon = "", color = "purple", } },
  { "<leader>x", group = "explorer", icon = { icon = "󰙅", color = "blue", } },
  { "<leader>T", group = "testing", icon = { icon = "󰇉", color = "purple", } },
  { "<leader>f", group = "flash", icon = { icon = "󱐋", color = "yellow", } },
  { "<leader>c", group = "comments", icon = { icon = "", color = "blue", } },
})

-- clipboard bootstrapping
require("post-init.clipboard")
