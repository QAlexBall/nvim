-- Author: Chris Zhu

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Lazy Installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
local opts = {
  spec = {
    { import = "plugins" }, -- auto import lua/plugins/*.lua
  },
  ui = {
    border = _G.border,
  },
  default = { lazy = true },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "rplugin",
        "tarPlugin",
        -- "tutor",
        "zipPlugin",
      },
    },
  },
}
require("lazy").setup(opts)
require('lspconfig').pyright.setup{}
-- require("nvim-tree").setup({})
vim.api.nvim_create_user_command("LZ", "Lazy", {})

-- for auto update colorscheme, always keep this at the last line
vim.cmd.colorscheme "catppuccin-latte"
-- vim.cmd.colorscheme "tokyonight"
-- vim.cmd.colorscheme "onedark"
--


