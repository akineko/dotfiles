return {
  {
    'sheerun/vim-polyglot',
    event = 'BufEnter',
  },
  -- TypeScript
  {
    'prisma/vim-prisma',
    event = 'BufReadPre *.prisma',
  },
  -- golang
  {
    'mattn/vim-goimports',
    ft = 'go',
  },
  -- HTML
  {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'php' },
  },
  -- Ruby
  {
    'tpope/vim-rails',
    ft = 'ruby',
  },
}
