local argparse = require("argparse")
local mini = require("mini.test")

-- Create an argument parser
local parser = argparse(
	"lest",
	[[
A CLI interface around echasnovski/mini.test
for Neovim plugins developed as Lux Projects
]]
)
parser:option("--pattern", "Test pattern. Default: '**/*_spec.lua'")
parser:option("-d --directory", "Test directory. Default: 'spec'")

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
