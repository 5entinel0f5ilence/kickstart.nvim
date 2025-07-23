return {
  {
    -- Undotree visualizes the undo history and makes it easy to browse and switch between different undo branches.
    'mbbill/undotree',
    vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle, { desc = 'Open edit history' }),
  },
}
