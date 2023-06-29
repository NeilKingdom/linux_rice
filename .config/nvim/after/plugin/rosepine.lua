require("rose-pine").setup({
	--- auto / main / moon / dawn
	variant = "auto",
	--- main / moon / dawn
	dark_variant = "moon",
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	groups = {
		background = "none",
		background_nc = "_experimental_nc",
		panel = "surface",
		panel_nc = "base",
		border = "highlight_med",
		comment = "muted",
		link = "iris",
		punctuation = "subtle",

		error = "love",
		hint = "iris",
		info = "foam",
		warn = "gold",

		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		}
	},

   -- Highlight groups accept a fg color and a bg color
	highlight_groups = {
		ColorColumn = { bg = "rose" },
		CursorLine = { bg = "foam", blend = 10 },
		StatusLine = { fg = "love", bg = "love", blend = 10 },

      -- Treesitter
      ["@keyword"] = { fg = "iris" },
      ["@field"] = { fg = "pine" },
      ["@string"] = { fg = "#f9aa5b" },
      ["@number"] = { fg = "#f9aa5b" },

      -- Telescope
		TelescopeBorder = { fg = "highlight_high", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "base" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "base" },
		TelescopeSelectionCaret = { fg = "iris", bg = "iris" },
	}
})

vim.cmd("colorscheme rose-pine")
