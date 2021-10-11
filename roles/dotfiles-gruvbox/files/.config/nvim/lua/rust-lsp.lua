local lspconfig = require 'lspconfig'

lspconfig.rust_analyzer.setup{
    cmd = {"~/.cargo/bin/rust-analyzer"},
    filetypes = { "rust" },
    root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
      ["rust-analyzer"] = {}
    }
}
