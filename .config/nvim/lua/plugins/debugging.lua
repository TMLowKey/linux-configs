return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
--    "microsoft/debugpy",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return vim.fn.exepath("python")
        end,
      },
    }
    --local path="~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    require("dap-python").setup(path)
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n',"<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set('n',"<Leader>dc", dap.continue, {})
    vim.keymap.set('n',"<Leader>di", dapui.toggle, {})

  end,
}
