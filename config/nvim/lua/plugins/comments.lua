-- NOTE: Plugins can also be added by using a table,
-- with the first argument being the link and the following
-- keys can be used to configure plugin behavior/loading/etc.
--
-- Use `opts = {}` to force a plugin to be loaded.
--
--  This is equivalent to:
--    require('Comment').setup({})

return {
	"numToStr/Comment.nvim",
	opts = {},
	config = function()
		require("Comment").setup()
		local api = require("Comment.api")

		-- Toggle selection (linewise)
		-- Control-/ will comment out the current selection
		local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
		vim.keymap.set("x", "<C-_>", function()
			vim.api.nvim_feedkeys(esc, "nx", false)
			api.toggle.linewise(vim.fn.visualmode())
		end)
		-- Toggle selection (blockwise)
		-- Control-\ will comment out the current selection
		vim.keymap.set("x", "<C-\\>", function()
			vim.api.nvim_feedkeys(esc, "nx", false)
			api.toggle.blockwise(vim.fn.visualmode())
		end)
	end,
}
