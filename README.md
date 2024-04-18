GEmpty line at the top of markdown file causes error. To reproduce:

- `nvim --clean -u ./minimal.lua ./empty_space_broken.md` and scroll to the bottom

Results in the following error:

```
Error detected while processing WinScrolled Autocommands for "*":
Error executing lua callback: ...vim-treesitter-context/lua/treesitter-context/render.lua:51: 'height' key must be a positive Integer
stack traceback:
        [C]: in function 'nvim_open_win'
        ...vim-treesitter-context/lua/treesitter-context/render.lua:51: in function 'display_window'
        ...vim-treesitter-context/lua/treesitter-context/render.lua:354: in function 'open'
        .../lazy/nvim-treesitter-context/lua/treesitter-context.lua:50: in function 'open'
        .../lazy/nvim-treesitter-context/lua/treesitter-context.lua:111: in function 'f'
        .../lazy/nvim-treesitter-context/lua/treesitter-context.lua:27: in function <.../lazy/nvim-treesitter-context/lua/treesitter-context.lua:21
```

File which works without error:

`nvim --clean -u ./minimal.lua ./works.md` and scroll to bottom

https://github.com/seanbreckenridge/treesitter-context-empty-line-bug/assets/7804791/655133b7-8f19-4b1b-b5ca-314de645a19d


Version:

```
NVIM v0.10.0-dev-2946+g562719033e
Build type: RelWithDebInfo
LuaJIT 2.1.1702233742
Run "nvim -V1 -v" for more info
```

