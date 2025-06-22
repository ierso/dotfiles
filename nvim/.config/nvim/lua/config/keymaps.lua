-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- General Keymaps -------------------
local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<esc>", { desc = "exit insert mode with jk" })
