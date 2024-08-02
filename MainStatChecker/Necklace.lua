local module = {}

local StatsTable = {
	"Attack",
	"Defense"

}

local StarterStatRanges = {
	Attack = {20, 50},
	Defense = {-12, 15}
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

	local ArtifactMainStats = {}
	ArtifactMainStats[selectedStat] = GenerateNumberMainStat(selectedStat)

	return ArtifactMainStats
end

return module
