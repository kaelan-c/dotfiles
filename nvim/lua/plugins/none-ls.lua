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
        -- require("none-ls.diagnostics.eslint_d"),
        -- Python linting and formatting
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        null_ls.builtins.formatting.sqlfmt,
        null_ls.builtins.diagnostics.sqlfluff,

      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
