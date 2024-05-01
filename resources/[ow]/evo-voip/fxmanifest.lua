game("gta5")
fx_version("cerulean")
client_script("@evo-base/components/cl_error.lua")
client_script("@evo-pwnzor/client/check.lua")

lua54("yes")

client_scripts({
	"shared/**/*.lua",
	"client/**/*.lua",
})

server_scripts({
	"shared/**/*.lua",
	"server/**/*.lua",
})
