return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- lua formatting
        null_ls.builtins.formatting.stylua,
        -- js linting and formatting
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.prettierd.with({
          extra_filetypes = { "astro", },
        }),
        -- Python linting and formatting
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
