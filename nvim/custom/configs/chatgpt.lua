
local chatgpt = require("chatgpt")
local wk = require("which-key")

wk.register({
    p = {
        name = "ChatGPT",
        e = {
            function()
                chatgpt.edit_with_instructions()
            end,
            "Edit with instructions",
        },
    },
    }, {
        prefix = "<leader>",
        mode = "v",
})

wk.register({
    g = {
        name = "ChatGPT",
        c = { "<cmd>ChatGPT<cr>", "chatgpt"},
        a = { "<cmd>ChatGPTActAs<cr>", "chatgpt act as"},
    },
    }, {
        prefix = "<leader>",
        mode = "n",
})

chatgpt.setup({
    chat = {
        keymaps = {
            close = { "jk", "kj", "<Esc>" },
            yank_last = "<C-y>",
            scroll_up = "<C-u>",
            scroll_down = "<C-d>",
            toggle_settings = "<C-o>",
            new_session = "<C-n>",
            cycle_windows = "<Tab>",
        },
    },
    popup_input = {
        submit = "<C-t>",
    },
})
