The current version of the logger specification is 0.1. 

Functions
=========

These functions must always be present otherwise the system will not work.

All functions must be prefixed with your loggers' name. This should be in all CAPS.

GetLoggerSpec()
---------------

Returns the logger specification number the logger uses. 

Initialize()
------------

Returns nothing, you dont _have_ to do anything here but it is called when the server starts for whatever you want to do with it.

OnDisable()
-----------

This also returns nothing. It is called when the server is shutting down and you might use it for stuff like closing SQL connections and forcing log writes.

WriteBlockLog(breakPlace, X, Y, Z, player, block)
-------------------------------------------------

This should write (or queue) a block log. 

breakPlace is 0 on block break and 1 on place.
X, Y and Z are the coords of the block broken or placed.
player is the name of the player that did the breaking or placing.
block _should_ be the id of the broken block (this isn't working yet).

ForceWrite()
------------

This should force a write of block logs. It doesn't have to though if you don't do that stuff.

FindBlock(X, Y, Z)
------------------

This should get all block changes at the specified coordinates. Nothing has to be done yet.
 
