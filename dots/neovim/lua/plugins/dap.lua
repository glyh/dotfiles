return function()
  local dap = require('dap')

  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
  }
  dap.adapters.python = {
    type = 'executable';
    command = '/usr/bin/python3';
    args = { '-m', 'debugpy.adapter' };
  }
  dap.configurations.cpp = {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
        -- if you change `runInTerminal` to true, you might need to change the
        -- yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  }

  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
  dap.configurations.nim = dap.configurations.cpp

  dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host, port = config.port })
  end
  dap.configurations.lua = {
    {
      type = 'nlua',
      request = 'attach',
      name = "Attach to running Neovim instance",
      host = function()
        local value = vim.fn.input('Host [127.0.0.1]: ')
        if value ~= "" then
          return value
        end
        return '127.0.0.1'
      end,
      port = function()
        local val = tonumber(vim.fn.input('Port: '))
        assert(val, "Please provide a port number")
        return val
      end,
    }
  }

  dap.configurations.python = {
    {
      -- The first three options are required by nvim-dap
      type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = 'launch';
      name = "Launch file";

      -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

      program = "${file}"; -- This configuration will launch the current file if used.
      pythonPath = function()
        -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
        -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
        -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
          return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return '/usr/bin/python'
        end
      end;
    }
  }

  dap.adapters.haskell = {
    type = 'executable';
    command = 'haskell-debug-adapter';
    args = {'--hackage-version=0.0.33.0'};
  }
  dap.configurations.haskell = {
    {
      type = 'haskell',
      request = 'launch',
      name = 'Debug',
      workspace = '${workspaceFolder}',
      startup = "${file}",
      stopOnEntry = true,
      logFile = vim.fn.stdpath('data') .. '/haskell-dap.log',
      logLevel = 'WARNING',
      ghciEnv = vim.empty_dict(),
      ghciPrompt = "λ: ",
      -- Adjust the prompt to the prompt you see when you invoke the stack ghci command below 
      ghciInitialPrompt = "λ: ",
      ghciCmd= "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
    },
  }

  dap.adapters.ruby = function(callback, config)
    callback {
      type = "server",
      host = "127.0.0.1",
      port = "${port}",
      executable = {
        command = "bundle",
        args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
          "-c", "--", "bundle", "exec", config.command, config.script,
        },
      },
    }
  end

  dap.configurations.ruby = {
    {
      type = "ruby",
      name = "debug current file",
      request = "attach",
      localfs = true,
      command = "ruby",
      script = "${file}",
    },
    {
      type = "ruby",
      name = "run current spec file",
      request = "attach",
      localfs = true,
      command = "rspec",
      script = "${file}",
    },
  }

  vim.api.nvim_set_keymap('n', 'tb', '',
    {callback = function()
      require('dap').toggle_breakpoint()
     end,
     noremap = true})
  vim.api.nvim_set_keymap('n', 'tc', '',
    {callback = function()
      require('dap').continue()
     end,
     noremap = true})
  vim.api.nvim_set_keymap('n', 'to', '',
    {callback = function()
      require('dap').step_over()
     end,
     noremap = true})
  vim.api.nvim_set_keymap('n', 'ti', '',
    {callback = function()
      require('dap').step_into()
     end,
     noremap = true})
  vim.api.nvim_set_keymap('n', 'tr', '',
    {callback = function()
      require('dap').step_into()
     end,
     noremap = true})
  --[[ vim.api.nvim_set_keymap(
    'n', '<leader>t', '<cmd>TroubleToggle<CR>', {noremap = true}) ]]

end
