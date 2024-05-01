fx_version("cerulean")
game("gta5")
lua54("yes")

client_script("@evo-base/components/cl_error.lua")
client_script("@evo-pwnzor/client/check.lua")

client_scripts({
	"shared/**/*.lua",
	"client/**/*.lua",
})

server_scripts({
	"shared/**/*.lua",
	"server/**/*.lua",
})
