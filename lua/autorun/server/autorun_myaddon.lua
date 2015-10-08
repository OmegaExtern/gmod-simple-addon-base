local dbsetmetatable = debug.setmetatable
MyAddon = dbsetmetatable(
	{
		NetworkStrings = {}; -- Add all network strings your addon uses. Example: { "TestMsg", "AnotherMsg" }
	},
	{
		__metatable = false;
		__tostring = "MyAddon"; -- A string that is used for this addon as a prefix for the hook library calls.
	}
)
local utilAddNetworkString = util.AddNetworkString
hook.Remove( "Initialize", MyAddon .. ".Initialize" )
hook.Add( "Initialize", MyAddon .. ".Initialize",
	function()
		for c = 1, #MyAddon.NetworkStrings do
			utilAddNetworkString( MyAddon.NetworkStrings[ c ] )
		end
	end
)
--
-- DO NOT EDIT BELOW THIS LINE !
--
local pairs, fileFind = fpairs, file.Find
AddCSLuaFileEx =
	function( path )
		local files, directories = fileFind( path .. "/*", "LUA", "nameasc" )
		for k, v in pairs( files ) do
			if ( v:GetExtensionFromFilename():lower() == "lua" ) then
				AddCSLuaFile( path .. '/' .. v )
			end
		end
		for k, v in pairs( directories ) do
			if ( v != ".." && v != '.' ) then
				AddCSLuaFileEx( path .. '/' .. v )
			end
		end
	end
AddCSLuaFileEx( "myaddon/shared" )
AddCSLuaFileEx( "myaddon/client" )
includeEx( "myaddon/shared" )
includeEx( "myaddon/server" )