# 🔌 Plugins

>[!TIP]
> For immediate access to an always up to date list of plugins, you can always use the `:Lazy` command for `lazy.nvim` to display all installed plugins.

- [lazy.nvim](https://github.com/folke/lazy.nvim):
    - `lazy.nvim` is a modern plugin manager for Neovim.

- [which-key](https://github.com/folke/which-key.nvim):
    - `which-key.nvim` helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.

- [gruvbox](https://github.com/morhetz/gruvbox)
  - `gruvbox`, the color scheme is known for its warm and retro-inspired color palette, which many developers find visually pleasing and comfortable for coding. It often includes variations for different languages and file types to make syntax highlighting more readable and aesthetically pleasing.

- [alpha-nvim](https://github.com/goolord/alpha-nvim)
  - `alpha` a fast and fully programmable dashbboard plugin for Neovim.
 
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
  - `bufferline` is a popular Neovim plugin that provides a customizable and feature-rich buffer/tabline for managing open buffers in Neovim. It enhances the visual representation of buffers in Neovim, making it easier to navigate and manage multiple open files.

- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
  - `indent-blankline.nvim` is a plugin is designed to enhance the visibility of indentation levels within your code or text documents.

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - `treesitter` is a parser generator tool and an incremental parsing library
    It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited
  - **_nvim-treesitter is required for IDE functionality such as parsing, syntax highlighting, code analysis and incremental selection_**
  
- [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
  - `nvim-treesitter-textobjects` provides syntax aware text-objects, select, move, swap, and peek support for `nvim-treesitter`.

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - `telescope` is a highly extendable fuzzy finder over lists. Built on the latest awesome features from Neovim core.

- [folke/flash.nvim](https://github.com/folke/flash.nvim)
  - `flash` lets you navigate your code with search labels, enhanced character motions, and Treesitter integration.

- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
  - `ripgrep`, also known as rg, is a line-oriented search tool that recursively searches your current directory for a regex pattern. It is developed by Andrew Gallant (also known by his GitHub handle BurntSushi) and is written in Rust. `ripgrep` is similar to other search tools like ack and ag (The Silver Searcher), but it is typically faster.

- [sharkdp/fd](https://github.com/sharkdp/fd)
  - `fd` is a fast and user-friendly alternative to the traditional find command that comes with Unix and Linux operating systems. Developed by David Peter (sharkdp), it's written in Rust, making it highly efficient and fast.

- [nickjvandyke/opencode.nvim](https://github.com/nickjvandyke/opencode.nvim)
  - `opencode.nvim` integrates the [opencode](https://opencode.ai) AI coding agent into Neovim, letting you ask questions, send buffer/selection context, and drive an opencode session without leaving the editor.

- [folke/snacks.nvim](https://github.com/folke/snacks.nvim)
  - `snacks` is a collection of small quality-of-life plugins for Neovim; `opencode.nvim` uses its `input` and `picker` components to enhance prompt entry and selection.

- [MunifTanjim/nui.nvim"](https://github.com/MunifTanjim/nui.nvim)
  - `nui` is a plugin for Neovim, and it's a highly customizable UI component framework based on Lua. This plugin aims to provide developers with components such as prompts, menus, and dialogs to help build interactive user interfaces within Neovim.

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
  - `plenary` is a Neovim library that provides lua functions required for the development and use of various Neovim plugins.

- [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio)
  - `nvim-nio` A library for asynchronous IO in Neovim, inspired by the asyncio library in Python. The library focuses on providing both common asynchronous primitives and asynchronous APIs for Neovim's core.

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
  - `lualine` is a blazing fast and easy to configure Neovim statusline written in Lua.

- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
  - `nvim-web-devicons` is a lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.

- [fatih/vim-go](https://github.com/fatih/vim-go)
  - `vim-go` is a plugin for the Vim text editor, specifically aimed at providing an enhanced environment for developing Go.
    the plugin is developed to augment Vim with Go development features and tools, enabling a powerful and integrated workflow for Go development within the Vim environment.

- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
  - `nvim-dap` is a generic protocol for Neovim that will interface with various debuggers.

- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
  - `dapui` is a User Interface (UI) for nvim-dap which provides a good out of the box configuration.
    
- [leoluz/nvim-dap-go](https://github.com/leoluz/nvim-dap-go)
  - `nvim-dap-go` is an extension for nvim-dap providing configurations for launching go debugger (delve) and debugging individual tests.

- [folke/neodev.nvim](https://github.com/folke/neodev.nvim)
  - `neodev` setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  - It is highly recommended to use neodev to enable type checking for nvim-dap-ui to get type checking, documentation and autocompletion for all API functions.

- [mortepau/codicons.nvim](https://github.com/mortepau/codicons.nvim)
  - `codicons` is a small library containing the codicons from VS Code and some functions to simplify the usage of them.

- [echasnovski/mini.icons](https://github.com/echasnovski/mini.icons)
  - `mini.icons` is a small library containing the icons that are used by projects like `which-key`.

- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - `nvim-lspconfig` is a configuration utility for the built-in Language Server Protocol (LSP) client for Neovim. 
  - the Language Server Protocol is a standard for implementing programming language smart features, such as autocompletion, go to definition, and find references, by using language servers that communicate with development environment editors and IDEs.

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
  - `mason` is a Neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface.

- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
  - `mason-lspconfig` bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
  - `mason-lspconfig`.nvim closes some gaps that exist between `mason` and `lspconfig`. 
  - `mason-lspconfig`'s main responsibilities are to:
    - register a setup hook with lspconfig that ensures servers installed with mason.nvim are set up with the necessary configuration
    - provide extra convenience APIs such as the :LspInstall command
    - allow you to (i) automatically install, and (ii) automatically set up a predefined list of servers
    - translate between lspconfig server names and mason.nvim package names (e.g. lua_ls <-> lua-language-server)

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - `nvim-cmp` is a Neovim plugin developed by hrsh7th that provides a powerful and extensible auto-completion framework for Neovim. it is designed to be a completion engine for Neovim and is part of the Neovim ecosystem that has grown around its native support for the Language Server Protocol (LSP).

- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
  - `cmp-nvim-lsp` is a source (or completion provider) for the `hrsh7th/nvim-cmp` completion framework, specifically designed to integrate with Neovim's built-in LSP (Language Server Protocol) client. The LSP client communicates with language servers to provide intelligent code completion, diagnostics, and other language features.
  - `cmp-nvim-lsp` allows nvim-cmp to provide completion suggestions based on the information provided by the LSP, like variable names, methods, functions, and more relevant to the programming language you are working with.

- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
  - `cmp-buffer` is another source for the `hrsh7th/nvim-cmp` completion framework. While `hrsh7th/cmp-nvim-lsp` provides completion suggestions from Neovim’s built-in Language Server Protocol (LSP) client, `cmp-buffer` provides completion suggestions from the content of the currently open buffers. This means that `cmp-buffer` will suggest words and phrases that exist in your currently open buffers, regardless of whether they are recognized as symbols or identifiers by a language server. This can be useful when working with any kind of text, not just code, as it can suggest completions based on what you have already typed or have open in another buffer.

- [L3MON4D3/Luasnip](https://github.com/L3MON4D3/LuaSnip)
  - `Luasnip` is a snippet engine plugin for Neovim. It's a Lua-based, fast, and extensible snippet solution for Neovim that allows you to define and insert snippets of text quickly, enhancing coding efficiency. Snippets are small pieces of reusable code or text that you can insert into your files, and they often have placeholders that you can jump between and fill out.

- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
  - `autopairs` is designed to automatically close pairs of characters like parentheses, brackets, and quotes as you type, providing a smoother and faster coding experience.

- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
  - `toggleterm` is a Neovim plugin written in Lua, designed to help manage terminal windows within Neovim. The plugin allows users to toggle Neovim's built-in terminal easily, meaning you can show or hide the terminal window with a single command or key mapping.

- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
  - `Comment.nvim` is a Neovim plugin written in Lua, which provides an easy and efficient way to comment out lines of code in multiple programming languages. Commenting is a common task in coding, and this plugin helps automate and streamline the process.

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
  - `gitsigns` is a Neovim plugin designed to enhance the user's experience when working with Git repositories by providing signs in the 'signcolumn' (the area just left of the line numbers). These signs indicate changes relative to the Git index (staged changes). The plugin is written in Lua and is optimized for performance, making it a popular choice among Neovim users.

- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)
  - `fzf` is a Neovim plugin that provides a Lua interface to the popular fzf fuzzy finder. fzf is a command-line tool that allows for interactive searching and filtering of lists, and it has been integrated into many editors and shells to provide enhanced fuzzy searching capabilities.

- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
  - `nvim-tree` is a popular file explorer plugin for Neovim, written in Lua. It provides a visual tree-like structure to navigate your file system, making it easier to browse, open, and manage files and directories directly from Neovim. This plugin is designed to be highly customizable and extendable, fitting seamlessly into a modern Neovim setup that utilizes Lua for configuration and plugins.

- [vim-test/vim-test](https://github.com/vim-test/vim-test)
  - `vim-test` is a versatile Vim plugin for running tests within various testing frameworks across multiple languages directly from vim.

- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
  - `vim-tmux-navigator` is a Vim plugin that enables seamless navigation between Vim and tmux panes using a consistent set of keyboard shortcuts. It simplifies workflow by allowing users to move across both Vim splits and tmux panes without switching context or needing additional key bindings.

- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
  - `nvim-notify` is a A fancy, configurable, notification manager for Neovim.

- [folke/noice.nvim](https://github.com/folke/noice.nvim)
  - `noice.nvim` is a plugin that completely replaces the UI for messages, cmdline and the popupmenu.

