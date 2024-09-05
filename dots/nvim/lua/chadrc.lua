---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "kanagawa",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  tabufline = {
    enabled = false,
  },
}

return M
