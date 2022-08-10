-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'glepnir/dashboard-nvim'
  -- theme
  use 'folke/tokyonight.nvim'
  use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = {'kyazdani42/nvim-web-devicons'} }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' } }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- git 
  use 'mhinz/vim-signify'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  --lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'onsails/lspkind-nvim'
  --auto complete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  -- Misc
  use 'tpope/vim-commentary'
  use 'windwp/nvim-autopairs'
  use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
  use 'ThePrimeagen/git-worktree.nvim'
 end)


