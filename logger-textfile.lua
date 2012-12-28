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

-- This is the textfile block logger for BlockLogger.

-- Configuration

TEXTFILELOGBLOCKBREAKS = true
TEXTFILELOGBLOCKPLACES = true
TEXTFILEBLOCKSTOQUEUE  = 200 -- Set to 1 for instant logging.

-- Globals

TEXTFILEBLOCKSCOUNTER = 0

function TEXTFILEWriteBlockLog(breakPlace, X, Y, Z, player, block)
	-- breakPlace == 0 means a block was broken
	-- breakPlace == 1 means a block was placed
	if breakPlace == 0 and TEXTFILELOGBLOCKBREAKS == false then
		return
	end
	if breakPlace == 1 and TEXTFILELOGBLOCKPLACES == false then
		return
	end
	TEXTFILEBLOCKSCOUNTER = TEXTFILEBLOCKSCOUNTER + 1
	QUEUE.insert(tostring(os.time)..","..breakPlace..","..X..","..Y..","..Z..","..player..","..block.."\n")
	if TEXTFILEBLOCKSCOUNTER = TEXTFILEBLOCKSTOQUEUE then
		TEXTFILEForceWrite()
	end 
end

function TEXTFILEForceWrite()
	local logFile = io.open('Plugins/BlockLogger/blocks.log', 'a')
	for i, v in ipairs(QUEUE) do
		logFile:write(v.value)
	end
	logFile:close()
end
