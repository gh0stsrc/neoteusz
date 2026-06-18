--* --------------------------------------------------------------- *--
--?                           Commenting                            ?--
--* --------------------------------------------------------------- *--

-- NOTE: todo-comments uses patched fonts/icons, if want to icons to successfully render you must have a set of patched fonts installed, already patched fonts are available at https://www.nerdfonts.com/

return {
  {
    "numToStr/Comment.nvim",
    commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb", -- v0.8.0 +59 (rolling master)
    opts = {
      ignore = "^$"
    }
  },
  {
    "folke/todo-comments.nvim",
    commit = "3094ead8edfa9040de2421deddec55d3762f64d1", -- v1.1.0 +4 (rolling main)
    lazy = false,
    config = function()
      require("todo-comments").setup({
        --override icons and colours associated to comment keywords
        keywords = {
          TODO = { icon = "󰐱 ", color = "info", },
          HACK = { icon = "󰠥 ", color = "warning", },
          FIX = {
            icon = "󰻕 ",
            color = "error",
            alt = { "BUG", "ISSUE" },
          },
          IMPORTANT = { icon = "󰚌 ", color = "error", },
          WARN = { icon = "󱡝 ", color = "warning", alt = { "WARNING" }, },
          PERF = { icon = "󱓞 ", },
          NOTE = { icon = "󰇥 ", color = "hint", },
          TEST = { icon = "󱈼", color = "test", alt = { "PASSED", "FAILED" }, },
        }
      })

      local wk = require("which-key")
      wk.add({
        { "<leader>ct", group = "Todo comments", icon = { icon = "󰐱", color = "blue", } },
        { "<leader>ch", group = "Hack comments", icon = { icon = "󰠥", color = "yellow", } },
        { "<leader>cb", group = "Bug/Fix comments", icon = { icon = "󰻕", color = "red", } },
        { "<leader>ci", group = "Important comments", icon = { icon = "󰚌", color = "red", } },
        { "<leader>cw", group = "Warn comments", icon = { icon = "󱡝", color = "yellow", } },
        { "<leader>cp", group = "Perf comments", icon = { icon = "󱓞", color = "cyan", } },
        { "<leader>cn", group = "Note comments", icon = { icon = "󰇥", color = "blue", } },
        { "<leader>cT", group = "Test comments", icon = { icon = "󱈼", color = "blue", } },
      })
    end,
    keys = {
      {
        "<leader>cs",
        function() vim.cmd("TodoTelescope") end,
        mode = "n",
        desc = "Search all comment tags"
      },
      {
        "<leader>ct]",
        function() require("todo-comments").jump_next({ keywords = { "TODO" } }) end,
        mode = "n",
        desc = "Jump to next TODO comment"
      },
      {
        "<leader>ct[",
        function() require("todo-comments").jump_prev({ keywords = { "TODO" } }) end,
        mode = "n",
        desc = "Jump to previous TODO comment"
      },
      {
        "<leader>cts",
        function() vim.cmd("TodoTelescope keywords=TODO") end,
        mode = "n",
        desc = "Search TODO comment tags"
      },
      {
        "<leader>ch]",
        function() require("todo-comments").jump_next({ keywords = { "HACK" } }) end,
        mode = "n",
        desc = "Jump to next HACK comment"
      },
      {
        "<leader>ch[",
        function() require("todo-comments").jump_prev({ keywords = { "HACK" } }) end,
        mode = "n",
        desc = "Jump to previous HACK comment"
      },
      {
        "<leader>chs",
        function() vim.cmd("TodoTelescope keywords=HACK") end,
        mode = "n",
        desc = "Search HACK comment tags"
      },
      {
        "<leader>cb]",
        function() require("todo-comments").jump_next({ keywords = { "BUG", "FIX" } }) end,
        mode = "n",
        desc = "Jump to next BUG/FIX comment"
      },
      {
        "<leader>cb[",
        function() require("todo-comments").jump_prev({ keywords = { "BUG", "FIX" } }) end,
        mode = "n",
        desc = "Jump to previous BUG/FIX comment"
      },
      {
        "<leader>cbs",
        function() vim.cmd("TodoTelescope keywords=BUG,FIX") end,
        mode = "n",
        desc = "Search BUG/FIX comment tags"
      },
      {
        "<leader>ci]",
        function() require("todo-comments").jump_next({ keywords = { "IMPORTANT", "IMP" } }) end,
        mode = "n",
        desc = "Jump to next IMPORTANT comment"
      },
      {
        "<leader>ci[",
        function() require("todo-comments").jump_prev({ keywords = { "IMPORTANT", "IMP" } }) end,
        mode = "n",
        desc = "Jump to previous IMPORTANT comment"
      },
      {
        "<leader>cis",
        function() vim.cmd("TodoTelescope keywords=IMPORTANT") end,
        mode = "n",
        desc = "Search IMPORTANT comment tags"
      },
      {
        "<leader>cw]",
        function() require("todo-comments").jump_next({ keywords = { "WARNING", "WARN" } }) end,
        mode = "n",
        desc = "Jump to next WARN comment"
      },
      {
        "<leader>cw[",
        function() require("todo-comments").jump_prev({ keywords = { "WARNING", "WARN" } }) end,
        mode = "n",
        desc = "Jump to previous WARN comment"
      },
      {
        "<leader>cws",
        function() vim.cmd("TodoTelescope keywords=WARN,WARNING") end,
        mode = "n",
        desc = "Search WARN comment tags"
      },
      {
        "<leader>cp]",
        function() require("todo-comments").jump_next({ keywords = { "PERF" } }) end,
        mode = "n",
        desc = "Jump to next PERF comment"
      },
      {
        "<leader>cp[",
        function() require("todo-comments").jump_prev({ keywords = { "PERF" } }) end,
        mode = "n",
        desc = "Jump to previous PERF comment"
      },
      {
        "<leader>cps",
        function() vim.cmd("TodoTelescope keywords=PERF") end,
        mode = "n",
        desc = "Search PERF comment tags"
      },
      {
        "<leader>cn]",
        function() require("todo-comments").jump_next({ keywords = { "NOTE" } }) end,
        mode = "n",
        desc = "Jump to next NOTE comment"
      },
      {
        "<leader>cn[",
        function() require("todo-comments").jump_prev({ keywords = { "NOTE" } }) end,
        mode = "n",
        desc = "Jump to previous NOTE comment"
      },
      {
        "<leader>cns",
        function() vim.cmd("TodoTelescope keywords=NOTE") end,
        mode = "n",
        desc = "Search NOTE comment tags"
      },
      {
        "<leader>cT]",
        function() require("todo-comments").jump_next({ keywords = { "TEST" } }) end,
        mode = "n",
        desc = "Jump to next TEST comment"
      },
      {
        "<leader>cT[",
        function() require("todo-comments").jump_prev({ keywords = { "TEST" } }) end,
        mode = "n",
        desc = "Jump to previous TEST comment"
      },
      {
        "<leader>cTs",
        function() vim.cmd("TodoTelescope keywords=TEST,PASSED,FAILED") end,
        mode = "n",
        desc = "Search TEST comment tags"
      },
    }
  },
}
