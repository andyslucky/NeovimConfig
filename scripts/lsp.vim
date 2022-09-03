" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require('lspconfig')
-- function to attach completion when setting up lsp
local on_attach = function(client,bufnr)
    require('completion').on_attach(client)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr,...) end
    local opts = {noremap=true, silent=true}
    buf_set_keymap('n','<S-F6>','<cmd>lua vim.lsp.buf.rename()<CR>',opts)
    buf_set_keymap('n','<A-Enter>','<cmd> lua vim.lsp.buf.code_action()<CR>',opts)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
nvim_lsp.gopls.setup({ on_attach=on_attach })
-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF
