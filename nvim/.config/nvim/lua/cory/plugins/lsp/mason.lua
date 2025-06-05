return {
	"williamboman/mason.nvim",
	version = "1.8.0",
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			version = "1.7.0",
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			version = "1.4.0",
		},
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"html", -- html language server
				"cssls", -- css language server
				"tsserver", -- typescript language server
				"graphql", -- graphql language server
				"emmet_ls", -- emmet language server
				"lua_ls", -- lua language server
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d", -- js linter
			},
			auto_update = false, -- disable auto update
			run_on_start = true, -- run on startup
		})
	end,
}
