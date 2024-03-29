
  -- Declare telescope package
  return {
    "nvim-telescope/telescope.nvim", tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Intialize telescope and configure
      local builtin = require("telescope.builtin")
      -- Bind telescope fuctions to keys
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end
  }
  
