-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Automatically save and load folds
vim.api.nvim_create_autocmd('BufWinLeave', {
  desc = 'Autosave folds on exit',
  pattern = '*.*',
  command = 'mkview',
})
vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Autoload folds on file open',
  pattern = '*.*',
  command = 'silent! loadview',
})

-- Don't auto comment new lines
vim.api.nvim_create_autocmd('BufEnter', {
  desc = "Don't auto commenting new lines",
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o',
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Ensures tabs are used on Makefiles instead of spaces',
  callback = function(event)
    if event.match == 'make' then
      vim.o.expandtab = false -- also tried with vim.opt
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  desc = 'Remove trailing white spaces',
  pattern = { '*' },
  callback = function()
    local save_cursor = vim.fn.getpos '.'
    vim.cmd [[%s/\s\+$//e]]
    vim.fn.setpos('.', save_cursor)
  end,
})

local skeletons = vim.api.nvim_create_augroup('open_skeletons', { clear = true })
vim.api.nvim_create_autocmd('BufNewFile', {
  group = skeletons,
  --group = vim.api.nvim_create_augroup('create_skeletons', { clear = true }),
  pattern = '*.c',
  command = '0r ~/.config/nvim-kickstart/templates/skeleton.c',
})
vim.api.nvim_create_autocmd('BufNewFile', {
  group = skeletons,
  --group = vim.api.nvim_create_augroup('create_skeletons', { clear = true }),
  pattern = '*.sh',
  command = '0r ~/.config/nvim-kickstart/templates/skeleton.sh',
})

--vim.api.nvim_create_autocmd('BufNewFile', {
--  group = vim.api.nvim_create_augroup('create_skeletons', { clear = true }),
--  pattern = 'README.md',
--  command = '0r ~/.config/nvim/templates/readme.md',
--})

-- Vertical line at N characters from the left.
--vim.api.nvim_set_option_value('colorcolumn', '81', {})

--vim.api.nvim_set_option_value('encoding', 'UTF-8', {})

--vim.g['webdevicons_enable_nerdtree'] = '1'

return {

  --{ -- The NERDTree is a file system explorer for the Vim editor. Using this plugin,
  -- users can visually browse complex directory hierarchies, quickly open files for reading or editing,
  -- and perform basic file system operations.
  --'preservim/nerdtree',

  --  vim.keymap.set('n', '<C-n>', vim.cmd.NERDTreeToggle, { desc = 'View directory hierarchies' }),
  --},

  --{
  --  'neoclide/coc.nvim',
  --},

  --{ -- DAP (Debug Adapter Protocol).
  --  'mfussenegger/nvim-dap',
  --  dependencies = {
  --    'rcarriga/nvim-dap-ui',
  --    'nvim-neotest/nvim-nio',
  --  },
  --  config = function()
  --    local dap = require 'dap'
  --    local dapui = require 'dapui'
  --    dap.listeners.before.attach.dapui_config = function()
  --      dapui.open()
  --    end
  --    dap.listeners.before.launch.dapui_config = function()
  --      dapui.open()
  --    end
  --    dap.listeners.before.event_terminated.dapui_config = function()
  --      dapui.close()
  --    end
  --    dap.listeners.before.event_exited.dapui_config = function()
  --      dapui.close()
  --    end
  --    vim.keymap.set('n', '<Leader>b', function()
  --      require('dap').toggle_breakpoint()
  --    end, { desc = 'Toggle debug breakpoint' })

  --    vim.keymap.set('n', '<Leader>cd', function()
  --      require('dap').continue()
  --    end, { desc = 'Continue debugging' })

  --    dap.adapters.gdb = {
  --      type = 'executable',
  --      command = 'gdb',
  --      args = { '--interpreter=dap', '--eval-command', 'set print pretty on' },
  --    }

  --    dap.configurations.c = {
  --      {
  --        name = 'Launch',
  --        type = 'gdb',
  --        request = 'launch',
  --        program = function()
  --          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  --        end,
  --        cwd = '${workspaceFolder}',
  --        stopAtBeginningOfMainSubprogram = false,
  --      },
  --      --{
  --      --  name = 'Select and attach to process',
  --      --  type = 'gdb',
  --      --  request = 'attach',
  --      --  program = function()
  --      --    return vim.fn.input('Path to executable: /usr/bin/gdb', vim.fn.getcwd() .. '/', 'file')
  --      --  end,
  --      --  pid = function()
  --      --    local name = vim.fn.input 'Executable name (filter): '
  --      --    return require('dap.utils').pick_process { filter = name }
  --      --  end,
  --      --  cwd = '${workspaceFolder}',
  --      --},
  --      --{
  --      --  name = 'Attach to gdbserver :1234',
  --      --  type = 'gdb',
  --      --  request = 'attach',
  --      --  target = 'localhost:1234',
  --      --  program = function()
  --      --    return vim.fn.input('Path to executable: /usr/bin/gdb', vim.fn.getcwd() .. '/', 'file')
  --      --  end,
  --      --  cwd = '${workspaceFolder}',
  --      --},
  --    }
  --  end,
  --},
}
