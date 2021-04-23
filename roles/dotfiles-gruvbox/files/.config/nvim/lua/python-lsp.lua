local lspconfig = require'lspconfig'

lspconfig.pyright.setup {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = function(filename)
          return lspconfig.util.root_pattern(unpack(root_files))(filename) or
                 lspconfig.util.path.dirname(filename)
        end;
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true
        }
      }
    }
}
