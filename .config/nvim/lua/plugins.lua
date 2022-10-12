local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use "nvim-lua/plenary.nvim"
  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }  
  use 'mjlbach/onedark.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'tpope/vim-fugitive'                                                             -- Git commands in nvim
  use 'tpope/vim-rhubarb'                                                              -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use("jose-elias-alvarez/null-ls.nvim") -- Formatting engine

  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
    use("ray-x/lsp_signature.nvim")

    use("onsails/lspkind-nvim") -- pictograms for lsp completion items
    use("j-hui/fidget.nvim") -- LSP status endpoint handler
    use("weilbith/nvim-code-action-menu") -- Show code actions in a useful manner
    use("kosayoda/nvim-lightbulb") -- Show code actions in a useful manner
    use("folke/lua-dev.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins'nvim-telescope/telescope.nvim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
