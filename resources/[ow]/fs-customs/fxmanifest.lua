fx_version("cerulean")
games({ "gta5" })
lua54("yes")
client_script("@fs-base/components/cl_error.lua")
client_script("@fs-pwnzor/client/check.lua")

client_scripts({
	"config/**/*.lua",
	"client/**/*.lua",
})
