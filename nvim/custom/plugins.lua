local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp
  },

  {
    "kevinhwang91/nvim-ufo",
    lazy = false,
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      require "custom.configs.ufo"
    end
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "ggandor/lightspeed.nvim",
    lazy = false,
    config = function()
      require "custom.configs.lightspeed"
    end,
  },

  {
    "folke/todo-comments.nvim"
  },

  {
    "ojroques/vim-oscyank",
    lazy = false,
    config = function ()
      require "custom.configs.oscyank"
    end
  },

  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end
    },
    config = function()
      require("copilot_cmp").setup({ name = "copilot", keyword_pattern = "." })
    end,
  },

  {
    "leoluz/nvim-dap-go",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("dapui").setup()
        end
      },
      {
        "mfussenegger/nvim-dap",
        config = function()
          require "custom.configs.dap"
        end
      },
    },
    config = function()
      require "custom.configs.dapgo"
    end
  },
  {
    "preservim/tagbar",
    cmd = { "TagbarToggle" },
    config = function()
      require "custom.configs.tagbar"
    end,
  },
  {
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.chatgpt"
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "jiaoshijie/undotree",
    config = function()
      require "custom.configs.undotree"
    end,
  },
  {
    "RRethy/vim-illuminate",
    ft = { "go", "rust", "python", "lua", "javascript", "typescript", "typescriptreact", "javascriptreact", "html", "css", "scss", "markdown", "yaml", "json" },
    config = function()
      require "custom.configs.illuminate"
    end,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require "custom.configs.todocomments"
    end,
  },
  {},
}

return plugins
