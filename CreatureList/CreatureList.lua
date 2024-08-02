local CreatureList = {}

local ServerScriptService = game:GetService("ServerScriptService")

local DropChance = require(ServerScriptService:WaitForChild("DropChance"):WaitForChild("DropChance"))






local MobList = {
	
	
	
}





function MobChecking(MobLocation,ID)
	
	if MobLocation:GetAttribute("Creature_ID") == ID then
		return true
		
	else
		
		return false
	end
	
end



function CreatureList:MobSpawned(ID, MobName,MobLocation)
	
	local Checking = MobChecking(MobLocation,ID)
	
	
	if Checking then
		
		local MobTable = {
			
			
			["Creature_Name"] = MobName , ["Level"] = MobLocation:GetAttribute("Level") 
			
			
		}
		
		-- Store the MobName with the unique ID
		MobList[ID] = MobTable
		-- Store ["UOqZpTt9wavH"] = "Zombie"

		-- Print the MobName for the given ID
		
		--print(MobTable)
		--print(ID,MobLocation:GetAttribute("Creature_ID"))
		
		
	else
		warn("No Mob Name ",MobName,"In this game Found")
		return
		
	end

	
	
end

function CreatureList:MobDied(MobName,Mob_Property)


	if MobList[Mob_Property.Creature_ID] then 
		
		
		
		MobList[Mob_Property.Creature_ID] = nil
		local Confirm_Monster_Destroy =  DropChance:MonsterKilled(MobName,Mob_Property)
		--print(Confirm_Monster_Destroy)
		return Confirm_Monster_Destroy
	else
		
		warn("No Mob Found")
		return true
		
	end

		
	


end



function CreatureList:SearchMobByID(ID)
	
	
	return MobList[ID]
	
	
end





return CreatureList
