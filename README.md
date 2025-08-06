# Telescope Autolaunch

Launch `:Telescope find_files` if in a git directory and not in commit message

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
