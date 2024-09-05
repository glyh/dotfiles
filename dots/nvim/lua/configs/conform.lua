local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    dart = { "dart_format" },
    -- css = { 'prettier' },
    -- html = { 'prettier' },
  },

  format_after_save = {
    lsp_fallback = true,
  },
}

require("conform").setup(options)
