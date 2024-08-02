local Result = {}
local ServerScriptService = game:GetService("ServerScriptService")
local MutationListFolder = ServerScriptService:WaitForChild("MutationList")

local MutationList = require(MutationListFolder:WaitForChild("MutationList"))








function Result:Killed(MonsterName,Mob_Property)
	
	
	
	local Drop_ModuleName = tostring(Mob_Property.SpecialType.."_Drop")
	
	local SpecialMonsterModule = require(script:FindFirstChild(Drop_ModuleName))
	
	local Confirm_Monster_Destroy = SpecialMonsterModule:Random_Drop(Mob_Property)
	--print(Confirm_Monster_Destroy)
	return Confirm_Monster_Destroy
end


return Result
