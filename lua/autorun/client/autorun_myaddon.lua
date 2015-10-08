local dbsetmetatable = debug.setmetatable
MyAddon = dbsetmetatable(
	{
	},
	{
		__metatable = false;
		__tostring = "myaddon"; -- A string that is a folder name for an addon (to include files from).
	}
)
includeEx( MyAddon .. "/shared" )
includeEx( MyAddon .. "/client" )