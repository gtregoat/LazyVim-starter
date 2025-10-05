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

-- Function to set darker terminal highlights
local function set_darker_terminal_hl()
  vim.api.nvim_set_hl(0, "TermNormal", { bg = "#0f1117" })
  vim.api.nvim_set_hl(0, "TermNormalNC", { bg = "#0f1117" })
end

-- Apply immediately on startup
set_darker_terminal_hl()

-- Reapply on any ColorScheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  group = jb_term,
  callback = set_darker_terminal_hl,
})

-- Apply to any new terminal window
vim.api.nvim_create_autocmd("TermOpen", {
  group = jb_term,
  callback = function()
    -- Ensure highlights are set
    set_darker_terminal_hl()
    -- Use the custom terminal highlights for this window
    pcall(vim.api.nvim_set_option_value, "winhighlight", "Normal:TermNormal,NormalNC:TermNormalNC", { scope = "local", win = 0 })
  end,
})

-- Reapply after plugins load (catches cases where plugins override colorscheme)
vim.api.nvim_create_autocmd("VimEnter", {
  group = jb_term,
  callback = function()
    vim.defer_fn(set_darker_terminal_hl, 100)
  end,
})
