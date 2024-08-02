local module = {}

local StatsTable = {
	"Attack_Speed",
	"Walk_Speed",


}

local StarterStatRanges = {
	Attack_Speed = {-20, 50},
	Walk_Speed = {1, 3},

}

local function RandomStarterMainStat(statName)
	local range = StarterStatRanges[statName]
	return math.random(range[1], range[2])
end

local function GenerateNumberMainStat(statName)
	local value = RandomStarterMainStat(statName)

	-- Use a table to convert percentage values to fractions
	local percentageStats = {
		Attack_Speed = true,


	}

	if percentageStats[statName] then
		value = value / 100
	end

	return value
end

function module:RandomStat()
	local tempStatsTable = {table.unpack(StatsTable)}

	local randomIndex = math.random(1, #tempStatsTable)
	local selectedStat = tempStatsTable[randomIndex]

	local ArtifactMainStats = {}
	ArtifactMainStats[selectedStat] = GenerateNumberMainStat(selectedStat)

	return ArtifactMainStats
end

return module
