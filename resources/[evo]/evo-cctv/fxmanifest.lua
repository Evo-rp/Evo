fx_version("cerulean")
game("gta5")
lua54("yes")

client_script("@evo-base/components/cl_error.lua")
client_script("@evo-pwnzor/client/check.lua")

client_scripts({
	"config/client.lua",
	"config/shared.lua",
	"client/**/*.lua",
})

server_scripts({
	"config/server.lua",
	"config/shared.lua",
	"server/**/*.lua",
})
