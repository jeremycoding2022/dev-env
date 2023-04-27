---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.tagbar = {
  n = {
    ["<leader>t"] = {"<cmd> TagbarToggle <CR>", "   TagbarToggle"}
  }
}

-- more keybinds!

return M
