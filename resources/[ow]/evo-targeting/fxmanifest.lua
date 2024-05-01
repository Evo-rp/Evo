fx_version("cerulean")
game("gta5")
lua54("yes")
client_script("@evo-base/components/cl_error.lua")
client_script("@evo-pwnzor/client/check.lua")

client_scripts({
	"@evo-polyzone/client.lua",
	"@evo-polyzone/BoxZone.lua",
	"@evo-polyzone/EntityZone.lua",
	"@evo-polyzone/CircleZone.lua",
	"@evo-polyzone/ComboZone.lua",

	"client/*.lua",
	"client/targets/*.lua",
})
