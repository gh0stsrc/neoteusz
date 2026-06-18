# 🤖 AI Assistant

Neoteusz integrates the [opencode](https://opencode.ai) AI coding agent into Neovim via the [`nickjvandyke/opencode.nvim`](https://github.com/nickjvandyke/opencode.nvim) plugin.

## Prerequisites

`opencode.nvim` is bundled with Neoteusz — there is no `config.lua` toggle. It auto-detects the `opencode` CLI and **only loads when `opencode` is found on your `$PATH`**. If the CLI is not found, the plugin is skipped and Neoteusz raises a warning notification on startup. So the only setup required is to make the `opencode` agent available:

1) Install the `opencode` CLI — see the [opencode install docs](https://opencode.ai/docs/). It must be available on your `$PATH`.
2) Authenticate opencode with a model provider (e.g. `opencode auth login`).

>[!NOTE]
> The presence check mirrors how Neoteusz handles the debugger's `dlv` dependency: install `opencode`, restart Neovim, and the plugin (and its `<leader>o…` key bindings) will be available.

>[!NOTE]
> opencode manages its own provider credentials, so — unlike the previous ChatGPT integration — you do **not** need to export an `OPENAI_API_KEY` for Neovim. Authentication is handled by the `opencode` CLI itself.

The `opencode.nvim` plugin drives the standalone `opencode` session and enhances the in-editor experience (context-aware prompts, pickers) via [`folke/snacks.nvim`](https://github.com/folke/snacks.nvim).

## Key Bindings

| Mapping | Mode | Action |
| --- | --- | --- |
| `<leader>oa` | n, x | Ask opencode about the current context / selection |
| `<leader>os` | n, x | Select an opencode prompt / command / server |
| `go` | n, x | Operator: append a motion/selection range to opencode |
| `goo` | n | Append the current line to opencode |
| `<S-C-u>` | n | Scroll the opencode session up |
| `<S-C-d>` | n | Scroll the opencode session down |

## Configuration

The plugin is configured in `lua/plugins/general/ai.lua`. opencode-specific options can be set via `vim.g.opencode_opts`; refer to the [opencode.nvim README](https://github.com/nickjvandyke/opencode.nvim) for the available fields.
