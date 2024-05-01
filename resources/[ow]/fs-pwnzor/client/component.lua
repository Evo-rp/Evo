AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["fs-base"]:RegisterComponent("Pwnzor", PWNZOR)
end)

PWNZOR = PWNZOR or {}
