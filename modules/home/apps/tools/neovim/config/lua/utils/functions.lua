local M = {}

local input = function(prompt, callback)
	local value = vim.fn.input(prompt)
	if value:len() ~= 0 then
		callback(value)
	end
end

local select = function(prompt, callback)
	vim.ui.select({ "tabs", "spaces" }, {
		prompt = prompt,
	}, function(choice)
		if choice then
			callback(choice)
		end
	end)
end

M.freeze = function()
	local path = "./._freeze.png"

	vim.cmd("Freeze")

	-- Run the shell command 'wl-copy <path>' after 'Freeze' completes
	vim.fn.system("wl-copy < " .. path)
	vim.fn.system("rm " .. path)
end

M.freeze_selection = function()
	local path = "./._freeze.png"

	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", false, true, true), "nx", false)
	-- Retrieve buffer ID for the current buffer
	local buf = vim.api.nvim_get_current_buf()

	-- Get positions of the start ('<') and end ('>') of the visual selection
	local start_pos = vim.api.nvim_buf_get_mark(buf, "<")
	local end_pos = vim.api.nvim_buf_get_mark(buf, ">")

	-- Retrieve the line numbers from the positions
	local start_line = start_pos[1]
	local end_line = end_pos[1]

	-- Execute the 'Freeze' command on the selected range
	vim.cmd(start_line .. "," .. end_line .. "Freeze")

	-- Run the shell command 'wl-copy <path>' after 'Freeze' completes
	vim.fn.system("wl-copy < " .. path)
	vim.fn.system("rm " .. path)
end

M.set_filetype = function()
	input("Set filetype: ", function(value)
		vim.bo[0].filetype = value
		vim.notify("Filetype set to " .. value)
	end)
end

M.set_indent = function()
	input("Set indentation: ", function(value)
		local type = vim.bo[0].expandtab and "spaces" or "tabs"
		local parsed = tonumber(value)

		if parsed then
			vim.bo[0].shiftwidth = parsed
			vim.notify("Indentation set to " .. value .. " " .. type)
		else
			vim.notify("Invalid value", vim.log.levels.ERROR)
		end
	end)
end

M.set_indent_type = function()
	select("Indent using: ", function(choice)
		if choice == "spaces" then
			vim.o.expandtab = true
		else
			vim.o.expandtab = false
		end

		vim.notify("Indentation using " .. choice)
	end)
end

M.toggle_wrap = function()
	vim.wo.wrap = not vim.wo.wrap
	vim.wo.linebreak = not vim.wo.linebreak
end

M.comment_line = function()
	require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end

M.comment_selection = function()
	vim.cmd("normal <esc>")
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end

M.first_buffer = function()
	require("bufferline").go_to(1)
end
M.last_buffer = function()
	require("bufferline").go_to(-1)
end

M.buf_hsplit = function()
	require("bufferline.pick").choose_then(function(id)
		local name = vim.api.nvim_buf_get_name(id)
		vim.cmd("sp" .. name)
		vim.cmd("wincmd x")
		vim.cmd("wincmd w")
	end)
end

M.buf_vsplit = function()
	require("bufferline.pick").choose_then(function(id)
		local name = vim.api.nvim_buf_get_name(id)
		vim.cmd("vsp" .. name)
		vim.cmd("wincmd x")
		vim.cmd("wincmd w")
	end)
end

M.open_lazygit = function()
	require("toggleterm.terminal").Terminal
		:new({
			cmd = "lazygit",
			hidden = true,
			float_opts = {
				width = 100,
				height = 25,
			},
			on_close = function()
				if package.loaded["neo-tree"] then
					require("neo-tree.events").fire_event("git_event")
				end
			end,
		})
		:open()
end

M.open_glow = function()
	require("toggleterm.terminal").Terminal
		:new({
			cmd = "glow",
			hidden = true,
			float_opts = {
				width = 100,
				height = 25,
			},
		})
		:open()
end

M.open_dapui = function()
	require("neo-tree").close_all()
	require("dapui").open()
end

M.close_dapui = function()
	require("dapui").close()
end

M.toggle_dapui = function()
	vim.cmd("NeoTreeShowToggle")
	require("dapui").toggle()
end

return M
