fx_version("cerulean")
lua54("yes")
game("gta5")
client_script("@evo-base/components/cl_error.lua")
client_script("@evo-pwnzor/client/check.lua")

files({
	"defaultsettings.dat",
	"visualsettings.dat",
})

client_scripts({
	"client/*.lua",
})

server_scripts({
	"server/*.lua",
})
