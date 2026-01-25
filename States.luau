--Singleton, good idea to create multiple of the script for each state if you want to have a state with the same <K, V>

--Module--

local States = {}
States.__index = States


--Variables--

local TotalStates = 0


--Public Functions--

function States.Mutate(Key:any, Value:any)
	States[Key] = Value
end

--Gets the total amount of states, even if removed, good for unique id's. Starts at 1 to match with arrays starting at 1 in lua.
function States.GetTotalStates()
	return TotalStates
end



return States
