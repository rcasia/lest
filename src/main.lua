local argparse = require("argparse")
local mini = require("mini.test")

local parser = argparse(
	"lest",
	[[
A CLI interface around echasnovski/mini.test
for Neovim plugins developed as Lux Projects
]]
)
parser:option("--pattern", "Test pattern. Default: '**/*_spec.lua'", "**/*_spec.lua")
parser:option("-d --directory", "Test directory. Default: 'spec'", "spec")

local args = parser:parse()

--- @param opts { pattern: string?, directory: string? }
local function run(opts)
	mini.setup({
		collect = {
			find_files = function()
				return vim.fn.globpath(opts.directory, opts.pattern, true, true)
			end,
		},
	})
	mini.run()
end

run({ pattern = args.pattern, directory = args.directory })
