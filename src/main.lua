local argparse = require("argparse")
local mini = require("mini.test")

-- Create an argument parser
local parser = argparse("script", "An example.")
parser:argument("input", "Input file.")

local args = parser:parse()

-- Directly print out the "input" argument
print(args.input)

vim.iter({ "algunas", "palabras" }):each(function(w)
	print(w)
end)
