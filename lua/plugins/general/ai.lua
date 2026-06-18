--* --------------------------------------------------------------- *--
--?                         AI Coding Agent                         ?--
--* --------------------------------------------------------------- *--

local Helpers = require("utils.helpers")
local enableOpencode = false

-- if the opencode CLI is not present on the system, inform the user via a notification
if not Helpers.command_exists("opencode") then
  Helpers.notify(
    "The `opencode` CLI was NOT found on your system. `opencode` is required by `opencode.nvim`. The `opencode.nvim` plugin will not be loaded until `opencode` is present on your system (see https://opencode.ai/docs/).",
    vim.log.levels.WARN)
  -- otherwise, set the flag to enable opencode.nvim and allow it to be loaded
else
  -- opencode present: enable opencode.nvim. No success notification.
  enableOpencode = true
end


return {
  {
    "nickjvandyke/opencode.nvim",
    commit = "97c90dd0936c9076cbe78d8f94c7a2d119509d2c", -- v0.13.1
    enabled = enableOpencode, -- NOTE: opencode.nvim will only be loaded if the `opencode` CLI is present on the system
    dependencies = {
      -- NOTE: snacks must be `setup()` for opencode's UI to be enhanced. lazy.nvim
      --       automatically runs `require("snacks").setup(opts)` for this dependency.
      {
        "folke/snacks.nvim",
        commit = "882c996cf28183f4d63640de0b4c02ec886d01f2", -- stable +11 (rolling main)
        opts = {
          input = { enabled = true },  -- enhances `ask()` -> context completion + highlighting on the selection
          picker = { enabled = true }, -- enhances `select()` -> previewed prompt/command/server picker
        },
      },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any; goto definition on the type or field for details
      }

      vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

      -- Recommended/example keymaps (operator maps on `go`/`goo` intentionally omitted to
      -- avoid shadowing Vim's built-in `go` and the resulting which-key/timeout ambiguity)
      vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ") end, { desc = "Ask OpenCode…" })
      vim.keymap.set({ "n", "x" }, "<leader>os", function() require("opencode").select() end,       { desc = "Select OpenCode…" })

      vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll OpenCode up" })
      vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll OpenCode down" })
    end,
  }
}
