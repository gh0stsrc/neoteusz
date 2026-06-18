--* --------------------------------------------------------------- *--
--?                         User Interface                          ?--
--* --------------------------------------------------------------- *--

-- NOTE: nvim-notify uses patched fonts/icons, if want to icons to successfully render you must have a set of patched fonts installed, already patched fonts are available at https://www.nerdfonts.com/

-- get the desired log level set within the config.lua file, if not set the log lvl will default to `INFO`
local log_lvl_nm = string.upper(vim.g.neoteusz_logging_level or "INFO")

-- map of log level names to vim log levels
local log_lvl_map = {
  TRACE = vim.log.levels.TRACE,
  DEBUG = vim.log.levels.DEBUG,
  INFO  = vim.log.levels.INFO,
  WARN  = vim.log.levels.WARN,
  ERROR = vim.log.levels.ERROR,
  OFF   = vim.log.levels.OFF
}

return {
  {
    "nvim-tree/nvim-tree.lua",
    commit = "85d1145ac71c1b8e1423862c78165a1f609faf60", -- v1.17.0
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = function() -- IMPORTANT: nvim-tree requires explicit initialization, otherwise lazy loading will break
      require("nvim-tree").setup({
        renderer = {
          highlight_git = "name",
          highlight_opened_files = "all",
          root_folder_label = ":t",
          indent_markers = {
            enable = true,
          },
        },
        view = {
          side = "left",
          width = 30,
        },
        diagnostics = {
          enable = true,
        },
      })
      -- explicitly override nvim-tree highlight groups to match gruvbox theme
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE", fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#fabd2f" })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#b8bb26", bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#928374" })
      vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#d79921" })
      vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#fb4934" })
    end,
    keys = {
      {
        "<leader>x<enter>",
        function() vim.cmd("NvimTreeToggle") end,
        mode = "n",
        desc = "Toggle nvim-tree explorer",
      },
      {
        "<leader>xx",
        function() vim.cmd("NvimTreeFocus") end,
        mode = "n",
        desc = "Set focus on nvim-tree explorer"
      }
    }
  },
  {
    "rcarriga/nvim-notify",
    commit = "a3020c2cf4dfc4c4f390c4a21e84e35e46cf5d17", -- v3.15.0 - Neovim 0.12 compat (older releases break on 0.11+)
    priority = 1000,
    lazy = false,
    config = function()
      -- load notify as a telescope extension
      require("telescope").load_extension("notify")

      -- configure the notify plugin
      require("notify").setup({
        level = log_lvl_map[log_lvl_nm],
        -- gruvbox dark (contrast="hard") background (dark0_hard). Used for the
        -- notification window's transparency blend. Set explicitly because
        -- nvim-notify can load before the colorscheme defines NotifyBackground.
        background_colour = "#1d2021",
        icons = {
          ERROR = "󰚌 ",
          WARN  = "󱡝 ",
          INFO  = "󰇥 ",
          DEBUG = "󰻕 ",
          TRACE = "󰛤 ",
        }
      })
      vim.notify = require("notify") -- NOTE: set nvim-notify as the default notification mechanism for all plugins that use the vim.notify function
    end,
    keys = {
      {
        "<leader>sn",
        function() vim.cmd("Telescope notify") end,
        mode = "n",
        desc = "Search notifications"
      },
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    commit = "2248ef254d0a1488a72041cfb45ca9caada6d994", -- compat-nvim-0.5 +6 (rolling master; no semver tags)
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nickjvandyke/opencode.nvim" },
      -- IMPORTANT: load the colorscheme BEFORE lualine. gruvbox runs `colorscheme gruvbox`,
      -- which clears all highlight groups; if lualine sets up first, its section/separator
      -- (transitional) highlights get wiped -> muted colors + boxy separators.
      { "ellisonleao/gruvbox.nvim" },
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = "gruvbox",
        section_separators = { left = "", right = "" }, -- IMPORTANT: to be able to load these semi-circle fonts you will need a Patched `Nerd Fonts` installed and your terminal configured to default to them
        component_separators = "|",
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 }, -- omit the separator for the left side of section `A`
        },
        lualine_b = { "filename", "branch" },
        lualine_c = { "fileformat" },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 }, -- omit the separator for the right side of section `Z`
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    }
  },
  {
    "akinsho/bufferline.nvim",
    commit = "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3", -- v4.9.1 - Neovim 0.12 compat (fixes "Segments must be a list")
    lazy = false,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "folke/which-key.nvim" },
    },
    config = function()
      require("bufferline").setup({
        options = {
          modified_icon = "󱙄 ",
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          --diagnostics_update_in_insert = true,
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end
        }
      })
      -- add group name for the root of <leader> b and <leader> bc
      require("which-key").add({
        { "<leader>b", group = "buffers", icon = { icon = "", color = "orange" } },
        { "<leader>bc", group = "close", icon = { icon = "󰅚", color = "red" } },
      })
    end,
    keys = {
      {
        "<leader>bcl",
        function() vim.cmd("BufferLineCloseLeft") end,
        mode = "n",
        desc = "Close buffers to the left",
      },
      {
        "<leader>bcr",
        function() vim.cmd("BufferLineCloseRight") end,
        mode = "n",
        desc = "Close buffers to the right",
      },
      {
        "<leader>bcc",
        function() vim.cmd("bdelete!") end,
        mode = "n",
        desc = "Close current buffer",
      },
      {
        "<leader>bco",
        function() vim.cmd("BufferLineCloseOthers") end,
        mode = "n",
        desc = "Close all buffers other than the current buffer",
      },
      {
        "<leader>b]",
        function() vim.cmd("BufferLineCycleNext") end,
        mode = "n",
        desc = "Move to the next open buffer",
      },
      {
        "<leader>b[",
        function() vim.cmd("BufferLineCyclePrev") end,
        mode = "n",
        desc = "Move to the previous open buffer",
      },
      {
        "<leader>m",
        function()
          local bufferNum = vim.v.count ~= 0 and vim.v.count or
              1 -- if the keybindind is not prefaced with a number, default to 1
          require("bufferline").go_to(bufferNum, false)
        end,
        mode = "n",
        desc = "Move to the nth visible buffer (relative)",
      },
      {
        "<leader>M",
        function()
          local bufferNum = vim.v.count ~= 0 and vim.v.count or
              1 -- if the keybindind is not prefaced with a number, default to 1
          require("bufferline").go_to(bufferNum, true)
        end,
        mode = "n",
        desc = "Move to the nth buffer (absolute)",
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "29be0919b91fb59eca9e90690d76014233392bef", -- v3.3.7
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      require("ibl").setup({
        scope = {
          show_exact_scope = true, -- requires treesitter
        },
        indent = {
          -- replace default char to a slimmer pipe
          char = "│",
        }
      })
    end
  },
}
