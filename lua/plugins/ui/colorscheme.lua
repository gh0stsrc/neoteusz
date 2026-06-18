--* --------------------------------------------------------------- *--
--?                      Neoteusz Colorscheme                       ?--
--* --------------------------------------------------------------- *--

-- desired generic overrides for gruvbox
local gruvbox_overrides = {
  -- use a treesitter group/LSP semantic override to force the colour of comments to green (supported for all installed LSPs)
  ["@comment"] = { fg = "#2ea542" },
  -- gopls marks constants/booleans/nil as readonly variables (rendered white); re-colour them gruvbox purple.
  -- typemod groups apply at priority 127 (> the 125 of @lsp.type.variable), so this override wins.
  ["@lsp.typemod.variable.readonly"] = { fg = "#d3869b" },
  -- gopls tags struct-field accesses as plain `variable` (rendered white). Clear the semantic
  -- `variable` colour so treesitter's finer captures show through: field accesses (@property)
  -- get coloured, while locals (@variable) stay white. (gruvbox strips the group's link on override.)
  ["@lsp.type.variable"] = {},
  -- colour field accessors (treesitter @property) aqua, distinct from the blue parameters.
  ["@property"] = { fg = "#8ec07c" },
}

-- default palette overrides for gruvbox - defaults to nil as palette overrides will only be leveraged if issues with an LSP arise
local gruvbox_palette_overrides

return {
  {
    "ellisonleao/gruvbox.nvim",
    commit = "154eb5ff5b96d0641307113fa385eaf0d36d9796", -- 2.0.0 +122 (rolling master)
    lazy = false,
    priority = 1000,
    setup = true,
    config = function()
      require("gruvbox").setup({
        -- set gruvbox to present a hardened contrast, preferred option when using Dark Mode
        contrast = "hard",
        --* use a treesitter group/LSP semantic override to force the colour of comments to green (supported for all installed LSPs)
        overrides = gruvbox_overrides,
        palette_overrides = gruvbox_palette_overrides,
      })
      --* ------------------------------------ *--
      --?      colourscheme finalization       ?--
      --* ------------------------------------ *--
      -- set the vim background to Dark Mode -- IMPORTANT: these colorscheme overrides must occur after the primary gruvbox setup
      vim.o.background = "dark"
      -- set colorscheme to gruvbox, AFTER setting all configurations
      vim.cmd("colorscheme gruvbox")
    end
  },
}
