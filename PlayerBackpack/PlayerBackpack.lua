


local LoadBackpack = require(script.Parent.Parent:WaitForChild("ProfileServiceFolder")
	:WaitForChild("ProfileServiceModule"):WaitForChild("LoadBackpack"))





local PlayerBackpack = {}

PlayerBackpack.Artifact = {}
PlayerBackpack.Weapon = {}
PlayerBackpack.Aura = {}
PlayerBackpack.Item = {}
PlayerBackpack.Extra = {}



local MaxWeapon_Capacity = 0
local MaxArtifact_Capacity = 0
local MaxAura_Capacity = 0
local MaxItem_Capacity = 0
local MaxExtra_Capacity  = 0


local Total_Weapon = 0
local Total_Artifact = 0
local Total_Aura = 0
local Total_Item = 0
local Total_Extra = 0


function PlayerBackpack:UpdateTotalWeapon()
	if not self.Weapon then
		self.Weapon = {}  -- ตรวจสอบให้แน่ใจว่ามีตารางเพื่อหลีกเลี่ยงข้อผิดพลาด
	end

	Total_Weapon = 0  -- รีเซ็ต Total_Weapon ก่อนเริ่มการอัปเดต

	for i, v in pairs(self.Weapon) do
		if Total_Weapon < MaxWeapon_Capacity then
			Total_Weapon = Total_Weapon + 1
		else
			self.Weapon[i] = nil
		end
	end

	print(MaxWeapon_Capacity, Total_Weapon)
end

function PlayerBackpack:UpdateTotalArtifact()
	if not self.Artifact then
		self.Artifact = {}  -- ตรวจสอบให้แน่ใจว่ามีตารางเพื่อหลีกเลี่ยงข้อผิดพลาด
	end

	Total_Artifact = 0  -- รีเซ็ต Total_Artifact ก่อนเริ่มการอัปเดต

	for i, v in pairs(self.Artifact) do
		if Total_Artifact < MaxArtifact_Capacity then
			Total_Artifact = Total_Artifact + 1
		else
			self.Artifact[i] = nil
		end
	end

	print(MaxArtifact_Capacity, Total_Artifact)
end

function PlayerBackpack:UpdateTotalAura()
	if not self.Aura then
		self.Aura = {}  -- ตรวจสอบให้แน่ใจว่ามีตารางเพื่อหลีกเลี่ยงข้อผิดพลาด
	end

	Total_Aura = 0  -- รีเซ็ต Total_Aura ก่อนเริ่มการอัปเดต

	for i, v in pairs(self.Aura) do
		if Total_Aura < MaxAura_Capacity then
			Total_Aura = Total_Aura + 1
		else
			self.Aura[i] = nil
		end
	end

	print(MaxAura_Capacity, Total_Aura)
end

function PlayerBackpack:UpdateTotalExtra()
	if not self.Extra then
		self.Extra = {}  -- ตรวจสอบให้แน่ใจว่ามีตารางเพื่อหลีกเลี่ยงข้อผิดพลาด
	end

	Total_Extra = 0  -- รีเซ็ต Total_Extra ก่อนเริ่มการอัปเดต

	for i, v in pairs(self.Extra) do
		if Total_Extra < MaxExtra_Capacity then
			Total_Extra = Total_Extra + 1
		else
			self.Extra[i] = nil
		end
	end

	print(MaxExtra_Capacity, Total_Extra)
end

function PlayerBackpack:UpdateTotalItem()
	if not self.Item then
		self.Item = {}  -- ตรวจสอบให้แน่ใจว่ามีตารางเพื่อหลีกเลี่ยงข้อผิดพลาด
	end

	Total_Extra = 0  -- รีเซ็ต Total_Extra ก่อนเริ่มการอัปเดต

	for i, v in pairs(self.Item) do
		if Total_Item < MaxItem_Capacity then
			Total_Extra = Total_Item + 1
		else
			self.Item[i] = nil
		end
	end

	print(MaxItem_Capacity, Total_Item)
end

function PlayerBackpack:GetBackpack()
	
	
	local PlayerCapacity = LoadBackpack:RequirePlayerCapacity()
	
	
	MaxWeapon_Capacity = PlayerCapacity.Weapon_Capacity
	MaxArtifact_Capacity = PlayerCapacity.Artifact_Capacity
	MaxAura_Capacity = PlayerCapacity.Aura_Capacity
	MaxItem_Capacity = PlayerCapacity.Item_Capacity
	MaxExtra_Capacity = PlayerCapacity.Extra_Capacity
	
	
	
	
	
	local PlayerInventory = LoadBackpack:RequirePlayerBackpack()
	
	
	self.Equiping = PlayerInventory.Equiping or {}
	self.Weapon = PlayerInventory.Weapon or {}
	self.Artifact = PlayerInventory.Artifact or {}
	self.Aura = PlayerInventory.Aura or {}
	self.Item = PlayerInventory.Item or {}
	self.Extra = PlayerInventory.Extra or {}
	
	PlayerBackpack:UpdateTotalWeapon()
	PlayerBackpack:UpdateTotalArtifact()
	PlayerBackpack:UpdateTotalAura()
	PlayerBackpack:UpdateTotalExtra()
	PlayerBackpack:UpdateTotalItem()
	
	print(self)
	
end

function PlayerBackpack:RequireWeaponCapacity()
	
	
	return MaxWeapon_Capacity , Total_Weapon
	
end

function PlayerBackpack:RequireArtifactCapacity()


	return MaxWeapon_Capacity , Total_Weapon

end


function PlayerBackpack:AddWeapon(NewWeapon)
	
	local weaponID = next(NewWeapon)
	
	self.Weapon[weaponID] = NewWeapon[weaponID]
	
	print(self.Weapon)
	
	
end

return PlayerBackpack
