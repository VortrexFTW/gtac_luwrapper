// This file provides proof that the LU wrapper, although unfinished, works.
// This file can run on both LU and GTA Connected.

function onPlayerJoin(pPlayer) {	
}

// -----------------------------------------------------------------------------

function onPlayerCommand(pPlayer, szCommand, szParams) {
	switch(szCommand.tolower()) {
		case "stars":
			if(szParams == "") {
				MessagePlayer("Usage: /stars <number>", pPlayer, Colour(160, 160, 160));
				return false;
			}
			
			if(NumTok(szParams, " ") != 1) {
				MessagePlayer("Usage: /stars <number>", pPlayer, Colour(160, 160, 160));
				return false;
			}
			
			local szValue = GetTok(szParams, " ", 1);
			pPlayer.WantedLevel = szValue.tointeger();
			MessagePlayer("Wanted level set to " + szValue, pPlayer, Colour(0, 255, 0));
			break;
			
		default:
			break;
	}
}