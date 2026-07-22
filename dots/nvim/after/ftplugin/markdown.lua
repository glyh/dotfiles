if vim.fn.expand("%:t") == "TODO.md" then
  vim.opt_local.foldmethod = "expr"

  _G.FoldTODO = function()
    local line = vim.fn.getline(vim.v.lnum)
    if line:match("^> %[!") then
      return "a1"
    elseif line:match("^>") then
      return "="
    elseif line:match("^####%s") then
      return ">3"
    elseif line:match("^###%s") then
      return ">2"
    elseif line:match("^##%s") then
      return ">1"
    else
      return "="
    end
  end

  vim.opt_local.foldexpr = "v:lua.FoldTODO()"

  vim.defer_fn(function()
    local now = os.time()
    local this_year = os.date("%Y")
    local this_month = os.date("%b")
    local today = os.date("%-d" .. ({
      "st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th",
      "th", "th", "th", "th", "th", "th", "th", "th", "th", "th",
      "st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th",
      "th", "st",
    })[tonumber(os.date("%d"))])

    vim.fn.cursor(1, 1)
    local y = vim.fn.search("^## " .. this_year .. "$", "w")
    if y > 0 then vim.cmd("normal! zv") end

    local m = vim.fn.search("^### " .. this_month .. "$", "w")
    if m > 0 then vim.cmd("normal! zv") end

    local wday = tonumber(os.date("%w", now))
    if wday == 0 then wday = 7 end
    local monday = now - (wday - 1) * 86400
    vim.fn.cursor(1, 1)
    for d = 0, 6 do
      local day = tonumber(os.date("%-d", monday + d * 86400))
      local suffix = ({
        "st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th",
        "th", "th", "th", "th", "th", "th", "th", "th", "th", "th",
        "st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th",
        "th", "st",
      })[day]
      local line = vim.fn.search("#### " .. day .. suffix .. "$", "w")
      if line > 0 then
        vim.cmd("normal! zv")
      end
    end

    vim.fn.cursor(1, 1)
    local rec = vim.fn.search("^## Recurring$", "w")
    if rec > 0 then vim.cmd("normal! zv") end

    vim.fn.cursor(1, 1)
    local tline = vim.fn.search("^#### " .. today .. "$", "bw")
    if tline > 0 then vim.fn.cursor(tline, 1) end
  end, 50)
end
