return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = function(bufnr)
				-- Get the filetype of the current buffer
				local ft = vim.bo[bufnr].filetype

				-- Check if any formatter for this filetype is Prettier
				local formatters = conform.get_formatters_by_ft(ft)
				local has_prettier = false
				for _, formatter in ipairs(formatters) do
					if formatter.name == "prettier" then
						has_prettier = true
						break
					end
				end

				if not has_prettier then
					return false -- Don't format if not a Prettier filetype
				end

				-- List of Prettier configuration files
				local root_files = {
					".prettierrc",
					".prettierrc.json",
					".prettierrc.yml",
					".prettierrc.yaml",
					".prettierrc.json5",
					".prettierrc.js",
					".prettierrc.cjs",
					"prettier.config.js",
					"prettier.config.cjs",
					".prettierrc.toml",
				}

				-- Check if any Prettier config exists in the project
				local config_file = vim.fs.find(root_files, { upward = true })[1]

				-- Enable formatting only if a config file is found
				if config_file then
					return {
						lsp_fallback = true,
						async = false,
						timeout_ms = 1000,
					}
				else
					return false -- No config found, don't format
				end
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
