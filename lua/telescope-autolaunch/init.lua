-- lua/custom/autolaunch/init.lua
local M = {}

function M.setup()
	local Job = require("plenary.job")
	local cwd = vim.fn.getcwd()

	if vim.bo.filetype ~= "gitcommit" then
		Job:new({
			cwd = cwd,
			command = "git",
			args = { "rev-parse", "--is-inside-work-tree" },
			on_exit = function(j, _)
				local result = j:result()
				-- If inside a git repo, launch telescope.find_files
				if #result > 0 and result[1] == "true" then
					vim.schedule(function()
						require("telescope.builtin").find_files()
					end)
				end
			end,
		}):start()
	end
end

return M
