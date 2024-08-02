local module = {}

local ServerScriptService = game:GetService("ServerScriptService")
local MainStatChecker = ServerScriptService:WaitForChild("MainStatChecker")

function module:CheckClass(PacketData)

	local WeaponClass = PacketData.Class
	local WeaponClassSubStats = require(script.Parent:WaitForChild("CheckWeaponClass"):FindFirstChild(WeaponClass))
	
	
	local SubStatTable = WeaponClassSubStats:RandomSubstat()
	local MainStatPriority = require(MainStatChecker:WaitForChild(PacketData.Priority))
	
	local MainStats = MainStatPriority:GetMainStats(PacketData)
	
	local SummarizeStats = require(script.Parent:WaitForChild("SummarizeWeaponStats"))
	
	print(SubStatTable)
	print(MainStats)
	
	if not MainStatPriority then print("No Weapon MainStat Plaease Check it") return end
	
	local CreateNewWeapon  = SummarizeStats:CreateWeapon(MainStats,SubStatTable,PacketData)
	
	return CreateNewWeapon --return afterfinished
	
end











return module
