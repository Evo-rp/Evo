fx_version("cerulean")
games({ "gta5" })
lua54("yes")
client_script("@evo-base/components/cl_error.lua")
client_script("@evo-pwnzor/client/check.lua")

author("Dr Nick")
version("v1.0.0")
url("https://www.mythicrp.com")

server_scripts({
	"shared/**/*.lua",
	"server/**/*.lua",
})

client_scripts({
	"shared/**/*.lua",
	"client/**/*.lua",
})
