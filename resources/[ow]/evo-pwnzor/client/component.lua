AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Pwnzor", PWNZOR)
end)

PWNZOR = PWNZOR or {}
