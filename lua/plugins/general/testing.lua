--* --------------------------------------------------------------- *--
--?                             Testing                             ?--
--* --------------------------------------------------------------- *--

return {
  {
    "vim-test/vim-test",
    commit = "2676d84c6901e484df00b5d728bd6a345d47ee12", -- v3.3.1
    config = function()
      -- set vim-test to launch tests in toggleterm
      vim.cmd("let test#strategy = 'toggleterm'")
    end,
    keys = {
      {
        "<leader>Tn",
        function() vim.cmd("TestNearest") end,
        mode = "n",
        desc = "Run the nearest test to the cursor",
      },
      {
        "<leader>Tf",
        function() vim.cmd("TestFile") end,
        mode = "n",
        desc = "Run all tests within the current file",
      },
      {
        "<leader>Ts",
        function() vim.cmd("TestSuite") end,
        mode = "n",
        desc = "Run all tests within a testing suite",
      },
      {
        "<leader>Tl",
        function() vim.cmd("TestLast") end,
        mode = "n",
        desc = "Re-run the last executed test",
      },
    }
  },
}
