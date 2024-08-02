local module = {}

local StatsTable = {
	"Attack_Percent",
	"Health_Percent",
	"Energy_Percent",
	"Defense_Percent"

}

local StarterStatRanges = {
	Attack_Percent = {20, 50},
	Health_Percent = {-10, 20},
	Energy_Percent = {-10, 20},
	Defense_Percent = {-12, 15}
}

local function RandomStarterMainStat(statName)
	local range = StarterStatRanges[statName]
	return math.random(range[1], range[2])
end

local function GenerateNumberMainStat(statName)
	local value = RandomStarterMainStat(statName)

	-- Use a table to convert percentage values to fractions
	local percentageStats = {
		Attack_Percent = true,
		Health_Percent = true,
		Energy_Percent = true,
		Defense_Percent = true,
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
