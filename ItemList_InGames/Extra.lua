local module = {}

local AllExtraIngame = {


	-- [""] = { TitleWeaponName = "",Level_Cap = , Rarity = "",Weapon_Class = "" };

	-- Mythical Zone
	

	Divine = {
		
		WingSult = {
			
			
		},
		
		Driver = {

			["DivaMetaSong"] = { TitleName = "Diva Meta Song",Level_Cap = 60}
		},
		
		
	},
		

	Mythical = {

		WingSult = {


		},

		Driver = {

			
		},


	},

	Legendary = {
		
		WingSult = {

			["PlasmaOpticWing"] = {TitleName = "Plasma Optic Wing",Level_Cap = 60}
		},

		Driver = {


		},
	},

	Rare = {
		
		WingSult = {


		},

		Driver = {


		},
	},

	Uncommon = {
		
		WingSult = {


		},

		Driver = {


		},
	},

	Common = {
		
		WingSult = {


		},

		Driver = {


		},
	}


}


function module:CheckItemList(_GetRewardName,_GetRarity,_GetClass,_GetMutation)




	local ExtraClass = AllExtraIngame[_GetRarity][_GetClass]

	if ExtraClass and ExtraClass[_GetRewardName] then

		local Extra = ExtraClass[_GetRewardName]
		print("Found Weapon In Game")

		return {


			Priority = "Extra",
			ExtraName = _GetRewardName,
			ExtraRarity = _GetRarity,
			ExtraClass = _GetClass,
			TitleName = Extra.TitleName,
			LevelCap = Extra.Level_Cap,
			Mutation = _GetMutation


		}


	else
		print("No Extra Found")
		return nil
	end



end


return module
