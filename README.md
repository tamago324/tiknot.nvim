# tiknot.nvim

A disposable floating window.

![tiknot.gif](https://github.com/tamago324/images/blob/master/tiknot.nvim/tiknot.gif)

## Requirements

* Neovim

## Installation

```vim
Plug 'tamago324/tiknot.nvim'
```

## Usage

```vim
:lua require'tiknot'.open()
:lua require'tiknot'.hide()
```


## Configuration

```lua
require'tiknot'.setup {
  hide_on_winleave = true,

  on_open = function(state)
    vim.api.nvim_buf_set_keymap(
      state.buf,
      'n', 'si', '<Cmd>lua require"tiknot".hide()<CR>',
      { noremap = true, silent = true }
    )
  end

}

vim.api.nvim_set_keymap(
  'n', 'si', '<Cmd>lua require"tiknot".open()<CR>',
  { noremap = true, silent = true }
)
```

## Contributing

* All contributions are welcome.


## License

MIT
