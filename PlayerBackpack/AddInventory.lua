local InsertBackpack = {}




function InsertBackpack:FindPriority(PacketData)
	

	local PriorityType = "Add"..PacketData.Priority 
	
	local PriorityAdd = require(script.Parent:WaitForChild("AddInventory"):FindFirstChild(PriorityType))
	
	
	local IsNotFull = PriorityAdd:AddToInventory(PacketData)
	
	
	return IsNotFull
	
end






return InsertBackpack
