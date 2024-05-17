-- Everything related to Language Server Protocol (LSP) configuration
--
-- based on:
-- https://lsp-zero.netlify.app/v3.x/blog/you-might-not-need-lsp-zero.html
--

local Utils = require("utils")

-- LSP actions
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function()
    Utils.register_keymaps({
      K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover information" },
      D = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open diagnostic float" },
    })

    Utils.register_keymaps({
      l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
        d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
        r = { "<cmd>Telescope lsp_references<cr>", "References" },
        i = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
        t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type definitions" },
        S = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature help" },
        R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol under cursor" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
        w = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace symbols" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format document" },
      },
      d = {
        name = "diagnostics",
        l = { "<cmd>Telescope diagnostics<cr>", "Document diagnostics" },
        n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
        p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous diagnostic" },
      },
    }, { prefix = "<leader>" })
  end
})

-- LSP configuration
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local default_setup = function(server)
  require("lspconfig")[server].setup({
    capabilities = lsp_capabilities,
  })
end

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {},
  handlers = {
    default_setup,
  },
})

-- Completion
local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
  },
  mapping = cmp.mapping.preset.insert({
    -- Confirm completion
    ["<cr>"] = cmp.mapping.confirm({ select = false }),

    -- Cancel completion
    ["<c-e>"] = cmp.mapping.close(),

    -- Trigger completion
    ["<c-space>"] = cmp.mapping.complete(),

    -- Navigate completion
    ["<c-n>"] = cmp.mapping.select_next_item(),
    ["<c-p>"] = cmp.mapping.select_prev_item(),

    -- Scroll documentation
    ["<c-d>"] = cmp.mapping.scroll_docs(4),
    ["<c-f>"] = cmp.mapping.scroll_docs(-4),
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
})

-- Language specific configuration
require("lspconfig").lua_ls.setup({
  capabilities = lsp_capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        }
      }
    }
  }
})

-- Format on save
local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormat", {})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = lsp_format_augroup,
  desc = "Format on save",
  callback = function(event)
    vim.lsp.buf.format({
      bufnr = event.buf,
    })
  end
})
