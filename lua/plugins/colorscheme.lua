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
    end,}
