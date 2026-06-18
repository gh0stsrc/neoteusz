--* --------------------------------------------------------------- *--
--?                      	  lazygit Setup   	                      ?--
--* --------------------------------------------------------------- *--

local command_exists = require("utils.helpers").command_exists

-- ONLY configure toggle terminal to open terminal window running lazygit, if lazy it is installed on the system (i.e. can be found on $PATH)
if command_exists("lazygit") then
  -- load and save toggle terminal's terminal module Terminal object, for direct terminal window creation
  local Terminal = require("toggleterm.terminal").Terminal
  -- Create a new Terminal instance for lazygit
  local LazyGit = Terminal:new({
    cmd = "lazygit",     -- command to execute in the terminal
    dir = "git_dir",     -- directory for terminal to be opened within
    direction = "float", -- set terminal to float over the current Neovim window
    float_opts = {
      border = "shadow", -- Options: 'single', 'double', 'shadow', or 'curved'
    },

    -- function to run on opening of the terminal
    on_open = function(term)
      vim.cmd("startinsert!") -- start in INSERT mode
      -- map the `q` key in normal mode to close the lazygit terminal window
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,

    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd("startinsert!") -- Resume INSERT mode upon closing the terminal window
    end,
  })

  -- function to toggle the lazygit terminal
  local function _lazygit_toggle()
    LazyGit:toggle()
  end

  -- set a keymap in normal mode: that will toggle the lazygit terminal - automatically picked up by which-key
  vim.keymap.set("n", "<leader>eg", function() _lazygit_toggle() end,
    { noremap = true, silent = true, desc = "Toggle lazygit" })
end
