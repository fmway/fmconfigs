-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local nix = "nixd"; -- available rnix, nil_ls, nixd
local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "rust_analyzer", nix, "zls", "clangd", "vls", 'intelephense', "jsonls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- laravel
-- lspconfig.intelephense.setup {
--   cmd = { "intelephense", "--stdio" },
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   filetypes = { "php", "blade" },
--   files = {
--     associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
--     maxSize = 5000000,
--   },
--   root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
-- }
--
-- vue language server
local util = require 'lspconfig.util'
local function get_typescript_server_path(root_dir)

  local global_ts = '/home/fmway/.local/share/pnpm/global/5/node_modules/typescript/lib'
  -- Alternative location if installed as root:
  -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

lspconfig.volar.setup{
  -- filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
}

-- typescript
lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json"),
  single_file_support = false
}
