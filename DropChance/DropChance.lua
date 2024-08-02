

local Creature = {}



local Monster = {
	Zombie = {Level = 25},
	Strong_Zombie = {Level = 50},
	Shiny_Zombie = {Level = 100}
}




function Creature:MonsterKilled(MobName,Mob_Property)
	
	if Monster[MobName] then
		
		local ScriptName = tostring(Mob_Property.CreatureType.."Drop")

		local CreatureDrop = require(script.Parent:FindFirstChild(ScriptName))

		local Confirm_Monster_Destroy = CreatureDrop:Killed(MobName,Mob_Property)
		--print(Confirm_Monster_Destroy)
		return Confirm_Monster_Destroy
		
		
	else
		print("Monster Not Found")
		
		return true
	end
	
	
	
end




return Creature
