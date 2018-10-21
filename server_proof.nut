// This file provides proof that the LU wrapper, although unfinished, works.
// This file can run on both LU and GTA Connected.

// -----------------------------------------------------------------------------

function onPlayerCommand(pPlayer, szCommand, szParams) {
    if(szCommand.tolower() == "health") {
        if(szParams == "") {
            MessagePlayer("Usage: /health <number>", pPlayer, Colour(160, 160, 160));
            return false;
        }
        
        if(NumTok(szParams, " ") != 1) {
            MessagePlayer("Usage: /health <number>", pPlayer, Colour(160, 160, 160));
            return false;
        }
        
        if(!IsNum(szParams)) {
            MessagePlayer("The amount must be a number!", pPlayer, Colour(255, 0 0));
            return false;
        }            
        
        local iValue = GetTok(szParams, " ", 1).tointeger();
        pPlayer.Health = iValue;
        MessagePlayer("Health set to " + iValue, pPlayer, Colour(0, 255, 0));
        break;
    }
}