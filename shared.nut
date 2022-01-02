// =============================================================================
// -- Setup and config and shit
// =============================================================================

GTAC <- getroottable();

// -----------------------------------------------------------------------------

LU <- {
	Players = array(128, false),
	Vehicles = array(1024, false),
	Civilians = array(1024, false),
};

// -----------------------------------------------------------------------------

GTAC.addEvent("OnPlayerEnteredVehicle", 3);
GTAC.addEvent("OnPlayerEnteringVehicle", 3);
GTAC.addEvent("OnPlayerExitedVehicle", 2);
GTAC.addEvent("OnPlayerExitingVehicle", 2);
GTAC.addEvent("OnPlayerSpawn", 2);

// =============================================================================
// -- Classes
// =============================================================================

class LUCivilian {

	GTACCivilian = false;

	_Alpha = 255;
	_Angle = 0;
	_Armour = 0;
	_Cash = 0;
	_Colour = false;
	_ColouredName = false;
	_Health = 100;
	_Immune = false;
	_IP = "";
	_Marker = true;
	_MarkerScale = 2;
	_MarkerSprite = 0;
	_Muted = false;
	_Pos = false;
	_Name = "";
    _Nametag = 1;
	_Skin = 0;
	_Team = 0;
	_Train = false;
	_Vehicle = false;
	_VehicleSeat = -1;
	_Velocity = false;
	_VirtualWorld = 0;
	_WalkStyle = 0;
	_Weapon = 0;
	_WeaponAmmo = 0;

	function RemoveLimb(iLimb) {
		::GTAC.triggerNetworkEvent("Civilian.RemoveLimb", null, GTACCivilian.id, iLimb.tointeger());
		return true;
	}

	function SetAnim(iAnim) {
		::GTAC.triggerNetworkEvent("Civilian.SetAnim", null, GTACCivilian.id, iAnim.tointeger());
		return true;
	}

	function EnterVehicle(pVehicle, iDoor) {
		::GTAC.triggerNetworkEvent("Civilian.EnterVehicle", null, GTACCivilian.id, pVehicle.GTACVehicle, iDoor.tointeger());
		return true;
	}

	function ExitVehicle() {
		::GTAC.triggerNetworkEvent("Civilian.ExitVehicle", null, GTACCivilian.id);
		return true;
	}

	function Duck() {
		::GTAC.triggerNetworkEvent("Civilian.Duck", null, GTACCivilian.id);
		return true;
	}

	function FuckYou() {
		::GTAC.triggerNetworkEvent("Civilian.FuckYou", null, GTACCivilian.id);
		return true;
	}

	function SetWeapon(iWeaponID, iAmmo) {
		::GTAC.triggerNetworkEvent("Civilian.SetWeapon", null, GTACCivilian.id, iWeaponID, iAmmo);
		return true;
	}

	function RunTo(pPosition) {
		::GTAC.triggerNetworkEvent("Civilian.RunTo", null, GTACCivilian.id, pPosition.GTACVector);
		return true;
	}

	function WalkTo(pPosition) {
		::GTAC.triggerNetworkEvent("Civilian.WalkTo", null, GTACCivilian.id, pPosition.GTACVector);
		return true;
	}

	function SprintTo(pPosition) {
		::GTAC.triggerNetworkEvent("Civilian.SprintTo", null, GTACCivilian.id, pPosition.GTACVector);
		return true;
	}

    function ResyncData() {
       	GTACCivilian.setData("LU.Name", _Name, true);
		GTACCivilian.setData("LU.Nametag", _Nametag, true);
		GTACCivilian.setData("LU.Marker", _Marker, true);
		GTACCivilian.setData("LU.MarkerSprite", _MarkerSprite, true);
		GTACCivilian.setData("LU.Alpha", _Alpha, true);
    }

	function _get(szKey) {
		switch(szKey) {
			case "Alpha":
				return _Alpha;
			case "Angle":
				return GTACPlayer.heading;
			case "Armour":
				return _Armour;
			case "Cash":
				return _Cash;
			case "Civilian":
				return true;
			case "Civilian":
				return _IsCivilian;
			case "Colour":
				return _Colour;
			case "ColouredName":
				return _ColouredName;
			case "Health":
				return _Health;
            case "ID":
                return GTACCivilian.id;
			case "Immune":
				return _Immune;
			case "Marker":
				return _Marker;
			case "MarkerScale":
				return _MarkerScale;
			case "MarkerSprite":
				return _MarkerSprite;
			case "Muted":
				return _Muted;
			case "Name":
				return _Name;
			case "NametagColour":
				return _NametagColour;
			case "Pos":
				return ::GTAC.Vector(GTACCivilian.position.x, GTACCivilian.position.y, GTACCivilian.position.z);
			case "Skin":
				return GTACCivilian.modelIndex;
			case "Team":
				return _Team;
			case "Train":
				if(GTACCivilian.vehicle != null) {
					if(GTACCivilian.vehicle.type == ELEMENT_TRAIN) {
						return ::LU.Vehicles[GTACCivilian.vehicle.id];
					}
				}
				return false;
			case "Vehicle":
				if(GTACCivilian.vehicle != null) {
					return ::LU.Vehicles[GTACCivilian.vehicle.id];
				}
				return false;
			case "VehicleSeat":
				return _VehicleSeat;
			case "Velocity":
				return ::GTAC.Vector(GTACCivilian.velocity.x, GTACCivilian.velocity.y, GTACCivilian.velocity.z);
			case "VirtualWorld":
				return GTACCivilian.dimension;
			case "WalkStyle":
				return _WalkStyle;
			case "Weapon":
				return _Weapon;
			case "WeaponAmmo":
				return _WeaponAmmo;

			default:
				throw null;
				break;
		}
	}

	function _set(szKey, pValue) {
		local szEventName = "Civilian.Set." + szKey;

		switch(szKey) {
			case "Alpha":
				_Alpha = pValue;
				//::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACCivilian.id, pValue.tointeger());
				break;

			case "Angle":
				_Angle = pValue.tofloat();
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACCivilian.id, pValue.tofloat());
				break;

			case "Armour":
				_Angle = pValue.tointeger();
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACCivilian.id, pValue.tointeger());
				break;

			case "Cash":
				_Cash = pValue.tointeger();
				triggerNetworkEvent(szEventName, GTACClient, GTACCivilian.id, pValue.tointeger());
				break;

			case "Colour":
				_Colour = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACCivilian.id, pValue.GTACColour);
				break;

			case "ColouredName":
				_ColouredName = pValue.tostring();
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACCivilian.id, pValue.tostring());
				break;

			case "Health":
				_Health = pValue.tointeger();
				triggerNetworkEvent(szEventName, GTACClient, GTACCivilian.id, pValue.tointeger());
				break;

			case "Immune":
				_Immune = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACCivilian.id, pValue.tointeger());
				break;

			case "Marker":
				_Marker = pValue;
				GTACCivilian.setData("LU.Marker", _Marker, true);
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACCivilian.id, _Marker);
				break;

			case "MarkerScale":
				_MarkerScale = pValue;
				GTACCivilian.setData("LU.MarkerScale", _MarkerScale, true);
				::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian.id, _MarkerScale);
				break;

			case "MarkerSprite":
				_MarkerSprite = pValue;
				GTACCivilian.setData("LU.MarkerSprite", _MarkerSprite, true);
				::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian.id, _MarkerSprite);
				break;

			case "Muted":
				_Muted = pValue;
				//::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACCivilian.id, pValue.tointeger());
				break;

			case "Muted":
				_Muted = pValue;
				//::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACCivilian.id, pValue.tointeger());
				break;

			case "Name":
				_Name = pValue;
				GTACCivilian.name = _Name;
				GTACCivilian.setData("LU.Name", _Name, true);
				//::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian, pValue.tostring());
				break;

			case "NametagColour":
				_NametagColour = pValue;
				triggerNetworkEvent(szEventName, null, GTACCivilian.id, pValue.tointeger());
				break;

			case "Pos":
				_Pos = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian.id, _Pos.x, _Pos.y, _Pos.z);
				break;

			case "Skin":
				_Skin = pValue.tointeger();
                GTACCivilian.modelIndex = _Skin;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian.id, pValue.tointeger());
				break;

			case "Team":
				_Team = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian.id, pValue.tointeger());
				break;

			case "Train":
				_Train = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian.id, pValue.GTACVethicle);
				break;

			case "Vehicle":
				_Vehicle = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian.id, pValue.GTACVehicle);
				break;

			case "VehicleSeat":
				_VehicleSeat = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian.id, pValue.tointeger());
				break;

			case "Velocity":
				_Velocity = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian.id, pValue.GTACVec3);
				break;

			case "VirtualWorld":
				_VirtualWorld = pValue.tointeger();
				GTACCivilian.dimension = pValue.tointeger();
				break;

			case "WalkStyle":
				_WalkStyle = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian.id, pValue.tointeger());
				break;

			case "WeaponAmmo":
				_WeaponAmmo = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACCivilian.id, pValue.tointeger());
				break;

			default:
				throw null;
				break;
		}
	}

	constructor(pGTACCivilian) {
		GTACCivilian = pGTACCivilian;
        _Name = "Civilian " + GTACCivilian.id;
        ResyncData();
	}
}

// -----------------------------------------------------------------------------

class LUPlayer {

	GTACPlayer = false;
	GTACClient = false;

	//_IsCivilian = false;

	_Alpha = 255;
	_Angle = 0;
	_Armour = 0;
	_Cash = 0;
	_Colour = false;
	_ColouredName = false;
	_Health = 100;
	_Immune = false;
	_IP = "";
	_Marker = true;
	_MarkerScale = 2;
	_MarkerSprite = 0;
	_Money = 0;
	_Muted = false;
    _Nametag = 1;
	_Pos = false;
	_Name = "";
	_Skin = 0;
	_Team = 0;
	_Train = false;
	_Vehicle = false;
	_VehicleSeat = -1;
	_Velocity = false;
	_VirtualWorld = 0;
	_WalkStyle = 0;
	_WantedLevel = 0;
	_Weapon = 0;
	_WeaponAmmo = 0;

	function RemoveLimb(iLimb) {
		::GTAC.triggerNetworkEvent("Player.RemoveLimb", GTACClient, GTACPlayer, iLimb.tointeger());
		return true;
	}

	function SetAnim(iAnim) {
		::GTAC.triggerNetworkEvent("Player.SetAnim", GTACClient, GTACPlayer, iAnim.tointeger());
		return true;
	}

	function EnterVehicle(pVehicle, iDoor) {
		::GTAC.triggerNetworkEvent("Player.EnterVehicle", GTACClient, GTACPlayer, pVehicle.GTACVehicle, iDoor.tointeger());
		return true;
	}

	function ExitVehicle() {
		::GTAC.triggerNetworkEvent("Player.ExitVehicle", GTACClient, GTACPlayer);
		return true;
	}

	function Duck() {
		::GTAC.triggerNetworkEvent("Player.Duck", GTACClient, GTACPlayer);
		return true;
	}

	function SetWeapon(iWeaponID, iAmmo) {
		::GTAC.triggerNetworkEvent("Player.SetWeapon", GTACClient, GTACPlayer, iWeaponID, iAmmo);
		return true;
	}

	function RunTo(pPosition) {
		::GTAC.triggerNetworkEvent("Player.RunTo", GTACClient, GTACPlayer, pPosition.GTACVector);
		return true;
	}

	function WalkTo(pPosition) {
		::GTAC.triggerNetworkEvent("Player.WalkTo", GTACClient, GTACPlayer, pPosition.GTACVector);
		return true;
	}

	function SprintTo(pPosition) {
		::GTAC.triggerNetworkEvent("Player.SprintTo", GTACClient, GTACPlayer, pPosition.GTACVector);
		return true;
	}

    function ResyncData() {
        GTACPlayer.setData("LU.Name", _Name, true);
        GTACPlayer.setData("LU.Nametag", _Nametag, true);
        GTACPlayer.setData("LU.Marker", _Marker, true);
        GTACPlayer.setData("LU.MarkerSprite", _MarkerSprite, true);
        GTACPlayer.setData("LU.Alpha", _Alpha, true);
    }

	function _get(szKey) {
		switch(szKey) {
			case "Alpha":
				return _Alpha;
			case "Angle":
				return GTACPlayer.heading;
			case "Armour":
				return _Armour;
			case "Cash":
				return _Cash;
			case "Civilian":
				return _IsCivilian;
			case "Colour":
				return _Colour;
			case "ColouredName":
				return _ColouredName;
			case "Health":
				return _Health;
            case "ID":
                return GTACClient.index;
			case "Immune":
				return _Immune;
			case "Marker":
				return _Marker;
			case "MarkerScale":
				return _MarkerScale;
			case "MarkerSprite":
				return _MarkerSprite;
			case "Money":
				return _Money;
			case "Money":
				return _Money;
			case "Muted":
				return _Muted;
			case "Name":
				return GTACClient.name;
			case "NametagColour":
				return _NametagColour;
			case "Pos":
				return ::GTAC.Vector(GTACPlayer.position.x, GTACPlayer.position.y, GTACPlayer.position.z);
			case "Skin":
				return GTACPlayer.modelIndex;
			case "Team":
				return _Team;
			case "Train":
				if(GTACPlayer.vehicle != null) {
					if(GTACPlayer.vehicle.type == ELEMENT_TRAIN) {
						return ::LU.Vehicles[GTACPlayer.vehicle];
					}
				}
				return false;
			case "Vehicle":
				if(GTACPlayer.vehicle != null) {
					return ::LU.Vehicles[GTACPlayer.vehicle.id];
				}
				return false;
			case "VehicleSeat":
				return _VehicleSeat;
			case "Velocity":
				return ::GTAC.Vector(GTACPlayer.velocity.x, GTACPlayer.velocity.y, GTACPlayer.velocity.z);
			case "VirtualWorld":
				return GTACPlayer.dimension;
			case "WalkStyle":
				return _WalkStyle;
			case "WantedLevel":
				return _WantedLevel;
			case "Weapon":
				return _Weapon;
			case "WeaponAmmo":
				return _WeaponAmmo;

			default:
				throw null;
				break;
		}
	}

	function _set(szKey, pValue) {
		local szEventName = "Player.Set." + szKey;

		switch(szKey) {
			case "Alpha":
				_Alpha = pValue.tointeger();
				GTACPlayer.setData("LU.Alpha", pValue.tointeger(), true);
				//::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "Angle":
				_Angle = pValue.tofloat();
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tofloat());
				break;

			case "Armour":
				_Angle = pValue.tointeger();
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "Cash":
				_Cash = pValue.tointeger();
				triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "Colour":
				_Colour = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.GTACColour);
				break;

			case "ColouredName":
				_ColouredName = pValue.tostring();
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tostring());
				break;

			case "Health":
				_Health = pValue.tointeger();
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "Immune":
				_Immune = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "Marker":
				_Marker = pValue;
				GTACPlayer.setData("LU.Marker", pValue.tointeger(), true);
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "MarkerScale":
				_MarkerScale = pValue;
				GTACPlayer.setData("LU.MarkerScale", pValue.tointeger(), true);
				::GTAC.triggerNetworkEvent(szEventName, null, GTACPlayer, pValue.tointeger());
				break;

			case "MarkerSprite":
				_MarkerSprite = pValue;
				GTACPlayer.setData("LU.MarkerSprite", pValue.tointeger(), true);
				::GTAC.triggerNetworkEvent(szEventName, null, GTACPlayer, pValue.tointeger());
				break;

			case "Muted":
				_Muted = pValue;
				//::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "Name":
				_Name = pValue;
				GTACPlayer.name = pValue;
				//::GTAC.triggerNetworkEvent(szEventName, null, GTACPlayer, pValue.tostring());
				break;

			case "Nametag":
				_Nametag = pValue;
				GTACPlayer.setData("LU.Nametag", pValue, true);
				triggerNetworkEvent(szEventName, null, GTACPlayer, pValue);
				break;

			case "NametagColour":
				_NametagColour = pValue;
				GTACPlayer.setData("LU.NametagColour", pValue, true);
				triggerNetworkEvent(szEventName, null, GTACPlayer, pValue.tointeger());
				break;

			case "Pos":
				_Pos = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, _Pos.x, _Pos.y, _Pos.z);

			case "Skin":
				_Skin = pValue.tointeger();
                GTACPlayer.modelIndex = _Skin;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "Team":
				_Team = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "Train":
				_Train = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.GTACVethicle);
				break;

			case "Velocity":
				_Velocity = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.GTACVec3);
				break;

			case "VirtualWorld":
				_VirtualWorld = pValue;
                GTACPlayer.dimension = _VirtualWorld;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "WantedLevel":
				_WantedLevel = pValue;
                GTACPlayer.wantedLevel = _WantedLevel;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "WeaponAmmo":
				_WeaponAmmo = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			default:
				throw null;
				break;
		}
	}

	constructor(pGTACClient) {
		GTACClient = pGTACClient;
        _Name = GTACClient.name;
        if(pGTACClient.player != null) {
            GTACPlayer = pGTACClient.player;
            ResyncData();
        }
	}
}

// -----------------------------------------------------------------------------

class LUVehicle {

	GTACVehicle = false;

	_Alarm = false;
    _Alpha = 255;
    _Angle = 0;
    _Colour1 = 0;
    _Colour2 = 0;
    _CruiseSpeed = 0;
    _Driver = false;
    _Doors = ::GTAC.array(4,1);
    _EngineDamage = 0;
    _Health = 1000;
    _IdleRespawnTime = 0;
    _IdleTime = 0;
    _Lights = 0;
    _LightState = 0;
    _Locked = 0;
    _Marker = false;
    _MarkerScale = 0;
    _MarkerSprite = 0;
    _Model = 0;
    _OneTime = false;
    _PassengerCount = 0;
    _Pos = false;
    _RespawnTime = 0;
    _RGBColour1 = false;
    _RGBColour2 = false;
    _SpawnAngle = 0;
    _SpawnPos = false;
    _Siren = false;
    _SirenLight = false;
    _TaxiLight = false;
    _Velocity = false;
    _VirtualWorld = 0;
    _Wheels = ::GTAC.array(4,1);
    _Wrecked = false;

	function Fix() {
		::GTAC.triggerNetworkEvent("Vehicle.Func.Fix", null, GTACVehicle);
		return true;
	}

	function Explode() {
		::GTAC.triggerNetworkEvent("Vehicle.Func.Explode", null, GTACVehicle);
		return true;
	}

	function Respawn(iAnim) {
		::GTAC.triggerNetworkEvent("Vehicle.Func.Respawn", null, GTACVehicle);
		return true;
	}

	function DriveTo(pPosition) {
		::GTAC.triggerNetworkEvent("Vehicle.Func.DriveTo", null, GTACVehicle, pPosition.GTACVector.x, pPosition.GTACVector.y, pPosition.GTACVector.z);
		return true;
	}

	function WanderRandomly() {
		::GTAC.triggerNetworkEvent("Vehicle.Func.WanderRandomly", null, GTACVehicle, pPosition.GTACVector.x, pPosition.GTACVector.y, pPosition.GTACVector.z);
		return true;
	}

    function ResyncData() {
        GTACVehicle.setData("LU.Marker", _Marker, true);
        GTACVehicle.setData("LU.MarkerScale", _MarkerScale, true);
        GTACVehicle.setData("LU.MarkerSprite", _MarkerSprite, true);
        GTACVehicle.setData("LU.Alpha", _Alpha, true);
    }

	function _get(szKey) {
		switch(szKey) {
			case "Alarm":
				return _Alarm;
			case "Alpha":
				return _Alpha;
			case "Angle":
				return _Angle;
			case "Colour1":
				return GTACVehicle.colour1;
			case "Colour2":
				return GTACVehicle.colour1;
			case "Driver":
				return LU.Players[getClientFromPlayerElement(GTACVehicle.getOccupant(0)).index];
			case "EngineDamage":
				return _EngineDamage;
			case "Health":
				return _Health;
			case "ID":
				return GTACVehicle.id;
			case "IdleRespawnTime":
				return _IdleRespawnTime;
			case "IdleTime":
				return _IdleTime;
			case "LightState":
				return _LightState;
			case "Locked":
				return _Locked;
			case "Marker":
				return _Marker;
			case "MarkerScale":
				return _MarkerScale;
			case "MarkerSprite":
				return _MarkerSprite;
			case "Model":
				return _Model;
			case "OneTime":
				return _OneTime;
			case "PassengerCount":
				return GTACVehicle.getOccupants().len();
			case "Pos":
				return ::GTAC.Vector(GTACVehicle.position.x, GTACVehicle.position.y, GTACVehicle.position.z);
			case "RespawnTime":
				return _RespawnTime;
			case "RGBColour1":
				return _RGBColour1;
			case "RGBColour2":
				return _RGBColour2;
			case "SpawnAngle":
				return _SpawnAngle;
			case "SpawnPos":
				return _SpawnPos;
			case "Siren":
				return _Siren;
			case "SirenLight":
				return _SirenLight;
			case "TaxiLight":
				return _TaxiLight;
			case "Velocity":
				return ::GTAC.Vector(GTACVehicle.velocity.x, GTACVehicle.velocity.y, GTACVehicle.velocity.z);
			case "VirtualWorld":
				return GTACVehicle.dimension;
			case "Wrecked":
				return _Wrecked;

			default:
				throw null;
				break;
		}
	}

	function _set(szKey, pValue) {
		local szEventName = "Vehicle.Set." + szKey;

		switch(szKey) {
			case "Alpha":
				_Alpha = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
			case "Alarm":
				_Alpha = pValue;
                GTACVehicle.setData("LU.Alpha", _Alpha, true);
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Angle":
				_Angle = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tofloat());
				break;
			case "Colour1":
				_Colour1 = pValue.tointeger();
                GTACVehicle.colour1 = _Colour1;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Colour2":
				_Colour2 = pValue.tointeger();
                GTACVehicle.colour2 = _Colour2;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "EngineDamage":
				_EngineDamage = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Health":
				_Health = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "IdleRespawnTime":
				_IdleRespawnTime = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "IdleTime":
				_IdleTime = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "LightState":
				_LightState = pValue.tointeger();
                //GTACVehicle.lights = pValue.tointeger();
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Locked":
				_Locked = (pValue.tointeger() == 0) ? false : true;
                GTACVehicle.locked = _Locked;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Marker":
				_Marker = (pValue.tointeger() == 0) ? false : true;
                GTACVehicle.setData("LU.Marker", _Marker, true);
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "MarkerScale":
				_MarkerScale = pValue;
                GTACVehicle.setData("LU.MarkerScale", _Marker, true);
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "MarkerSprite":
				GTACVehicle.setData("LU.MarkerSprite", _Marker, true);
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "OneTime":
				_OneTime = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Pos":
				_Pos = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.GTACVector.x, pValue.GTACVector.z, pValue.GTACVector.z);
				break;
			case "RespawnTime":
				_RespawnTime = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "RGBColour1":
				_RGBColour1 = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.GTACColour.r, pValue.GTACColour.g, pValue.GTACColour.b);
				break;
			case "RGBColour2":
				_RGBColour2 = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.GTACColour.r, pValue.GTACColour.g, pValue.GTACColour.b);
				break;
			case "SpawnAngle":
				_SpawnAngle = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "SpawnPos":
				_SpawnPos = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Siren":
				_Siren = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "SirenLight":
				_SirenLight = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "TaxiLight":
				_TaxiLight = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Velocity":
				_Velocity = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "VirtualWorld":
				_VirtualWorld = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Wrecked":
				_Wrecked = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;

			default:
				throw null;
				break;
		}
	}

	// -------------------------------------------------------------------------

	constructor(pGTACVehicle) {
		GTACVehicle = pGTACVehicle;
        ResyncData();
	}
}

// -----------------------------------------------------------------------------

class Colour {
	GTACColour = false;
	_r = 0;
	_g = 0;
	_b = 0;
	_alpha = 255;

	function _get(szKey) {
		switch (szKey) {
			case "r":
				return _r;

			case "g":
				return _g;

			case "b":
				return _b;

			case "alpha":
				return _alpha;

			default:
				return false;
		}
	}

	function _set(szKey, pValue) {
		switch(szKey) {
			case "r":
				local newColour = ::GTAC.toColour(pValue, _g, _b, _alpha);
				GTACColour = newColour;
				return true;

			case "g":
				local newColour = ::GTAC.toColour(_r, pValue, _b, _alpha);
				GTACColour = newColour;

			case "b":
				local newColour = ::GTAC.toColour(_r, _g, pValue, _alpha);
				GTACColour = newColour;

			case "alpha":
				local newColour = ::GTAC.toColour(_r, _g, _b, pValue);
				GTACColour = newColour;

			default:
				return false;
		}
	}

	constructor(r, g, b, a = 255 ) {
		GTACColour = ::GTAC.toColour(r, g, b, a);
	}

}

// -----------------------------------------------------------------------------

class Vector {
	GTACVector = false;
	_x = 0;
	_y = 0;
	_z = 0;

	function _get(szKey)  {
		switch(szKey){
			case "x":
				return GTACVector.x;

			case "y":
				return GTACVector.y;

			case "z":
				return GTACVector.z;

			default:
				return false;
		}
	}

	function _set(szKey, pValue)  {
		switch(szKey)  {
			case "x":
				local newVec = ::GTAC.Vec3(pValue, GTACVector[1], GTACVector[2]);
				GTACVector = newVec;
				return true;

			case "y":
				local newVec = ::GTAC.Vec3(GTACVector[0], pValue, GTACVector[2]);
				GTACVector = newVec;

			case "z":
				local newVec = ::GTAC.Vec3(GTACVector[0], GTACVector[1], pValue );
				GTACVector = newVec;

			default:
				return false;
		}
	}

	constructor(x, y, z) {
		GTACVector = ::GTAC.Vec3(x, y, z);
	}
}

// -----------------------------------------------------------------------------

function gtacGetPlayerVehicleSeat(pClient) {
	for(local i = 0 ; i <= 4 ; i++) {
		if(pClient.player.vehicle.getOccupant(i) == pClient.player) {
			return i;
		}
	}

	return -1;
}

// =============================================================================
// -- Misc Functions
// =============================================================================

function MessagePlayer(szMessage, pPlayer, pColour = Colour(255, 255, 255)) {
	GTAC.messagePlayer(szMessage, pPlayer.GTACClient, pColour.GTACColour);
}

// -----------------------------------------------------------------------------

function Message(szMessage, pColour = Colour(255, 255, 255)) {
	GTAC.message(szMessage, pColour.GTACColour);
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
	return iInteger.tointeger() ? true : false;
}

// -----------------------------------------------------------------------------

function FindPlayer(szParams) {
	if(type(szParams) == "integer") {
		local iPlayerID = szParams.tointeger();
		if(LU.Players[iPlayerID]) {
			return LU.Players[iPlayerID];
		}
	} else {
		foreach(ii, iv in LU.Players) {
			if(iv.Name.tolower().find(szParams.tolower()) != -1) {
				return iv;
			}
		}
	}

	return false
}

// -----------------------------------------------------------------------------

function FindVehicle(szParams) {
	if(type(szParams) == "integer") {
		local iVehicleID = szParams.tointeger();
		if(LU.Vehicles[iVehicleID]) {
			return LU.Vehicles[iVehicleID];
		}
	}

	return false;
}

// -----------------------------------------------------------------------------