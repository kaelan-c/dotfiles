-- Declare neotree package
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Configure neotree keybind
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
  end,
}
