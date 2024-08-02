-- สร้างตารางต้นแบบ (prototype table) สำหรับคลาส Backpack
local Backpack = {}

-- เพิ่มเมธอดในคลาส Backpack
function Backpack:LoadBackpack(player: Player,BackpackOnCloud)
	
	
	self.Equiping = BackpackOnCloud.Equiping
	self.Weapon = BackpackOnCloud.Weapon
	self.Artifact = BackpackOnCloud.Artifact
	self.Aura = BackpackOnCloud.Aura
	self.Item = BackpackOnCloud.Item
	self.Extra = BackpackOnCloud.Extra
	
	--Load Capacity 
	
	self.Weapon_Capacity = BackpackOnCloud.Weapon_Capacity
	self.Artifact_Capacity = BackpackOnCloud.Artifact_Capacity
	self.Aura_Capacity = BackpackOnCloud.Item_Capacity
	self.Extra_Capacity = BackpackOnCloud.Extra_Capacity
	self.Item_Capacity = BackpackOnCloud.Item_Capacity
	
end


function Backpack:RequirePlayerBackpack()
	
	return {
		
		
		
		Equiping = self.Equiping,
		Weapon = self.Weapon,
		Artifact = self.Artifact,
		Aura = self.Aura,
		Item = self.Item,
		Extra = self.Extra,
		
	}
	
	
end


function Backpack:RequirePlayerCapacity()

	return {
		
		
		Weapon_Capacity = self.Weapon_Capacity,
		Artifact_Capacity = self.Artifact_Capacity,
		Item_Capacity = self.Item_Capacity,
		Aura_Capacity = self.Aura_Capacity,
		Extra_Capacity = self.Extra_Capacity,



	}


end


return Backpack
