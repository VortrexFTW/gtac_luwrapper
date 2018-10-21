"use strict";

let callbackHandlers = [];

// =============================================================================
// -- Player Functions

function setPlayerPosition(client, x, y, z) {
    triggerNetworkEvent("lu.plr.pos", client, x, y, z);
}

function setPlayerHeading(client, angle) {
    triggerNetworkEvent("lu.plr.zrot", client, angle);
}

function givePlayerWeapon(client, weaponID, ammo) {
    triggerNetworkEvent("lu.plr.wepadd", client, weaponID, ammo);
}

function clearPlayerWeapons(client) {
    triggerNetworkEvent("lu.plr.wepclr", client);
}

function setPlayerSkin(client, skinID) {
    triggerNetworkEvent("lu.plr.skin", client, skinID);
}

function setPlayerInvincible(client, state) {
    triggerNetworkEvent("lu.plr.god", client, state);
}

function setPlayerProofs(client, bullet, fire, explosion, collision, melee) {
    triggerNetworkEvent("lu.plr.proofs", client, bullet, fire, explosion, collision, melee);
}

function setPlayerHealth(client, health) {
    triggerNetworkEvent("lu.plr.hp", client, health);
}

function setPlayerArmour(client, armour) {
    triggerNetworkEvent("lu.plr.ap", client, armour);
}

function warpPlayerIntoVehicle(client, vehicle, driver) {
    triggerNetworkEvent("lu.plr.veh.warpin", client, vehicle, driver);
}

function removePlayerFromVehicle(client) {
    triggerNetworkEvent("lu.plr.veh.warpout", client);
}

function makePlayerEnterVehicle(client, vehicle, driver) {
    triggerNetworkEvent("lu.plr.veh.warpin", client, vehicle, driver);
}

function makePlayerExitVehicle(client) {
    triggerNetworkEvent("lu.plr.veh.exit", client);
}

function setPlayerWantedLevel(client, wantedLevel) {
    triggerNetworkEvent("lu.plr.stars", client, wantedLevel);
}

// =============================================================================
// -- Ped Functions

function setCivilianPosition(civilian, x, y, z) {
    triggerNetworkEvent("lu.civ.pos", getSyncerFromID(civilian.syncer), civilian, x, y, z);
}

function setCivilianHeading(civilian, angle) {
    triggerNetworkEvent("lu.civ.zrot", getSyncerFromID(civilian.syncer), civilian, angle);
}

function giveCivilianWeapon(civilian, weaponID, ammo) {
	console.log(civilian.syncer);
    triggerNetworkEvent("lu.civ.wep.add", getSyncerFromID(civilian.syncer), civilian, weaponID, ammo);
}

function clearCivilianWeapons(civilian) {
    triggerNetworkEvent("lu.civ.wep.clr", getSyncerFromID(civilian.syncer), civilian, client);
}

function setCivilianSkin(civilian, skinID) {
    triggerNetworkEvent("lu.civ.skin", getSyncerFromID(civilian.syncer), civilian, skinID);
}

function setCivilianInvincible(civilian, state) {
    triggerNetworkEvent("lu.civ.god", getSyncerFromID(civilian.syncer), civilian, state);
}

function setCivilianProofs(civilian, proof, state) {
    triggerNetworkEvent("lu.civ.proofs", getSyncerFromID(civilian.syncer), civilian, proof, state);
}

function setCivilianHealth(civilian, health) {
    triggerNetworkEvent("lu.civ.hp", getSyncerFromID(civilian.syncer), civilian, health);
}

function setCivilianArmour(civilian, armour) {
    triggerNetworkEvent("lu.civ.ap", getSyncerFromID(civilian.syncer), civilian, armour);
}

function warpCivilianIntoVehicle(civilian, vehicle, driver) {
    triggerNetworkEvent("lu.civ.veh.warpin", getSyncerFromID(civilian.syncer), civilian, vehicle, driver);
}

function makeCivilianEnterVehicle(civilian, vehicle, driver) {
    triggerNetworkEvent("lu.civ.veh.in", getSyncerFromID(civilian.syncer), civilian, vehicle, driver);
}

function makeCivilianExitVehicle(civilian) {
    triggerNetworkEvent("lu.civ.veh.in", getSyncerFromID(civilian.syncer), civilian);
}

function removeCivilianFromVehicle(civilian) {
    triggerNetworkEvent("lu.civ.veh.eject", getSyncerFromID(civilian.syncer), civilian);
}

function makeCivilianWalkToPos(civilian, x, y, z) {
    triggerNetworkEvent("lu.civ.walk.pos", getSyncerFromID(civilian.syncer), civilian, x, y);
}

function makeCivilianWalkForward(civilian, distance) {
    triggerNetworkEvent("lu.civ.walk.fwd", getSyncerFromID(civilian.syncer), civilian, distance);
}

function makeCivilianWalkToElement(civilian, element) {
    triggerNetworkEvent("lu.civ.walk.to", getSyncerFromID(civilian.syncer), civilian, element);
}

function makeCivilianRunToPos(civilian, x, y, z) {
    triggerNetworkEvent("lu.civ.run.pos", getSyncerFromID(civilian.syncer), civilian, x, y);
}

function makeCivilianRunForward(civilian, distance) {
    triggerNetworkEvent("lu.civ.run.fwd", getSyncerFromID(civilian.syncer), civilian, distance);
}

function makeCivilianRunToElement(civilian, element) {
    triggerNetworkEvent("lu.civ.run.to", getSyncerFromID(civilian.syncer), civilian, element);
}

function makeCivilianDuck(civilian) {
    triggerNetworkEvent("lu.civ.duck", getSyncerFromID(civilian.syncer), civilian);
}

function makeCivilianHailTaxi(civilian) {
    triggerNetworkEvent("lu.civ.hailtaxi", getSyncerFromID(civilian.syncer), civilian);
}

function resurrectCivilian(civilian) {
    triggerNetworkEvent("lu.civ.resurrect", getSyncerFromID(civilian.syncer), civilian);
}

function makeCivilianPointGunAt(civilian, thing) {
    triggerNetworkEvent("lu.civ.aimat", getSyncerFromID(civilian.syncer), civilian, thing);
}

function makeCivilianStayInSamePlace(civilian, state) {
    triggerNetworkEvent("lu.civ.stay", getSyncerFromID(civilian.syncer), civilian, state);
}

function setCivilianCollision(civilian, state) {
    triggerNetworkEvent("lu.civ.col", getSyncerFromID(civilian.syncer), civilian, state);
}

function setCivilianThreatSearch(civilian, threat) {
    triggerNetworkEvent("lu.civ.threat.add", getSyncerFromID(civilian.syncer), civilian, threat);
}

function setCivilianHeedThreats(civilian, state) {
    triggerNetworkEvent("lu.civ.threat.heed", getSyncerFromID(civilian.syncer), civilian, state);
}

function clearCivilianThreatSearch(civilian) {
    triggerNetworkEvent("lu.civ.threat.clr", getSyncerFromID(civilian.syncer), civilian);
}

function makeCivilianFlipOff(civilian) {
    triggerNetworkEvent("lu.civ.fu", getSyncerFromID(civilian.syncer), civilian);
}

function setCivilianPedStats(civilian, stat) {
    triggerNetworkEvent("lu.civ.stat", getSyncerFromID(civilian.syncer), civilian, stat);
}

function setCivilianObjective(civilian, objectiveID, x = 0, y = 0, z = 0) {
    triggerNetworkEvent("lu.civ.objective", getSyncerFromID(civilian.syncer), civilian, objectiveID, x, y, z);
}

function setCivilianPedType(civilian, pedType) {
    triggerNetworkEvent("lu.civ.type", getSyncerFromID(civilian.syncer), civilian, pedType);
}

function setCivilianWanderPath(civilian, wanderPath) {
    triggerNetworkEvent("lu.civ.wanderpath", getSyncerFromID(civilian.syncer), civilian, wanderPath);
}

function setCivilianScale(civilian, scale) {
    triggerNetworkEvent("lu.civ.scale", getSyncerFromID(civilian.syncer), civilian, scale);
}

function setCivilianWalkStyle(civilian, walkStyle) {
    triggerNetworkEvent("lu.civ.walkstyle", getSyncerFromID(civilian.syncer), civilian, walkStyle);
}

function mekeCivilianSpeak(civilian, speechID) {
    triggerNetworkEvent("lu.civ.say", getSyncerFromID(civilian.syncer), civilian, speechID);
}

function setCivilianAnim(civilian, anim) {
    triggerNetworkEvent("lu.civ.anim", getSyncerFromID(civilian.syncer), civilian, anim);
}

function removeLimbFromCivilian(civilian, bodyPart) {
    triggerNetworkEvent("lu.civ.removepart", getSyncerFromID(civilian.syncer), civilian, bodyPart);
}

function setCivilianActiveWeapon(civilian, weaponID) {
    triggerNetworkEvent("lu.civ.wep.set", getSyncerFromID(civilian.syncer), civilian, weaponID);
}

// =============================================================================
// -- Vehicle Functions

function setVehicleHealth(vehicle, health) {
    triggerNetworkEvent("lu.veh.health", getSyncerFromID(vehicle.syncer), vehicle, health);
}

function setVehicleBaseType(vehicle, baseType) {
    triggerNetworkEvent("lu.veh.type.base", getSyncerFromID(vehicle.syncer), vehicle, baseType);
}

function setVehicleSubType(vehicle, subType) {
    triggerNetworkEvent("lu.veh.type.sub", getSyncerFromID(vehicle.syncer), vehicle, subType);
}

function setVehicleColour1(vehicle, colour1) {
    triggerNetworkEvent("lu.veh.col.1", getSyncerFromID(vehicle.syncer), vehicle, colour1);
}

function setVehicleColour2(vehicle, colour2) {
    triggerNetworkEvent("lu.veh.col.2", getSyncerFromID(vehicle.syncer), vehicle, colour2);
}

function setVehicleColour3(vehicle, colour3) {
    triggerNetworkEvent("lu.veh.col.3", getSyncerFromID(vehicle.syncer), vehicle, colour3);
}

function setVehicleColour4(vehicle, colour4) {
    triggerNetworkEvent("lu.veh.col.4", getSyncerFromID(vehicle.syncer), vehicle, colour4);
}

function setVehicleCruiseSpeed(vehicle, cruiseSpeed) {
    triggerNetworkEvent("lu.veh.cruisespeed", getSyncerFromID(vehicle.syncer), vehicle, cruiseSpeed);
}

function makeVehicleWanderRandomly(vehicle) {
    triggerNetworkEvent("lu.veh.wander", getSyncerFromID(vehicle.syncer), vehicle);
}

function setVehicleDrivingStyle(vehicle, drivingStyle) {
    triggerNetworkEvent("lu.veh.drivestyle", getSyncerFromID(vehicle.syncer), vehicle, drivingStyle);
}

function setVehicleMission(vehicle, mission) {
    triggerNetworkEvent("lu.veh.mission", getSyncerFromID(vehicle.syncer), vehicle, mission);
}

function repairVehicle(vehicle) {
    triggerNetworkEvent("lu.veh.fix", getSyncerFromID(vehicle.syncer), vehicle);
}

// =============================================================================
// -- Train Functions

function setTrainDerailed(train, state) {
    triggerNetworkEvent("lu.train.derailed", getSyncerFromID(vehicle.syncer), train, state);
}

function setTrainTrack(train, track) {
    triggerNetworkEvent("lu.train.track.id", getSyncerFromID(vehicle.syncer), train, track);
}

function setTrainTrackPosition(train, trackPosition) {
    triggerNetworkEvent("lu.train.track.pos", getSyncerFromID(vehicle.syncer), train, trackPosition);
}

function setTrainSpeed(train, speed) {
    triggerNetworkEvent("lu.train.speed", getSyncerFromID(vehicle.syncer), train, speed);
}

// =============================================================================
// -- Garage Functions

function openGarage(garageID) {
    triggerNetworkEvent("lu.garage.open", getSyncerFromID(vehicle.syncer), garage);
}

function closeGarage(garageID) {
    triggerNetworkEvent("lu.garage.close", getSyncerFromID(vehicle.syncer), garage);
}

// =============================================================================
// -- Utility Functions

function getSyncerFromID(syncerID) {
	let clients = getClients();
	return clients[syncerID];
}

function getClientFromID(clientID) {
	let clients = getClients();
	return clients[clientID];
}

function getClientID(client) {
	let clients = getClients();
	for(let i in clients) {
		if(clients[i] == client) {
			return i;
		}
	}
	
	return -1;
}

function getAllClients() {
	return getClients();
}

function getClientIDFromName(clientName) {
	let clients = getClients();
	for(let i in clients) {
		if(clients[i].name == clientName) {
			return i;
		}
	}
	
	return -1;
}

// =============================================================================
// -- Events

addEventHandler("OnResourceStart", function(event, resource) {
	
	let allClients = reflection.createFunction(getClients);
	console.log(reflection.call(allClients));
	//console.log(reflection.tostring(allClients));
	
});

// =============================================================================