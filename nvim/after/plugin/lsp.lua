local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<CR>.", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})


---------------------- Omnisharp config

-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
-- curl --verbose --location --remote-name https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.8/omnisharp-linux-x64-net6.0.tar.gz
-- mkdir -p ~/.local/omnisharp
-- mv omnisharp-linux-x64-net6.0.tar.gz ~/.local/omnisharp
-- cd ~/.local/omnisharp
-- tar -xvf omnisharp-linux-x64-net6.0.tar.gz

local pid = vim.fn.getpid()
local omnisharp_bin = vim.fn.expand("~/.local/omnisharp/OmniSharp")
local util = require 'lspconfig/util'

vim.g.OmniSharp_server_use_net6 = 1
local config = {
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
  cmd = { omnisharp_bin, '--languageserver' , '--hostPID', tostring(pid) },
  use_modern_net = true,
  path = '',
  -- use_global_mono = 'always',
  -- rest of your settings
  -- Enables support for reading code style, naming convention and analyzer
    -- settings from .editorconfig.
  enable_editorconfig_support = true,

    -- If true, MSBuild project system will only load projects for files that
    -- were opened in the editor. This setting is useful for big C# codebases
    -- and allows for faster initialization of code navigation features only
    -- for projects that are relevant to code that is being edited. With this
    -- setting enabled OmniSharp may load fewer projects and may thus display
    -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,

    -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = true,

    -- Specifies whether 'using' directives should be grouped and sorted during
    -- document formatting.
  organize_imports_on_format = false,

    -- Enables support for showing unimported types and unimported extension
    -- methods in completion lists. When committed, the appropriate using
    -- directive will be added at the top of the current file. This option can
    -- have a negative impact on initial completion responsiveness,
    -- particularly for the first few completion sessions after opening a
    -- solution.
  enable_import_completion = true,

    -- Specifies whether to include preview versions of the .NET SDK when
    -- determining which version to use for project loading.
  sdk_include_prereleases = true,

    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
    -- true
  analyze_open_documents_only = true,


  default_config = {
    filetypes = { 'cs', 'vb' },
    root_dir = function(fname)
      return util.root_pattern '*.sln'(fname) or util.root_pattern '*.csproj'(fname)
    end,
    on_new_config = function(new_config, new_root_dir)
      if new_root_dir then
        table.insert(new_config.cmd, '-s')
        table.insert(new_config.cmd, new_root_dir)
      end
    end,
    init_options = {},
  }
}

require'lspconfig'.omnisharp.setup(config)