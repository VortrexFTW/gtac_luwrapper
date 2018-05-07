LU <- {};

LU_PLAYERS <- array(256 , false );
LU_VEHICLES <- array(256 , false );

NetworkEventPrefix <- "ChangeMe";

// =============================================================================
// -- Classes
// =============================================================================

class LUPlayer {
	GTACPlayer = false;
	GTACClient = false;

	EnterVehicle = function() {
		::makePlayerEnterVehicle(GTACPlayer );
	};
	
	ExitVehicle = function() {
		::makePlayerExitVehicle(GTACPlayer );
	};
	
	ForceToSpawnScreen = function() {
		::forcePlayerToSpawnScreen(GTACPlayer );
	};
	
	GetBoundariesLower = function() {
	};
	
	GetBoundariesUpper = function() {
	};
	
	GetIgnored = function() {
	};
	
	RemoveFromVehicle = function() {
	};
	
	RemoveLimb = function() {
	};
	
	SetAnim = function() {
	};
	
	SetBoundaries = function() {
	};
	
	SetIgnored = function() {
	};
	
	SetIgnoredBy = function() {
	};
	
	SetWeapon = function(WeaponID , Ammo){
		::givePlayerWeapon(WeaponID , Ammo );
	};
	
	Spawn = function() {
	};
	
	// -------------------------------------------------------------------------
	
	function _get(szKey){
		triggerNetworkEvent("lu.update.plr", this.GTACClient, this.GTACPlayer);
		switch(szKey){	
			case "Angle":
				return ::this.GTACPlayer.heading;
				
			case "ID":
				return ::this.GTACClient.index;
				
			case "IP":
				return ::this.GTACClient.ip;
				
			case "Island":
				return 0;
				
			case "LUID":
				return "";
				
			case "Name":
				return ::this.GTACClient.name;
				
			case "Ping":
				return ::this.GTACPlayer.ping;
				
			case "Train"
				if(this.GTACPlayer.vehicle.type == ELEMENT_TRAIN) {
					return ::this.GTACPlayer.vehicle;
				}
				return -1;
				
			case "Vehicle":
				return ::this.GTACPlayer.vehicle;
				
			case "Velocity":
				return ::this.GTACPlayer.velocity
				
			case "VirtualWorld":
				return 0;
				
			case "WantedLevel":
				return ::this.GTACPlayer.wantedLevel;
				
			case "WeaponState":	
				return 0;
				
			default:
				return ::this.GTACPlayer.setData(szKey);	
		}
	}
	
	// -------------------------------------------------------------------------
	
	function _set(szKey , pValue ){
		switch(szKey){
			case "Alpha":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "Angle":
				::this.GTACPlayer.setData(szKey, pValue.tofloat(), true);
				return pValue;
				
			case "Armour":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "Cash":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "Colour":
				::this.GTACPlayer.setData(szKey, pValue.GTACColour, true);
				return pValue;
				
			case "ColouredName":
				::this.GTACPlayer.setData(szKey, pValue.tostring(), true);
				return pValue;
				
			case "Health":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "Immune":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "LUID":
				return "";
				
			case "Marker":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "MarkerScale":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "MarkerSprite":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "Muted":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "Name":
				::this.GTACPlayer.setData(szKey, pValue.tostring(), true);
				return pValue;
				
			case "NametagColour":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "NametagColour":
				::this.GTACPlayer.setData(szKey, pValue.GTACColour, true);
				return pValue;
				
			case "Team":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "Train":
				::this.GTACPlayer.setData(szKey, pValue.GTACVehicle, true);
				return pValue;
				
			case "Vehicle":
				::this.GTACPlayer.setData(szKey, pValue.GTACVehicle, true);
				return pValue;
				
			case "VehicleSeat":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "Velocity":
				::this.GTACPlayer.setData(szKey, pValue.GTACVec3, true);
				return pValue;
				
			case "VirtualWorld":
				::this.GTACPlayer.setData(szKey,  pValue.tointeger(), true);
				return pValue;
				
			case "WantedLevel":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "Weapon":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			case "WeaponAmmo":
				::this.GTACPlayer.setData(szKey, pValue.tointeger(), true);
				return pValue;
				
			default:
				return null;		
		}
		triggerNetworkEvent("lu.sync.plr", null, this.GTACPlayer);
	}	
	
	// -------------------------------------------------------------------------
	
	constructor(pGTACClient){
		GTACClient = pGTACClient;
		GTACPlayer = pGTACClient.player;
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
    
    r = 0;
    g = 0;
    b = 0;
    alpha = 0;
	
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
    
    constructor(r , g , b , a = 255 ){
        r = r; 
        g = g;
        b = b;
        a = a;
        GTACColour = ::toColour(r , g , b , a ); 
    }

}

// -----------------------------------------------------------------------------

class Vector {
    GTACVector = false;
    x = 0;
    y = 0;
    z = 0;
	
	function _get(szKey){
		switch(Key ){
			case "x":
				return this.GTACVector [ 0 ];
				
			case "y":
				return this.GTACVector [ 1 ];

			case "z":
				return this.GTACVector [ 2 ];	

			default:
				return false;
		}
	}	
	
	function _set(szKey, pValue){
		switch(szKey){
			case "x":
				local newVec = ::Vec3(Value , this.GTACVector [ 1 ] , this.GTACVector [ 2 ] );
				this.GTACVector = newVec;
				return true;
				
			case "y":
				local newVec = ::Vec3(this.GTACVector [ 0 ] , Value , this.GTACVector [ 2 ] );
				this.GTACVector = newVec;

			case "z":
				local newVec = ::Vec3(this.GTACVector [ 0 ] , this.GTACVector [ 1 ] , Value );
				this.GTACVector = newVec;

			default:
				return false;
		}
	}		
    
    constructor(x , y , z ){
        x = x; 
        y = y;
        z = z;
        GTACVector = ::Vec3(r , g , b , a ); 
    }
}

// =============================================================================
// -- Misc Functions
// =============================================================================

function MessagePlayer(szMessage, pPlayer, pColour = Colour(255, 255, 255)) {
	outputChatBox(szMessage, pColour.GTACColour, pColour.GTACClient);
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
	::LU_PLAYERS[pClient.index] = ::LUPlayer(pClient);
});

// -----------------------------------------------------------------------------

addEventHandler("OnPlayerChat", function(pEvent, pClient, szMessage) {
	if(szMessage.slice(0, 1) == "!"){
		local pSplitMessage = split(szMessage , " " );
		local szCommand = pSplitMessage [ 0 ];
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
			if(type(getroottable().rawget("onPlayerCommand")) == "function"){
				onPlayerCommand(::LU_PLAYERS [ pClient.index ] , szCommand.slice(1, szCommand.len()) , szParams );
			}
		}
	}
});

// =============================================================================
// -- Liberty Unleashed Event Hooks
// =============================================================================

function onPlayerJoin(pPlayer){	
}

// -----------------------------------------------------------------------------

function getClientID(Client){
	foreach(ii , iv in ::getClients()){
		if(iv == Client){
			return ii;
		
		}
	}
}

// -----------------------------------------------------------------------------

function onPlayerCommand(pPlayer, szCommand, szParams){
	switch(szCommand.tolower()) {
		case "lustars":
			if(szParams != ""){
				pPlayer.WantedLevel = szParams.tointeger();
			} else {
				MessagePlayer("Stars: " + pPlayer.WantedLevel , pPlayer , Colour(255 , 255 , 255 ));
			}
			break;
			
		default:
			break;
	}
}

// -----------------------------------------------------------------------------