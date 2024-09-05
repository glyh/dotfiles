vim.g["conjure#filetype#rust"] = false
vim.g["conjure#log#hud#border"] = "none"
vim.g["conjure#extract#tree_sitter#enabled"] = true
vim.g["conjure#mapping#eval_visual"] = "e"
vim.g["conjure#mapping#doc_word"] = false

-- https://github.com/Olical/conjure/wiki/Quick-start:-Clojure
-- For lein
require("overseer").register_template {
  name = "Start Lein nREPL",
  builder = function()
    return {
      name = "clj-lein-jack",
      cmd = { "lein", "update-in", ":plugins", "conj", '[cider/cider-nrepl "0.24.0"]', "--", "repl" },
    }
  end,
  condition = {
    filetype = { "clojure" },
  },
}

-- For Deps.edn
require("overseer").register_template {
  name = "Start Deps.edn nREPL",
  builder = function()
    return {
      name = "clj-deps-jack",
      cmd = { "clj", "-M:repl/conjure" },
      -- cmd = { "lein", "update-in", ":plugins", "conj", '[cider/cider-nrepl "0.24.0"]', '--', 'repl' },
    }
  end,
  condition = {
    filetype = { "clojure" },
  },
}

-- For shadow-cljs
-- https://github.com/Olical/conjure/wiki/Quick-start:-ClojureScript-(shadow-cljs)
vim.cmd [[
function! AutoConjureSelect()
  let shadow_build=system("ps aux | grep 'shadow-cljs watch' | head -1 | sed -E 's/.*?shadow-cljs watch //' | tr -d '\n'")
  let cmd='ConjureShadowSelect ' . shadow_build
  execute cmd
endfunction
command! AutoConjureSelect call AutoConjureSelect()
autocmd BufReadPost *.cljs :AutoConjureSelect
]]

require("which-key").add {
  { "<localleader>k", require("conjure.eval")["doc-word"], desc = "Get document under cursor" },
}
