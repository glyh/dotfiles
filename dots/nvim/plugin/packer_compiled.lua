-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/lyh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/lyh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/lyh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/lyh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lyh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  conjure = {
    config = { "\27LJ\2\nÅ\3\0\0\2\0\r\0\0296\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\a\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\1\0+\1\1\0=\1\f\0K\0\1\0005conjure#client#scheme#stdio#value_prefix_pattern\b> $/conjure#client#scheme#stdio#prompt_pattern\tchez(conjure#client#scheme#stdio#command\29conjure#mapping#doc_word\6e conjure#mapping#eval_visual(conjure#extract#tree_sitter#enabled\tnone\27conjure#log#hud#border\6g\bvim\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/conjure",
    url = "https://github.com/Olical/conjure"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["focus.nvim"] = {
    config = { "\27LJ\2\nã\1\0\0\6\0\n\1\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0036\5\6\0009\5\a\0059\5\b\5\29\5\0\5B\3\2\2=\3\t\2B\0\2\1K\0\1\0\nwidth\fcolumns\6o\bvim\nfloor\tmath\1\0\1\venable\2\nsetup\nfocus\frequireÁÃô≥\6≥Êåˇ\3\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/focus.nvim",
    url = "https://github.com/beauwilliams/focus.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21case_insensitive\1\18hint_patterns\bhop\frequireR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21case_insensitive\1\18hint_patterns\bhop\frequireR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21case_insensitive\1\18hint_patterns\bhop\frequire±\3\1\0\a\0\24\0=6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\v\0'\3\b\0'\4\t\0005\5\f\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\r\0'\3\b\0'\4\t\0005\5\14\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\15\0'\4\16\0005\5\18\0003\6\17\0=\6\19\5B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\v\0'\3\15\0'\4\16\0005\5\21\0003\6\20\0=\6\19\5B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\r\0'\3\15\0'\4\16\0005\5\23\0003\6\22\0=\6\19\5B\0\5\1K\0\1\0\1\0\1\fnoremap\2\0\1\0\1\fnoremap\2\0\rcallback\1\0\1\fnoremap\2\0\5\6F\1\0\1\fnoremap\2\6o\1\0\1\fnoremap\2\6v\1\0\1\fnoremap\2\22<cmd>HopChar2<CR>\6f\6n\20nvim_set_keymap\bapi\bvim\1\0\1\tkeys\23fhdjskalgryeuwiqot\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n“\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\21filetype_exclude\1\6\0\0\thelp\vpacker\rmarkdown\bman\vresult\20bufname_exclude\1\2\0\0\fOUTLINE\20buftype_exclude\1\2\0\0\rterminal\1\0\1\tchar\6|\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["janet.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/janet.vim",
    url = "https://github.com/janet-lang/janet.vim"
  },
  ["kmonad-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/kmonad-vim",
    url = "https://github.com/kmonad/kmonad-vim"
  },
  kommentary = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n{\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\frefresh\1\0\1\15statusline\3»\1\1\0\1\ntheme\tnord\nsetup\flualine\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-tool-installer.nvim"] = {
    config = { "\27LJ\2\nï\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\16auto_update\2\1\3\0\0\24lua-language-server\18rust-analyzer\nsetup\25mason-tool-installer\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/mason-tool-installer.nvim",
    url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n¢\1\0\0\a\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0'\4\3\0006\5\4\0'\6\5\0&\4\6\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\vgithub\1\0\0\26download_url_template\1\0\0 /%s/releases/download/%s/%s\vGITHUB\rhttps://\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n≠\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fpresets\1\0\5\19lsp_doc_border\1\15inc_rename\1\26long_message_to_split\2\20command_palette\2\18bottom_search\2\blsp\1\0\0\roverride\1\0\0\1\0\0031vim.lsp.util.convert_input_to_markdown_lines\2 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\2\nsetup\nnoice\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nord.nvim"] = {
    after = { "lualine.nvim" },
    config = { "\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bset\tnord\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n \1\0\1\6\0\v\0\0169\1\0\0009\1\1\1\15\0\1\0X\2\vÄ6\1\2\0009\1\3\0019\1\4\1'\3\5\0005\4\6\0006\5\2\0009\5\a\0059\5\b\0059\5\t\5=\5\n\4B\1\3\1K\0\1\0\rcallback\vformat\bbuf\blsp\1\0\1\fpattern\r<buffer>\16BufWritePre\24nvim_create_autocmd\bapi\bvim\31documentFormattingProvider\24server_capabilities◊\1\1\0\6\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0004\4\4\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\4\0059\5\6\5>\5\2\0049\5\3\0009\5\a\0059\5\b\5>\5\3\4=\4\n\0033\4\v\0=\4\f\3B\1\2\1K\0\1\0\14on_attach\0\fsources\1\0\0\14clj_kondo\16diagnostics\20trim_whitespace\18trim_newlines\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n∏\1\0\0\a\0\b\0\0156\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0005\5\6\0005\6\5\0=\6\a\5B\3\2\1K\0\1\0\21disable_filetype\1\0\0\1\3\0\0\20TelescopePrompt\bvim\nsetup\28nvim-autopairs.ts-conds\24nvim-autopairs.rule\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\ng\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim@\0\2\6\0\3\0\b\18\2\0\0005\4\0\0009\5\1\1=\5\1\0049\5\2\1=\5\2\4B\2\2\1K\0\1\0\tport\thost\1\0\1\ttype\vserverZ\0\0\3\0\6\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\6\0\4\0X\1\1ÄL\0\2\0'\1\5\0L\1\2\0\014127.0.0.1\5\23Host [127.0.0.1]: \ninput\afn\bvimx\0\0\5\0\a\0\f6\0\0\0006\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0A\0\0\0026\1\5\0\18\3\0\0'\4\6\0B\1\3\1L\0\2\0!Please provide a port number\vassert\vPort: \ninput\afn\bvim\rtonumber‡\1\0\0\5\0\a\1#6\0\0\0009\0\1\0009\0\2\0B\0\1\0026\1\0\0009\1\1\0019\1\3\1\18\3\0\0'\4\4\0&\3\4\3B\1\2\2\t\1\0\0X\1\5Ä\18\1\0\0'\2\4\0&\1\2\1L\1\2\0X\1\16Ä6\1\0\0009\1\1\0019\1\3\1\18\3\0\0'\4\5\0&\3\4\3B\1\2\2\t\1\0\0X\1\5Ä\18\1\0\0'\2\5\0&\1\2\1L\1\2\0X\1\2Ä'\1\6\0L\1\2\0K\0\1\0\20/usr/bin/python\22/.venv/bin/python\21/venv/bin/python\15executable\vgetcwd\afn\bvim\2=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\22toggle_breakpoint\bdap\frequire4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rcontinue\bdap\frequire5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14step_over\bdap\frequire5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14step_into\bdap\frequire5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14step_into\bdap\frequire¬\v\1\0\b\0<\0z6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0=\2\3\0019\1\2\0005\2\6\0005\3\a\0=\3\b\2=\2\5\0019\1\t\0005\2\v\0003\3\f\0=\3\r\0024\3\0\0=\3\b\2=\2\n\0019\1\t\0009\2\t\0009\2\n\2=\2\14\0019\1\t\0009\2\t\0009\2\n\2=\2\15\0019\1\t\0009\2\t\0009\2\n\2=\2\16\0019\1\2\0003\2\18\0=\2\17\0019\1\t\0004\2\3\0005\3\20\0003\4\21\0=\4\22\0033\4\23\0=\4\24\3>\3\1\2=\2\19\0019\1\t\0004\2\3\0005\3\25\0003\4\26\0=\4\27\3>\3\1\2=\2\5\0019\1\2\0005\2\29\0005\3\30\0=\3\b\2=\2\28\0019\1\t\0004\2\3\0005\3\31\0006\4 \0009\4!\0049\4\"\4'\6#\0B\4\2\2'\5$\0&\4\5\4=\4%\0036\4 \0009\4&\4B\4\1\2=\4'\3>\3\1\2=\2\28\0016\1 \0009\1(\0019\1)\1'\3*\0'\4+\0'\5,\0005\6.\0003\a-\0=\a/\6B\1\5\0016\1 \0009\1(\0019\1)\1'\3*\0'\0040\0'\5,\0005\0062\0003\a1\0=\a/\6B\1\5\0016\1 \0009\1(\0019\1)\1'\3*\0'\0043\0'\5,\0005\0065\0003\a4\0=\a/\6B\1\5\0016\1 \0009\1(\0019\1)\1'\3*\0'\0046\0'\5,\0005\0068\0003\a7\0=\a/\6B\1\5\0016\1 \0009\1(\0019\1)\1'\3*\0'\0049\0'\5,\0005\6;\0003\a:\0=\a/\6B\1\5\1K\0\1\0\1\0\1\fnoremap\2\0\atr\1\0\1\fnoremap\2\0\ati\1\0\1\fnoremap\2\0\ato\1\0\1\fnoremap\2\0\atc\rcallback\1\0\1\fnoremap\2\0\5\atb\6n\20nvim_set_keymap\bapi\fghciEnv\15empty_dict\flogFile\21/haskell-dap.log\tdata\fstdpath\afn\bvim\1\0\n\frequest\vlaunch\22ghciInitialPrompt\tŒª: \fghciCmdbstack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show\ttype\fhaskell\tname\nDebug\15ghciPrompt\tŒª: \rlogLevel\fWARNING\16stopOnEntry\2\14workspace\23${workspaceFolder}\fstartup\f${file}\1\2\0\0\31--hackage-version=0.0.33.0\1\0\2\fcommand\26haskell-debug-adapter\ttype\15executable\fhaskell\15pythonPath\0\1\0\4\frequest\vlaunch\ttype\vpython\tname\16Launch file\fprogram\f${file}\tport\0\thost\0\1\0\3\frequest\vattach\ttype\tnlua\tname&Attach to running Neovim instance\blua\0\tnlua\bnim\trust\6c\fprogram\0\1\0\6\frequest\vlaunch\16stopOnEntry\1\ttype\tlldb\tname\vLaunch\bcwd\23${workspaceFolder}\18runInTerminal\1\bcpp\19configurations\targs\1\3\0\0\a-m\20debugpy.adapter\1\0\2\fcommand\21/usr/bin/python3\ttype\15executable\vpython\1\0\3\tname\tlldb\fcommand\25/usr/bin/lldb-vscode\ttype\15executable\tlldb\radapters\bdap\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n\"\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\1¿\topen#\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\1¿\nclose#\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\1¿\ncloseŒ\2\1\0\b\0\21\0\"6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0014\4\0\0B\2\2\0019\2\4\0009\2\5\0029\2\6\0023\3\b\0=\3\a\0029\2\4\0009\2\t\0029\2\n\0023\3\v\0=\3\a\0029\2\4\0009\2\t\0029\2\f\0023\3\r\0=\3\a\0026\2\14\0009\2\15\0029\2\16\2'\4\17\0'\5\18\0'\6\19\0005\a\20\0B\2\5\0012\0\0ÄK\0\1\0\1\0\1\fnoremap\2+<cmd>lua require('dapui').toggle()<CR>\att\6n\20nvim_set_keymap\bapi\bvim\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\nsetup\ndapui\bdap\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n¯\b\0\0\16\0E\0n6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\1+\2\2\0=\2\b\1+\2\2\0=\2\t\1+\2\2\0=\2\n\1+\2\2\0=\2\v\1+\2\2\0=\2\f\0015\2\15\0005\3\14\0=\3\16\2=\2\r\0015\2\19\0005\3\18\0=\3\20\2=\2\17\0016\2\21\0'\4\22\0B\2\2\0026\3\21\0'\5\23\0B\3\2\0026\4\21\0'\6\24\0B\4\2\0029\5\25\0049\5\26\0055\a\27\0=\0\28\aB\5\2\0019\5\29\0049\5\26\0055\a\30\0=\0\28\aB\5\2\0016\5\0\0009\5\31\0056\a \0009\a!\a'\b\"\0B\5\3\0026\6#\0009\6$\6\18\b\5\0'\t%\0B\6\3\0016\6#\0009\6$\6\18\b\5\0'\t&\0B\6\3\0019\6'\0049\6\26\0065\b)\0005\t(\0=\t*\b5\t:\0005\n,\0005\v+\0=\5!\v=\v-\n5\v/\0005\f.\0=\f0\v=\v1\n5\v5\0006\f\0\0009\f2\f9\f3\f'\0144\0+\15\2\0B\f\3\2=\f6\v=\v7\n5\v8\0=\v9\n=\n;\t=\t<\b=\0\28\bB\6\2\0019\6=\0049\6\26\0064\b\0\0B\6\2\0019\6>\0049\6\26\0065\bB\0009\t?\0049\t@\t'\vA\0B\t\2\2=\tC\bB\6\2\0019\6D\0049\6\26\0064\b\0\0B\6\2\1K\0\1\0\bhls\rroot_dir\1\0\0\t.git\17root_pattern\tutil\rocamllsp\njdtls\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\bcmd\1\0\0\1\2\0\0\24lua-language-server\16sumneko_lua\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\1\0\0\18rust_analyzer\17capabilities\1\0\0\nsetup\vclangd\14lspconfig\19lspconfig.util\22lspconfig.configs\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\rvalueSet\1\0\0\1\2\0\0\3\1\15tagSupport\28commitCharactersSupport\22deprecatedSupport\24labelDetailsSupport\25insertReplaceSupport\21preselectSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nË\a\0\0\f\0\30\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\3\0006\3\0\0'\5\1\0B\3\2\0029\3\2\3B\3\1\0A\1\0\4H\4\tÄ9\6\4\0059\a\4\0059\a\5\a\18\t\a\0009\a\6\a'\n\a\0006\v\b\0B\a\4\2=\a\5\6F\4\3\3R\4ı\1276\1\0\0'\3\t\0B\1\2\0029\1\n\0015\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0005\5\17\0=\5\18\4=\4\19\0035\4\20\0004\5\0\0=\5\21\0045\5\22\0=\5\23\4=\4\24\0035\4\27\0005\5\25\0005\6\26\0=\6\18\5=\5\28\4=\4\29\3B\1\2\1K\0\1\0\16textobjects\vselect\1\0\0\1\0\5\aaf\20@function.outer\aas\21@statement.outer\aic\19@comment.inner\aac\19@comment.outer\aif\20@function.inner\1\0\2\14lookahead\2\venable\2\15playground\16keybindings\1\0\n\14show_help\6?\14goto_node\t<CR>\21unfocus_language\6f\19focus_language\6f\28toggle_language_display\6i\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\vupdate\6r\fdisable\1\0\3\venable\2\20persist_queries\1\15updatetime\3\25\26incremental_selection\fkeymaps\1\0\3\21node_incremental\ago\19init_selection\19<localleader>v\21node_decremental\agi\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\0\1\f\0\0\6c\bcpp\trust\blua\vpython\vfennel\nquery\tfish\velixir\fclojure\tagda\nsetup\28nvim-treesitter.configs\vGITHUB\15github.com\tgsub\burl\17install_info\npairs\23get_parser_configs\28nvim-treesitter.parsers\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind",
    url = "https://github.com/jbyuki/one-small-step-for-vimkind"
  },
  ["packer.nvim"] = {
    config = { "\27LJ\2\nã\2\0\0\6\0\r\0\0256\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\27<cmd>PackerCompile<CR>\15<leader>pc\1\0\1\fnoremap\2\26<cmd>PackerStatus<CR>\15<leader>ps\1\0\1\fnoremap\2\24<cmd>PackerSync<CR>\15<leader>pu\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["parinfer-rust"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/parinfer-rust",
    url = "https://github.com/eraserhd/parinfer-rust"
  },
  playground = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/sql.nvim",
    url = "https://github.com/tami5/sql.nvim"
  },
  ["sway-vim-syntax"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/sway-vim-syntax",
    url = "https://github.com/ajouellette/sway-vim-syntax"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\ns\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\28<cmd>SymbolsOutline<CR>\14<leader>o\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n˙\5\0\0\a\0#\0C6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\0035\4\t\0005\5\b\0=\5\n\4=\4\v\3B\1\2\0019\1\f\0'\3\n\0B\1\2\0019\1\f\0'\3\r\0B\1\2\0019\1\f\0'\3\14\0B\1\2\0019\1\f\0'\3\15\0B\1\2\0016\1\16\0009\1\17\0019\1\18\1'\3\19\0'\4\20\0'\5\21\0005\6\22\0B\1\5\0016\1\16\0009\1\17\0019\1\18\1'\3\19\0'\4\23\0'\5\24\0005\6\25\0B\1\5\0016\1\16\0009\1\17\0019\1\18\1'\3\19\0'\4\26\0'\5\27\0005\6\28\0B\1\5\0016\1\16\0009\1\17\0019\1\18\1'\3\19\0'\4\29\0'\5\30\0005\6\31\0B\1\5\0016\1\16\0009\1\17\0019\1\18\1'\3\19\0'\4 \0'\5!\0005\6\"\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2&<cmd>Telescope lsp_references<CR>\agr\1\0\1\fnoremap\2 <cmd>Telescope projects<CR>\14<leader>r\1\0\1\fnoremap\2\31<cmd>Telescope buffers<CR>\15<leader>fb\1\0\1\fnoremap\2 <cmd>Telescope frecency<CR>\15<leader>fr\1\0\1\fnoremap\2\"<cmd>Telescope find_files<CR>\15<leader>ff\6n\20nvim_set_keymap\bapi\bvim\bdap\rprojects\rfrecency\19load_extension\15extensions\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\fpickers\1\0\0\fbuffers\1\0\0\1\0\2\14previewer\1\ntheme\rdropdown\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\nŒ\3\0\0\6\0\25\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\23\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0005\5\15\0=\5\5\4=\4\16\0035\4\17\0005\5\18\0=\5\5\4=\4\19\0035\4\20\0005\5\21\0=\5\5\4=\4\22\3=\3\24\2B\0\2\1K\0\1\0\rkeywords\1\0\0\tNOTE\1\2\0\0\tINFO\1\0\2\ticon\tÔ°ß \ncolor\thint\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tÔôë \tWARN\1\4\0\0\fWARNING\bXXX\nERROR\1\0\2\ticon\tÔÅ± \ncolor\fwarning\tHACK\1\0\2\ticon\tÔíê \ncolor\fwarning\aOK\1\0\2\ticon\tÔÄå \ncolor\tinfo\tTODO\1\0\2\ticon\tÔÄå \ncolor\tinfo\bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ticon\tÔÜà \ncolor\nerror\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n†\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\27<cmd>TroubleToggle<CR>\14<leader>t\6n\20nvim_set_keymap\bapi\bvim\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\n|\0\0\6\0\a\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\6\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\6n\22<Plug>(EasyAlign)\aga\6x\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-racket"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/vim-racket",
    url = "https://github.com/wlangstroth/vim-racket"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-sexp"] = {
    config = { "\27LJ\2\n^\0\0\5\0\a\0\n6\0\0\0009\0\1\0006\1\0\0009\1\3\0019\1\4\0016\3\5\0'\4\6\0B\1\3\2=\1\2\0K\0\1\0\6,\20LISP_FILE_TYPES\tjoin\afn\19sexp_filetypes\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/vim-sexp",
    url = "https://github.com/guns/vim-sexp"
  },
  ["vim-sexp-mappings-for-regular-people"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/vim-sexp-mappings-for-regular-people",
    url = "https://github.com/tpope/vim-sexp-mappings-for-regular-people"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-zsh"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/vim-zsh",
    url = "https://github.com/clones/vim-zsh"
  },
  vimtex = {
    config = { "\27LJ\2\n`\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\fzathura\23vimtex_view_method\24vimtex_view_enabled\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["zig.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/zig.vim",
    url = "https://github.com/ziglang/zig.vim"
  },
  ["zinit-vim-syntax"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lyh/.local/share/nvim/site/pack/packer/opt/zinit-vim-syntax",
    url = "https://github.com/tylerw/zinit-vim-syntax"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: conjure
time([[Config for conjure]], true)
try_loadstring("\27LJ\2\nÅ\3\0\0\2\0\r\0\0296\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\a\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\1\0+\1\1\0=\1\f\0K\0\1\0005conjure#client#scheme#stdio#value_prefix_pattern\b> $/conjure#client#scheme#stdio#prompt_pattern\tchez(conjure#client#scheme#stdio#command\29conjure#mapping#doc_word\6e conjure#mapping#eval_visual(conjure#extract#tree_sitter#enabled\tnone\27conjure#log#hud#border\6g\bvim\0", "config", "conjure")
time([[Config for conjure]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n˙\5\0\0\a\0#\0C6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\0035\4\t\0005\5\b\0=\5\n\4=\4\v\3B\1\2\0019\1\f\0'\3\n\0B\1\2\0019\1\f\0'\3\r\0B\1\2\0019\1\f\0'\3\14\0B\1\2\0019\1\f\0'\3\15\0B\1\2\0016\1\16\0009\1\17\0019\1\18\1'\3\19\0'\4\20\0'\5\21\0005\6\22\0B\1\5\0016\1\16\0009\1\17\0019\1\18\1'\3\19\0'\4\23\0'\5\24\0005\6\25\0B\1\5\0016\1\16\0009\1\17\0019\1\18\1'\3\19\0'\4\26\0'\5\27\0005\6\28\0B\1\5\0016\1\16\0009\1\17\0019\1\18\1'\3\19\0'\4\29\0'\5\30\0005\6\31\0B\1\5\0016\1\16\0009\1\17\0019\1\18\1'\3\19\0'\4 \0'\5!\0005\6\"\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2&<cmd>Telescope lsp_references<CR>\agr\1\0\1\fnoremap\2 <cmd>Telescope projects<CR>\14<leader>r\1\0\1\fnoremap\2\31<cmd>Telescope buffers<CR>\15<leader>fb\1\0\1\fnoremap\2 <cmd>Telescope frecency<CR>\15<leader>fr\1\0\1\fnoremap\2\"<cmd>Telescope find_files<CR>\15<leader>ff\6n\20nvim_set_keymap\bapi\bvim\bdap\rprojects\rfrecency\19load_extension\15extensions\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\fpickers\1\0\0\fbuffers\1\0\0\1\0\2\14previewer\1\ntheme\rdropdown\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: mason-tool-installer.nvim
time([[Config for mason-tool-installer.nvim]], true)
try_loadstring("\27LJ\2\nï\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\16auto_update\2\1\3\0\0\24lua-language-server\18rust-analyzer\nsetup\25mason-tool-installer\frequire\0", "config", "mason-tool-installer.nvim")
time([[Config for mason-tool-installer.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n∏\1\0\0\a\0\b\0\0156\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0005\5\6\0005\6\5\0=\6\a\5B\3\2\1K\0\1\0\21disable_filetype\1\0\0\1\3\0\0\20TelescopePrompt\bvim\nsetup\28nvim-autopairs.ts-conds\24nvim-autopairs.rule\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n¯\b\0\0\16\0E\0n6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\1+\2\2\0=\2\b\1+\2\2\0=\2\t\1+\2\2\0=\2\n\1+\2\2\0=\2\v\1+\2\2\0=\2\f\0015\2\15\0005\3\14\0=\3\16\2=\2\r\0015\2\19\0005\3\18\0=\3\20\2=\2\17\0016\2\21\0'\4\22\0B\2\2\0026\3\21\0'\5\23\0B\3\2\0026\4\21\0'\6\24\0B\4\2\0029\5\25\0049\5\26\0055\a\27\0=\0\28\aB\5\2\0019\5\29\0049\5\26\0055\a\30\0=\0\28\aB\5\2\0016\5\0\0009\5\31\0056\a \0009\a!\a'\b\"\0B\5\3\0026\6#\0009\6$\6\18\b\5\0'\t%\0B\6\3\0016\6#\0009\6$\6\18\b\5\0'\t&\0B\6\3\0019\6'\0049\6\26\0065\b)\0005\t(\0=\t*\b5\t:\0005\n,\0005\v+\0=\5!\v=\v-\n5\v/\0005\f.\0=\f0\v=\v1\n5\v5\0006\f\0\0009\f2\f9\f3\f'\0144\0+\15\2\0B\f\3\2=\f6\v=\v7\n5\v8\0=\v9\n=\n;\t=\t<\b=\0\28\bB\6\2\0019\6=\0049\6\26\0064\b\0\0B\6\2\0019\6>\0049\6\26\0065\bB\0009\t?\0049\t@\t'\vA\0B\t\2\2=\tC\bB\6\2\0019\6D\0049\6\26\0064\b\0\0B\6\2\1K\0\1\0\bhls\rroot_dir\1\0\0\t.git\17root_pattern\tutil\rocamllsp\njdtls\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\bcmd\1\0\0\1\2\0\0\24lua-language-server\16sumneko_lua\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\1\0\0\18rust_analyzer\17capabilities\1\0\0\nsetup\vclangd\14lspconfig\19lspconfig.util\22lspconfig.configs\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\rvalueSet\1\0\0\1\2\0\0\3\1\15tagSupport\28commitCharactersSupport\22deprecatedSupport\24labelDetailsSupport\25insertReplaceSupport\21preselectSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n†\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\27<cmd>TroubleToggle<CR>\14<leader>t\6n\20nvim_set_keymap\bapi\bvim\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\n≠\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\fpresets\1\0\5\19lsp_doc_border\1\15inc_rename\1\26long_message_to_split\2\20command_palette\2\18bottom_search\2\blsp\1\0\0\roverride\1\0\0\1\0\0031vim.lsp.util.convert_input_to_markdown_lines\2 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\2\nsetup\nnoice\frequire\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nË\a\0\0\f\0\30\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\3\0006\3\0\0'\5\1\0B\3\2\0029\3\2\3B\3\1\0A\1\0\4H\4\tÄ9\6\4\0059\a\4\0059\a\5\a\18\t\a\0009\a\6\a'\n\a\0006\v\b\0B\a\4\2=\a\5\6F\4\3\3R\4ı\1276\1\0\0'\3\t\0B\1\2\0029\1\n\0015\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0005\5\17\0=\5\18\4=\4\19\0035\4\20\0004\5\0\0=\5\21\0045\5\22\0=\5\23\4=\4\24\0035\4\27\0005\5\25\0005\6\26\0=\6\18\5=\5\28\4=\4\29\3B\1\2\1K\0\1\0\16textobjects\vselect\1\0\0\1\0\5\aaf\20@function.outer\aas\21@statement.outer\aic\19@comment.inner\aac\19@comment.outer\aif\20@function.inner\1\0\2\14lookahead\2\venable\2\15playground\16keybindings\1\0\n\14show_help\6?\14goto_node\t<CR>\21unfocus_language\6f\19focus_language\6f\28toggle_language_display\6i\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\vupdate\6r\fdisable\1\0\3\venable\2\20persist_queries\1\15updatetime\3\25\26incremental_selection\fkeymaps\1\0\3\21node_incremental\ago\19init_selection\19<localleader>v\21node_decremental\agi\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\0\1\f\0\0\6c\bcpp\trust\blua\vpython\vfennel\nquery\tfish\velixir\fclojure\tagda\nsetup\28nvim-treesitter.configs\vGITHUB\15github.com\tgsub\burl\17install_info\npairs\23get_parser_configs\28nvim-treesitter.parsers\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21case_insensitive\1\18hint_patterns\bhop\frequireR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21case_insensitive\1\18hint_patterns\bhop\frequireR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21case_insensitive\1\18hint_patterns\bhop\frequire±\3\1\0\a\0\24\0=6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\v\0'\3\b\0'\4\t\0005\5\f\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\r\0'\3\b\0'\4\t\0005\5\14\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\15\0'\4\16\0005\5\18\0003\6\17\0=\6\19\5B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\v\0'\3\15\0'\4\16\0005\5\21\0003\6\20\0=\6\19\5B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\r\0'\3\15\0'\4\16\0005\5\23\0003\6\22\0=\6\19\5B\0\5\1K\0\1\0\1\0\1\fnoremap\2\0\1\0\1\fnoremap\2\0\rcallback\1\0\1\fnoremap\2\0\5\6F\1\0\1\fnoremap\2\6o\1\0\1\fnoremap\2\6v\1\0\1\fnoremap\2\22<cmd>HopChar2<CR>\6f\6n\20nvim_set_keymap\bapi\bvim\1\0\1\tkeys\23fhdjskalgryeuwiqot\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\ns\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\28<cmd>SymbolsOutline<CR>\14<leader>o\6n\20nvim_set_keymap\bapi\bvim\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
try_loadstring("\27LJ\2\nã\1\0\0\6\0\n\1\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0036\5\6\0009\5\a\0059\5\b\5\29\5\0\5B\3\2\2=\3\t\2B\0\2\1K\0\1\0\nwidth\fcolumns\6o\bvim\nfloor\tmath\1\0\1\venable\2\nsetup\nfocus\frequireÁÃô≥\6≥Êåˇ\3\0", "config", "focus.nvim")
time([[Config for focus.nvim]], false)
-- Config for: vim-easy-align
time([[Config for vim-easy-align]], true)
try_loadstring("\27LJ\2\n|\0\0\6\0\a\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\6\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\6n\22<Plug>(EasyAlign)\aga\6x\20nvim_set_keymap\bapi\bvim\0", "config", "vim-easy-align")
time([[Config for vim-easy-align]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\nŒ\3\0\0\6\0\25\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\23\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0005\5\15\0=\5\5\4=\4\16\0035\4\17\0005\5\18\0=\5\5\4=\4\19\0035\4\20\0005\5\21\0=\5\5\4=\4\22\3=\3\24\2B\0\2\1K\0\1\0\rkeywords\1\0\0\tNOTE\1\2\0\0\tINFO\1\0\2\ticon\tÔ°ß \ncolor\thint\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tÔôë \tWARN\1\4\0\0\fWARNING\bXXX\nERROR\1\0\2\ticon\tÔÅ± \ncolor\fwarning\tHACK\1\0\2\ticon\tÔíê \ncolor\fwarning\aOK\1\0\2\ticon\tÔÄå \ncolor\tinfo\tTODO\1\0\2\ticon\tÔÄå \ncolor\tinfo\bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ticon\tÔÜà \ncolor\nerror\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n \1\0\1\6\0\v\0\0169\1\0\0009\1\1\1\15\0\1\0X\2\vÄ6\1\2\0009\1\3\0019\1\4\1'\3\5\0005\4\6\0006\5\2\0009\5\a\0059\5\b\0059\5\t\5=\5\n\4B\1\3\1K\0\1\0\rcallback\vformat\bbuf\blsp\1\0\1\fpattern\r<buffer>\16BufWritePre\24nvim_create_autocmd\bapi\bvim\31documentFormattingProvider\24server_capabilities◊\1\1\0\6\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0004\4\4\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\4\0059\5\6\5>\5\2\0049\5\3\0009\5\a\0059\5\b\5>\5\3\4=\4\n\0033\4\v\0=\4\f\3B\1\2\1K\0\1\0\14on_attach\0\fsources\1\0\0\14clj_kondo\16diagnostics\20trim_whitespace\18trim_newlines\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n“\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\21filetype_exclude\1\6\0\0\thelp\vpacker\rmarkdown\bman\vresult\20bufname_exclude\1\2\0\0\fOUTLINE\20buftype_exclude\1\2\0\0\rterminal\1\0\1\tchar\6|\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n¢\1\0\0\a\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0'\4\3\0006\5\4\0'\6\5\0&\4\6\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\vgithub\1\0\0\26download_url_template\1\0\0 /%s/releases/download/%s/%s\vGITHUB\rhttps://\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: packer.nvim
time([[Config for packer.nvim]], true)
try_loadstring("\27LJ\2\nã\2\0\0\6\0\r\0\0256\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\27<cmd>PackerCompile<CR>\15<leader>pc\1\0\1\fnoremap\2\26<cmd>PackerStatus<CR>\15<leader>ps\1\0\1\fnoremap\2\24<cmd>PackerSync<CR>\15<leader>pu\6n\20nvim_set_keymap\bapi\bvim\0", "config", "packer.nvim")
time([[Config for packer.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nord.nvim
time([[Config for nord.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bset\tnord\frequire\0", "config", "nord.nvim")
time([[Config for nord.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n\"\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\1¿\topen#\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\1¿\nclose#\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\1¿\ncloseŒ\2\1\0\b\0\21\0\"6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0014\4\0\0B\2\2\0019\2\4\0009\2\5\0029\2\6\0023\3\b\0=\3\a\0029\2\4\0009\2\t\0029\2\n\0023\3\v\0=\3\a\0029\2\4\0009\2\t\0029\2\f\0023\3\r\0=\3\a\0026\2\14\0009\2\15\0029\2\16\2'\4\17\0'\5\18\0'\6\19\0005\a\20\0B\2\5\0012\0\0ÄK\0\1\0\1\0\1\fnoremap\2+<cmd>lua require('dapui').toggle()<CR>\att\6n\20nvim_set_keymap\bapi\bvim\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\nsetup\ndapui\bdap\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\ng\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim@\0\2\6\0\3\0\b\18\2\0\0005\4\0\0009\5\1\1=\5\1\0049\5\2\1=\5\2\4B\2\2\1K\0\1\0\tport\thost\1\0\1\ttype\vserverZ\0\0\3\0\6\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\6\0\4\0X\1\1ÄL\0\2\0'\1\5\0L\1\2\0\014127.0.0.1\5\23Host [127.0.0.1]: \ninput\afn\bvimx\0\0\5\0\a\0\f6\0\0\0006\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0A\0\0\0026\1\5\0\18\3\0\0'\4\6\0B\1\3\1L\0\2\0!Please provide a port number\vassert\vPort: \ninput\afn\bvim\rtonumber‡\1\0\0\5\0\a\1#6\0\0\0009\0\1\0009\0\2\0B\0\1\0026\1\0\0009\1\1\0019\1\3\1\18\3\0\0'\4\4\0&\3\4\3B\1\2\2\t\1\0\0X\1\5Ä\18\1\0\0'\2\4\0&\1\2\1L\1\2\0X\1\16Ä6\1\0\0009\1\1\0019\1\3\1\18\3\0\0'\4\5\0&\3\4\3B\1\2\2\t\1\0\0X\1\5Ä\18\1\0\0'\2\5\0&\1\2\1L\1\2\0X\1\2Ä'\1\6\0L\1\2\0K\0\1\0\20/usr/bin/python\22/.venv/bin/python\21/venv/bin/python\15executable\vgetcwd\afn\bvim\2=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\22toggle_breakpoint\bdap\frequire4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rcontinue\bdap\frequire5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14step_over\bdap\frequire5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14step_into\bdap\frequire5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14step_into\bdap\frequire¬\v\1\0\b\0<\0z6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0=\2\3\0019\1\2\0005\2\6\0005\3\a\0=\3\b\2=\2\5\0019\1\t\0005\2\v\0003\3\f\0=\3\r\0024\3\0\0=\3\b\2=\2\n\0019\1\t\0009\2\t\0009\2\n\2=\2\14\0019\1\t\0009\2\t\0009\2\n\2=\2\15\0019\1\t\0009\2\t\0009\2\n\2=\2\16\0019\1\2\0003\2\18\0=\2\17\0019\1\t\0004\2\3\0005\3\20\0003\4\21\0=\4\22\0033\4\23\0=\4\24\3>\3\1\2=\2\19\0019\1\t\0004\2\3\0005\3\25\0003\4\26\0=\4\27\3>\3\1\2=\2\5\0019\1\2\0005\2\29\0005\3\30\0=\3\b\2=\2\28\0019\1\t\0004\2\3\0005\3\31\0006\4 \0009\4!\0049\4\"\4'\6#\0B\4\2\2'\5$\0&\4\5\4=\4%\0036\4 \0009\4&\4B\4\1\2=\4'\3>\3\1\2=\2\28\0016\1 \0009\1(\0019\1)\1'\3*\0'\4+\0'\5,\0005\6.\0003\a-\0=\a/\6B\1\5\0016\1 \0009\1(\0019\1)\1'\3*\0'\0040\0'\5,\0005\0062\0003\a1\0=\a/\6B\1\5\0016\1 \0009\1(\0019\1)\1'\3*\0'\0043\0'\5,\0005\0065\0003\a4\0=\a/\6B\1\5\0016\1 \0009\1(\0019\1)\1'\3*\0'\0046\0'\5,\0005\0068\0003\a7\0=\a/\6B\1\5\0016\1 \0009\1(\0019\1)\1'\3*\0'\0049\0'\5,\0005\6;\0003\a:\0=\a/\6B\1\5\1K\0\1\0\1\0\1\fnoremap\2\0\atr\1\0\1\fnoremap\2\0\ati\1\0\1\fnoremap\2\0\ato\1\0\1\fnoremap\2\0\atc\rcallback\1\0\1\fnoremap\2\0\5\atb\6n\20nvim_set_keymap\bapi\fghciEnv\15empty_dict\flogFile\21/haskell-dap.log\tdata\fstdpath\afn\bvim\1\0\n\frequest\vlaunch\22ghciInitialPrompt\tŒª: \fghciCmdbstack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show\ttype\fhaskell\tname\nDebug\15ghciPrompt\tŒª: \rlogLevel\fWARNING\16stopOnEntry\2\14workspace\23${workspaceFolder}\fstartup\f${file}\1\2\0\0\31--hackage-version=0.0.33.0\1\0\2\fcommand\26haskell-debug-adapter\ttype\15executable\fhaskell\15pythonPath\0\1\0\4\frequest\vlaunch\ttype\vpython\tname\16Launch file\fprogram\f${file}\tport\0\thost\0\1\0\3\frequest\vattach\ttype\tnlua\tname&Attach to running Neovim instance\blua\0\tnlua\bnim\trust\6c\fprogram\0\1\0\6\frequest\vlaunch\16stopOnEntry\1\ttype\tlldb\tname\vLaunch\bcwd\23${workspaceFolder}\18runInTerminal\1\bcpp\19configurations\targs\1\3\0\0\a-m\20debugpy.adapter\1\0\2\fcommand\21/usr/bin/python3\ttype\15executable\vpython\1\0\3\tname\tlldb\fcommand\25/usr/bin/lldb-vscode\ttype\15executable\tlldb\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\n{\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\frefresh\1\0\1\15statusline\3»\1\1\0\1\ntheme\tnord\nsetup\flualine\frequire\0", "config", "lualine.nvim")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType scheme ++once lua require("packer.load")({'vim-sexp-mappings-for-regular-people', 'vim-sexp', 'parinfer-rust'}, { ft = "scheme" }, _G.packer_plugins)]]
vim.cmd [[au FileType zig ++once lua require("packer.load")({'zig.vim'}, { ft = "zig" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType kbd ++once lua require("packer.load")({'kmonad-vim'}, { ft = "kbd" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'vim-zsh', 'zinit-vim-syntax'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType janet ++once lua require("packer.load")({'janet.vim'}, { ft = "janet" }, _G.packer_plugins)]]
vim.cmd [[au FileType sway ++once lua require("packer.load")({'sway-vim-syntax'}, { ft = "sway" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'vim-sexp-mappings-for-regular-people', 'vim-sexp', 'parinfer-rust'}, { ft = "clojure" }, _G.packer_plugins)]]
vim.cmd [[au FileType fennel ++once lua require("packer.load")({'vim-sexp-mappings-for-regular-people', 'vim-sexp', 'parinfer-rust'}, { ft = "fennel" }, _G.packer_plugins)]]
vim.cmd [[au FileType hy ++once lua require("packer.load")({'vim-sexp-mappings-for-regular-people', 'vim-sexp', 'parinfer-rust'}, { ft = "hy" }, _G.packer_plugins)]]
vim.cmd [[au FileType racket ++once lua require("packer.load")({'vim-sexp-mappings-for-regular-people', 'vim-sexp', 'vim-racket', 'parinfer-rust'}, { ft = "racket" }, _G.packer_plugins)]]
vim.cmd [[au FileType lisp ++once lua require("packer.load")({'vim-sexp-mappings-for-regular-people', 'vim-sexp', 'parinfer-rust'}, { ft = "lisp" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'LuaSnip'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /home/lyh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/lyh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /home/lyh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/sway-vim-syntax/ftdetect/sway.vim]], true)
vim.cmd [[source /home/lyh/.local/share/nvim/site/pack/packer/opt/sway-vim-syntax/ftdetect/sway.vim]]
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/sway-vim-syntax/ftdetect/sway.vim]], false)
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], true)
vim.cmd [[source /home/lyh/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]]
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], false)
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/vim-racket/ftdetect/racket.vim]], true)
vim.cmd [[source /home/lyh/.local/share/nvim/site/pack/packer/opt/vim-racket/ftdetect/racket.vim]]
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/vim-racket/ftdetect/racket.vim]], false)
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/janet.vim/ftdetect/janet.vim]], true)
vim.cmd [[source /home/lyh/.local/share/nvim/site/pack/packer/opt/janet.vim/ftdetect/janet.vim]]
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/janet.vim/ftdetect/janet.vim]], false)
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/kmonad-vim/ftdetect/kbd.vim]], true)
vim.cmd [[source /home/lyh/.local/share/nvim/site/pack/packer/opt/kmonad-vim/ftdetect/kbd.vim]]
time([[Sourcing ftdetect script at: /home/lyh/.local/share/nvim/site/pack/packer/opt/kmonad-vim/ftdetect/kbd.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
