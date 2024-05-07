AddEventHandler("Buffs:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Buffs = exports["evo-base"]:FetchComponent("Buffs")
	Hud = exports["evo-base"]:FetchComponent("Hud")
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Progress = exports["evo-base"]:FetchComponent("Progress")
	Action = exports["evo-base"]:FetchComponent("Action")
	Keybinds = exports["evo-base"]:FetchComponent("Keybinds")
	ListMenu = exports["evo-base"]:FetchComponent("ListMenu")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	Minigame = exports["evo-base"]:FetchComponent("Minigame")
	Interaction = exports["evo-base"]:FetchComponent("Interaction")
	Utils = exports["evo-base"]:FetchComponent("Utils")
	Phone = exports["evo-base"]:FetchComponent("Phone")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	Weapons = exports["evo-base"]:FetchComponent("Weapons")
	Jail = exports["evo-base"]:FetchComponent("Jail")
	Animations = exports["evo-base"]:FetchComponent("Animations")
	Admin = exports["evo-base"]:FetchComponent("Admin")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Buffs", {
		"Buffs",
		"Hud",
		"Callbacks",
		"Action",
		"Progress",
		"Keybinds",
		"ListMenu",
		"Notification",
		"Minigame",
		"Interaction",
		"Utils",
		"Phone",
		"Inventory",
		"Weapons",
		"Jail",
		"Animations",
		"Admin",
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()
	end)
end)

local _runningIds = 1
local _buffDefs = {}

local _BUFFS = {
	RegisterBuff = function(self, id, icon, color, duration, type)
		_buffDefs[id] = {
			icon = icon,
			color = color,
			duration = duration,
			type = type,
		}
		SendNUIMessage({
			type = "REGISTER_BUFF",
			data = {
				id = id,
				data = {
					icon = icon,
					color = color,
					duration = duration,
					type = type,
				},
			},
		})
	end,
	ApplyBuff = function(self, buffId, val, override)
		SendNUIMessage({
			type = "BUFF_APPLIED",
			data = {
				instance = {
					buff = buffId,
					override = override,
					val = val,
				}
			},
		})
	end,
	ApplyUniqueBuff = function(self, buffId, val, override)
		SendNUIMessage({
			type = "BUFF_APPLIED_UNIQUE",
			data = {
				instance = {
					buff = buffId,
					override = override,
					val = val,
				}
			},
		})
	end,
	UpdateBuff = function(self, buffId, nVal)
		SendNUIMessage({
			type = "BUFF_UPDATED",
			data = {
				buff = buffId,
				val = nVal,
			},
		})
	end,
	IconOverride = function(self, buffId, override)
		SendNUIMessage({
			type = "BUFF_UPDATED",
			data = {
				buff = buffId,
				override = override,
			},
		})
	end,
	RemoveBuffType = function(self, buffId)
		SendNUIMessage({
			type = "REMOVE_BUFF_BY_TYPE",
			data = {
				type = buffId,
			},
		})
	end,
}

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Buffs", _BUFFS)
end)
