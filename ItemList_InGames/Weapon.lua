local module = {}

local AllWeaponIngame = {
	Divine = {
		Katana = {
			["Ithil"] = { TitleName = "Ithil", Level_Cap = 50}
		},
		Sword = {},
		Dagger = {},
		Spear = {},
		Gunner = {},
		Shield = {},
		Bow = {},
		Hammer = {},
		Gauntlet = {},
		Sniper = {
			["NewJersey"] = { TitleName = "New Jersey", Level_Cap = 50}
		},
		Rifle = {},
		GreatSword = {},
		Halbert = {},
	},

	Mythical = {
		Katana = {
			["CyberVenom"] = { TitleName = "Cyber Venom", Level_Cap = 50}
		},
		Halbert = {
			["Dreamer"] = { TitleName = "Dreamer", Level_Cap = 50}
		},
		Bow = {
			["Benet"] = { TitleName = "Benet", Level_Cap = 50}
		},
		GreatSword = {
			["PandoraEater"] = { TitleName = "Pandora Eater", Level_Cap = 50}
		},
		Sword = {},
		Dagger = {},
		Spear = {},
		Gunner = {},
		Shield = {},
		Hammer = {},
		Gauntlet = {},
		Sniper = {},
		Rifle = {},
	},

	Legendary = {
		Shield = {
			["BloodHound"] = { TitleName = "Bloodhound", Level_Cap = 50}
		},
		Sword = {
			["BraveHero"] = { TitleName = "Brave Hero", Level_Cap = 50}
		},
		Sniper = {
			["Silenus"] = { TitleName = "Silenus", Level_Cap = 45}
		},
		Rifle = {
			["Tashmiter"] = { TitleName = "Tashmiter", Level_Cap = 25}
		},
		Katana = {},
		Dagger = {},
		Spear = {},
		Gunner = {},
		Bow = {},
		Hammer = {},
		Gauntlet = {},
		GreatSword = {},
		Halbert = {},
	},

	Rare = {
		Spear = {
			["Amethyst"] = { TitleName = "Amethyst", Level_Cap = 12}
		},
		Gunner = {
			["Blaster"] = { TitleName = "Blaster", Level_Cap = 10}
		},
		Hammer = {
			["JackNautis"] = { TitleName = "Jack Nautis", Level_Cap = 15}
		},
		Katana = {},
		Sword = {},
		Dagger = {},
		Shield = {},
		Bow = {},
		Gauntlet = {},
		Sniper = {},
		Rifle = {},
		GreatSword = {},
		Halbert = {},
	},

	Uncommon = {
		Sword = {
			["Vamtide"] = { TitleName = "Vamtide", Level_Cap = 10}
		},
		Gauntlet = {
			["Huanlao"] = { TitleName = "Huanlao", Level_Cap = 10}
		},
		Katana = {},
		Dagger = {},
		Spear = {},
		Gunner = {},
		Shield = {},
		Bow = {},
		Hammer = {},
		Sniper = {},
		Rifle = {},
		GreatSword = {},
		Halbert = {},
	},

	Common = {
		Dagger = {
			["Kepler"] = { TitleName = "Kepler", Level_Cap = 5}
		},
		Katana = {
			["Tenshido"] = { TitleName = "Tenshido", Level_Cap = 2}
		},
		Sword = {},
		Spear = {},
		Gunner = {},
		Shield = {},
		Bow = {},
		Hammer = {},
		Gauntlet = {},
		Sniper = {},
		Rifle = {},
		GreatSword = {},
		Halbert = {},
	}
}





function module:CheckItemList(_GetRewardName,_GetRarity,_GetClass,_GetMutation)




	local weaponClass = AllWeaponIngame[_GetRarity][_GetClass]
	
	if weaponClass and weaponClass[_GetRewardName] then
		
		local weapon = weaponClass[_GetRewardName]
		print("Found Weapon In Game")
		
		return {
			
			
			Priority = "Weapon",
			WeaponName = _GetRewardName,
			WeaponRarity = _GetRarity,
			WeaponClass = _GetClass,
			TitleName = weapon.TitleName,
			LevelCap = weapon.Level_Cap,
			Mutation = _GetMutation
			
			
		}
		
		
	else
		print("No Weapon Found")
		return nil
	end
	
	
	
end



return module
