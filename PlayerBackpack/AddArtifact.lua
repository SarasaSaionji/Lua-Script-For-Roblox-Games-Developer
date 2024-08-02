local PlayerBackpack = require(script.Parent.Parent:WaitForChild("PlayerBackpack"))

local ServerScriptService = game:GetService("ServerScriptService")
local RandomSubStats = ServerScriptService:WaitForChild("RandomSubStats")

local CheckArtfactClass = require(RandomSubStats:WaitForChild("CheckArtifactClass")) 
local PlayerBackpack = require(script.Parent.Parent:WaitForChild("PlayerBackpack"))

local module = {}

function module:AddToInventory(PacketData)

	local MaxArtifact , TotalArtifact = PlayerBackpack:RequireArtifactCapacity()

	if TotalArtifact < MaxArtifact then
		--Send To Add into Inventory And this is A WeaponModule So Add Weapon To Module
		local CreateNewArtifact = CheckArtfactClass:CheckClass(PacketData)

		--PlayerBackpack:AddWeapon(CreateNewArtifact)

		return true -- return for delete table droplist

	else

		return false
	end

end



return module
