local module = {}



local StatsTable = {
	
	"Critical_Damage",
	"Critical_Chance",
	"Attack_Damage",
	"Attack_Speed",
	"Defense",
	"Health",
	"Energy",
	"Walk_Speed",
	"Heal_Regen",
	"Heal_Percent",

}

local StarterStatRanges = {
	Critical_Chance = {-20, 5},
	Critical_Damage = {-20, 10},
	Attack_Damage = {-5, 20},
	Attack_Speed = {-20, 10},
	Defense = {50, 100},
	Health = {200, 400},
	Energy = {10, 50},
	Walk_Speed = {-10, 2},
	Heal_Regen = {20, 40},
	Heal_Percent = {1, 5},
}

local function RandomStarterSubStat(statName)
	local range = StarterStatRanges[statName]
	return math.random(range[1], range[2])
end


local function GenerateNumberSubStats(collectStat)
	local WeaponSubStats = {}

	for _, statName in ipairs(collectStat) do
		local value = RandomStarterSubStat(statName)

		-- Use a table to convert percentage values to fractions
		local percentageStats = {
			Critical_Chance = true,
			Critical_Damage = true,
			Piercing = true,
			Attack_Speed = true,
			Heal_Percent = true,
			Energy_Percent = true

		}

		if percentageStats[statName] then
			value = value / 100
		end

		WeaponSubStats[statName] = value
	end

	return WeaponSubStats
end


function module:RandomSubstat()
	local randomChooseStat = math.random(3, 5)
	local collectStat = {}

	-- Copy StatsTable to avoid modifying the original
	local tempStatsTable = {table.unpack(StatsTable)}

	for i = 1, randomChooseStat do
		if #tempStatsTable == 0 then
			break
		end

		local randomIndex = math.random(1, #tempStatsTable)
		local selectedStat = tempStatsTable[randomIndex]

		table.insert(collectStat, selectedStat)
		-- Remove selectedStat from tempStatsTable
		table.remove(tempStatsTable, randomIndex)
	end

	local WeaponSubStats = GenerateNumberSubStats(collectStat)
	return WeaponSubStats
end

return module
