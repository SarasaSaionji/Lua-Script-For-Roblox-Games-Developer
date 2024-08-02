local module = {}

local AllArtifactIngame = {


	Divine = {
		Amulet = {
		},
		Bracelet = {},
		Ring = {},
		Gems = {},
		Necklace = {},

	},

	Mythical = {
		Amulet = {
			["BurnedHornAmulet"] = { TitleName = "Burned Horn Amulet", Level_Cap = 50},
			["ThunderHorn"] = { TitleName = "ThunderHorn", Level_Cap = 50}
		},
		Bracelet = {
			["BurnedHornBracelet"] = { TitleName = "Burned Horn Bracelet", Level_Cap = 50}
		},
		Ring = {},
		Gems = {
			["ArgivyGems"] = { TitleName = "Argivy Gems", Level_Cap = 50}	
		},
		Necklace = {},
		Apparel = {},
		Relic = {}
	},

	Legendary = {
		Amulet = {

		},
		Bracelet = {},
		Ring = {},
		Gems = {},
		Necklace = {},
		Apparel = {},
		Relic = {}
	},

	Rare = {
		Amulet = {

		},
		Bracelet = {},
		Ring = {},
		Gems = {},
		Necklace = {},
		Apparel = {},
		Relic = {}
	},

	Uncommon = {
		Amulet = {

		},
		Bracelet = {},
		Ring = {},
		Gems = {},
		Necklace = {},
		Apparel = {},
		Relic = {}
	},

	Common = {
		Amulet = {
		},
		Bracelet = {},
		Ring = {},
		Gems = {},
		Necklace = {},
		Apparel = {},
		Relic = {}
	}
}

function module:CheckItemList(_GetRewardName,_GetRarity,_GetClass)

	local ArtifactClass = AllArtifactIngame[_GetRarity][_GetClass]

	if ArtifactClass and ArtifactClass[_GetRewardName] then

		local Artifact = ArtifactClass[_GetRewardName]
		print("Found Weapon In Game")

		return {


			Priority = "Artifact",
			ArtifactName = _GetRewardName,
			ArtifactRarity = _GetRarity,
			ArtifactClass = _GetClass,
			TitleName = Artifact.TitleName,
			LevelCap = Artifact.Level_Cap,


		}


	else
		print("No Artifact Found")
		return nil
	end
end



return module
