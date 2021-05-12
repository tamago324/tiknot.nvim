local M = {}

local config = require'tiknot.config'

local a = vim.api

local state = {}
state.buf = nil
state.win = nil

M.hide = function()
  if a.nvim_win_is_valid(state.win) then
    a.nvim_win_hide(state.win)
  end
end

M.open = function()
  if state.buf == nil then
    state.buf = a.nvim_create_buf(false, true)
  end

  state.win = a.nvim_open_win(state.buf, true, {
    relative = 'cursor',
    width = 40,
    height = 15,
    col = 10,
    row = 3,
    focusable = true,
    style = 'minimal',
    border = 'shadow',
  })

  vim.cmd [[setlocal winhl=Normal:TikNotNormal,EndOfBuffer:TikNotNormal]]

  vim.cmd [[setlocal cursorline]]
  vim.cmd [[setlocal number]]

  local opts = {
    noremap = true,
    silent = true
  }
  a.nvim_buf_set_keymap(state.buf, 'n', 'q', '<Cmd>lua require"tiknot".hide()<CR>', opts)

  if config.values.hide_on_winleave then
    vim.cmd [[augroup TikNot]]
    vim.cmd [[  autocmd!]]
    vim.cmd [[  autocmd WinLeave <buffer> lua require"tiknot".hide()]]
    vim.cmd [[augroup END]]
  end

  if type(config.values.on_open) == 'function' then
    config.values.on_open(state)
  end
end

---@param prefs table
M.setup = function(prefs)
  config.set_default_values(prefs)
end

return M
