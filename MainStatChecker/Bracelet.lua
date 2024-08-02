local module = {}

local StatsTable = {
	"Attack",
	"Health",
	"Energy",
	"Defense"

}

local StarterStatRanges = {
	Attack = {20, 50},
	Health = {1, 3},
	Energy = {20, 50},
	Defense = {1, 3},

}

local function RandomStarterMainStat(statName)
	local range = StarterStatRanges[statName]
	return math.random(range[1], range[2])
end

local function GenerateNumberMainStat(statName)
	local value = RandomStarterMainStat(statName)

	-- Use a table to convert percentage values to fractions

	return value
end

function module:RandomStat()
	local tempStatsTable = {table.unpack(StatsTable)}

	local randomIndex = math.random(1, #tempStatsTable)
	local selectedStat = tempStatsTable[randomIndex]

	local WeaponSubStats = {}
	WeaponSubStats[selectedStat] = GenerateNumberMainStat(selectedStat)

	return WeaponSubStats
end

return module
