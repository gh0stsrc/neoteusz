--* --------------------------------------------------------------- *--
--?                             Terminal                            ?--
--* --------------------------------------------------------------- *--

return {
  {
    "akinsho/toggleterm.nvim",
    commit = "50ea089fc548917cc3cc16b46a8211833b9e3c7c", -- v2.13.1
    dependencies = {
      { "folke/which-key.nvim" },
    },
    config = function()
      require("toggleterm").setup({
        direction = "float",
        float_opts = {
          border = "curved", -- Options: 'single', 'double', 'shadow', or 'curved'
        }
      })
      -- add group name for the root of <leader> t (i.e. terminal)
      require("which-key").add({
        { "<leader>t", group = "terminal", icon = { icon = "", color = "grey" } },
      })
    end,
    keys = {
      {
        "<leader>tj",
        function() vim.cmd("ToggleTerm direction=horizontal name=Neoteusz") end,
        mode = "n",
        desc = "Open horizontal toggle terminal window"
      },
      {
        "<leader>tk",
        function() vim.cmd("ToggleTerm direction=float name=Neoteusz") end,
        mode = "n",
        desc = "Open floating toggle terminal window"
      },
      {
        "<leader>ts",
        function() vim.cmd("TermSelect") end,
        mode = "n",
        desc = "Select a terminal to focus"
      },
      {
        "<leader>ta",
        function() vim.cmd("ToggleTermToggleAll") end,
        mode = "n",
        desc = "Toggle all terminals"
      },
      --* key mapping to exit terminal mode while a toggleterm window is open
      {
        "jk", -- NOTE: `lazygit` is mapped differently, it maintains its own bindings, refer to its respective README for bindings
        function()
          -- nvim_feedkeys does NOT parse <> notation; encode the terminal-escape
          -- sequence (<C-\><C-n>) via nvim_replace_termcodes first.
          local esc = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true)
          -- get all instances of toggle terminals that currently exist
          local terminals = require("toggleterm.terminal").get_all()
          -- enumerate over the toggle terminal instances
          for _, terminal in pairs(terminals) do
            -- break nvim out of terminal mode and toggle off the open terminal
            if terminal:is_open() then
              vim.api.nvim_feedkeys(esc, "n", false)
              terminal:toggle()
              break
            end
          end
        end,
        mode = "t",
        desc = "Minimize an open terminal"
      },
    }
  },
}
