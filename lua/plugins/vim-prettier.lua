return {
  "prettier/vim-prettier",
  function()
    local helpers = require("helpers")
    local autocomplete = require("rpm.autocomplete")

    local parser_select_options = {
      "typescript",
      "css",
      "json",
      "jsonc",
      "graphql",
      "markdown",
      "ruby",
      "yaml",
      "html"
    }

    helpers.set_global_option("prettier#autoformat", 1)
    helpers.set_global_option("prettier#autoformat_require_pragma", 0)

    helpers.set_keymap("<leader>p", "<cmd>PrettierAsync<cr>", {
      desc = "Format with Prettier"
    })

    -- cmd for formatting the current line or visual selection
    vim.api.nvim_create_user_command(
      "PS",
      function(opt)
        local filetype = opt.fargs[1]

        local range_start = vim.fn.line("'<")
        local range_end = vim.fn.line("'>")

        local lines = vim.fn.getline(range_start, range_end)
        local indent = vim.fn.indent(range_start)

        local temp_file = vim.fn.tempname()
        vim.fn.writefile(lines, temp_file)

        local command = "prettier --write --parser " .. filetype .. " " .. temp_file
        local output = vim.fn.systemlist(command)

        if vim.v.shell_error ~= 0 then
          vim.fn.delete(temp_file)
          vim.notify(output[1])
          return
        end

        local formatted_lines = vim.fn.readfile(temp_file)

        -- restore indent 
        for i, line in ipairs(formatted_lines) do
          formatted_lines[i] = string.rep(" ", indent) .. line
        end

        vim.fn.setline(range_start, formatted_lines)
        vim.fn.delete(temp_file)

        -- move the cursor to the end of the formatted lines
        vim.cmd("normal! `>")
      end,
      {
        nargs = 1,
        range = true,
        desc = "Format the current line or visual selection with Prettier",
        complete = function(arg_lead)
          return autocomplete.narrow_options(parser_select_options, arg_lead)
        end
      }
    )
  end
}
