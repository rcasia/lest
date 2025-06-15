local argparse = require("argparse")
local mini = require("mini.test")

-- Create an argument parser
local parser = argparse("script", "An example.")
parser:option("--pattern", "Test pattern. Default: '**/*_spec.lua'")
parser:option("--directory", "Test directory. Default: 'spec'")

local args = parser:parse()

--- @param opts { pattern: string?, directory: string? }
local function run(opts)
	local pattern = opts.pattern or "**/*_spec.lua"
	local directory = opts.directory or "spec"

	mini.setup({
		collect = {
			find_files = function()
				return vim.fn.globpath(directory, pattern, true, true)
			end,
		},
	})
	mini.run()
end

run({ pattern = args.pattern, directory = args.directory })
