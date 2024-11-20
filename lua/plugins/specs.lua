return {
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- require("catppuccin").setup()
  -- vim.cmd.colorscheme "catppuccin"

  -- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
  },

  -- TREESITTER --
  --Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  {
    'nvim-treesitter/nvim-treesitter', 
    build= ':TSUpdate',
    config = function()
	    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
	    ensure_installed = { "c", "lua", "vim", "markdown" , "awk", "bash", "cmake", "json", "python"}
	    -- Automatically install missing parsers when entering buffer
	    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	    auto_install = false
	    highlight = {
	      enable = true,
	      additional_vim_regex_highlighting = false
      	    }
	    indent = { 
		enable = true
	    }
    end
  }
}
