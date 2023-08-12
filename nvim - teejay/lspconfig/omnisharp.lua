local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'
local server_name = 'omnisharp'

configs[server_name] = {
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
  },
  -- on_new_config = function(new_config) end;
  -- on_attach = function(client, bufnr) end;
  docs = {
    description = '',
    default_config = {
      root_dir = [[root_pattern(".sln") or root_pattern(".csproj")]],
    },
  },
}
