--Pckr plugin
local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
    { 'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { 'nvim-lua/plenary.nvim' } };
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
    { 'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim'} };
    -- Mason for LSP language servers
    { 'williamboman/mason.nvim' };
    { 'williamboman/mason-lspconfig.nvim' };
    -- LSP Support
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' };
    { 'neovim/nvim-lspconfig' };
    { 'hrsh7th/cmp-nvim-lsp' };
    { 'hrsh7th/cmp-buffer' };
    { 'hrsh7th/cmp-path' };
    { 'hrsh7th/cmp-cmdline' };
    { 'hrsh7th/cmp-nvim-lua' };
    { 'hrsh7th/nvim-cmp' };
};
