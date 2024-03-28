-- Set Tab to 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- Set leader key to space
vim.g.mapleader= " "

-- Declare lazy.nvim as nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Tuple to declare nvim plugins
local plugins = {
  -- Declare catppuccin package
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },

  -- Declare telescope package
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Declare treesitter package
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- Declare neotree package
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },
}
local opts = {}

-- Initialize vim with lazy.nvim
require("lazy").setup(plugins, opts)

-- Intialize telescope and configure
local builtin = require("telescope.builtin")
-- Bind telescope fuctions to keys
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- Intialize and configure treesitter
local configs = require("nvim-treesitter.configs")
configs.setup({
  -- Declare languages with treesitter
  ensure_installed = {"c", "python", "css", "tsx", "lua", "vim", "html", "javascript", "cpp"},
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true},
})

-- Configure neotree keybind
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

-- Set colour scheme to catppuccin
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
