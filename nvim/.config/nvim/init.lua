vim.opt.shiftwidth = 2
vim.opt.hlsearch = false
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.g.termguicolors = true

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ' '
vim.opt.clipboard = 'unnamedplus'

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'BurntSushi/ripgrep'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = {{'nvim-lua/plenary.nvim'}}
  }
end)

require('telescope').setup{
  pickers = {
    find_files = {
      find_command = {"rg", "--files", "--hidden", "--glob", "!**/.git/*"},
    }
  }
}

require('nvim-tree').setup()

local telebuiltin = require('telescope.builtin')

vim.api.nvim_set_keymap('i', '<c-h>', '<esc>', { noremap = true})
vim.keymap.set('n', '<leader>ff', telebuiltin.find_files, {})
vim.keymap.set('n', '<leader>fs', telebuiltin.live_grep, {})
vim.keymap.set('n', '<leader>do', ':NvimTreeToggle<CR>', {})
vim.keymap.set('n', '<leader>bn', ':bn<CR>', {noremap = true})
vim.keymap.set('n', '<leader>bp', ':bp<CR>', {noremap = true})
