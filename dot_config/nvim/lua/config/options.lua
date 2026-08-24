-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- OSC52 clipboard so yanks work over SSH. Omarchy ships this module on Linux;
-- it doesn't exist on macOS, so load it only if it's there.
local ok, remote_clipboard = pcall(require, "config.remote_clipboard")
if ok then
  remote_clipboard.setup()
end

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true        -- Enable visual wrapping
vim.opt.linebreak = true   -- Wrap at word boundaries (don't break words in half)
vim.opt.breakindent = true -- Indent wrapped lines to match the code's indentation
