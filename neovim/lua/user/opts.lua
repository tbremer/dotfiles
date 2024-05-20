-- Leader
vim.g.mapleader = ","
vim.g.localleader = ","

-- Enable relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Enable auto indenting and set it to spaces
vim.opt.smartindent = true
vim.opt.shiftwidth = 2

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Disable text wrap
vim.opt.wrap = false

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease updatetime to 200ms
--vim.opt.updatetime = 200

-- Enable persistent undo history
vim.opt.undofile = true

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Place a column line
vim.opt.colorcolumn = "80,120"

-- Set fold settings
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldenable = true
vim.opt.numberwidth = 1
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

local status_colums = {
  -- symbols
  "%s",

  -- numbering
  '%{v:relnum ? (v:relnum < 10 ? v:relnum . " " : v:relnum > 99 ? v:relnum : v:relnum . "  ") : (v:lnum < 10 ? v:lnum . " " : v:lnum)}',

  -- folding
  -- basically, if we have a foldlevel and and that foldlevel is bigger than 1
  -- check if it's closed, if closed print right carent, else print down caret
  -- if no foldlevel or fold is 1, print space
  -- if no foldlevel or fold is 1, print space
  -- function()
  --   if tonumber("%{foldlevel(v:lnum)}") > 0 then
  --     if tonumber("%{foldlevel(v:lnum)}") > tonumber("%{foldlevel(v:lnum - 1)}") then
  --       if tonumber("%{foldclosed(v:lnum)}") == -1 then
  --         return " "
  --       else
  --         return " "
  --       end
  --     end
  --   end
  --   return " "
  -- end,
  '%{foldlevel(v:lnum) > 0 ? (foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? " " : " ") : " ") : " " }',
}

vim.opt.statuscolumn = table.concat(status_colums, "%= ")

-- disable netrwPlugin
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
