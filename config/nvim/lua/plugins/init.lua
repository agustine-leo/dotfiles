-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	"github/copilot.vim",
	require("plugins.colorscheme"),
	require("plugins.lualine"),
	require("plugins.neo_tree"),
	require("plugins.comments"),
	require("plugins.getsigns"),
	require("plugins.which_key"),
	require("plugins.telescope"),
	require("plugins.nvim_cmp"),
	require("plugins.lsp_config"),
	require("plugins.conform"),
	require("plugins.todo_comments"),
	require("plugins.nvim_treesitter"),
	require("plugins.lazygit"),
	require("plugins.indent_blankline"),
	require("plugins.auto_pairs"),
	require("plugins.vim_multiple_cursors"),
	require("plugins.themes"),
	-- require("plugins.harpoon"),
	require("plugins.tabline"),

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	--    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
	-- { import = 'custom.plugins' },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
