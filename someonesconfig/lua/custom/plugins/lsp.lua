return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			"hrsh7th/nvim-cmp",					-- completion engine
			"hrsh7th/cmp-nvim-lsp",			-- LSP source for nvim-cmp
		},
		config = function()
			-- Setup mason
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "",
						package_pending = "󰦗 ",
						package_uninstalled = "✗"
					}
				}
			})

			-- Ensure clangd is installed and auto-installed if missing
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd" },
				automatic_installation = true,

			})

			local keymap = vim.keymap

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = {
						buffer = ev.buf,
						silent = false,
					}

					opts.desc = "Show LSP references"
					keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

					opts.desc = "Go to declaration"
					keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

					opts.desc = "Show LSP definitions"
					keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

					opts.desc = "Show LSP implementations"
					keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

					opts.desc = "Show LSP type definitions"
					keymap.set("n", "gR", "<cmd>Telescope lsp_type_definitions<CR>", opts)

					opts.desc = "See available code actions"
					keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

					opts.desc = "Smart rename"
					keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					opts.desc = "Show buffer diagnostics"
					keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

					opts.desc = "Show line diagnostics"
					keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

					opts.desc = "Go to previous diagnostics"
					keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

					opts.desc = "Go to next diagnostics"
					keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

					opts.desc = "Show doc for what is under cursor"
					keymap.set("n", "K", vim.lsp.buf.hover, opts)

					opts.desc = "Restart LSP"
					keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
				end,
			})

			-- Get nvim-cmp capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- gdscript activation
			local lspconfig = require('lspconfig')
			lspconfig.gdscript.setup {
				name = "gdscript",
				cmd = { "nc", "localhost", "6005" },
				root_dir = lspconfig.util.root_pattern("project.godot")
			}

			-- Setup clangd LSP
			lspconfig.clangd.setup({
				capabilities = capabilities,	 -- << add this line
				on_attach = function(_, bufnr)
					print("  clangd attached.")
					-- optional: set keymaps here
				end,
			})
		end,
	},
}
