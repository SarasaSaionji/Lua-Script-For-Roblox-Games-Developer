local module = {}

local AllItemIngame = {


	Divine = {


	},

	Mythical = {

		["Tomore"] = { TitleName = "Tomore"}
		

	},

	Legendary = {
		["GoldenWatch"] = { TitleName = "Golden Watch"}	
	},

	Rare = {
		["MediumEnergyOrb"] = { TitleName = "Medium Energy Orb"} 
	},

	Uncommon = {
		["SmallEnergyOrb"] = { TitleName = "Small Energy Orb"} 
	},

	Common = {

	}
}

function module:CheckItemList(_GetRewardName,_GetRarity)




	local ItemName = AllItemIngame[_GetRarity][_GetRewardName]

	if ItemName  then


		return {


			Priority = "Item",
			ItemName = _GetRewardName,
			ItemRarity = _GetRarity,
			TitleName = ItemName.TitleName,
			
			

		}


	else
		print("No Item Found")
		return nil
	end



end



return module
