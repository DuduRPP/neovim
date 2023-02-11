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

return require('lazy').setup({

	'folke/tokyonight.nvim',
    { "catppuccin/nvim", name = "catppuccin" },

    'tpope/vim-surround',
    'tpope/vim-repeat',
    'ggandor/leap.nvim',

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		dependencies = { { 'nvim-lua/plenary.nvim' } }
	},

	{
		'nvim-treesitter/nvim-treesitter',
		build = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	},

	"theprimeagen/harpoon",

	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	},

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    },

    {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    {"akinsho/toggleterm.nvim", config = function()
        require("toggleterm").setup()
    end},
})
