return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		-- REQUIRED
		local harpoon = require("harpoon")
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>e", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<C-S-P>", function()
		-- 	harpoon:list():prev()
		-- end)
		-- vim.keymap.set("n", "<C-S-N>", function()
		-- 	harpoon:list():next()
		-- end)

		-- local harpoon = require("harpoon")
		-- harpoon:setup({})
		--
		-- -- basic telescope configuration
		-- local conf = require("telescope.config").values
		-- local function toggle_telescope(harpoon_files)
		-- 	local file_paths = {}
		-- 	for _, item in ipairs(harpoon_files.items) do
		-- 		table.insert(file_paths, item.value)
		-- 	end
		--
		-- 	local make_finder = function()
		-- 		local paths = {}
		-- 		for _, item in ipairs(harpoon_files.items) do
		-- 			table.insert(paths, item.value)
		-- 		end
		--
		-- 		return require("telescope.finders").new_table({
		-- 			results = paths,
		-- 		})
		-- 	end
		--
		-- 	require("telescope.pickers")
		-- 		.new({}, {
		-- 			prompt_title = "Harpoon",
		-- 			finder = require("telescope.finders").new_table({
		-- 				results = file_paths,
		-- 			}),
		-- 			previewer = conf.file_previewer({}),
		-- 			sorter = conf.generic_sorter({}),
		-- 			attach_mappings = function(prompt_buffer_number, map)
		-- 				map("i", "dd", function()
		-- 					local state = require("telescope.actions.state")
		-- 					local selected_entry = state.get_selected_entry()
		-- 					local current_picker = state.get_current_picker(prompt_buffer_number)
		--
		-- 					harpoon:list():remove(selected_entry)
		-- 					current_picker:refresh(make_finder())
		-- 				end)
		--
		-- 				return true
		-- 			end,
		-- 		})
		-- 		:find()
		-- end
		--
		-- vim.keymap.set("n", "<leader>a", function()
		-- 	harpoon:list():add()
		-- end)
		--
		-- vim.keymap.set("n", "<leader-S>a", function()
		-- 	harpoon:list():remove()
		-- end)
		--
		-- vim.keymap.set("n", "<C-e>", function()
		-- 	toggle_telescope(harpoon:list())
		-- end, { desc = "Open harpoon window" })
		--
		-- -- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<C-S-p>", function()
		-- 	harpoon:list():prev()
		-- end)
		-- vim.keymap.set("n", "<C-S-N>", function()
		-- 	harpoon:list():next()
		-- end)
	end,
}
