return {
  {
    'junegunn/fzf',
    build = ':call fzf#install()',
    event = 'BufEnter',
  },
}
