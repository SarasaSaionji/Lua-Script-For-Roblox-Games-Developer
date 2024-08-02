local PlayerBackpack = require(script.Parent.Parent:WaitForChild("PlayerBackpack"))

local ServerScriptService = game:GetService("ServerScriptService")
local RandomSubStats = ServerScriptService:WaitForChild("RandomSubStats")

local CheckWeaponClass = require(RandomSubStats:WaitForChild("CheckWeaponClass")) 
local PlayerBackpack = require(script.Parent.Parent:WaitForChild("PlayerBackpack"))

local module = {}

function module:AddToInventory(PacketData)
	
	local MaxWeapon , TotalWeapon = PlayerBackpack:RequireWeaponCapacity()
	
	if TotalWeapon < MaxWeapon then
		--Send To Add into Inventory And this is A WeaponModule So Add Weapon To Module
		local CreateNewWeapon = CheckWeaponClass:CheckClass(PacketData)
		
		PlayerBackpack:AddWeapon(CreateNewWeapon)
		
		return true -- return for delete table droplist
		
	else
		
		return false
	end
	
end



return module
