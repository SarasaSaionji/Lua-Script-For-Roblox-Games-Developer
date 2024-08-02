local MutationType = {}


local _AllMutation = {
	["Artist"] = {Rate = 10.0001},
	["Golden"] = {Rate = 20.001},
	["Shadow"] = {Rate = 30.01},
	["Frost"] = {Rate = 40.1},
	["Albino"] = {Rate = 51}
}

local function randomNumber()
	local Number = math.random(1, 1000000)
	

	for index, mutation in pairs(_AllMutation) do
		
		local Rate = mutation.Rate * 10000
		
		if Number <= Rate then

			warn("You got", index)
			
			return index
		end
		
		

	end
	warn("You got Regular")
	return "Regular"
end

function MutationType:Mutation()
	local result = randomNumber()
	return result
end

return MutationType
