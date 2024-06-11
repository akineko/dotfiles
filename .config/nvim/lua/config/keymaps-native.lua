-- init.vim の編集
vim.keymap.set("n", "<Space>.", ":edit $XDG_CONFIG_HOME/nvim/init.lua<CR>")
vim.keymap.set("n", "<Space>.l", ":source $XDG_CONFIG_HOME/nvim/init.lua<CR>")

-- 選択した文字列の検索/置換
vim.keymap.set("v", "//", [[y/<C-r>=escape(@", '\\/.*$^~[]')<CR><CR>]], { silent = true })
vim.keymap.set("v", "/r", [[y:%s/\v<C-r>=escape(@", '\\/.*$^~[]')<CR>//gc<Left><Left><Left>]])
vim.keymap.set("v", "/g", [[y:Telescope grep_string search=<C-r>=escape(@", '\\/.*$^~[]')<CR><CR>]])

-- ウィンドウ操作
vim.keymap.set("n", "<Space>h", "<C-w>h")
vim.keymap.set("n", "<Space>j", "<C-w>j")
vim.keymap.set("n", "<Space>l", "<C-w>l")
vim.keymap.set("n", "<Space>k", "<C-w>k")
vim.keymap.set("n", "<Space>H", "<C-w>H")
vim.keymap.set("n", "<Space>J", "<C-w>J")
vim.keymap.set("n", "<Space>K", "<C-w>K")
vim.keymap.set("n", "<Space>L", "<C-w>L")
vim.keymap.set("n", "<Space><", "<C-w><")
vim.keymap.set("n", "<Space>>", "<C-w>>")
vim.keymap.set("n", "<Space>+", "<C-w>+")
vim.keymap.set("n", "<Space>-", "<C-w>-")

-- タブ操作
vim.keymap.set("n", "[Tab]", '')
vim.keymap.set("n", "<C-t>", "[Tab]", { remap = true })
vim.keymap.set("n", "[Tab]n", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "[Tab]c", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "[Tab]h", ":-tabmove<CR>", { silent = true })
vim.keymap.set("n", "[tab]l", ":+tabmove<CR>", { silent = true })
vim.keymap.set("n", "[Tab]j", ":tabnext<CR>")
vim.keymap.set("n", "[Tab]k", ":tabprevious<CR>")
vim.keymap.set("n", "<Tab>", ":tabnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>")
vim.keymap.set("n", "<C-Tab>", ":tabnext<CR>")
vim.keymap.set("n", "<C-S-Tab>", ":tabprevious<CR>")

-- タグジャンプ操作
vim.keymap.set("n", "[Tag]", '')
vim.keymap.set("n", "t", "[Tag]", { remap = true })
vim.keymap.set("n", "[Tag]t", "<C-]>")
vim.keymap.set("n", "[Tag]j", ":tag<CR>", { silent = true })
vim.keymap.set("n", "[Tag]k", ":pop<CR>", { silent = true })
vim.keymap.set("n", "[Tag]l", ":tags<CR>", { silent = true })

-- C++
vim.api.nvim_create_augroup("CppConfig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "CppConfig",
  pattern = "cpp",
  callback = function()
    vim.keymap.set("n", "sh", ":hide edit %<.hpp<CR>", { buffer = true })
    vim.keymap.set("n", "ss", ":hide edit %<.cpp<CR>", { buffer = true })
  end,
})
