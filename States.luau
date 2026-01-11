--Singleton, good idea to create multiple of the script for each state if you want to have a state with the same <K, V>


--Types--

export type StatesInfo = {
	Key:string|number|{any},
	Value:any,
}


--Module--

local States = {}
States.__index = States


--Variables--

local TotalStates = 0

--Public Functions--

--[=[

	Key:string,
	Value:any,

]=]
function States.AddState(Info:StatesInfo)

	TotalStates += 1
	assert(not States[Info.Key], `There is already a state named {tostring(Info.Key)} under States`)
	
	States[Info.Key] = Info.Value
	
	return Info.Key, States[Info.Key]
end


--Gets the total amount of states, even if removed, good for unique id's. Starts at 1 to match with arrays starting at 1 in lua.
function States.GetTotalStates()
	return TotalStates
end


function States.RemoveState(Key):unknown
	assert(States[Key], `The state with a key of {tostring(Key)} does not exist`)
	
	local Value = States[Key]
	
	States[Key] = nil
	
	return Value
end


return States
