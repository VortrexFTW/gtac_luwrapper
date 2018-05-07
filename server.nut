LU_PLAYERS <- array(128, false);
LU_VEHICLES <- array(256, false);

NetworkEventPrefix <- "ChangeMe";

// =============================================================================
// -- Classes
// =============================================================================

class LUPlayer {
	_GTACPlayer = false;
	_GTACClient = false;
	
	function _set(szKey, pValue) {
		print("SET " + szKey + " to " + pValue);
		
		local szEventName = "Player.Set." + szKey;
		print(szEventName);
	
		switch(szKey) {				
			case "Alpha":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "Angle":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tofloat());
				return pValue;
				
			case "Armour":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "Cash":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "Colour":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.GTACColour);
				return pValue;
				
			case "ColouredName":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tostring());
				return pValue;
				
			case "Health":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "Immune":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "Marker":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "MarkerScale":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "MarkerSprite":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "Muted":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "Name":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tostring());
				return pValue;
				
			case "NametagColour":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "NametagColour":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.GTACColour);
				return pValue;

			case "Skin":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "Team":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "Train":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.GTACVehicle);
				return pValue;
				
			case "Vehicle":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.GTACVehicle);
				return pValue;
				
			case "VehicleSeat":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "Velocity":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.GTACVec3);
				return pValue;
				
			case "VirtualWorld":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer,  pValue.tointeger());
				return pValue;
				
			case "WantedLevel":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "Weapon":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;
				
			case "WeaponAmmo":
				triggerNetworkEvent(szEventName, _GTACClient, _GTACPlayer, pValue.tointeger());
				return pValue;		
		}
	}	
	
	// -------------------------------------------------------------------------
	
	constructor(pGTACClient){
		_GTACClient = pGTACClient;
		_GTACPlayer = pGTACClient.player;
		/*	
		Alpha = 255;
		Angle = ::getPlayerAngle(this );
		Armour = ::getPlayerArmour(this );
		Cash = ::getPlayerCash(this );
		Class = ::getPlayerClass(this );
		Health = ::getPlayerHealth(this );
		ID = ::getPlayerID(this );
		IP = ::getPlayerIP(this );
		Immune = ::getPlayerInvincible(this );
		Island = ::getPlayerIsland(this );
		LUID = "";
		Marker = ::getPlayerMarker(this );
		MarkerScale = ::getPlayerMarkerScale(this );
		MarkerSprite = ::getPlayerSprite(this );
		Muted = ::getPlayerMuted(this );
		Name = ::getPlayerName(this );
		Nametag = ::getPlayerNametag(this );
		NametagColour = ::getPlayerNametagColour(this );
		Ping = ::getPlayerPing(this );
		Spawned = ::getPlayerSpawned(this );
		Skin = ::getPlayerSkin(this );
		Team = ::getPlayerTeam(this );
		Train = ::getPlayerTrain(this );
		Vehicle = ::getPlayerVehicle(this );
		VehicleSeat = ::getPlayerVehicle(this );
		Velocity = ::getPlayerVelocity(this );
		VirtualWorld = ::getPlayerVirtualWorld(this );
		WantedLevel = ::getPlayerWantedLevel(this );
		Weapon = ::getPlayerWeapon(this );
		WeaponAmmo = ::getPlayerWeaponAmmo(this );
		WeaponState	= ::getPlayerWeaponState(this );
		*/
		
		/*
		GTACPlayer.setData("LU.Player.Alpha" , 255 , true );
		GTACPlayer.setData("LU.Player.Armour" , 255 , true );
		GTACPlayer.setData("LU.Player.Cash" , 255 , true );
		GTACPlayer.setData("LU.Player.Class" , 255 , true );
		GTACPlayer.setData("LU.Player.Health" , 255 , true );
		GTACPlayer.setData("LU.Player.ID" , 255 , true );
		GTACPlayer.setData("LU.Player.IP" , 255 , true );
		GTACPlayer.setData("LU.Player.Immune" , 255 , true );
		GTACPlayer.setData("LU.Player.Island" , 255 , true );
		GTACPlayer.setData("LU.Player.LUID" , 255 , true );
		GTACPlayer.setData("LU.Player.Marker" , 255 , true );
		GTACPlayer.setData("LU.Player.MarkerScale" , 255 , true );
		GTACPlayer.setData("LU.Player.MarkerSprite" , 255 , true );
		GTACPlayer.setData("LU.Player.Muted" , 255 , true );
		GTACPlayer.setData("LU.Player.Name" , 255 , true );
		GTACPlayer.setData("LU.Player.Nametag" , 255 , true );
		GTACPlayer.setData("LU.Player.NametagColour" , ::getPlayerNametagColour(this), true );
		*/
	}	
}

// -----------------------------------------------------------------------------

class Colour {
	GTACColour = false;
	
	function _get(szKey) {
		switch (szKey) {
			case "r":
				return this.r;
				
			case "g":
				return this.g;

			case "b":
				return this.b;	
				
			case "alpha":
				return this.alpha;				

			default:
				return false;
		}
	}	
	
	function _set(szKey, pValue) {
		switch(szKey) {
			case "r":
				local newColour = ::toColour(pValue, this.g, this.b, this.alpha);
				this.GTACColour = newColour;
				return true;
				
			case "g":
				local newColour = ::toColour(this.r, pValue, this.b, this.alpha);
				this.GTACColour = newColour;

			case "b":
				local newColour = ::toColour(this.r, this.g, pValue, this.alpha);
				this.GTACColour = newColour;
				
			case "alpha":
				local newColour = ::toColour(this.r, this.g, this.b, pValue);
				this.GTACColour = newColour;				

			default:
				return false;
		}
	}		
	
	constructor(r, g, b, a = 255 ) {
		GTACColour = ::toColour(r, g, b, a); 
	}

}

// -----------------------------------------------------------------------------

class Vector {
	GTACVector = false;
	
	function _get(szKey){
		switch(szKey){
			case "x":
				return this.GTACVector.x;
				
			case "y":
				return this.GTACVector.y;

			case "z":
				return this.GTACVector.z;	

			default:
				return false;
		}
	}	
	
	function _set(szKey, pValue){
		switch(szKey){
			case "x":
				local newVec = ::Vec3(pValue, this.GTACVector[1], this.GTACVector[2]);
				this.GTACVector = newVec;
				return true;
				
			case "y":
				local newVec = ::Vec3(this.GTACVector[0], pValue, this.GTACVector[2]);
				this.GTACVector = newVec;

			case "z":
				local newVec = ::Vec3(this.GTACVector[0], this.GTACVector[1], pValue );
				this.GTACVector = newVec;

			default:
				return false;
		}
	}		
	
	constructor(x, y, z) {
		GTACVector = ::Vec3(r, g, b, 255); 
	}
}

// =============================================================================
// -- Misc Functions
// =============================================================================

function MessagePlayer(szMessage, pPlayer, pColour = Colour(255, 255, 255)) {
	outputChatBox(szMessage, pColour.GTACColour, pPlayer._GTACClient);
}

// -----------------------------------------------------------------------------

function NumTok(szString, szDelimiter) {
	return split(szString, szDelimiter).len();
}

// -----------------------------------------------------------------------------

function GetTok(szString, szDelimiter, iIndex) {
	if(iIndex <= 0) {
		return false;
	}
	
	if((iIndex-1) > NumTok(szString, szDelimiter)) {
		return false;
	}
	
	return split(szString, szDelimiter)[iIndex-1];
}

// -----------------------------------------------------------------------------

function IsNum(iInteger) {
	return (type(iInteger)=="integer") ? true : false;
}

// -----------------------------------------------------------------------------

function FindPlayer(szParams) {
	if(type(szParams) == "integer") {
		local iPlayerID = szParams.tointeger();
		if(LU_PLAYERS[iPlayerID]) {
			return LU_PLAYERS[iPlayerID];
		}
	}
	
	return false
}

// =============================================================================
// -- GTA Connected Event Hooks
// =============================================================================

addEventHandler("OnResourceStart", function(pEvent, pResource) {
	//print(getAllClients );
	//print(reflection.call( );

	//for(local i = 0 ; i <= server.maxPlayers){
	//
	//	::LU_PLAYERS [ iv.index ] = ::LUPlayer(iv );
	//
	//}
});

// -----------------------------------------------------------------------------

addEventHandler("OnPlayerConnect", function(pEvent, szIP, szPort) {

});

// -----------------------------------------------------------------------------

addEventHandler("OnPlayerJoined", function(pEvent, pClient) {
	LU_PLAYERS[pClient.index] = LUPlayer(pClient);
});

// -----------------------------------------------------------------------------

addEventHandler("OnPlayerChat", function(pEvent, pClient, szMessage) {
	if(LU_PLAYERS[pClient.index] == false) {
		LU_PLAYERS[pClient.index] = LUPlayer(pClient);
	}
	
	if(szMessage.slice(0, 1) == "!"){
		local pSplitMessage = split(szMessage, " ");
		local szCommand = pSplitMessage[0];
		local szParams = "";
		
		if(pSplitMessage.len() > 0){
			foreach(ii , iv in pSplitMessage){
				if(ii != 0){
					if(szParams == ""){
						szParams = iv;
					} else {
						szParams = " " + iv;
					}
				}
			}
		} else {
			szParams = "";
		}
		
		if(getroottable().rawin("onPlayerCommand")) {
			if(type(onPlayerCommand) == "function") {
				onPlayerCommand(LU_PLAYERS[pClient.index], szCommand.slice(1, szCommand.len()), szParams);
			}
		}
	}
});

// =============================================================================
// -- Other Shit
// =============================================================================

addCommandHandler("code", function(szCommand, szParams, pClient) {
	local szOutput = compilestring("return " + szParams)();
	//outputChatBox("Code returns: " + szOutput, COLOUR_YELLOW);
});