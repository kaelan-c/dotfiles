-- Declare catppuccin package
return { 
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
 -- Set colour scheme to catppuccin
    vim.cmd.colorscheme "catppuccin"
  end
}
