local present, dapui = pcall(require, 'dapui')

if not present then
  return
end

dapui.setup()
