local g = vim.g
local opt = vim.opt

-- Python & Rust
g.python_recommended_style = 0
g.rust_recommended_style = 0

-- Tabs / Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
g.background = "dark"

-- Clipboard / Swapfile
-- opt.clipboard = "unnamedplus"
opt.swapfile = true

opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 999
opt.termguicolors = true
opt.wrap = false
opt.ignorecase = true
opt.inccommand = "split"
opt.hlsearch = true
-- vim.o.pumblend = 20

opt.titlestring = "this"
opt.title = true
