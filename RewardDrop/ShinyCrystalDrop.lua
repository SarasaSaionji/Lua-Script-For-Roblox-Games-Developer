local module = {}



local RewardDropFolder = script.Parent






function module:FindItemPriority(ItemPropertyTable,MobProperty)
	
	local Data_Priority = require(RewardDropFolder:WaitForChild("ShinyCrystalDrop"):WaitForChild(ItemPropertyTable.Priority))
	
	local Confirm_Monster_Destroy = Data_Priority:SendDataToShinyOrb(ItemPropertyTable,MobProperty)
	

	return Confirm_Monster_Destroy
end












return module
