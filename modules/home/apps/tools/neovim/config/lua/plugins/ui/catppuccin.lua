return {
	"catppuccin/nvim",
	name = "catppuccin",
	init = function()
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
	opts = {
		transparent_background = true,
		custom_highlights = function(C)
			return {
				Pmenu = { bg = C.base },
				CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
				CmpItemKindKeyword = { fg = C.base, bg = C.red },
				CmpItemKindText = { fg = C.base, bg = C.teal },
				CmpItemKindMethod = { fg = C.base, bg = C.blue },
				CmpItemKindConstructor = { fg = C.base, bg = C.blue },
				CmpItemKindFunction = { fg = C.base, bg = C.blue },
				CmpItemKindFolder = { fg = C.base, bg = C.blue },
				CmpItemKindModule = { fg = C.base, bg = C.blue },
				CmpItemKindConstant = { fg = C.base, bg = C.peach },
				CmpItemKindField = { fg = C.base, bg = C.green },
				CmpItemKindProperty = { fg = C.base, bg = C.green },
				CmpItemKindEnum = { fg = C.base, bg = C.green },
				CmpItemKindUnit = { fg = C.base, bg = C.green },
				CmpItemKindClass = { fg = C.base, bg = C.yellow },
				CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
				CmpItemKindFile = { fg = C.base, bg = C.blue },
				CmpItemKindInterface = { fg = C.base, bg = C.yellow },
				CmpItemKindColor = { fg = C.base, bg = C.red },
				CmpItemKindReference = { fg = C.base, bg = C.red },
				CmpItemKindEnumMember = { fg = C.base, bg = C.red },
				CmpItemKindStruct = { fg = C.base, bg = C.blue },
				CmpItemKindValue = { fg = C.base, bg = C.peach },
				CmpItemKindEvent = { fg = C.base, bg = C.blue },
				CmpItemKindOperator = { fg = C.base, bg = C.blue },
				CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
				CmpItemKindCopilot = { fg = C.base, bg = C.teal },
				TelescopeBorder = { fg = C.base, bg = C.base },
				TelescopeNormal = { bg = C.base },
				TelescopePreviewBorder = { fg = C.base, bg = C.base },
				TelescopePreviewNormal = { bg = C.base },
				TelescopePreviewTitle = { fg = C.base, bg = C.green },
				TelescopePromptBorder = { fg = C.surface0, bg = C.surface0 },
				TelescopePromptNormal = { fg = C.blue, bg = C.surface0 },
				TelescopePromptPrefix = { fg = C.red, bg = C.surface0 },
				TelescopePromptTitle = { fg = C.base, bg = C.red },
				TelescopeResultsBorder = { fg = C.base, bg = C.base },
				TelescopeResultsNormal = { bg = C.base },
				TelescopeResultsTitle = { fg = C.base, bg = C.base },
			}
		end,
		flavor = "mocha",
		integrations = {
			cmp = true,
			noice = true,
			treesitter = true,
			neotree = true,
			overseer = true,
			notify = true,
			telescope = {
				enabled = true,
				style = "nvchad",
			},
			which_key = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
		},
	},
	priority = 1000,
}
