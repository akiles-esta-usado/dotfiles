local api=vim.api
local fn=vim.fn


function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
    return ...
end


local M = {}

M.map = function (mode, lhs, rhs, opts)

  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end

  api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
