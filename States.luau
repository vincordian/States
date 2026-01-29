--Singleton, good idea to create multiple of the script for each state if you want to have a state with the same <K, V>

--!strict
--!native
--!optimize 2

--Module--

local States = {}
States.__index = States


--Variables--

local TotalStates = 0


--Public Functions--

--Constructor
function States.new(Key:{unknown}, Value:{unknown})
	
	local self = setmetatable({}, States)
	
	self.Key = Key
	self.Value = Value
	
	States[Key] = Value
	TotalStates += 1

	return self
end


function States:Mutate(Key:{unknown}, Value:{unknown})
	States[self.Key] = nil
	States[Key] = Value
	self.Key = Key
	self.Value = Value
end


--Gets the total amount of states, even if removed
function States.GetTotalStates()
	return TotalStates
end



return States