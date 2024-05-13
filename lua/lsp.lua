-- Everything related to Language Server Protocol (LSP) configuration
--
-- based on:
-- https://lsp-zero.netlify.app/v3.x/blog/you-might-not-need-lsp-zero.html
--

local helpers = require("helpers")
local telescope = require("telescope.builtin")

-- Global LSP keybindings
helpers.set_keymap("gl", "<cmd>lua vim.diagnostic.open_float()<cr>", {
  desc = "Open diagnostic float"
})

helpers.set_keymap("úd", "<cmd>lua vim.diagnostic.goto_prev()<cr>", {
  desc = "Go to previous diagnostic"
})

helpers.set_keymap("äd", "<cmd>lua vim.diagnostic.goto_next()<cr>", {
  desc = "Go to next diagnostic"
})

local function lsp_keymap_opts_factory(event)
  return function(opts)
    return vim.tbl_extend("force", { buffer = event.buf }, opts or {})
  end
end

local function telescope_lsp_action_factory()
  return function(action)
    local action_name = "lsp_" .. action
    return function()
      telescope[action_name]()
    end
  end
end

-- LSP actions
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local get_opts = lsp_keymap_opts_factory(event)
    local lsp_action = telescope_lsp_action_factory()

    helpers.set_keymap("<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", get_opts({
      desc = "Rename symbol"
    }))

    helpers.set_keymap("ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", get_opts({
      desc = "Show code actions"
    }))

    helpers.set_keymap("K", "<cmd>lua vim.lsp.buf.hover()<cr>", get_opts({
      desc = "Show hover information"
    }))

    helpers.set_keymap("gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", get_opts({
      desc = "Show signature help"
    }))

    helpers.set_keymap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", get_opts({
      desc = "Go to declaration"
    }))

    helpers.set_keymap("gd", lsp_action("definitions"), get_opts({
      desc = "Go to definition"
    }))

    helpers.set_keymap("gi", lsp_action("implementations"), get_opts({
      desc = "Go to implementation"
    }))

    helpers.set_keymap("go", lsp_action("type_definitions"), get_opts({
      desc = "Go to type definition"
    }))

    helpers.set_keymap("gr", lsp_action("references"), get_opts({
      desc = "Show references"
    }))
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
        globals = {'vim'},
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        }
      }
    }
  }
})
