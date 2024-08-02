local CreateWeaponStat = {}

local MaxExp = {
	Common = 450000,
	Uncommon = 600000,
	Rare = 750000,
	Legendary = 900000,
	Mythical = 1050000,
	Divine = 1200000
}

-- Generate a unique ID for the weapon
local function generateID(length)
	local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local id = ""
	for i = 1, length do
		local rand = math.random(1, #charset)
		id = id .. charset:sub(rand, rand)
	end
	return id
end

-- Create a new weapon and return the data
function CreateWeaponStat:CreateWeapon(MainStatData, SubStatTable, PacketData)
	-- Generate a unique ID for the weapon
	local weaponID = generateID(12)

	local CreateNewWeapon = {}
	-- Determine MaxExp based on Rarity
	local rarity = PacketData.Rarity
	local maxExp = MaxExp[rarity] or 0  -- Default to 0 if rarity is not found

	-- Initialize the new weapon table with weaponID as the key
	CreateNewWeapon = { 
		[weaponID] = {
		Name = PacketData.Name,
		TitleName = PacketData.TitleName,
		Rarity = PacketData.Rarity,
		Class = PacketData.Class,
		Mutation = PacketData.Mutation,
		Player_Sign = PacketData.Rarity ~= "Divine" and "None" or PacketData.Owner,
		Level_Cap = PacketData.LevelCap,
		MaxExp = maxExp,
		CurrentEXP = 0,
		UpgradeTime = 0,
		Tradable = false,
		Equiping_Aura = {
			Equiping = false,
			Aura_Name = "None",
		},
		BaseStats = {},
		SubStats = {},
		}
	}

	-- Populate BaseStats from MainStatData
	for statName, statValue in pairs(MainStatData) do
		CreateNewWeapon[weaponID].BaseStats[statName] = { [1] = statValue }
	end

	-- Populate SubStats from SubStatTable
	for statName, statValue in pairs(SubStatTable) do
		CreateNewWeapon[weaponID].SubStats[statName] = { [1] = statValue }
	end


	return CreateNewWeapon

end

return CreateWeaponStat
