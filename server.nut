// =============================================================================
// -- Setup and config and shit
// =============================================================================

GTAC <- getroottable();

// -----------------------------------------------------------------------------

LU <- {
	Players = array(128, false),
	Vehicles = array(1024, false),
};

// -----------------------------------------------------------------------------

GTAC.addEvent("OnPlayerEnteredVehicle", 3);
GTAC.addEvent("OnPlayerEnteringVehicle", 3);

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
		::GTAC.triggerNetworkEvent("Civilian.RemoveLimb", GTACClient, GTACPlayer, iLimb.tointeger());
		return true;
	}

	function SetAnim(iAnim) {
		::GTAC.triggerNetworkEvent("Civilian.SetAnim", GTACClient, GTACPlayer, iAnim.tointeger());
		return true;
	}

	function EnterVehicle(pVehicle, iDoor) {
		::GTAC.triggerNetworkEvent("Civilian.EnterVehicle", GTACClient, GTACPlayer, pVehicle.GTACVehicle, iDoor.tointeger());
		return true;
	}

	function ExitVehicle() {
		::GTAC.triggerNetworkEvent("Civilian.ExitVehicle", GTACClient, GTACPlayer);
		return true;
	}

	function Duck() {
		::GTAC.triggerNetworkEvent("Civilian.Duck", GTACClient, GTACPlayer);
		return true;
	}

	function FuckYou() {
		::GTAC.triggerNetworkEvent("Civilian.FuckYou", GTACClient, GTACPlayer);
		return true;
	}

	function SetWeapon(iWeaponID, iAmmo) {
		::GTAC.triggerNetworkEvent("Civilian.SetWeapon", GTACClient, GTACPlayer, iWeaponID, iAmmo);
		return true;
	}

	function RunTo(pPosition) {
		::GTAC.triggerNetworkEvent("Civilian.RunTo", GTACClient, GTACPlayer, pPosition.GTACVector);
		return true;
	}

	function WalkTo(pPosition) {
		::GTAC.triggerNetworkEvent("Civilian.WalkTo", GTACClient, GTACPlayer, pPosition.GTACVector);
		return true;
	}

	function SprintTo(pPosition) {
		::GTAC.triggerNetworkEvent("Civilian.SprintTo", GTACClient, GTACPlayer, pPosition.GTACVector);
		return true;
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
			//case "Civilian":
			//	return _IsCivilian;
			case "Civilian":
				return _IsCivilian;
			case "Colour":
				return _Colour;
			case "ColouredName":
				return _ColouredName;
			case "Health":
				return _Health;
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
				return GTACClient.name;
			case "NametagColour":
				return _NametagColour;
			case "Pos":
				return ::GTAC.Vector(GTACPlayer.position.x, GTACPlayer.position.y, GTACPlayer.position.z);
			case "Skin":
				return _Skin;
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
					return ::LU.Vehicles[GTACPlayer.vehicle];
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

			//case "Civilian":
			//	_IsCivilian = pValue.tointeger();
			//	triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
			//	break;

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
				triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
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
				GTACPlayer.setData("LU.Name", pValue.tostring(), true);
				//::GTAC.triggerNetworkEvent(szEventName, null, GTACPlayer, pValue.tostring());
				break;

			case "NametagColour":
				_NametagColour = pValue;
				triggerNetworkEvent(szEventName, null, GTACPlayer, pValue.tointeger());
				break;

			case "Pos":
				_Pos = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, _Pos.x, _Pos.y, _Pos.z);
				break;

			case "Skin":
				_Skin = pValue.tointeger();
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

			case "Vehicle":
				_Vehicle = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.GTACVehicle);
				break;

			case "VehicleSeat":
				_VehicleSeat = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "Velocity":
				_Velocity = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.GTACVec3);
				break;

			case "VirtualWorld":
				_VirtualWorld = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "WalkStyle":
				_WalkStyle = pValue;
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

	constructor(pGTACCivilian) {
		GTACCivilian = pGTACCivilian;
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

	function FuckYou() {
		::GTAC.triggerNetworkEvent("Player.FuckYou", GTACClient, GTACPlayer);
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
				return _Skin;
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
					return ::LU.Vehicles[GTACPlayer.vehicle];
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

			case "Vehicle":
				_Vehicle = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.GTACVehicle);
				break;

			case "VehicleSeat":
				_VehicleSeat = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "Velocity":
				_Velocity = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.GTACVec3);
				break;

			case "VirtualWorld":
				_VirtualWorld = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "WalkStyle":
				_WalkStyle = pValue;
				::GTAC.triggerNetworkEvent(szEventName, GTACClient, GTACPlayer.id, pValue.tointeger());
				break;

			case "WantedLevel":
				_WantedLevel = pValue;
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
		GTACPlayer = pGTACClient.player;
	}
}

// -----------------------------------------------------------------------------

class LUVehicle {

	GTACVehicle = false;

	_Alarm = false;
    _Alpha = 255;
    _Angle = 0;
    _Colour1 = 0;
    _Colour2 = ::GTAC.array(6,1);
    _CruiseSpeed = 0;
    _Driver = false;
    _Doors = ::GTAC.array(6,1);
    _EngineDamage = 0;
    _Health = 1000;
    _IdleRespawnTime = 0;
    _IdleTime = ::GTAC.array(4,1);
    _Lights = ::GTAC.array(4,1);
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
    _VirtualWorld = ::GTAC.array(4,1);
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

	function _get(szKey) {
		switch(szKey) {
			case "Alarm":
				return _Alarm;
			case "Alpha":
				return _Alpha;
			case "Angle":
				return _Angle;
			case "Colour1":
				return _Colour1;
			case "Colour2":
				return _Colour2;
			case "Driver":
				return _Driver;
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
				return _PassengerCount;
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
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Angle":
				_Angle = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tofloat());
				break;
			case "Colour1":
				_Colour1 = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Colour2":
				_Colour2 = pValue;
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
				_LightState = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Locked":
				_Locked = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Marker":
				_Marker = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "MarkerScale":
				_MarkerScale = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "MarkerSprite":
				_MarkerSprite = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "Model":
				_Model = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "OneTime":
				_OneTime = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "PassengerCount":
				_PassengerCount = pValue;
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
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
				break;
			case "RGBColour2":
				_RGBColour2 = pValue;
				::GTAC.triggerNetworkEvent(szEventName, null, GTACVehicle, pValue.tointeger());
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
	message(szMessage, pColour.GTACColour, pPlayer.GTACClient);
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

	return false;;
}

// -----------------------------------------------------------------------------

function CreateVehicle(iModel, pPosition, fRotation, iColour1, iColour2, iGame = 1) {
	local pVehicle = GTAC.game.createVehicle(iModel, iGame);
	//pVehicle.modelIndex = iModel;
	pVehicle.position = pPosition.GTACVector;
	pVehicle.heading = fRotation;
	addToWorld(pVehicle);
	LU.Vehicles[pVehicle] = ::LUVehicle(pVehicle);
}

// -----------------------------------------------------------------------------

function GetClients() {
	if(type(getClients()) == "array") {
		return getClients();
	}

	return [getClients()];
}

// -----------------------------------------------------------------------------

// =============================================================================
// -- Event Hooks
// =============================================================================

GTAC.addEventHandler("OnResourceStart", function(pEvent, pResource) {
	foreach(ii, iv in GTAC.getClients()) {
		LU.Players[iv.index] = ::LUPlayer(iv);
	}

	if(pResource == GTAC.thisResource) {
		if(getroottable().rawin("onScriptLoad")) {
			local func = getroottable().rawget("onScriptLoad");
			if(type(func) == "function") {
				func.call(this);
			}
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnResourceStop", function(pEvent, pResource) {
	if(pResource == GTAC.thisResource) {
		if(getroottable().rawin("onScriptUnload")) {
			local func = getroottable().rawget("onScriptUnload");
			if(type(func) == "function") {
				func.call(this);
			}
		}
	}

	// Cleanup
	GTAC.collectAllGarbage();
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnServerStart", function(pEvent, pResource) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(pResource == GTAC.thisResource) {
		if(getroottable().rawin("onServerStart")) {
			local func = getroottable().rawget("onServerStart");
			if(type(func) == "function") {
				func.call(this);
			}
		}
	}

	// Cleanup
	GTAC.collectAllGarbage();
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerQuit", function(pEvent, pClient, iReason) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(getroottable().rawin("onPlayerPart")) {
		local func = getroottable().rawget("onPlayerPart");
		if(type(func) == "function") {
			func.call(this, LU.Players[pClient.index], iReason);
		}
	}

	LU.Players[pClient.index] = false;
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerEnteringVehicle", function(pEvent, pClient, pVehicle, iSeat) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(getroottable().rawin("onPlayerEnteringVehicle")) {
		local func = getroottable().rawget("onPlayerEnteringVehicle");
		if(type(func) == "function") {
			func.call(this, LU.Players[pClient.index], LU.Vehicles[pClient.vehicle.id], iSeat);
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerEnteredVehicle", function(pEvent, pClient, pVehicle) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(getroottable().rawin("onPlayerEnteredVehicle")) {
		local func = getroottable().rawget("onPlayerEnteredVehicle");
		if(type(func) == "function") {
			func.call(this, LU.Players[pClient.index], LU.Vehicles[pClient.vehicle.id], getPlayerVehicleSeat(pClient));
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerJoin", function(pEvent, pClient) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(getroottable().rawin("onPlayerConnect")) {
		if(type(onPlayerCommand) == "function") {
			local func = getroottable().rawget("onPlayerConnect");
			if(type(func) == "function") {
				func.call(this, LU.Players[pClient.index]);
			}
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerJoined", function(pEvent, pClient) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(getroottable().rawin("onPlayerJoin")) {
		if(type(onPlayerCommand) == "function") {
			local func = getroottable().rawget("onPlayerJoin");
			if(type(func) == "function") {
				func.call(this, LU.Players[pClient.index]);
			}
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerChat", function(pEvent, pClient, szMessage) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(getroottable().rawin("onPlayerChat")) {
		if(type(onPlayerCommand) == "function") {
			local func = getroottable().rawget("onPlayerChat");
			if(type(func) == "function") {
				local pResult = func.call(this, LU.Players[pClient.index]);

				// Check if returned 0 to cancel the normal chat output
				if(pResult == 0) {
					pEvent.preventDefault();
				}
			}
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerCommand", function(pEvent, pClient, szCommand, szParams) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(getroottable().rawin("onPlayerCommand")) {
		local func = getroottable().rawget("onPlayerCommand");
		if(type(func) == "function") {
			func.call(this, LU.Players[pClient.index], szCommand, szParams);
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnProcess", function(pEvent, iDeltaTime) {
	foreach(ii, iv in GTAC.getClients()) {
		if(iv.player != null) {
			if(iv.player.vehicle != null) {
				if(iv.player.getData("vehicle") == null) {
					triggerEvent("OnPlayerEnteredVehicle", LU.Players[iv.index], LU.Vehicles[iv.player.vehicle.id], gtacGetPlayerVehicleSeat(pClient));
				}
			}
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPedEnterVehicle", function(pEvent, pPed, pVehicle, iSeat) {
	if(pPed.isType(GTAC.ELEMENT_PLAYER)) {
		triggerEvent("OnPlayerEnteringVehicle", LU.Players[getClientFromPlayerElement(pPed).index], pVehicle, iSeat);
	}
});

// -----------------------------------------------------------------------------