

local ServerScriptService = game:GetService("ServerScriptService")
local MutationListFolder = ServerScriptService:WaitForChild("MutationList")

local MutationList = require(MutationListFolder:WaitForChild("MutationList"))
local ItemList_InGameFolder = ServerScriptService:WaitForChild("ItemList_InGame")






local module = {}




local Divine_Chance = 0.0002
local Mythical_Chance =  0.002 
local Legendary_Chance =  0.02 
local Rare_Chance =  0.2
local Uncommon_Chance =  2
local Common_Chance =  5

local Divine_Reward = {

	["DivaMetaSong"] = { Priority = "Extra" , Rate_Drop = 100 , Item_Class = "Driver"} ,


}

local Mythical_Reward = {



	["JackHawk"] = { Priority ="Extra" , Rate_Drop = 5 , Item_Class = "Driver"} ,
	["Pixel"] = { Priority ="Aura" , Rate_Drop = 5} ,
	["Tomore"] = { Priority ="Item", Rate_Drop = 10 } ,
	["PandoraEater"] = { Priority = "Weapon" , Rate_Drop = 20 , Item_Class = "GreatSword"} ,
	["CyberVenom"] = { Priority ="Weapon" , Rate_Drop = 20 , Item_Class = "Katana"} ,
	["BurnedHorn"] = { Priority ="Artifact", Rate_Drop = 20 , Item_Class = "Amulet"} ,
	["Argivy"] = { Priority ="Artifact",Rate_Drop = 20, Item_Class = "Gems" } 



}



local Legendary_Reward = {

	["Lasernet"] = { Priority ="Aura"  , Rate_Drop = 5},
	["PlasmaOpticWing"] = { Priority ="Extra"  , Rate_Drop = 15, Item_Class = "WingSult"},

	["BloodHound"] = { Priority ="Weapon"  , Rate_Drop = 20 , Item_Class = "Shield"} ,
	["BraveHero"] = { Priority ="Weapon"  , Rate_Drop = 20 , Item_Class = "Sword"} ,
	["ThunderMoon"] = { Priority ="Aura"  , Rate_Drop = 20} ,
	["GoldenWatch"] = { Priority ="Item"  , Rate_Drop = 20} 


}



local Rare_Reward = {

	["Petal"] = { Priority ="Aura" , Rate_Drop = 10 },
	["Amethyst"] = { Priority ="Weapon"  , Rate_Drop = 45, Item_Class = "Spear"} ,
	["MediumEnergyOrb"] = { Priority ="Item"  , Rate_Drop = 45} 


}




local Uncommon_Reward = {

	["Vamtide"] = { Priority ="Weapon"  , Rate_Drop = 50 , Item_Class = "Sword"} ,
	["SmallEnergyOrb"] = { Priority ="Item"  , Rate_Drop = 50 } ,


}



local Common_Reward = {

	["Kepler"] = { Priority ="Weapon", Rate_Drop = 50 , Item_Class = "Dagger" } ,
	["Tenshido"] = { Priority ="Weapon", Rate_Drop = 50 , Item_Class = "Katana"} ,


}





Min_VictusCoin = 1
Max_VictusCoin = 10


local ChangeToPercentage = 10000


local function RandomNumber()

	local RandomNumber = math.random(1, 1000000)

	return RandomNumber

end

local function RandomRewardChance()

	local RandomNumber = math.random(1, 100)

	return RandomNumber

end



local function DivineRandomReward()


	local number = RandomNumber()

	if number <= Divine_Chance * ChangeToPercentage then

		local number = RandomRewardChance()

		local SummarizeRateDrop = 0

		for RewardName , RewardDrop in pairs(Divine_Reward) do

			SummarizeRateDrop  +=  RewardDrop.Rate_Drop

			if number <= SummarizeRateDrop then

				if RewardDrop.Priority == "Weapon" or RewardDrop.Priority == "Extra" then 

					local Mutation = MutationList:Mutation()
					local Item_Class = RewardDrop.Item_Class

					warn("You Got :",RewardDrop.Priority,Mutation,RewardName ,"Divine Drop")

					return RewardName , RewardDrop.Priority , Mutation , Item_Class


				elseif RewardDrop.Priority == "Artifact" then


					local Item_Class = RewardDrop.Item_Class


					warn("You Got :",RewardDrop.Priority,RewardName ,"Divine Drop")



					return RewardName , RewardDrop.Priority , nil , Item_Class

				end

				warn("You Got :",RewardDrop.Priority,RewardName ,"Divine Drop")


				return RewardName , RewardDrop.Priority , nil , nil

			end


		end


	else

		return nil , nil , nil , nil
	end



end


local function MythicalRandomReward()

	local number = RandomNumber()

	if number <= Mythical_Chance * ChangeToPercentage then

		local number = RandomRewardChance()

		local SummarizeRateDrop = 0

		for RewardName , RewardDrop in pairs(Mythical_Reward) do

			SummarizeRateDrop  +=  RewardDrop.Rate_Drop

			if number <= SummarizeRateDrop then

				if RewardDrop.Priority == "Weapon" or RewardDrop.Priority == "Extra" then 

					local Mutation = MutationList:Mutation()
					local Item_Class = RewardDrop.Item_Class

					warn("You Got :",RewardDrop.Priority,Mutation,RewardName ,"Mythical Drop")

					return RewardName , RewardDrop.Priority , Mutation , Item_Class


				elseif RewardDrop.Priority == "Artifact" then


					local Item_Class = RewardDrop.Item_Class


					warn("You Got :",RewardDrop.Priority,RewardName ,"Mythical Drop")



					return RewardName , RewardDrop.Priority , nil , Item_Class

				end

				warn("You Got :",RewardDrop.Priority,RewardName ,"Mythical Drop")


				return RewardName , RewardDrop.Priority , nil , nil

			end


		end


	else

		return nil , nil , nil , nil
	end

end

local function LegendaryRandomReward()

	local number = RandomNumber()

	if number <= Legendary_Chance * ChangeToPercentage then

		local number = RandomRewardChance()

		local SummarizeRateDrop = 0

		for RewardName , RewardDrop in pairs(Legendary_Reward) do

			SummarizeRateDrop  +=  RewardDrop.Rate_Drop

			if number <= SummarizeRateDrop then

				if RewardDrop.Priority == "Weapon" or RewardDrop.Priority == "Extra" then 

					local Mutation = MutationList:Mutation()
					local Item_Class = RewardDrop.Item_Class

					warn("You Got :",RewardDrop.Priority,Mutation,RewardName ,"Legendary Drop")

					return RewardName , RewardDrop.Priority , Mutation , Item_Class


				elseif RewardDrop.Priority == "Artifact" then


					local Item_Class = RewardDrop.Item_Class


					warn("You Got :",RewardDrop.Priority,RewardName ,"Legendary Drop")



					return RewardName , RewardDrop.Priority , nil , Item_Class

				end

				warn("You Got :",RewardDrop.Priority,RewardName ,"Legendary Drop")


				return RewardName , RewardDrop.Priority , nil , nil

			end


		end


	else

		return nil , nil , nil , nil
	end
end

local function RareRandomReward()

	local number = RandomNumber()

	if number <= Rare_Chance * ChangeToPercentage then

		local number = RandomRewardChance()

		local SummarizeRateDrop = 0

		for RewardName , RewardDrop in pairs(Rare_Reward) do

			SummarizeRateDrop  +=  RewardDrop.Rate_Drop

			if number <= SummarizeRateDrop then

				if RewardDrop.Priority == "Weapon" or RewardDrop.Priority == "Extra" then 

					local Mutation = MutationList:Mutation()
					local Item_Class = RewardDrop.Item_Class

					warn("You Got :",RewardDrop.Priority,Mutation,RewardName ,"Rare Drop")

					return RewardName , RewardDrop.Priority , Mutation , Item_Class


				elseif RewardDrop.Priority == "Artifact" then


					local Item_Class = RewardDrop.Item_Class


					warn("You Got :",RewardDrop.Priority,RewardName ,"Rare Drop")



					return RewardName , RewardDrop.Priority , nil , Item_Class

				end

				warn("You Got :",RewardDrop.Priority,RewardName ,"Rare Drop")


				return RewardName , RewardDrop.Priority , nil , nil

			end


		end


	else

		return nil , nil , nil , nil
	end

end

local function UncommonRandomReward()

	local number = RandomNumber()

	if number <= Uncommon_Chance * ChangeToPercentage then

		local number = RandomRewardChance()

		local SummarizeRateDrop = 0

		for RewardName , RewardDrop in pairs(Uncommon_Reward) do

			SummarizeRateDrop  +=  RewardDrop.Rate_Drop

			if number <= SummarizeRateDrop then

				if RewardDrop.Priority == "Weapon" or RewardDrop.Priority == "Extra" then 

					local Mutation = MutationList:Mutation()
					local Item_Class = RewardDrop.Item_Class

					warn("You Got :",RewardDrop.Priority,Mutation,RewardName ,"Uncommon Drop")

					return RewardName , RewardDrop.Priority , Mutation , Item_Class


				elseif RewardDrop.Priority == "Artifact" then


					local Item_Class = RewardDrop.Item_Class


					warn("You Got :",RewardDrop.Priority,RewardName ,"Uncommon Drop")



					return RewardName , RewardDrop.Priority , nil , Item_Class

				end

				warn("You Got :",RewardDrop.Priority,RewardName ,"Uncommon Drop")


				return RewardName , RewardDrop.Priority , nil , nil

			end


		end


	else

		return nil , nil , nil , nil
	end

end

local function CommonRandomReward()


	local number = RandomNumber()

	if number <= Common_Chance * ChangeToPercentage then

		local number = RandomRewardChance()

		local SummarizeRateDrop = 0

		for RewardName , RewardDrop in pairs(Common_Reward) do

			SummarizeRateDrop  +=  RewardDrop.Rate_Drop

			if number <= SummarizeRateDrop then

				if RewardDrop.Priority == "Weapon" or RewardDrop.Priority == "Extra" then 

					local Mutation = MutationList:Mutation()
					local Item_Class = RewardDrop.Item_Class

					warn("You Got :",RewardDrop.Priority,Mutation,RewardName ,"Common Drop")

					return RewardName , RewardDrop.Priority , Mutation , Item_Class


				elseif RewardDrop.Priority == "Artifact" then


					local Item_Class = RewardDrop.Item_Class


					warn("You Got :",RewardDrop.Priority,RewardName ,"Divine Drop")



					return RewardName , RewardDrop.Priority , nil , Item_Class

				end

				warn("You Got :",RewardDrop.Priority,RewardName ,"Common Drop")


				return RewardName , RewardDrop.Priority , nil , nil

			end


		end


	else

		return nil , nil , nil , nil
	end

end





local function HandleReward(rewardFunc,Rarity,MobProperty)
	local reward, rewardPriority, mutationResult , Item_Class = rewardFunc()
	if rewardPriority == nil then return true end
	local priorityModule = require(ItemList_InGameFolder:FindFirstChild(rewardPriority))


	local Item_Property = {

		Reward_Name = reward,
		Reward_Priority = rewardPriority,
		Rarity = Rarity,
		Item_Class = Item_Class,
		Mutation = mutationResult

	}




	if reward then
		if rewardPriority == "Weapon" or rewardPriority == "Extra" then
			local TableProperty = priorityModule:CheckItemList(Item_Property.Reward_Name,Item_Property.Rarity,Item_Class,Item_Property.Mutation)


			if TableProperty then
				print("Ready To Clone Weapon",TableProperty.TitleName)

				local ShinyCrystalDrop = require(ServerScriptService:WaitForChild("RewardDrop"):WaitForChild("ShinyCrystalDrop"))


				local Confirm_Monster_Destroy = ShinyCrystalDrop:FindItemPriority(TableProperty,MobProperty)
				print(Confirm_Monster_Destroy)
				return Confirm_Monster_Destroy
			else
				print("Failed to find ",rewardPriority, "details")
				return true
			end

		elseif rewardPriority == "Artifact" then 

			local ArtifactTableProperty = priorityModule:CheckItemList(Item_Property.Reward_Name,Item_Property.Rarity,Item_Class)

			if ArtifactTableProperty then
				print("Ready To Clone Weapon",ArtifactTableProperty.TitleName)

				local ShinyCrystalDrop = require(ServerScriptService:WaitForChild("RewardDrop"):WaitForChild("ShinyCrystalDrop"))


				local Confirm_Monster_Destroy = ShinyCrystalDrop:FindItemPriority(ArtifactTableProperty,MobProperty)
				print(Confirm_Monster_Destroy)
				return Confirm_Monster_Destroy
			else
				print("Failed to find Artifact details")
				return true
			end

		elseif rewardPriority == "Item" then 

			local ItemTableProperty = priorityModule:CheckItemList(Item_Property.Reward_Name,Item_Property.Rarity)

			if ItemTableProperty then
				print("Ready To Clone Weapon",ItemTableProperty.TitleName)

				local ShinyCrystalDrop = require(ServerScriptService:WaitForChild("RewardDrop"):WaitForChild("ShinyCrystalDrop"))


				local Confirm_Monster_Destroy = ShinyCrystalDrop:FindItemPriority(ItemTableProperty,MobProperty)
				print(Confirm_Monster_Destroy)
				return Confirm_Monster_Destroy 
			else
				print("Failed to find Item details")
				return true
			end


		end
		return true
	else
		print("No reward obtained")
		return true
	end
end

function module:Random_Drop(Mob_Property)
	local CheckedCommon = HandleReward(CommonRandomReward,"Common",Mob_Property)
	local CheckedUncommon = HandleReward(UncommonRandomReward,"Uncommon",Mob_Property)
	local CheckedRare = HandleReward(RareRandomReward,"Rare",Mob_Property)
	local CheckedLegendary = HandleReward(LegendaryRandomReward,"Legendary",Mob_Property)
	local CheckedMythical = HandleReward(MythicalRandomReward,"Mythical",Mob_Property)
	local CheckedDivine = HandleReward(DivineRandomReward,"Divine",Mob_Property)

	if CheckedCommon and CheckedUncommon and CheckedRare and CheckedLegendary and CheckedMythical and CheckedDivine then return true end
end


return module
