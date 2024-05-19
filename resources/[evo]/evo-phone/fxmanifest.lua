name("ARP Phone")
description("Phone Written For ARP")
author("[Alzar]")
version("v1.0.0")
url("https://www.mythicrp.com")
lua54("yes")
fx_version("cerulean")
game("gta5")
client_script("@evo-base/components/cl_error.lua")
client_script("@evo-pwnzor/client/check.lua")

ui_page("ui/dist/index.html")

server_script("@oxmysql/lib/MySQL.lua")

files({
	"ui/dist/*.*",
})

client_scripts({
	"client/*.lua",
	"client/apps/**/*.lua",
})

server_scripts({
	"server/*.lua",
	"server/apps/**/*.lua",
})
