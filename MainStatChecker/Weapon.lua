local MainWeaponStat = {
	
	Divine = {
		Katana = {
			["Ithil"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
		},
		Sword = {},
		Dagger = {},
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
	},

	Mythical = {
		Katana = {
			["CyberVenom"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
		},
		Halbert = {
			["Dreamer"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
		},
		Bow = {
			["Benet"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
		},
		GreatSword = {
			["PandoraEater"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
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
			["BloodHound"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
		},
		Sword = {
			["BraveHero"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
		},
		Sniper = {
			["Silenus"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
		},
		Rifle = {
			["Tashmiter"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
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
			["Amethyst"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
		},
		Gunner = {
			["Blaster"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
		},
		Hammer = {
			["JackNautis"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
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
			["Vamtide"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
		},
		Gauntlet = {
			["Huanlao"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
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
			["Kepler"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
		},
		Katana = {
			["Tenshido"] = {Attack = 50, Critical_Chance = 0.10 ,Attack_Speed = 0.50}
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



function MainWeaponStat:GetMainStats(PacketData)
	
	local rarity = PacketData.Rarity
	local Class = PacketData.Class
	local Name = PacketData.Name
	
	print("Checking MainStats")
	
	local weaponStats = self[rarity] and self[rarity][Class] and self[rarity][Class][Name]
	
	if weaponStats then
		
		local GetMainStat = self[rarity][Class][Name]
		
		
		return GetMainStat
	else
		return nil -- หรือจะคืนค่าที่ต้องการเมื่อไม่พบข้อมูล
	end
	
end



return MainWeaponStat
