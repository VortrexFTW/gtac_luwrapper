LU <- {};

LU_PLAYERS <- array ( 256 , false );
LU_VEHICLES <- array ( 256 , false );

NetworkEventPrefix <- "ChangeMe";

// =============================================================================
// -- Classes
// =============================================================================

class LUPlayer {

	GTACPlayer = false;
	
	GTACClient = false;

	Alpha = 255;
	
	Angle = 0;
	
	Armour = 0;
	
	Cash = 0;
	
	Class = 0;
	
	ClearWeapons = 0;
	
	Colour = 0;
	
	ColouredName = "";
	
	/*EnterVehicle = function ( ) {
	
		::makePlayerEnterVehicle ( GTACPlayer );
		
	};*/
	
	/*ExitVehicle = function ( ) {
	
		::makePlayerExitVehicle ( GTACPlayer );
		
	};*/
	
	/*ForceToSpawnScreen = function ( ) {
	
		::forcePlayerToSpawnScreen ( GTACPlayer );
		
	};*/
	
	Frozen = false;
	
	/*GetBoundariesLower = function ( ) {
		
	};*/
	
	/*GetBoundariesUpper = function ( ) {
	
	};*/
	
	/*GetIgnored = function ( ) {
	
	};*/
	
	Health = 0;
	
	ID = 0;
	
	IP = "";
	
	Immune = false;
	
	Island = 0;
	
	LUID = "";
	
	Marker = false;
	
	MarkerScale = 0;
	
	MarkerSprite = 0;
	
	Muted = false;
	
	Name = "";
	
	Nametag = true;
	
	NametagColour = 0;
	
	Ping = 0;
	
	Pos = false;
	
	/*RemoveFromVehicle = function ( ) {
	
	};*/
	
	/*RemoveLimb = function ( ) {
	
	};*/
	
	Score = 0;
	
	/*SetAnim = function ( ) {
	
	};*/
	
	/*SetBoundaries = function ( ) {
	
	};*/
	
	/*SetIgnored = function ( ) {
	
	};*/
	
	/*SetIgnoredBy = function ( ) {
	
	};*/
	
	/*SetVehicleEnterDoor = function ( ) {
		
	};*/
	
	/*SetWeapon = function ( WeaponID , Ammo ) {
		
		::givePlayerWeapon ( WeaponID , Ammo );
		
	};*/
	
	Skin = 0;
	
	/*
	Spawn = function ( ) {
	
	};
	*/
	
	Spawned = false;
	
	Team = 0;
	
	Train = 0;
	
	Vehicle = false;
	
	VehicleSeat = 0;
	
	Velocity = false;
	
	VirtualWorld = 0;
	
	WantedLevel = 6;
	
	Weapon = 0;
	
	WeaponAmmo = 0;
	
	WeaponState	= 0;
	
	// -------------------------------------------------------------------------
	
	_get = function ( Key ) {
	
		print( "_get called - " + Key );
		switch( Key ) {
			case "Alpha":
				return ::getPlayerAlpha ( this );
				
			case "Angle":
				return ::getPlayerAngle ( this );
				
			case "Armour":
				return ::getPlayerArmour ( this );
				
			case "Cash":
				return ::getPlayerCash ( this );
				
			case "Class":
				return ::getPlayerClass ( this );
				
			case "Colour":
				return ::getPlayerColour ( this );
				
			case "ColouredName":
				return ::getPlayerColouredName ( this );
				
			case "Health":
				return ::getPlayerHealth ( this );
				
			case "ID":
				return ::getPlayerID ( this );
				
			case "IP":
				return ::getPlayerIP ( this );
				
			case "Immune":
				return ::getPlayerImmune ( this );
				
			case "Island":
				return ::getPlayerIsland ( this );
				
			case "LUID":
				return ::getPlayerLUID ( this );
				
			case "Marker":
				return ::getPlayerMarker ( this );
				
			case "MarkerScale":
				return ::getPlayerMarkerScale ( this );
				
			case "MarkerSprite":
				return ::getPlayerMarkerSprite ( this );
				
			case "Muted":
				return ::getPlayerMuted ( this );
				
			case "Name":
				return ::getPlayerName ( this );
				
			case "Nametag":
				return ::getPlayerNametag ( this );
				
			case "NametagColour":
				return ::getPlayerNameTagColour ( this );
				
			case "Ping":
				return ::getPlayerPing ( this );
				
			case "Spawned":
				return ::getPlayerSpawned ( this );
				
			case "Team":
				return ::getPlayerTeam ( this );
				
			case "Train":
				return ::getPlayerTrain ( this );
				
			case "Vehicle":
				return ::getPlayerVehicle ( this );
				
			case "VehicleSeat":
				return ::getPlayerVehicleSeat ( this );
				
			case "Velocity":
				return ::getPlayerVelocity ( this );
				
			case "VirtualWorld":
				return ::getPlayerVirtualWorld ( this );
				
			case "WantedLevel":
				return ::getPlayerWantedLevel ( this );
				
			case "Weapon":
				return ::getPlayerWeaponAmmo ( this );
				
			case "WeaponAmmo":
				return ::getPlayerWeaponAmmo ( this );
				
			case "WeaponState":	
				return ::getPlayerWeaponState ( this );
				
			default:
				return null;		
		}
	}
	
	// -------------------------------------------------------------------------
	
	_set = function ( Key , Value  ) {
	
		print( "_set called - " + Key + " / " + Value );
	
		switch ( Key  ) {
		
			case "Alpha":
				return ::setPlayerAlpha ( this , Value );
				
			case "Angle":
				return ::setPlayerAngle ( this , Value );
				
			case "Armour":
				return ::setPlayerArmour ( this , Value );
				
			case "Cash":
				return ::setPlayerCash ( this , Value );
				
			case "Class":
				return ::setPlayerClass ( this , Value );
				
			case "Colour":
				return ::setPlayerColour ( this , Value );
				
			case "ColouredName":
				return ::setPlayerColouredName ( this , Value );
				
			case "Health":
				return ::setPlayerHealth ( this , Value );
				
			case "ID":
				return ::setPlayerID ( this , Value );
				
			case "IP":
				return ::setPlayerIP ( this , Value );
				
			case "Immune":
				return ::setPlayerImmune ( this , Value );
				
			case "Island":
				return ::setPlayerIsland ( this , Value );
				
			case "LUID":
				return ::setPlayerLUID ( this , Value );
				
			case "Marker":
				return ::setPlayerMarker ( this , Value );
				
			case "MarkerScale":
				return ::setPlayerMarkerScale ( this , Value );
				
			case "MarkerSprite":
				return ::setPlayerMarkerSprite ( this , Value );
				
			case "Muted":
				return ::setPlayerMuted ( this , Value );
				
			case "Name":
				return ::setPlayerName ( this , Value );
				
			case "Nametag":
				return ::setPlayerNametag ( this , Value );
				
			case "NametagColour":
				return ::setPlayerNameTagColour ( this , Value );
				
			case "Ping":
				return ::setPlayerPing ( this , Value );
				
			case "Spawned":
				return ::setPlayerSpawned ( this , Value );
				
			case "Team":
				return ::setPlayerTeam ( this , Value );
				
			case "Train":
				return ::setPlayerTrain ( this , Value );
				
			case "Vehicle":
				return ::setPlayerVehicle ( this , Value );
				
			case "VehicleSeat":
				return ::setPlayerVehicleSeat ( this , Value );
				
			case "Velocity":
				return ::setPlayerVelocity ( this , Value );
				
			case "VirtualWorld":
				return ::setPlayerVirtualWorld ( this , Value );
				
			case "WantedLevel":
				print("_set called" );
				::setPlayerWantedLevel ( this , Value );
				return true;
				
			case "Weapon":
				return ::setPlayerWeaponAmmo ( this , Value );
				
			case "WeaponAmmo":
				return ::setPlayerWeaponAmmo ( this , Value );
				
			case "WeaponState":	
				return ::setPlayerWeaponState ( this , Value );
				
			default:
				return null;		
		}
	}	
	
	// -------------------------------------------------------------------------
	
	constructor ( GTACClient ) {
	
		GTACClient = GTACClient;
		GTACPlayer = GTACClient.player;
		
		/*	
		Alpha = 255;
		Angle = ::getPlayerAngle ( this );
		Armour = ::getPlayerArmour ( this );
		Cash = ::getPlayerCash ( this );
		Class = ::getPlayerClass ( this );
		Health = ::getPlayerHealth ( this );
		ID = ::getPlayerID ( this );
		IP = ::getPlayerIP ( this );
		Immune = ::getPlayerInvincible ( this );
		Island = ::getPlayerIsland ( this );
		LUID = "";
		Marker = ::getPlayerMarker ( this );
		MarkerScale = ::getPlayerMarkerScale ( this );
		MarkerSprite = ::getPlayerSprite ( this );
		Muted = ::getPlayerMuted ( this );
		Name = ::getPlayerName ( this );
		Nametag = ::getPlayerNametag ( this );
		NametagColour = ::getPlayerNametagColour ( this );
		Ping = ::getPlayerPing ( this );
		Spawned = ::getPlayerSpawned ( this );
		Skin = ::getPlayerSkin ( this );
		Team = ::getPlayerTeam ( this );
		Train = ::getPlayerTrain ( this );
		Vehicle = ::getPlayerVehicle ( this );
		VehicleSeat = ::getPlayerVehicle ( this );
		Velocity = ::getPlayerVelocity ( this );
		VirtualWorld = ::getPlayerVirtualWorld ( this );
		WantedLevel = ::getPlayerWantedLevel ( this );
		Weapon = ::getPlayerWeapon ( this );
		WeaponAmmo = ::getPlayerWeaponAmmo ( this );
		WeaponState	= ::getPlayerWeaponState ( this );
		*/
		
		/*
		GTACPlayer.setData ( "LU.Player.Alpha" , 255 , true );
		GTACPlayer.setData ( "LU.Player.Armour" , 255 , true );
		GTACPlayer.setData ( "LU.Player.Cash" , 255 , true );
		GTACPlayer.setData ( "LU.Player.Class" , 255 , true );
		GTACPlayer.setData ( "LU.Player.Health" , 255 , true );
		GTACPlayer.setData ( "LU.Player.ID" , 255 , true );
		GTACPlayer.setData ( "LU.Player.IP" , 255 , true );
		GTACPlayer.setData ( "LU.Player.Immune" , 255 , true );
		GTACPlayer.setData ( "LU.Player.Island" , 255 , true );
		GTACPlayer.setData ( "LU.Player.LUID" , 255 , true );
		GTACPlayer.setData ( "LU.Player.Marker" , 255 , true );
		GTACPlayer.setData ( "LU.Player.MarkerScale" , 255 , true );
		GTACPlayer.setData ( "LU.Player.MarkerSprite" , 255 , true );
		GTACPlayer.setData ( "LU.Player.Muted" , 255 , true );
		GTACPlayer.setData ( "LU.Player.Name" , 255 , true );
		GTACPlayer.setData ( "LU.Player.Nametag" , 255 , true );
		GTACPlayer.setData ( "LU.Player.NametagColour" , ::getPlayerNametagColour ( this ) , true );
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
	
	function _get ( Key  ) {
		switch ( Key  ) {
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
	
	function _set ( Key , Value  ) {
		switch( Key  ) {
			case "r":
				local newColour = ::toColour ( Value , this.g , this.b , this.alpha );
				this.GTACColour = newColour;
				return true;
				
			case "g":
				local newColour = ::toColour  ( this.r , Value , this.b , this.alpha );
				this.GTACColour = newColour;

			case "b":
				local newColour = ::toColour ( this.r , this.g , Value , this.alpha );
				this.GTACColour = newColour;
				
			case "alpha":
				local newColour = ::toColour ( this.r , this.g , this.b , Value );
				this.GTACColour = newColour;				

			default:
				return false;
		}
	}		
    
    constructor ( r , g , b , a = 255  ) {
    
        r = r; 
        g = g;
        b = b;
        a = a;
        
        GTACColour = ::toColour ( r , g , b , a ); 
    
    }

}

// -----------------------------------------------------------------------------

class Vector {
    
    GTACVector = false;
    
    x = 0;
    y = 0;
    z = 0;
	
	function _get ( Key  ) {
		switch ( Key  ) {
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
	
	function _set ( Key , Value  ) {
		switch( Key  ) {
			case "x":
				local newVec = ::Vec3 ( Value , this.GTACVector [ 1 ] , this.GTACVector [ 2 ] );
				this.GTACVector = newVec;
				return true;
				
			case "y":
				local newVec = ::Vec3 ( this.GTACVector [ 0 ] , Value , this.GTACVector [ 2 ] );
				this.GTACVector = newVec;

			case "z":
				local newVec = ::Vec3 ( this.GTACVector [ 0 ] , this.GTACVector [ 1 ] , Value );
				this.GTACVector = newVec;

			default:
				return false;
		}
	}		
    
    constructor ( x , y , z  ) {
    
        x = x; 
        y = y;
        z = z;
        
        GTACVector = ::Vec3 ( r , g , b , a ); 
    
    }

}

// =============================================================================
// -- Player Functions
// =============================================================================

function getPlayerAlpha ( Player  ) {
	return 255;
}

function getPlayerAngle ( Player  ) {

	return Player.GTACPlayer.heading;
	
}

function getPlayerArmour ( Player  ) {

	return Player.GTACPlayer.heading;
	
}

function getPlayerCash ( Player  ) {

	return 0;
	
}

function getPlayerClass ( Player  ) {

	return 0;
	
}

function getPlayerColour ( Player  ) {

	return 0;
	
}

function getPlayerColouredName ( Player  ) {

	return Player.GTACClient.name;
	
}

function getPlayerHealth ( Player  ) {

	return Player.GTACPlayer.health;
	
}

function getPlayerID ( Player  ) {

	return Player.GTACClient.index;
	
}

function getPlayerIP ( Player  ) {

	return Player.GTACClient.ip;
	
}

function getPlayerImmune ( Player  ) {

	return false;
	
}

function getPlayerIsland ( Player  ) {

	return 1;
	
}

function getPlayerLUID ( Player  ) {

	return "";
	
}

function getPlayerMarker ( Player  ) {

	return Player.GTACPlayer.getData ( "LU.Marker.Visible" );	
	
}

function getPlayerMarkerScale ( Player  ) {
	
}

function getPlayerMarkerSprite ( Player  ) {
	
}

function getPlayerMuted ( Player  ) {
	
}

function getPlayerName ( Player  ) {
	
}

function getPlayerNametag ( Player  ) {

	return Player.GTACPlayer.getData ( "LU.Nametag.Visible" );
	
}

function getPlayerNameTagColour ( Player  ) {

	return Player.GTACPlayer.getData ( "LU.Nametag.Colour" );
	
}

function getPlayerPing ( Player  ) {

	return Player.GTACClient.ping;
	
}

function getPlayerSpawned ( Player  ) {

	if ( Player.GTACPlayer  ) {
	
		return true;
		
	}
	
	return false;
	
}

function getPlayerTeam ( Player  ) {

	return Player.GTACPlayer.getData ( "LU.Player.Team" );	
	
}

function getPlayerTrain ( Player  ) {
	
}

function getPlayerVehicle ( Player  ) {
	
}

function getPlayerVehicleSeat ( Player  ) {
	
}

function getPlayerVelocity ( Player  ) {
	
}

function getPlayerVirtualWorld ( Player  ) {
	
}

function getPlayerWantedLevel ( Player  ) {
	
}

function getPlayerWeaponAmmo ( Player  ) {
	
}

function getPlayerWeaponAmmo ( Player  ) {
	
}

function getPlayerWeaponState ( Player  ) {
	
}

function setPlayerAlpha ( Player , Value ) {
	
}

function setPlayerAngle ( Player , Value ) {

    if ( type ( Value ) != "float" && type ( Value ) != "integer"  ) {
    
        return false;
    
    }
	
	Player.GTACPlayer.heading = Value.tofloat ( );
	
}

function setPlayerArmour ( Player , Value ) {

    if ( type ( Value ) != "integer"  ) {
    
        return false;
    
    }
	
    ::triggerNetworkEvent ( "lu.plr.s.ap" , Player.GTACClient , Value.tointeger ( ) );
	
}

function setPlayerCash ( Player , Value ) {
	
}

function setPlayerClass ( Player , Value ) {
	
}

function setPlayerColour ( Player , Value ) {
	
}

function setPlayerColouredName ( Player , Value ) {
	
}

function setPlayerHealth ( Player , Value ) {
	
	if ( type ( Value ) != "float" && type ( Value ) != "integer"  ) {
    
        return false;
    
    }
    
    ::triggerNetworkEvent ( "lu.plr.s.hp" , Player.GTACClient , Value.tointeger ( ) );
	
}

function setPlayerImmune ( Player , Value ) {
	
	if ( type ( Value ) != "boolean" && type ( Value ) != "integer"  ) {
    
        return false;
    
    }
    
    if ( type ( Value ) == "integer"  ) {
        
        Value = GetBooleanFromInteger ( Value.tointeger ( ) );   
        
    }
	
	::triggerNetworkEvent ( "lu.plr.s.god" , Player.GTACClient , Value );
	::triggerNetworkEvent ( "lu.plr.s.proofs" , Player.GTACClient , Value , Value , Value , Value , Value );
	
	return true;
	
}

function setPlayerMarker ( Player , Value ) {
	
	if ( type ( Value ) != "boolean" && type ( Value ) != "integer"  ) {
    
        return false;
    
    }
    
    if ( type ( Value ) == "integer"  ) {
        
        Value = GetBooleanFromInteger ( Value.tointeger ( ) );   
        
    }	
	
	Player.GTACPlayer.setData ( "LU.Marker.Visible" , Value , true );	
	
}

function setPlayerMarkerScale ( Player , Value ) {

	if ( type ( Value ) != "integer"  ) {
    
        return false;
    
    }

    Player.GTACPlayer.setData ( "LU.Marker.Scale" , Value , true );
	
}

function setPlayerMarkerSprite ( Player , Value ) {

	if ( type ( Value ) != "integer"  ) {
    
        return false;
    
    }

    Player.GTACPlayer.setData ( "LU.Marker.Sprite" , Value , true );
	
}

function setPlayerMuted ( Player , Value ) {
	
	Player.GTACPlayer.setData ( "LU.Muted" , Value , true );
	
	return true;
	
}

function setPlayerName ( Player , Value ) {
	
	if ( type ( Value ) != "string"  ) {
    
        return false;
    
    }
    
    if ( ::IsPlayerNameAlreadyConnected ( Value.tostring ( ) ) ) {
    
        return false;
    
    }
	
	Player.GTACClient.name = Value;

	return true;
	
}

function setPlayerNametag ( Player , Value ) {
	
	if ( type ( Value ) != "boolean" && type ( Value ) != "integer"  ) {
    
        return false;
    
    }
    
    if ( type ( Value ) == "integer"  ) {
        
        Value = GetBooleanFromInteger ( Value.tointeger ( ) );   
        
    }	
	
	Player.GTACPlayer.setData ( "LU.Nametag.Visible" , Value.tointeger ( ) , true );
	
}

function setPlayerNameTagColour ( Player , Value ) {

	if ( type ( Value ) != "integer"  ) {
    
        return false;
    
    }
	
	Player.GTACPlayer.setData ( "LU.Nametag.Colour" , Value.tointeger ( ) , true );
	
}

function setPlayerTeam ( Player , Value ) {
	
}

function setPlayerTrain ( Player , Value ) {

    if ( type ( Value ) != "object"  ) {
    
        return false;
    
    }
    
    if ( Value.type != ELEMENT_VEHICLE  ) {
    
        return false;
    
    }

    ::triggerNetworkEvent ( "lu.plr.s.veh" , Player.GTACClient , Value );
 
 	return true;
    
}

function setPlayerVehicle ( Player , Value ) {

    if ( type ( Value ) != "object"  ) {
    
        return false;
    
    }
    
    if ( Value.type != ELEMENT_VEHICLE  ) {
    
        return false;
    
    }

    ::triggerNetworkEvent ( "lu.plr.s.veh" , Player.GTACClient , Value );
	
	return true;
	
}

function setPlayerVehicleSeat ( Player , Value ) {

	Player.GTACPlayer.seat = Value;
	
	return true;	
	
}

function setPlayerVelocity ( Player , Value ) {

    if ( type ( Value ) != "object"  ) {
    
        return false;
    
    }

	::triggerNetworkEvent ( "lu.plr.s.stars" , Player.GTACClient , Value );
	
	return true;
			
}

function setPlayerVirtualWorld ( Player , Value ) {
	
	return false;
	
}

function setPlayerWantedLevel ( Player , Value ) {

	print("Function called" );

    if ( type ( Value ) != "integer"  ) {
    
        return false;
    
    }

	::triggerNetworkEvent ( "plr.stars" , Player.GTACClient , Value.tointeger ( ) );
	
	return Value;
	
}

function setPlayerWeaponAmmo ( Player , Value ) {
	
}

function setPlayerWeaponState ( Player , Value ) {
	
}

// =============================================================================
// -- GTA Connected Event Hooks
// =============================================================================

addEventHandler ( "OnResourceStart" , function ( pEvent ) {

	foreach ( ii , iv in getroottable ( ) ) {
	
		print ( ii + " - " + iv + " (" + typeof iv + ")");
	
	}

});

addEventHandler ( "OnPlayerConnect" , function ( pEvent , pClient ) {

	local iClientID = getClientID ( pClient );

	LU_PLAYERS [ iClientID ] = ::LUPlayer ( pClient );

	::onPlayerConnect ( LU_PLAYERS [ pClient.index ] );

} );

addEventHandler ( "OnPlayerJoined" , function ( pEvent , pClient ) {

	local iClientID = getClientID ( pClient );

	::onPlayerJoin ( LU_PLAYERS [ iClientID ] );

} );

// -----------------------------------------------------------------------------

function onPlayerJoin ( pPlayer ) {	
	
	::print("Setting wanted level" );
	print(pPlayer);
	print(pPlayer.WantedLevel);

}

// -----------------------------------------------------------------------------

function getClientID ( pClient ) {

	foreach ( ii , iv in getClients ( ) ) {
	
		if ( iv == pClient ) {
		
			return ii;
		
		}
	
	}

}
