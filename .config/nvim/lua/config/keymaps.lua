-- leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- : と ; の入れ替え
vim.keymap.set("", ";", ":")
vim.keymap.set("", ":", ";")

-- 検索ハイライトの非表示
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { silent = true })

if not vim.g.vscode then
  require('config.keymaps-native')
end
