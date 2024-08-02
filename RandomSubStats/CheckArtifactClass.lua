local module = {}

local ServerScriptService = game:GetService("ServerScriptService")
local MainStatChecker = ServerScriptService:WaitForChild("MainStatChecker")

function module:CheckClass(PacketData)

	local ArtifactClass = PacketData.Class
	local AftifactClassSubStats = require(script.Parent:WaitForChild("CheckArtifactClass"):FindFirstChild(ArtifactClass))


	local SubStatTable = AftifactClassSubStats:RandomSubstat()
	
	local MainStatTable = require(MainStatChecker:WaitForChild(PacketData.Priority))
	local MainStats = MainStatTable:GetMainStats(PacketData)
	

	local SummarizeStats = require(script.Parent:WaitForChild("SummarizeAmuletStats"))

	print(SubStatTable)
	print(MainStats)

	if not MainStats then print("No Artifact MainStat Plaease Check it") return end

	local CreateNewArtifact  = SummarizeStats:CreateArtifact(MainStats,SubStatTable,PacketData)

	return CreateNewArtifact --return afterfinished
	

end











return module
