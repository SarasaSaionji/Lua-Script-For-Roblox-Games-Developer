
local ServerScriptService = game:GetService("ServerScriptService")
local PlayerBackpack = ServerScriptService:WaitForChild("PlayerBackpack")
local AddInventory = require(PlayerBackpack:WaitForChild("AddInventory"))






local ShinyOnDrop = {}

-- ตารางสำหรับเก็บข้อมูลไอเท็ม
ShinyOnDrop.Items = {}






function ShinyOnDrop:Add(GlobalTable)
	-- เพิ่มไอเท็มใหม่ลงในตาราง Items
	
	if GlobalTable.Priority == "Weapon" or GlobalTable.Priority == "Extra" then
		
		self.Items[GlobalTable.LinkID] = {
			Priority = GlobalTable.Priority,
			Name = GlobalTable.Name,
			Rarity = GlobalTable.Rarity,
			Class = GlobalTable.Class,
			LevelCap = GlobalTable.LevelCap,
			Owner = tostring(GlobalTable.Owner),
			TitleName = GlobalTable.TitleName,
			Mutation = GlobalTable.Mutation
			
		}
		
		
		
	elseif GlobalTable.Priority == "Artifact" then
		
		
		
		self.Items[GlobalTable.LinkID] = {
			Priority = GlobalTable.Priority,
			Name = GlobalTable.Name,
			Rarity = GlobalTable.Rarity,
			Class = GlobalTable.Class,
			Owner = tostring(GlobalTable.Owner),
			TitleName = GlobalTable.TitleName,


		}
	 
		
	elseif GlobalTable.Priority == "Item" or GlobalTable.Priority == "Aura" then
		
		self.Items[GlobalTable.LinkID] = {
			Priority = GlobalTable.Priority,
			Name = GlobalTable.Name,
			Rarity = GlobalTable.Rarity,
			Owner = tostring(GlobalTable.Owner),
			TitleName = GlobalTable.TitleName,


		}
		
	else
		
		
		warn("No Priority Matching")
		
	end
	
	
	

	print(self.Items)
end


function ShinyOnDrop:RemoveItemFromList(ID)

	self.Items[ID] = nil 


end

function ShinyOnDrop:CheckLocalDrop(ID, player: Player)
	-- ตรวจสอบว่ามีไอเท็มอยู่ในตาราง self.Items และเจ้าของไอเท็มตรงกับผู้เล่นหรือไม่
	if self.Items[ID] then
		
		if self.Items[ID].Owner == player.Name then
			print(player.Name, "was the owner of this item")
			print(player.Name, "Checking Backpack")
			
			local PacketData = self.Items[ID]

			
			local BackPackIsNotFull = AddInventory:FindPriority(PacketData)
			
			if BackPackIsNotFull then
				
				print("Add Item Into Inventory")
				ShinyOnDrop:RemoveItemFromList(ID)
				return true
				
			else
				
				print("Backpack Is Full")
				return false
			end
			
			
		else
			print("You are not the owner of this item")
			return false
		end
	else
		print("This item wasn't dropped correctly")
		return false
	end
	
end





function ShinyOnDrop:AddToBackpack()
	
	
	
	
end



return ShinyOnDrop



--[[


		LinkID = ID,
		Priority = "Item",
		Name = ItemProperty.ItemName,
		Rarity = ItemProperty.WeaponRarity,
		Owner = tostring(MobProperty.PlayerNameKilled),
		TitleName = ItemProperty.TitleName,

		LinkID = ID,
		Priority = "Artifact",
		Name = ItemProperty.ArtifactName,
		Rarity = ItemProperty.ArtifactRarity,
		Class = ItemProperty.ArtifactClass,
		Owner = tostring(MobProperty.PlayerNameKilled),
		TitleName = ItemProperty.TitleName,
		
		LinkID = ID,
		Priority = "Aura",
		Name = ItemProperty.AuraName,
		Rarity = ItemProperty.AuraRarity,

		Owner = tostring(MobProperty.PlayerNameKilled),
		TitleName = ItemProperty.TitleName,
		
		LinkID = ID,
		Priority = "Extra",
		Name = ItemProperty.ExtraName,
		Rarity = ItemProperty.ExtraRarity,
		Class = ItemProperty.ExtraClass,
		LevelCap = ItemProperty.LevelCap,
		Owner = tostring(MobProperty.PlayerNameKilled),
		TitleName = ItemProperty.TitleName,
		Mutation = ItemProperty.Mutation
		
		LinkID = ID,
		Priority = "Weapon",
		Name = ItemProperty.WeaponName,
		Rarity = ItemProperty.WeaponRarity,
		Class = ItemProperty.WeaponClass,
		LevelCap = ItemProperty.LevelCap,
		Owner = tostring(MobProperty.PlayerNameKilled),
		TitleName = ItemProperty.TitleName,
		Mutation = ItemProperty.Mutation

]]