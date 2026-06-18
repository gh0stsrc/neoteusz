--* --------------------------------------------------------------- *--
--?                              Icons                              ?--
--* --------------------------------------------------------------- *--

-- IMPORTANT: all fonts/icons are required to be patched to be able to be rendered by the terminal, already patched fonts are available at https://www.nerdfonts.com/

return {
  {
    "nvim-tree/nvim-web-devicons",
    commit = "f0267921c845c42685968401bc49aa65e18d3e09", -- nerd-v2-compat +27 (rolling master)
    priority = 1000,
    lazy = false,
    -- NOTE: override icons based on patched Ubuntu Nerd Fonts
    opts = {
      override = {
        go = {
          icon = "󰟓"
        },
        md = {
          icon = "󰽛"
        },
        python = {
          icon = "󰌠"
        },
        rs = {
          icon = ""
        },
        tf = {
          icon = "󱁢"
        },
        tfvars = {
          icon = "󱁢"
        },
        ts = {
          icon = "󰛦"
        },
        lua = {
          icon = "󰢱"
        },
        yaml = {
          icon = ""
        },
        license = {
          icon = "󰿃"
        },
        makefile = {
          icon = "󰛕"
        },
      },

      override_by_filename = {
        [".gitignore"] = {
          icon = "󰊢"
        },
        [".gitconfig"] = {
          icon = "󰊢"
        },
        [".gitcommit"] = {
          icon = "󰊢"
        },
        [".gitattributes"] = {
          icon = "󰊢"
        },
        [".bashrc"] = {
          icon = ""
        },
        [".bash_profile"] = {
          icon = ""
        },
      },

      override_by_extension = {
        ["sh"] = {
          icon = ""
        },
        ["git"] = {
          icon = "󰊢"
        },
        ["Dockerfile"] = {
          icon = ""
        },
      },
    }
  },
  {
    "mortepau/codicons.nvim", -- NOTE: codicons is a dependency of dapui, which leverages codicons as part of the UI"s debugger pane
    priority = 1000,
    lazy = false,
    config = function()
      require("codicons").setup()
    end
  },
  {
    "echasnovski/mini.icons", -- NOTE: mini.icons is an optional dependency of which-key
    commit = "ac38c983aed0a2bd32a65ca3e2348e12e58ca292", -- post-v0.17.0 (latest main; no tag past v0.17.0 yet)
    priority = 1000,
    lazy = false,
    config = function()
      require("mini.icons").setup()
    end,
  },
}
