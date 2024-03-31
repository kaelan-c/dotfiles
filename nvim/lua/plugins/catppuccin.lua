-- Declare catppuccin package
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false,
      integrations = {
        cmp = true,
        mason = true,
        neotree = true,
      },
    })
    -- Set colour scheme to catppuccin
    vim.cmd.colorscheme("catppuccin")
  end,
}
