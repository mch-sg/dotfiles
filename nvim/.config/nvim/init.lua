vim.opt.termguicolors = false 
vim.opt.number = true
vim.opt.relativenumber = true

-- Contrastic plugin initialization variable
vim.g.contrastic_enable_dyn_bg = 1 
--vim.opt.background = "light"
vim.g.contrastic_contrast = "hard"

-- 
-- KEYBINDS 
--
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set("i", "<M-BS>", "<C-w>", { desc = "Delete word backward" })
vim.keymap.set({ "i", "c" }, "<C-a>", "<Home>")
vim.keymap.set({ "i", "c" }, "<C-e>", "<End>")
vim.keymap.set({ "i", "n", "v" }, "<F15>", "<Cmd>normal! gg<CR>")
vim.keymap.set({ "i", "n", "v" }, "<F16>", "<Cmd>normal! G$<CR>")
vim.keymap.set({"n", "v"}, "<C-j>", "10j")
vim.keymap.set({"n", "v"}, "<C-k>", "10k")
vim.keymap.set({"n", "v"}, "<C-h>", "5h")
vim.keymap.set({"n", "v"}, "<C-l>", "5l")

--
-- Bootstrap lazy.nvim
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  end,
})

--
-- Install themes
--
require("lazy").setup({
  { "nuvic/flexoki-nvim", name="flexoki-nvim"},
  { "aikhe/fleur.nvim", name="fleur.nvim"},
  { "paulo-granthon/hyper.nvim", name="hyper.vim"},
  { "Verf/deepwhite.nvim", name="deepwhite" },
  { "YedTheEmo/gore.nvim", name="gore.nvim"},
  { "cesarus777/contrastic", name="contrastic"},

  { "yasukotelin/notelight", name="notelight"},
  { "tjdevries/colorbuddy.nvim", name="colorbuddy" },
  { "vim-scripts/ansi_blows.vim", name="ansi_blows"},
  { "znake/znake-vim", name="znake" },
  { "fcpg/vim-fahrenheit", name="fahrenheit" },
  { "nikolvs/vim-sunbather", name="sunbather" },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine", priority = 1000 },
  { "lewis6991/gitsigns.nvim", opts = {} },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        component_separators = "",
        section_separators = { left = right_round, right = left_round },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = left_round }, right_padding = 2 } },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "diagnostics", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { { "location", separator = { right = right_round }, left_padding = 2 } },
      },
     },
     },

     {
  'ibhagwan/fzf-lua',
  opts = {},
  keys = {
    { '<leader>ff', function() require('fzf-lua').files() end,     desc = 'Files' },
    { '<leader>fg', function() require('fzf-lua').live_grep() end, desc = 'Grep' },
    { '<leader>fb', function() require('fzf-lua').buffers() end,   desc = 'Buffers' },
  },
  },

})



-- 
-- SET THEMES
--

-- Activate your favorite scheme:
--vim.opt.background = "light"
vim.o.background = "dark"
vim.cmd.colorscheme("vim")

-- THIS IS THE CORRECT ORDER FOR COLOR SCHEME : GVIM
--vim.cmd.colorscheme("default")
--vim.opt.background = "light"
--vim.api.nvim_set_hl(0, "Normal", { bg = "#ffffff", fg = "#000000" })
--vim.api.nvim_set_hl(0, "LineNr", { fg = "#A52A2A", bold = true }) -- Keeps the classic pink line numbers!
