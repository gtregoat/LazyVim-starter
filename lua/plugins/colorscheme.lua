return {
--   -- Install Catppuccin and use Mocha
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     priority = 1000,
--     opts = {
--       flavour = "mocha",
--     },
--     config = function(_, opts)
--       require("catppuccin").setup(opts)
--     end,
--   },
--
--   -- Set default colorscheme to Catppuccin
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
 "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        -- require("jb").setup({transparent = true})
        vim.cmd("colorscheme jb")
        
        -- Fix window separator colors - use a subtle color from the colorscheme
        local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
        vim.api.nvim_set_hl(0, "WinSeparator", { bg = normal_bg, fg = "#3c3c3c" })
        
        -- Fix Avante input border to show separator line
        vim.api.nvim_set_hl(0, "AvantePromptInputBorder", { bg = normal_bg, fg = "#3c3c3c" })
    end,}
