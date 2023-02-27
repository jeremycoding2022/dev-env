local present, dap = pcall(require, 'dap')

if not present then
  return
end

local present_ui, dapui = pcall(require, 'dapui')

if not present_ui then
  return
end

dap.adapters.go = function(callback, _)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = { nil, stdout },
    -- args = { "dap", "-l", "127.0.0.1:" .. port },
    args = { "dap", "--check-go-version=false", "--listen=127.0.0.1:" .. port, "--log-dest=3" },
    detached = true,
  }

  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print("dlv exited with code", code)
    end
  end)
  assert(handle, "Error running dlv: " .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
      end)
    end
  end)

  vim.defer_fn(function()
    callback { type = "server", host = "127.0.0.1", port = port }
  end, 100)
end

-- 此处获取命令行输入参数，其他语言的配置也是可以加的啦
-- 主要是这个程序是一个简单的容器实验，模仿实现docker所以需要从命令行输入参数
local get_args = function()
  -- 获取输入命令行参数
  local cmd_args = vim.fn.input('CommandLine Args:')
  local params = {}
  -- 定义分隔符(%s在lua内表示任何空白符号)
  for param in string.gmatch(cmd_args, "[^%s]+") do
    table.insert(params, param)
  end
  return params
end;

dap.configurations.go = {
-- 普通文件的debug
  {
    type = "go",
    name = "Debug",
    request = "launch",
    args = get_args,
    program = "${file}",
  },
-- 测试文件的debug
  {
    type = "go",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    cwd = '${workspaceFolder}',
    program = "${file}"
  },
  -- works with go.mod packages and sub packages
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    cwd = '${workspaceFolder}',
    program = "./${relativeFileDirname}"
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- 定义包含要配置快捷键的文件类型的表格
local filetypes = { "go", "python" }

local function set_debug_keymaps ()
  vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
  vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
  vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
  vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
  vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
  vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
  vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
  vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
  vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
  vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
  end)
  vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
  end)
  vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
  end)
  vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
  end)
end

-- 在打开特定文件类型时运行此函数
function Set_my_debug_keymaps()
  -- 检查文件类型是否在表格中
  if vim.tbl_contains(filetypes, vim.bo.filetype) then
    -- 添加配置
    if vim.bo.filetype == "go" then
      set_debug_keymaps()
      local filename = vim.fn.expand("%:t")
    elseif vim.bo.filetype == "python" then
      set_debug_keymaps()
    end
  end
end

function Set_go_debug(bufnr)
  if vim.tbl_contains(filetypes, vim.bo.filetype) then
    -- 获取当前 buffer 的完整路径及文件名
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local filename = vim.fn.expand("%:t")
    -- local filename = vim.fn.fnamemodify(bufname, ":t")
    -- local extension = vim.fn.fnamemodify(bufname, ":e")
    
    if string.find(filename, "_test.go") or string.find(bufname, "_test.go") then
        vim.keymap.set("n", '<F5>', function() require('dap-go').debug_test() end)
    else
        vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
    end
  end
end

-- 添加自动命令
vim.cmd([[
  augroup FileTypeMappings
    autocmd!
    autocmd FileType * lua Set_my_debug_keymaps()
    autocmd BufEnter * lua Set_go_debug(vim.fn.bufnr())
  augroup END
]])

vim.cmd([[
  augroup BufEnterMappings
    autocmd!
    autocmd BufEnter * lua Set_go_debug(vim.fn.bufnr())
  augroup END
]])
