return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},

	config = function()
		vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }

		local function open_neotree(args)
			vim.cmd("Neotree action=focus source=buffers position=right")
			-- vim.cmd("Neotree action=focus source=git_status position=right")
			if args then
				vim.cmd(string.format("Neotree %s action=focus source=filesystem position=left", args))
			else
				vim.cmd("Neotree ${args} action=focus source=filesystem position=left")
			end
		end

		local function check_if_opened_with_dir()
			local args = vim.fn.argv()
			if #args > 0 then
				local arg = args[1]
				if vim.fn.isdirectory(arg) == 1 then
					open_neotree(arg)
				end
			else
				open_neotree(".")
			end
		end

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = check_if_opened_with_dir,
		})

		vim.keymap.set("n", "<C-f>", function()
			local manager = require("neo-tree.sources.manager")
			local renderer = require("neo-tree.ui.renderer")
			local state = manager.get_state("filesystem")
			local window_exists = renderer.window_exists(state)

			if window_exists then
				vim.cmd("Neotree close")
			else
				open_neotree(".")
			end
		end, { desc = "Toggle [N]eo[T]ree" })
		-- move to right panel if neovim tree is open by using '<C-l>'
		vim.keymap.set("n", "<C-Space>l", function()
			vim.cmd("wincmd l")
		end, { desc = "Move to right panel" })
		vim.keymap.set("n", "<C-Space>h", function()
			vim.cmd("wincmd h")
		end, { desc = "Move to left panel" })

		require("neo-tree").setup({
			enable_git_status = true,
			enable_diagnostics = true,
			close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab

			filesystem = {
				hijack_netrw_behavior = "disabled", -- hijack netrw window on startup
				filtered_items = {
					visible = false, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false, -- only works on Windows for hidden files/directories
					hide_by_name = {
						"node_modules",
					},
					always_show = { -- remains visible even if other settings would normally hide it
						--".gitignored",
					},
					never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
						--".DS_Store",
						--"thumbs.db"
					},
					never_show_by_pattern = { -- uses glob style patterns
						--".null-ls_*",
					},
				},
			},
		})
	end,
}
