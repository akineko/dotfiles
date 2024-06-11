return {
  {
    'folke/lsp-colors.nvim',
    event = 'BufEnter',
    cond = not vim.g.vscode,
  },
  {
    'junegunn/fzf',
    build = ':call fzf#install()',
    event = 'BufEnter',
  },
}
