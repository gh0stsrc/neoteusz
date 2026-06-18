--* --------------------------------------------------------------- *--
--?                            Debugging                            ?--
--* --------------------------------------------------------------- *--

-- NOTE: nvim-dap-ui uses patched fonts/icons, if want to icons to successfully render you must have a set of patched fonts installed, already patched fonts are available at https://www.nerdfonts.com/

local Helpers = require("utils.helpers")
local enableNvimDapGo = false

-- if the dlv debugger is not present on the system, inform the user via a notification
if not Helpers.command_exists("dlv") then
  Helpers.notify(
    "The delve debugger aka `dlv`, was NOT found on your system. `dlv` is required by `nvim-dap-go`. The `nvim-dap-go` plugin will not be loaded until `dlv` is present on your system",
    vim.log.levels.WARN)
  -- otherwise, set the flag to enable nvim-dap-go and allow it to be lazy loaded once the respective keybindings have been invoked
else
  -- dlv present: enable nvim-dap-go (lazy-loaded on keybinding). No success notification.
  enableNvimDapGo = true
end


return {
  {
    "leoluz/nvim-dap-go",
    commit = "a5cc8dcad43f0732585d4793deb02a25c4afb766", -- (no upstream tags; rolling main)
    enabled = enableNvimDapGo, -- NOTE: nvim-dap-go will only be installed if dlv installed on the system
    dependencies = {
      {
        { "mfussenegger/nvim-dap",           commit = "6a5bba0ddea5d419a783e170c20988046376090d" }, -- 0.10.0
        { "nvim-treesitter/nvim-treesitter" },
      },
    },
    opts = {
      -- dap_configurations accepts a list of tables where each entry represents a dap configuration
      -- for more details run :help dap-configuration
      dap_configurations = {
        {
          -- Must be "go" or it will be ignored by the plugin
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
        {
            type = "go",
            name = "Launch file",
            request = "launch",
            program = "${file}",
        },
      },
      -- delve config
      delve = {
        -- the path to the executable dlv which will be used for debugging, by default, this is the dlv executable on your PATH
        path = "dlv",
        -- time to wait for delve to initialize the debug session, defaults to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger, defaults to string "${port}" which instructs nvim-dap to start the process in a random available port
        port = "${port}",
        -- additional args to pass to dlv
        args = {},
        -- the build flags that are passed to delve, defaults to an empty string, but can be used to provide flags such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example passing build flags using args is ineffective, as those are ignored by delve in dap mode
        build_flags = "",
      },
    },
    keys = {
      {
        "<leader>db",
        function() require("dap").toggle_breakpoint() end,
        mode = "n",
        desc = "Toggle breakpoint"
      },
      {
        "<leader>dc",
        function() require("dap").continue() end,
        mode = "n",
        desc = "Debugger continue"
      },
      {
        "<leader>do",
        function() require("dap").step_over() end,
        mode = "n",
        desc = "Debugger step over"
      },
      {
        "<leader>di",
        function() require("dap").step_into() end,
        mode = "n",
        desc = "Debugger step into"
      },
      {
        "<leader>dO",
        function() require("dap").step_out() end,
        mode = "n",
        desc = "Debugger step out"
      },
      {
        "<leader>dl",
        function() require("dap").run_last() end,
        mode = "n",
        desc = "Debugger run last"
      },
      {
        "<leader>dr",
        function() require("dap").repl.toggle() end,
        mode = "n",
        desc = "Toggle debugger repl"
      },
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    -- Pinned past the v4.0.0 tag: v4.0.0 crashes on `toggle()` with no active session
    -- (hover.lua indexes nil `client.session`). The fix `13888eb fix(hover): check
    -- session exists` (plus related session-guard + nvim-0.11 fixes) landed after v4.0.0
    -- and no newer release tag carries it yet.
    commit = "1a66cabaa4a4da0be107d5eda6d57242f0fe7e49", -- v4.0.0 +35 (master HEAD)
    dependencies = {
      { "mfussenegger/nvim-dap",  commit = "6a5bba0ddea5d419a783e170c20988046376090d" }, -- 0.10.0
      { "nvim-neotest/nvim-nio",  commit = "21f5324bfac14e22ba26553caf69ec76ae8a7662" }, -- v1.10.1
      { "mortepau/codicons.nvim", commit = "1b06e16e799809d886f9dda8e93f12133e18e392" } -- v0.3.0 +4 (master; dapui dep)
    },
    config = function()
      require("dapui").setup()
    end,
    keys = {
      {
        "<leader>du",
        function() require("dapui").toggle() end,
        mode = "n",
        desc = "Toggle DAP UI"
      }
    }
  },
}
