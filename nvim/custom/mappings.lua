local M = {}

M.truzen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "   truzen ataraxis" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "   truzen minimal" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "   truzen focus" },
  },
}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "  find media" },
  },
}

M.shade = {
  n = {
    ["<leader>s"] = {
      function()
        require("shade").toggle()
      end,

      "   toggle shade.nvim",
    },

    ["<leader>lz"] = {
      function()
        require("nvterm.terminal").send("lazygit", "vertical")
      end,
      "nvterm lazygit",
    },
  },
}

M.tagbar = {
  n = {
    ["<leader>t"] = {"<cmd> TagbarToggle <CR>", "   TagbarToggle"}
  },
}

M.gitsigns = {
  n = {
    ["<leader>gcl"] = {"<cmd> Gitsigns toggle_current_line_blame <CR>", "   toggle current line blame"}
  },
}

M.oscyank = {
  v = {
    ["<leader>c"] = {"<cmd> OSCYank <CR>", "use osc yank copy"}
  },
}

return M
