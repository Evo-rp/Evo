fx_version("cerulean")
game("gta5")
lua54("yes")
client_script("@fs-base/components/cl_error.lua")
client_script("@fs-pwnzor/client/check.lua")

client_scripts({
	"@fs-polyzone/client.lua",
	"@fs-polyzone/BoxZone.lua",
	"@fs-polyzone/EntityZone.lua",
	"@fs-polyzone/CircleZone.lua",
	"@fs-polyzone/ComboZone.lua",

	"client/*.lua",
	"client/targets/*.lua",
})
