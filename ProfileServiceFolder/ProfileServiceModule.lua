


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




local function PlayerAdded(player: Player) -- �� SLAZROSS , game:GetService("Players") ��� parameter
	local LoadProflie = GetProflieStarter:LoadProfileAsync("PlayerID_"..player.UserId)

	if LoadProflie ~= nil then


		LoadProflie:AddUserId(player.UserId) -- ��Ǩ�ͺ��������� playerID �ç�Ѻ������
		LoadProflie:Reconcile() --㹡ó�������� Stat ��������������� PlayerStatStarter �����������纡�͹�������蹨� save
		LoadProflie:ListenToRelease(function() -- ��÷Ѵ���зӧҹ ����Ϳѧ��� Release() �ӧҹ 
			-- ź�����ͧ�������͡�ҡ data manager
			datamanager.Profile[player] = nil -- ��ҧ�����ŷ��
			-- �м������͡���ͻ�ͧ�ѹ�ѭ�������������ǡѺ��������ó�ͧ������
			player:Kick()
		end)

		if player:IsDescendantOf(Players) then --��Ҽ����� �� SLAZROSS ���١��ҹ�ͧ game:GetService("Players")
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
				-- ��������Фö١��Ŵ����
				character:WaitForChild("HumanoidRootPart")
				setPlayerCollisionGroup(character)
			end

			-- �������� CharacterAdded �Ѻ�����蹷�����������
			player.CharacterAdded:Connect(onCharacterAdded)

			-- ��Ҽ������յ���Ф��������� ����駤�� CollisionGroup �ѹ��
			if player.Character then
				onCharacterAdded(player.Character)
			end
			
			
			
		else
			LoadProflie:Release() --��������ͧ��������������Ǫ������ç�ѹ ����ҧ�����ŷ�� ��� 价ӧҹ  LoadProflie:ListenToRelease
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

-- ���¡��ѧ��ѹ PlayerRemoving ����ͼ������͡�ҡ��
for _, player in pairs(Players:GetPlayers()) do
	task.spawn(PlayerRemoving, player)
end



Players.PlayerAdded:Connect(PlayerAdded)
Players.PlayerRemoving:Connect(PlayerRemoving)



return datamanager
