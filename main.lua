-- Copyright (c) 2012 Alexander Harkness

-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:

-- The above copyright notice and this permission notice shall be included
-- in all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
-- CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


-- Configuration

LOGFORMAT = "TEXTFILE"

-- Globals

PLUGIN = {}
LOGPREFIX = ""
QUEUE = {}

-- Plugin Start

function Initialize( Plugin )

        PLUGIN = Plugin

        Plugin:SetName( "BlockLogger" )
        Plugin:SetVersion( 1 )

	LOGPREFIX = "["..Plugin:GetName().."] "        

        PluginManager = cRoot:Get():GetPluginManager()
        PluginManager:AddHook(Plugin, cPluginManager.HOOK_BLOCK_PLACE)
        PluginManager:AddHook(Plugin, cPluginManager.HOOK_BLOCK_DIG)
        
	LOG( LOGPREFIX .. "Plugin v" .. Plugin:GetVersion() .. " Enabled!" )
        return true
end

function OnDisable()
	_G[LOGFORMAT.."ForceWrite"]()
	LOG( LOGPREFIX .. "Plugin Disabled!" )
end
