local module = {}



local StatsTable = {
	"Critical_Damage",
	"Critical_Chance",
	"Piercing",
	"Attack_Damage",
	"Attack_Speed",
	"Defense",
	"Health",
	"Energy",
	"Walk_Speed",
}

local StarterStatRanges = {
	Critical_Chance = {-5, 5},
	Critical_Damage = {-10, 15},
	Piercing = {-5, 10},
	Attack_Damage = {-10, 20},
	Attack_Speed = {-10, 20},
	Defense = {20, 50},
	Health = {100, 200},
	Energy = {20, 50},
	Walk_Speed = {-4, 5},
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

	local WeaponSubStats =  GenerateNumberSubStats(collectStat)
	return WeaponSubStats
end

return module
