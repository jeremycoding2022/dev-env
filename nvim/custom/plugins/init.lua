return {
  -- autoclose tags in html, jsx etc
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.smolconfigs").autotag()
    end,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- minimal modes
  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  -- get highlight group under cursor
  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  -- dim inactive windows
  ["andreadev-it/shade.nvim"] = {
    module = "shade",
    config = function()
      require("custom.plugins.smolconfigs").shade()
    end,
  },

  ["Pocco81/AutoSave.nvim"] = {
    module = "autosave",
    config = function()
      require("custom.plugins.smolconfigs").autosave()
    end,
  },

  -- notes stuff
  ["nvim-neorg/neorg"] = {
    ft = "norg",
    after = "nvim-treesitter",
    config = function()
      require "custom.plugins.neorg"
    end,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
    cmd = "Alpha",
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ['max397574/better-escape.nvim'] = {
    config = function()
    require("better_escape").setup()
    end
  },
  ['preservim/tagbar'] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.tagbar"
    end,
  },
  ['ggandor/lightspeed.nvim'] = {
  },
  ['folke/todo-comments.nvim'] = {
    config = function()
      require "custom.plugins.todocomments"
    end,
  },
  ['RRethy/vim-illuminate'] = {
    config = function()
      require "custom.plugins.illuminate"
    end,
  },
  ['ojroques/vim-oscyank'] = {
    config = function()
      require "custom.plugins.oscyank"
    end,
  },
  ['kevinhwang91/promise-async'] = {
  },
  ['kevinhwang91/nvim-ufo'] = {
    after = "promise-async"
    config = function()
      require "custom.plugins.nvimufo"
    end,
  },
  ['kdheepak/lazygit.nvim'] = {
    config = function()
      require "custom.plugins.lazygit"
    end,
  },
  ['sindrets/diffview.nvim'] = {
    config = function()
      require "custom.plugins.diffview"
    end,
  },
  ['jiaoshijie/undotree'] = {
    config = function()
      require "custom.plugins.undotree"
    end,
  },
  ['christoomey/vim-tmux-navigator'] = {
  },
  ['mfussenegger/nvim-dap'] = {
    config = function()
      require "custom.plugins.dap"
    end,
  },
  ['rcarriga/nvim-dap-ui'] = {
    config = function()
      require "custom.plugins.dapui"
    end,
  },
  ['leoluz/nvim-dap-go'] = {
    config = function()
      require "custom.plugins.dapgo"
    end,
  },
  ['zbirenbaum/copilot.lua'] = {
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  ['zbirenbaum/copilot-cmp'] = {
    after = "copilot.lua",
    config = function()
      require("copilot_cmp").setup({})
    end,
  },
}
