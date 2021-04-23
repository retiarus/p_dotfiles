local lspconfig = require'lspconfig'

lspconfig.cssls.setup {
    cmd = { "css-languageserver", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_dir = lspconfig.util.root_pattern("package.json"),
    settings = {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    }
}
