
rockspec_format = "3.0"
package = "luxuriest.nvim"
version = "0.1.0-1"

description = {
summary = "",
maintainer = "Ricardo Casía",
labels = {
"",
},
}

dependencies = {
"lua ==5.1",
"argparse ==0.7.1",
}

source = {
url = "https://github.com/rcasia/luxuriest.nvim",
}

test = {
type = "busted",
}

build = {
type = "builtin",
}