
local ReplicatefStorage = game:GetService("ReplicatedStorage")
local ShinyCrystal = ReplicatefStorage:WaitForChild("ShinyCrystal")
local DropList = require(script.Parent.Parent:WaitForChild("DropList"))
local ServerStorge = game:GetService("ServerStorage")
--local ClonePickupAndTTL = ServerStorge:WaitForChild("PickupAndTTLScript"):WaitForChild("Pickup & TTL"):Clone()

local module = {}







function generateID(length)
	local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local id = ""
	for i = 1, length do
		local rand = math.random(1, #charset)
		id = id .. charset:sub(rand, rand)
	end
	return id
end

function module:SendDataToShinyOrb(ItemProperty,MobProperty)

	local ShinyCrystalClone = ShinyCrystal:FindFirstChild(ItemProperty.ArtifactRarity):Clone()
	ShinyCrystalClone.Parent = game.Workspace


	
	-- ตรวจสอบว่า MobModel มี PrimaryPart หรือไม่
	if MobProperty.MobModel.PrimaryPart then
		local primaryPartCFrame = MobProperty.MobModel.PrimaryPart.CFrame
		local randomOffset = Vector3.new(math.random(-5, 5), 0, math.random(-5, 5)) -- กำหนดระยะสุ่ม

		-- กำหนดตำแหน่งใหม่โดยการเพิ่ม offset
		local newPosition = primaryPartCFrame.Position + randomOffset
		ShinyCrystalClone:SetPrimaryPartCFrame(CFrame.new(newPosition))
	else
		warn("MobModel No PrimaryPart")
	end

	local ItemData = Instance.new("Folder")
	ItemData.Name = "ItemData"
	ItemData.Parent = ShinyCrystalClone

	local Mutation = Instance.new("StringValue")
	Mutation.Name = "SubText"
	Mutation.Parent = ItemData
	Mutation.Value = "Artifact"

	local Rarity = Instance.new("StringValue")
	Rarity.Name = "Rarity"
	Rarity.Parent = ItemData
	Rarity.Value = ItemProperty.ArtifactRarity

	local TitleName = Instance.new("StringValue")
	TitleName.Name = "TitleName"
	TitleName.Parent = ItemData
	TitleName.Value = ItemProperty.TitleName
	
	local Owner_Name = Instance.new("StringValue")
	Owner_Name.Name = "Owner_Name"
	Owner_Name.Parent = ItemData
	Owner_Name.Value = tostring(MobProperty.PlayerNameKilled)
	
	--ClonePickupAndTTL.Parent = ShinyCrystalClone
	
	local ID = generateID(12)

	local GlobalTable = {


		LinkID = ID,
		Priority = "Artifact",
		Name = ItemProperty.ArtifactName,
		Rarity = ItemProperty.ArtifactRarity,
		Class = ItemProperty.ArtifactClass,
		
		Owner = tostring(MobProperty.PlayerNameKilled),
		TitleName = ItemProperty.TitleName,


		--[[Priority = "Weapon",
		WeaponName = _GetRewardName,
		WeaponRarity = _GetRarity,
		WeaponClass = _GetClass,
		TitleName = weapon.TitleName,
		LevelCap = weapon.Level_Cap,
		Mutation = _GetMutation]]
	}





	ShinyCrystalClone:SetAttribute("ID",ID)
	DropList:Add(GlobalTable)
	

	return true

end






return module
