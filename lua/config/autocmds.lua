-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Darker terminal background (window-local, minimal override)
local jb_term = vim.api.nvim_create_augroup("user_darker_terminal", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = jb_term,
  callback = function()
    -- Set a darker bg for terminal windows
    vim.api.nvim_set_hl(0, "TermNormal", { bg = "#0f1117" })
    vim.api.nvim_set_hl(0, "TermNormalNC", { bg = "#0f1117" })
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = jb_term,
  callback = function()
    -- Use the custom terminal highlights for this window
    pcall(vim.api.nvim_set_option_value, "winhighlight", "Normal:TermNormal,NormalNC:TermNormalNC", { scope = "local", win = 0 })
  end,
})
