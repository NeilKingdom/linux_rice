-- Language Server Protocol (LSP). Allows for auto-complete and builtin function info dialogs

local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.setup()

-- Language servers
lsp.ensure_installed({
   "clangd",
	"rust_analyzer",
})

-- Bindings for auto-complete
local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = {}
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

-- Remaps for current buffer
lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

   -- Jump to definition
	vim.keymap.set("n", "<leader>jd", function() vim.lsp.buf.definition() end, opts)
   -- Function/variable help
	vim.keymap.set("n", "<leader>fh", function() vim.lsp.buf.hover() end, opts)
   -- A less useful version of hover()
	vim.keymap.set("n", "<leader>sh", function() vim.lsp.buf.signature_help() end, opts)
   -- Rename function/variable
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
   -- Find usages of the current symbol
	vim.keymap.set("n", "<leader>fu", function() vim.lsp.buf.references() end, opts)
   -- Find symbols at the workspace level e.g. structs or classes
	vim.keymap.set("n", "<leader>fwr", function() vim.lsp.buf.workspace_symbol() end, opts)
   -- Trigger a specified action at the current cursor position
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

   -- Open warning/error message in a floating window
	vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float() end, opts)
   -- Jump to next warning/error message
	vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
   -- Jump to previous warning/error message
	vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
end)

lsp.setup()

-- Add diagnostics (warnings, errors, etc.)
vim.diagnostic.config({
   virtual_text = true,
   signs = true,
   update_in_insert = false,
   underline = true,
   severity_sort = false,
   float = true,
})

-- Clangd setup
local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
    cmd = {
        "clangd",
        "--function-arg-placeholders",
        "--header-insertion=never"
    },
})
