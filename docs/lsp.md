# 🚀 Language Severs, LSPs, Linters & Formatters

The base setup comes with a small number language servers enabled; however, you can easily extend the number of language servers with minimal effort. Simply update the `ensure_installed` lua table within the `mason-lspconfig` setup function to include the names of your desired language servers.

To view the currently installed language servers, simply enter the the following command within Neovim:
```vim
:Mason
```
![mason](/assets/mason-lsp.png)

To see the comprehensive list of available language servers please refer to [mason-lspconfig documentation](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers).

>[!TIP]
> The default configuration of language server should be automatically handled by `mason-lspconfig`; however, some language servers may also require an explicit `setup({})` call to properly initialize.
>
>If LSP functionality is not working for a newly added language server, add an explicit setup call for the particular language server within the `nvim-lspconfig` config function:
>```lua
>lspconfig.<server>.setup({})
>```

