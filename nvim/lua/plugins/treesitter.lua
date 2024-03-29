  -- Declare treesitter package
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Intialize and configure treesitter
    local configs = require("nvim-treesitter.configs")
    configs.setup({
    -- Declare languages with treesitter
      ensure_installed = {"c", "python", "css", "tsx", "lua", "vim", "html", "javascript", "cpp"},
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true},
    })
  end
}

 
