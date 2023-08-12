
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  'folke/trouble.nvim',

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter', dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
    build = ':TSUpdate',
  },
  'nvim-treesitter/nvim-treesitter-context',
  'nvim-treesitter/playground',
  'ThePrimeagen/harpoon',
  'ThePrimeagen/refactoring.nvim',
  'mbbill/undotree',

  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'jiangmiao/auto-pairs',
  'tpope/vim-surround',
  'vim-scripts/ReplaceWithRegister',
  'ryanoasis/vim-devicons',
  'scrooloose/nerdtree',
  'jistr/vim-nerdtree-tabs',
  'tiagofumo/vim-nerdtree-syntax-highlight',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',          opts = {} },

  -- LSP and Auto Completion
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'rafamadriz/friendly-snippets'}
    }
  },
  'OmniSharp/omnisharp-vim',
  'Hoffs/omnisharp-extended-lsp.nvim',

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
        -- See `:help gitsigns.txt`
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
            vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
                { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
            vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
                { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
            vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
                { buffer = bufnr, desc = '[P]review [H]unk' })
        end,
    },
  },

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
        vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
        options = {
            icons_enabled = false,
            theme = 'onedark',
            component_separators = '|',
            section_separators = '',
        },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
        char = '┊',
        show_trailing_blankline_indent = false,
    },
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
        return vim.fn.executable 'make' == 1
    end,
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },

  'folke/zen-mode.nvim',
  'github/copilot.vim',
  'eandrju/cellular-automaton.nvim',
  'laytan/cloak.nvim',
}, {})
