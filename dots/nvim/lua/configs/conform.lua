require("conform").setup {
  -- Define your formatters
  formatters_by_ft = {
    cmake = { "cmake_format" },
    dart = { "dart_format" },
    lua = { "stylua" },
    ocaml = { "ocamlformat" },
  },
  -- Set default options
  default_format_opts = {
    lsp_format = "fallback",
  },
  -- Set up format-on-save
  format_on_save = { timeout_ms = 500 },
}
