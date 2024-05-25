fx_version("cerulean")
lua54("yes")
game("gta5")
client_script("@evo-base/components/cl_error.lua")
client_script("@evo-pwnzor/client/check.lua")

client_scripts({
	"client/**/*.lua",
})

shared_scripts({
	"shared/**/*.lua",
})

server_scripts({
	"@oxmysql/lib/MySQL.lua",
	"configs/**/*.lua",
	"server/**/*.lua",
})
