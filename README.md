<img src="/assets/neoteusz.png" alt="neoteusz">

## Neoteusz - Get S#@% done with Neovim!
Neoteusz is a streamlined yet powerful Neovim configuration designed for developers who value speed and efficiency, this configuration offers a blazingly-fast, responsive developer experience. Instantly navigate large codebases, run complex commands, and interact seamlessly with Neovim; all while maintaining a low resource footprint.

Whether you're working on large projects or quick scripts, this setup helps your workflow remain smooth and distraction free, empowering you to focus on building the things that you enjoy.

Thank you for stopping by and have fun!


## 🗒️ Note
It should be noted that this configuration and the instructions outlined, were implemented on a `Ubuntu 24.04 LTS (Noble Numbat)` system using a `v0.12.3` Neovim app image; instructions may need to be tailored for other linux distributions or Neovim versions.


## 📋 Requirements

### Required
- Neovim >= 0.12.3(built with LuaJIT)
- Git >= 2.19.0 (for partial clones support)
- A patched Nerd Font - To see how to patch fonts, refer to the [references section](#-references).

>[!WARNING]
> If you do not install a patched Nerd Font, you will see unknown symbols rendered for UI components for a a number of plugins.

### Optional ###
- Terminal UIs (TUIs):
    - [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)
    - [jesseduffield/lazydocker](https://github.com/jesseduffield/lazydocker)
    - [derailed/k9s](https://github.com/derailed/k9s)

- AI Assistant:
    - In the interest of attempting to maintain minimalism for the readme, the AI Asstant configuration details are within their own [dedicated document](/docs/ai-assistant.md)

- Neovim Clipboard
    - In the interest of attempting to maintain minimalism for the readme, please see Neoteusz [config documentation](docs/neoteusz-config.md) for information pertaining to clipboard configurations

- [tmux](https://github.com/tmux/tmux/wiki)
    - You don't really need to use tmux as part of your dev workflow; however, it does pair very well with this Neovim config as navigation between tmux and Neovim is seamless because of christoomey's [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
      - You can run as many tmux panes and Neovim splits within a window as you wish, while seamless navigating between both Neovim and tmux panes and maintaining a consistent set of key binding
    - If you decide to use `tmux`, make sure you install christoomey's [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) within your tmux config, to ensure seamless navigation - the Neovim side will be handled automatically via this config
      - The install and setup is fairly simple, please refer to the plugins documentation (previously linked)

## 💯 Get Started
1) Get a Neovim app image build with LuaJIT or build it yourself from source
2) Ensure the Neovim image is executable
    ```shell
    chmod +x <image_name>
    ```
3) Clone this repo to your Neovim configuration directory
    - To get the correct path for your system, run the following command
    ```vim
    :echo stdpath('config')`
    ```
4) Follow the steps in the [references section](#-references) to install a patched Nerd Font on your system
5) Have fun!

>[!TIP]
> You should also review the [Neoteusz config section](#-neoteusz-specific-config) to see if there is anything you may want to customize or enable.


## 🧰 Neoteusz Specific Config
Most configurations are focused around the behaviour of plugins installed and managed by `lazy.nvim`; however, there are additional configurations where you can control behaviours of Neoteusz itself (e.g. set logging level).

To understand these configurations and the defaults that Neoteusz will startup with, please see Neoteusz [config documentation](docs/neoteusz-config.md).


## ✅ Neoteusz Setup Validation
After addressing [requirements](#-requirements), you should check the overall status of your Neovim setup by executing the following command:
```vim
:checkhealth
```

The `:checkhealth` command runs a series of diagnostic tests to check the health of your Neovim installation. If it uncovers any problems, it usually offers suggestions on how to fix them, or where to go to learn more.
If you find a relevant *Warnings* which may impact your Neovim setup or experience, OR any *Errors*, follow the guidance provided and address their resolution accordingly.


## 🔌 Plugin Inventory
For a comprehensive overiew of all included plugins, please see Neoteusz [plugins documentation](docs/plugins.md).


## 🔎 Key Bindings - Which Key
[which-key](https://github.com/folke/which-key.nvim) is a brillant plugin that helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type. Please read the below subsections to better understand how to leverage `which-key` for keybindings within Neoteusz.

>[!NOTE]
> by default the leader key binding is set to the `<space>` key, feel free to change it 🫡

### Leader Bound Key Bindings ###
All keybindings tied to the leader key, are grouped into categories to help provide an intuitive navigation experience. I encourage you to explore the key bindings using `which-key` to get a better understanding of the custom key bindings that have been made available to you.
![leader-keybindings](/assets/which-key_leader-keybinding.png)

### Window Manipulation & Navigation ###
Key bindings related to windows within Neovim can still be observed using `which-key`, simply enter `<C-w>` (i.e. `<ctrl> + w`) and `which-key` will display all window related keybindings that are currently registered.
![window-keybindings](/assets/which-key_window-bindings.png)

### Auto-Completion ###
To allow for a seamless experience with auto-completion, related keys were not registered with `which-key`. For auto-completion key bindings, please see the below:

- `<tab>`: The *tab* key is used for auto-completion of lsp suggestions, as well as the expansion of suggestions and jumping to snippet placeholders.
- `<C-e>`: The *ctrl + e* key combination is used to the auto-completion
- `<Up>`: The *up* key is used to scroll through upward through lsp suggestions
- `<Down>`: The *down* key is used to scroll through downward through lsp suggestions
- `<PageUp>`: The *page up* key is used to scroll upward through text within the preview window for the currently selected lsp suggestion
- `<PageDown>`: The *page down* key is used to scroll downward through text within the preview window for the currently selected lsp suggestion
- `<C-p>`: the *ctrl + p* key combination is used to move to the previous item in the lsp suggestion window, if the window is currently visible, otherwise it will toggle open the suggestion window
- `<C-n>`: the *ctrl + n* key combination is used to move to the next item in the lsp suggestion window, if the window is currently visible, otherwise it will toggle open the suggestion window

### Treesitter Navgation ###
Treesitter navigation is also available through `which-key`; however, it leverages distinct leader keys. For accessing previous and next nodes use the `[` (i.e. previous) `]` (i.e. next) leader keys respectively.

### Registers ###
Values stored within registers are also available through `which-key`; however, it leverages the `""` leader key.

### Flash Enhanced Search ###
`folke/flash.nvim` is leveraged to enhance general Neovim search capabilities. Simply use the typically search leader keys of `/` or `?` and you will automatically gain the search benefits of `flash.nvim`.

### Cross Neovim and Tmux Navigation ###
To allow for a seamless experience with navigating between Neovim splits and tmux panes, related keys were not registered with `which-key`. The typical vim motion keys were leveraged to make navigation more seamless between Neovim and tmux:

- `<C-h>`: The *ctrl + h* key combination is used to navigate to the next split / pane to the ***RIGHT***, regardless of if it's Neovim or tmux
- `<C-j>`: The *ctrl + j* key combination is used to navigate to the next split / pane ***BELOW***, regardless of if it's Neovim or tmux
- `<C-k>`: The *ctrl + k* key combination is used to navigate to the next split / pane ***ABOVE***, regardless of if it's Neovim or tmux
- `<C-l>`: The *ctrl + h* key combination is used to navigate to the next split / pane to the ***LEFT***, regardless of if it's Neovim or tmux
- `<C-\>`: The *ctrl + \\* key combination is used to navigate to the ***PREVIOUS*** split / pane, regardless of if it's Neovim or tmux

## 🚀 Language Severs, LSPs, Linters & Formatters
For an overiew of how language severs, LSPs, linters and formatters are integrated with Neoteusz, please see Neoteusz [lsp documentation](docs/lsp.md).


## 💻 Terminal UI (TUI) Integration - Extensions
Neoteusz comes baked with `toggleterm` ready implmentations for a couple of TUI apps. The respective TUI key bindings will only function if the underlying apps are installed. Once installed, simply use [which-key](#-key-bindings---which-key) to discover the appropriate key bindings and have fun with TUIs.

>[!TIP]
> The pattern used for the integration of TUIs with Neovim can be followed to add additional TUIs as desired. You may need to tweak things a little bit depending on how the TUI behaves; however, it shouldn't be too tricky.

- [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)
  - `lazygit` is a **_NOT_** a Neovim plugin, but rather a simple terminal UI for Git commands, built with Go. It offers a more visual and interactive way to manage and visualize Git repositories directly from the terminal, without needing to remember or type out individual Git commands.

- [jesseduffield/lazydocker](https://github.com/jesseduffield/lazydocker)
  - `lazygit` is a **_NOT_** a Neovim plugin, but rather a simple terminal UI for Docker commands, built with Go. It offers a more visual and interactive way to manage and visualize your Docker environment directly from the terminal, without needing to remember or type out individual Docker commands.

- [derailed/k9s](https://github.com/derailed/k9s)
  - `k9s` is a popular open-source terminal-based console (TUI) for managing and interacting with Kubernetes clusters. It provides a powerful and convenient way to view, navigate, and manipulate Kubernetes resources and clusters directly from your terminal. K9s is designed to simplify Kubernetes administration tasks and provide real-time insights into your cluster.


## 📚 References
- [Nerd Fonts](https://www.nerdfonts.com/)
  - A number of Neoteusz's plugins are configured to use [Patched Fonts](https://github.com/ryanoasis/nerd-fonts#patched-fonts) for rendering icons within the terminal and ultimately Neovim
  - [Nerd Font's Github](https://github.com/ryanoasis/nerd-fonts)

- **_How to Patch Fonts_**:
    - Manually Patching a Font
      - [Font Patching Procedure](https://github.com/ryanoasis/nerd-fonts#option-9-patch-your-own-font)
      - Once a font is patched, move the respective `.ttf` file to the running user's font dir (e.g. `~/.local/share/fonts/FontName.ttf`) or in a well named subdirectory (e.g. `~/.local/share/fonts/Ubuntu/FontName.ttf`
    - Using already Patched Fonts
      - Download a patched font from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
      - Move the respective `.ttf` file(s) to the running user's font dir (e.g. `~/.local/share/fonts/FontName.ttf`) or in a well named subdirectory (e.g. `~/.local/share/fonts/Ubuntu/FontName.ttf`)

