To reproduce:

- `nvim -u ./minimal_init.lua` to setup lazy
- quit nvim
- open `nvim -u ./minimal_init.lua ./broken.md` and scroll to the bottom

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

A file without the yaml frontmatter present at the top of `broken.md` poses no issue, test `nvim -u ./minimal_init.lua ./fine.md` and scroll to the bottom, no error
