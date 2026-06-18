--* --------------------------------------------------------------- *--
--?                      	      k9s Setup   	                      ?--
--* --------------------------------------------------------------- *--

local command_exists = require("utils.helpers").command_exists

-- ONLY configure toggle terminal to open terminal window running k9s, if k9s is installed on the system (i.e. can be found on $PATH)
if command_exists("k9s") then
  -- load and save toggle terminal's terminal module Terminal object, for direct terminal window creation
  local Terminal = require("toggleterm.terminal").Terminal
  -- Create a new Terminal instance for k9s
  local K9s = Terminal:new({
    cmd = "k9s",         -- command to execute in the terminal
    dir = "./",          -- directory for terminal to be opened within
    direction = "float", -- set terminal to float over the current Neovim window
    float_opts = {
      border = "shadow", -- Options: 'single', 'double', 'shadow', or 'curved'
    },

    -- function to run on opening of the terminal
    on_open = function(term)
      vim.cmd("startinsert!") -- start in INSERT mode
      -- map the `q` and `qq` keys in normal and terminal mode respectively, to close the k9s terminal window
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "qq", "<cmd>close<CR>", { noremap = true, silent = true })
    end,

    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd("startinsert!") -- Resume INSERT mode upon closing the terminal window
    end,
  })

  -- function to toggle the k9s terminal
  local function _k9s_toggle()
    K9s:toggle()
  end

  -- set a keymap in normal mode, that will toggle the k9s terminal - automatically picked up by which-key
  vim.keymap.set("n", "<leader>ek", function() _k9s_toggle() end, { noremap = true, silent = true, desc = "Toggle k9s" })
end
