# Telescope Autolaunch

If git status is dirty it will launch `:Teleschop git_status` if it's clean it will launch `:Telescope find_files`

## Install

set up with `lazy.nvim`

```lua
{
  'aaaaargzombies/telescope-autolaunch.nvim',
  event = 'VimEnter',
  config = function()
    require('telescope-autolaunch').setup()
  end,
},
```
