-- Copyright (c) 2013 Alexander Harkness

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

function OnPlayerBreakingBlock( Player, X, Y, Z )

	if DEBUGMODE then
		LOG(LOGPREFIX.."Checking to see if logs need to be checked at a block..")
	end

	if not Player:HasPermission("BlockLogger.viewlogs") then
		if DEBUGMODE then
			LOG(LOGPREFIX.."Player has no permission to check logs.")
		end
		return false -- Player has no permissions to view logs.
	end

	local playerEquippedItem = Player:GetEquippedItem()

	if playerEquippedItem.m_ItemID == 7 then
		_G[LOGFORMAT.."FindBlock"](X, Y, Z)
	end

	return false

end
