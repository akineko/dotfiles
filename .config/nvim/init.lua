vim.opt.termguicolors = true
-- vim.cmd.colorscheme("nordfox")
vim.opt.background = "dark"

-- encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = {
  "ucs-bom",
  "utf-8",
  "eucjp",
  "cp932",
  "ucs-2le",
  "latin1",
  "iso-2022-jp",
}

-- fileformat
vim.opt.fileformat = "unix"
vim.opt.fileformats = { "unix", "dos", "mac" }

-- 行番号
vim.opt.number = true
-- 行番号横の印表示域
vim.opt.signcolumn = "yes"

-- カーソル位置のハイライト
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- マウス
vim.opt.mouse = ""

-- クリップボード
if vim.fn.has('gui') then
  vim.opt.clipboard = "unnamedplus"
end

-- 描画改善
-- vim.opt.lazyredraw
vim.opt.ttyfast = true
vim.opt.redrawtime = 15000

-- スクロールのマージ
vim.opt.scrolloff = 5

-- swap&backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = true

-- インデント関係
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftround = true

-- splitの表示位置を下に
vim.opt.splitbelow = true
-- vsplitの表示位置を右に
vim.opt.splitright = true

-- modeline
vim.opt.modeline = true

-- search
-- 小文字での検索時に大文字小文字を区別しない
vim.opt.ignorecase = true
-- 大文字がある場合のみ大文字小文字を区別
vim.opt.smartcase = true
-- インクリメンタルサーチ
vim.opt.incsearch = true
-- 検索結果をハイライト
vim.opt.hlsearch = true
-- 検索のループ
vim.opt.wrapscan = true
-- 補完の際の大文字小文字の区別しない ignorecaseとsmartcaseに依存
vim.opt.infercase = true
-- 置換時のプレビュー
vim.opt.inccommand = "split"

-- ファイル更新の自動読み込み
vim.opt.autoread = true
vim.api.nvim_create_augroup("vim-checktime", { clear = true })
vim.api.nvim_create_autocmd("WinEnter", {
  group = "vim-checktime",
  command = "checktime",
})

-- 編集を保持したまま別ファイルへ
vim.opt.hidden = true

-- 不可視文字の表示
-- tab:最初２文字 trail:行末の空白 extends:折り返しの行末 precedes:折り返しの行頭 eol:行末
vim.opt.list = true
vim.opt.listchars = { tab = "> ", trail = "-", nbsp = "%", extends = ">", precedes = "<" }

-- コマンドラインの行数
vim.opt.cmdheight = 2
-- コマンドをステータス行に表示
vim.opt.showcmd = true
-- コマンドの記録数
vim.opt.history = 100

-- ステータスラインに文字コードと改行文字を表示
vim.opt.statusline = "%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\\ %F%=[%l/%L]"

-- カーソル位置のシンタックス情報を表示
local function get_syn_id(transparent)
  local synid = vim.fn.synID(vim.fn.line("."), vim.fn.col("."), 1)
  if transparent then
    return vim.fn.synIDtrans(synid)
  else
    return synid
  end
end

local function get_syn_attr(synid)
  local name = vim.fn.synIDattr(synid, "name")
  local ctermfg = vim.fn.synIDattr(synid, "fg", "cterm")
  local ctermbg = vim.fn.synIDattr(synid, "bg", "cterm")
  local guifg = vim.fn.synIDattr(synid, "fg", "gui")
  local guibg = vim.fn.synIDattr(synid, "bg", "gui")
  return {
    name = name,
    ctermfg = ctermfg,
    ctermbg = ctermbg,
    guifg = guifg,
    guibg = guibg,
  }
end

local function get_syn_info()
  local baseSyn = get_syn_attr(get_syn_id(0))
  print(
    "name: "
    .. baseSyn.name
    .. " ctermfg: "
    .. baseSyn.ctermfg
    .. " ctermbg: "
    .. baseSyn.ctermbg
    .. " guifg: "
    .. baseSyn.guifg
    .. " guibg: "
    .. baseSyn.guibg
  )

  local linkedSyn = get_syn_attr(get_syn_id(1))
  print("link to")
  print(
    "name: "
    .. linkedSyn.name
    .. " ctermfg: "
    .. linkedSyn.ctermfg
    .. " ctermbg: "
    .. linkedSyn.ctermbg
    .. " guifg: "
    .. linkedSyn.guifg
    .. " guibg: "
    .. linkedSyn.guibg
  )
end
vim.api.nvim_create_user_command(
  "SyntaxInfo",
  function() get_syn_info() end,
  { desc = 'SyntaxInfo' }
)

-- volta で nodejs を管理している場合は neovim-node-host を設定
if vim.fn.executable("volta") == 1 then
  vim.g.node_host_prog = vim.fn.trim(vim.fn.system("volta which neovim-node-host"))
end

-- .env.* も .env と同じ filetype にする
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  pattern = ".env*",
  command = "set filetype=sh | lua vim.diagnostic.disable()",
})

require('config.keymaps')
require('lazynvim')
