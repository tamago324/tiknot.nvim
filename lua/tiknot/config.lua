local defaults_values = {
  hide_on_winleave = true,
  on_open = nil
}

local config = {}
config.values = {}

---@param opts table
function config.set_default_values(opts)
  config.values = vim.tbl_deep_extend('force', defaults_values, opts or {})
end

return config
