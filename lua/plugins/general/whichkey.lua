--* --------------------------------------------------------------- *--
--?                 Interactive Keybinding Explorer                 ?--
--* --------------------------------------------------------------- *--

-- NOTE: which-key uses patched fonts/icons, if want to icons to successfully render you must have a set of patched fonts installed, already patched fonts are available at https://www.nerdfonts.com/

return {
  {
    "folke/which-key.nvim",
    commit = "fcbf4eea17cb299c02557d576f0d568878e354a4", -- v3.17.0
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "echasnovski/mini.icons" },
    },
    event = "VeryLazy",
    opts = {
      -- disable icons
      -- icons = {
      --   mappings = false
      -- }
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}
