---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>e"] = "",
  }
}

local function vsplit_new_file()
  vim.cmd("vsplit")
  require('telescope.builtin').find_files()
end

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<leader>v"] = {vsplit_new_file , "New vertical split with a file" },
    ["<leader>tt"] = {"<Cmd>NvimTreeFocus<CR>", "Focus nvimtree" },
    ["<leader>fb"] = {function() require('reach').buffers() end, "Find buffers" },

    ["<localleader>oo"] = {"<Cmd>OverseerRun<CR>", "Run an overseer command" },
    ["<localleader>ot"] = {"<Cmd>OverseerToggle<CR>", "Toggle overseer output" },
  },
}

-- more keybinds!

return M
