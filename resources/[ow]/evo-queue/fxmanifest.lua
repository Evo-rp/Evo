fx_version("cerulean")
games({ "gta5" })
lua54("yes")
client_script("@evo-base/components/cl_error.lua")
client_script("@evo-pwnzor/client/check.lua")

server_only("yes")

server_scripts({
	"config.lua",
	"server/*.lua",
})
