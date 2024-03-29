// This file provides proof that the LU wrapper, although unfinished, works.
// This file can run on both LU and GTA Connected.

// -----------------------------------------------------------------------------

function onScriptLoad() {
    print("Script loaded!");
}

function onScriptUnload() {
    print("Script unloaded!");
}

function onServerStart() {
    print("Server started!");
}

function onPlayerConnect(pPlayer) {
    Message(pPlayer.Name + " joined the server!", Colour(255, 255, 255));
}

function onPlayerPart(pPlayer, iReason) {
    Message(pPlayer.Name + " left the server!", Colour(255, 255, 255));
}

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
    } else if(szCommand.tolower() == "exec") {
        if(szParams == "") {
            MessagePlayer("Usage: /exec <code>", pPlayer, Colour(160, 160, 160));
            return false;
        }

        local szOutput = compilestring("return " + szParams)();
	    MessagePlayer("Code executed! " + szOutput, Colour(255, 255, 0));
    }
}