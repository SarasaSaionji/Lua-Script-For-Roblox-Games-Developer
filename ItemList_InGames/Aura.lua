local module = {}

local AllItemIngame = {


	Divine = {


	},

	Mythical = {

		["Pixel"] = { TitleName = "Pixel Aura"}
		

	},

	Legendary = {
		["Lasernet"] = { TitleName = "Lasernet Aura"},
		["ThunderMoon"] = { TitleName = "Thunder Moon"}	
	},

	Rare = {
		["Petal"] = { TitleName = "Petal"} 
	},

	Uncommon = {
		
	},

	Common = {

	}
}

function module:CheckItemList(_GetRewardName,_GetRarity)




	local AuraName = AllItemIngame[_GetRarity][_GetRewardName]

	if AuraName  then


		return {


			Priority = "Aura",
			AuraName = _GetRewardName,
			AuraRarity = _GetRarity,
			TitleName = AuraName.TitleName,
			
			

		}


	else
		print("No Item Found")
		return nil
	end



end



return module
