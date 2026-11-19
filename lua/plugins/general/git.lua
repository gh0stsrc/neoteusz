--* --------------------------------------------------------------- *--
--?                           Git Related                           ?--
--* --------------------------------------------------------------- *--

return {
  {
    "lewis6991/gitsigns.nvim",
    commit = "a462f416e2ce4744531c6256252dee99a7d34a83", -- v2.1.0
    lazy = false,
    dependencies = {
      { "folke/which-key.nvim" },
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" } -- override gitsigns to reflect new lines with a `plus` sign
      },
      -- buffer-local git keymaps, only active in git-tracked buffers
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Report gitsigns errors as a notification instead of a raised traceback
        local function notify_err(err)
          vim.schedule(function()
            vim.notify(tostring(err), vim.log.levels.ERROR)
          end)
        end

        -- Show the hunk under the cursor inline in the buffer
        local function preview_inline()
          gitsigns.preview_hunk_inline(function(err)
            if err then
              notify_err(err)
            end
          end)
        end

        -- Jump to the next/previous hunk, then preview it inline
        local function nav(direction)
          return function()
            gitsigns.nav_hunk(direction, nil, function(err)
              if err then
                notify_err(err)
                return
              end
              preview_inline()
            end)
          end
        end

        -- hunk navigation
        map("n", "<leader>gp", preview_inline, "Preview git hunk")
        map("n", "<leader>g[", nav("prev"), "Previous git hunk")
        map("n", "<leader>g]", nav("next"), "Next git hunk")

        -- search all repo hunks via telescope (populate qflist, then open telescope's quickfix picker)
        map("n", "<leader>g<enter>", function()
          gitsigns.setqflist("all", { open = false }, function()
            require("telescope.builtin").quickfix()
          end)
        end, "Search git hunks (telescope)")
      end,
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
      -- add group name for the root of <leader> g (i.e. git)
      require("which-key").add({
        { "<leader>g", group = "git", icon = { icon = "", color = "orange" } },
      })
    end,
    keys = {
      { "<leader>gs", function() require("telescope.builtin").git_status() end,   mode = "n", desc = "Search changed files (git status)" },
      { "<leader>gc", function() require("telescope.builtin").git_commits() end,  mode = "n", desc = "Search commits (repo)" },
      { "<leader>gC", function() require("telescope.builtin").git_bcommits() end, mode = "n", desc = "Search commits (current buffer)" },
      { "<leader>gb", function() require("telescope.builtin").git_branches() end, mode = "n", desc = "Search branches" },
      { "<leader>gS", function() require("telescope.builtin").git_stash() end,    mode = "n", desc = "Search stashes" },
    },
  },
}
