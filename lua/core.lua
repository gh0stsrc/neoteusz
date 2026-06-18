--* --------------------------------------------------------------- *--
--?                           Core / Init                           ?--
--* --------------------------------------------------------------- *--

-- IMPORTANT: this module  should always be loaded before lazy.nvim loads any plugins

-- Silence the `vim.tbl_flatten` deprecation emitted by several pinned plugins on
-- Neovim 0.12+ (the function is removed in 0.13). This is a behavior-identical
-- reimplementation that doesn't call vim.deprecate(), so those plugins keep
-- working without warning spam. Must run before any plugin loads.
do
  local function tbl_flatten(t)
    local result = {}
    local function rec(list)
      for i = 1, #list do
        local v = list[i]
        if type(v) == "table" then
          rec(v)
        elseif v ~= nil then
          result[#result + 1] = v
        end
      end
    end
    rec(t)
    return result
  end
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.tbl_flatten = tbl_flatten
end

-- set the default leader for key mappings
vim.g.mapleader = " " -- leader is the <space> key
vim.g.maplocalleader = " "
-- enables support for 24-bit RGB colors in the terminal.
vim.opt.termguicolors = true
-- reserve a space in the gutter to signs
vim.opt.signcolumn = "yes"
-- inform Neovim to treat the `Netrw` plugin as if it was already loaded, preventing it from actually being loaded when launching Neovim; required to load nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set  the cursor shape to a block (i:block) when you are in insert mode (i). The cursor shape changes visually to indicate the mode you are in
vim.opt.guicursor = "i:block"
-- set the number of spaces a tab character should display as. In this case, it's set to 2 spaces
vim.opt.tabstop = 2
-- sets the number of spaces used for auto-indentation and when shifting lines with << or >> commands to 2 spaces
vim.opt.shiftwidth = 2
-- specifies the number of spaces inserted for a <Tab> keypress or during auto-indentation. This ensures that pressing <Tab> inserts 2 spaces
vim.opt.softtabstop = 2
-- use spaces for indentation instead of tab characters when you press <Tab> or use auto-indentation.
vim.opt.expandtab = true
-- enables line numbering in the left margin of the buffer
vim.opt.number = true
-- disables the creation of swap files. Swap files are used for crash recovery and can be helpful, but this configuration turns them off
vim.opt.swapfile = false
-- enables highlight search results, causing text matching your search pattern to be highlighted.
vim.o.hlsearch = true
-- enables mouse support for all modes ('a'). This allows you to use the mouse to select, scroll, and interact with Vim
vim.o.mouse = 'a'
-- enables automatic line breaking with the breakindent feature, which helps maintain proper indentation when a line wraps
vim.o.breakindent = true
-- enables undo file support, which allows you to persist undo history across sessions
vim.o.undofile = true
-- makes searches case-insensitive by default. When you search for text, Vim will match regardless of case
vim.o.ignorecase = true
-- Sets the interval (in milliseconds) for updating the screen and triggering various autocmd events; this can improve responsiveness
vim.o.updatetime = 250
-- Enables the use of timeouts for key mappings and commands
vim.o.timeout = true
-- sets the timeout length (in milliseconds) for key mappings. If you don't complete a key sequence within this time, Vim will assume you intended to type the keys separately
vim.o.timeoutlen = 300
-- enables true color support in the terminal if supported by your terminal emulator. This allows for more colorful syntax highlighting
vim.o.termguicolors = true
-- configure automatic toggling between relative and absolute number mode dynamically based on events
vim.cmd([[
 augroup numbertoggle
   autocmd!
   autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif " NOTE: ENABLE relative numbering when entering a buffer, gaining neovim focus, leaving insert mode or when entering a window
   autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif " NOTE: DISABLE relative number (set absolute), when leaving a buffer, losing focus, entering insert mode and leaving a window
 augroup END
]])
