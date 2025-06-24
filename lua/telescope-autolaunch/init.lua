-- lua/custom/autolaunch/init.lua
local M = {}

function M.setup()
	local Job = require("plenary.job")
	local cwd = vim.fn.getcwd()

	Job:new({
		command = "git",
		args = { "rev-parse", "--is-inside-work-tree" },
		cwd = cwd,
		on_exit = function(_, return_val)
			if return_val ~= 0 then
				vim.schedule(function()
					require("telescope.builtin").find_files()
				end)
				return
			end

			Job:new({
				command = "git",
				args = { "status", "--porcelain" },
				cwd = cwd,
				on_exit = function(j2, _)
					local result = j2:result()
					if #result > 0 then
						vim.schedule(function()
							require("telescope.builtin").git_status()
						end)
					else
						vim.schedule(function()
							require("telescope.builtin").find_files()
						end)
					end
				end,
			}):start()
		end,
	}):start()
end

return M
