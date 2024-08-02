


local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")


--Location Zone
local ProfileServiceFolder = ServerScriptService:WaitForChild("ProfileServiceFolder")
local PlayerBackpackFolder = ServerScriptService:WaitForChild("PlayerBackpack")

--Require  ProfileServiceFolder Zone
local ProfileService = require(ProfileServiceFolder:WaitForChild("ProfileServiceModule"):WaitForChild("ProfileService"))
local PlayerStatsStarter = require(ProfileServiceFolder:WaitForChild("ProfileServiceModule"):WaitForChild("PlayerStatsStarter"))
local LoadBackpack = require(ProfileServiceFolder:WaitForChild("ProfileServiceModule"):WaitForChild("LoadBackpack"))




--Require  ProfileServiceFolder Zone
local PlayerBackpackModule = require(PlayerBackpackFolder:WaitForChild("PlayerBackpack"))
 

local DataStoreKey = "_KeyData"
local GetProflieStarter = ProfileService.GetProfileStore(DataStoreKey, PlayerStatsStarter)


local PhysicsService = game:GetService("PhysicsService")


local datamanager = {}
datamanager.Profile = {} 



local function setPlayerCollisionGroup(character)
	for _, part in ipairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CollisionGroup = "Players"
		end
	end
end




local function PlayerAdded(player: Player) -- นำ SLAZROSS , game:GetService("Players") เข้า parameter
	local LoadProflie = GetProflieStarter:LoadProfileAsync("PlayerID_"..player.UserId)

	if LoadProflie ~= nil then


		LoadProflie:AddUserId(player.UserId) -- ตรวจสอบให้แน่ใจว่า playerID ตรงกับผู้เล่น
		LoadProflie:Reconcile() --ในกรณีเราเพิ่ม Stat ผู้เล่นเข้าไปใหม่ใน PlayerStatStarter จะเพิ่มเข้าไปเก็บก่อนที่ผู้เล่นจะ save
		LoadProflie:ListenToRelease(function() -- บรรทัดนี้จะทำงาน เมื่อฟังชั่น Release() ทำงาน 
			-- ลบโปรไฟล์ของผู้เล่นออกจาก data manager
			datamanager.Profile[player] = nil -- ล้างข้อมูลทิ้ง
			-- เตะผู้เล่นออกเพื่อป้องกันปัญหาเพิ่มเติมเกี่ยวกับความสมบูรณ์ของข้อมูล
			player:Kick()
		end)

		if player:IsDescendantOf(Players) then --ถ้าผู้เล่น เช่น SLAZROSS เป็นลูกหลานของ game:GetService("Players")
			datamanager.Profile[player] = LoadProflie

			--[[if datamanager.Profile[player].Data.ProflieAvatar then
			
			--Libraly here 
			
				datamanager.Profile[player].Data.ProflieAvatar = nil
				
				datamanager.Profile[player].Data.Backpack.Weapon = nil

			end]] -- To Delete Table


			datamanager.Profile[player].Data.Stats.PlayerClass = "Citizen"
			
			datamanager.Profile[player].Data.Backpack.Weapon = nil
			
			print(datamanager.Profile[player])
			
			local PlayerBackpack = datamanager.Profile[player].Data.Backpack
			
			local DataTable = LoadBackpack:LoadBackpack(player,PlayerBackpack)



			
			PlayerBackpackModule:GetBackpack() 
				

			local function onCharacterAdded(character)
				-- รอให้ตัวละครถูกโหลดเสร็จ
				character:WaitForChild("HumanoidRootPart")
				setPlayerCollisionGroup(character)
			end

			-- เชื่อมต่อ CharacterAdded กับผู้เล่นที่เข้ามาใหม่
			player.CharacterAdded:Connect(onCharacterAdded)

			-- ถ้าผู้เล่นมีตัวละครอยู่แล้ว ให้ตั้งค่า CollisionGroup ทันที
			if player.Character then
				onCharacterAdded(player.Character)
			end
			
			
			
		else
			LoadProflie:Release() --ถ้าโปรไฟล์ของผู้เล่นเข้ามาแล้วชื่อไม่ตรงกัน จะล้างข้อมูลทิ้ง และ ไปทำงาน  LoadProflie:ListenToRelease
		end
	else
		player:Kick()
	end

end





local function PlayerRemoving(player)
	local PlayerProfileStat = datamanager.Profile[player]
	local PlayerBackpack = PlayerProfileStat.Data.Backpack

	
	

	
	



	if PlayerProfileStat then
		PlayerProfileStat:Release()
	end
	-- Save Whole Data PlayerInventory
	--print(WeaponPlayerInv)
end

-- เรียกใช้ฟังก์ชัน PlayerRemoving เมื่อผู้เล่นออกจากเกม
for _, player in pairs(Players:GetPlayers()) do
	task.spawn(PlayerRemoving, player)
end



Players.PlayerAdded:Connect(PlayerAdded)
Players.PlayerRemoving:Connect(PlayerRemoving)



return datamanager
