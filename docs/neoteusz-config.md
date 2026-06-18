# 🧰 Neoteusz Config

## Overview

Neoteusz has some configurable behaviours which you as a user can customize via entries within the `config.lua` file. Please see the subsequent section to better understand the behaviours which you can modify for your Neoteusz instance.


## Logging

Neoteusz was configured to use the [`rcarriga/nvim-notify`](https://github.com/rcarriga/nvim-notify) plugin as the de facto notification method for Neovim. You are able to configure what level of logging information you would like to receive notifications for (i.e. `TRACE`, `DEBUG`, `INFO`, `WARN`, `ERROR`, `OFF`) by updating the value under the `logging.level` field within the `config.lua` file.


## Clipboard

Neovim has no direct connection to the system clipboard. Instead it depends on a `provider` which transparently uses shell commands to communicate with the system clipboard or any other clipboard "backend.

The following command will bring up clipboard help documentation that will outline available clipboards that can be integrated with Neovim:
```vim
:help g:clipboard
```

>[!TIP]
> You can also leverage `telescope` to search clipboard help documentation.

This means that if any of the clipboards listed as a result of the aforementioned command are installed and their dependent environment variables (e.g. $DISPLAY) are found (more so for linux distros with a UI), Neovim will implicitly create the necessary hooks and enable the required registers (`+`, `*`). Ultimately resulting in a turn-key clipboard solution for GUI supporting linux distributions (e.g. ubuntu).

There is a caveat though, if you are running a headless linux distribution and want to leverage `tmux` as your clipboard provider there are additional configurations required to function with the `+` and `*` registers. Neoteusz can do this for you, simply update the `config.lua` file to have the `clipboard.tmux.bootstrap` field set to `true`. Additionally, if `tmux` is your only clipboard provider and you open Neovim within a tmux session, Neoteusz will automatically bootstrap it for you against the `+` and `*` registers.

>[!NOTE]
> This `tmux` behaviour only impacts terminal only/headless users (No GUI)


## AI Assistant

Neoteusz bundles the [`nickjvandyke/opencode.nvim`](https://github.com/nickjvandyke/opencode.nvim) plugin — an in-editor integration for the [opencode](https://opencode.ai) AI coding agent — which loads automatically whenever the `opencode` CLI is detected on your `$PATH` (and raises a warning notification if it is not), so there is no `config.lua` toggle for it. To start using it you only need to install and authenticate the `opencode` CLI, as outlined in the neoteusz [AI assistant documentation](/docs/ai-assistant.md).

