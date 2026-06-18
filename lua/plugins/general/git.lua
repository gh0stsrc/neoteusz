--* --------------------------------------------------------------- *--
--?                           Git Related                           ?--
--* --------------------------------------------------------------- *--

return {
  {
    "lewis6991/gitsigns.nvim",
    commit = "a462f416e2ce4744531c6256252dee99a7d34a83", -- v2.1.0
    opts = {
      signs = {
        add = { text = "+" } -- override gitsigns to reflect new lines with a `plus` sign
      }
    }
  },
}
