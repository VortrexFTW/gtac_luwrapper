"use strict";

// =============================================================================
// -- Player Functions

addNetworkHandler("lu.plr.pos", function(player, x, y, z) {
    player.position = new Vec3(x, y, z);
});

addNetworkHandler("lu.plr.zrot", function(player, angle) {
    player.heading = angle;
});

addNetworkHandler("lu.plr.wep.add", function(player, weaponID, ammo) {
    player.giveWeapon(weaponID, ammo);
});

addNetworkHandler("lu.plr.wep.clr", function(player) {
    player.clearWeapons();
});

addNetworkHandler("lu.plr.skin", function(player, skinID) {
    player.skin = skinID;
});

addNetworkHandler("lu.plr.god", function(player, state) {
    localPlayer.invincible = state;
});

addNetworkHandler("lu.plr.proofs", function(player, bullet, fire, explosion, collision, melee) {
    player.setProofs(bullet, fire, explosion, collision, melee);
});

addNetworkHandler("lu.plr.hp", function(player, amount) {
    player.health = amount;
});

addNetworkHandler("lu.plr.ap", function(player, amount) {
    player.armour = amount;
});

addNetworkHandler("lu.plr.inveh", function(player, vehicle, driver) {
    player.warpIntoVehicle(vehicle, driver)
});

addNetworkHandler("lu.plr.eject", function(player) {
    player.removeFromVehicle();
});

addNetworkHandler("lu.plr.stars", function(player, amount) {
    player.wantedLevel = amount;
});

// =============================================================================
// -- Civilian Functions

addNetworkHandler("lu.civ.pos", function(civilian, x, y, z) {    civilian.position = new Vec3(x, y, z);
});

addNetworkHandler("lu.civ.zrot", function(civilian, angle) {
    civilian.heading = angle;
});

addNetworkHandler("lu.civ.wep.add", function(civilian, weaponID, ammo) {
    civilian.giveWeapon(weaponID, ammo);
});

addNetworkHandler("lu.civ.wep.clr", function(civilian) {
    civilian.clearWeapons();
});

addNetworkHandler("lu.civ.skin", function(civilian, skinID) {
    civilian.skin = skinID;
});

addNetworkHandler("lu.civ.god", function(civilian, state) {
    civilian.invincible = state;
});

addNetworkHandler("lu.civ.proofs", function(civilian, bullet, fire, explosion, collision, melee) {
    civilian.setProofs(bullet, fire, explosion, collision, melee);
});

addNetworkHandler("lu.civ.hp", function(civilian, amount) {
    civilian.health = amount;
});

addNetworkHandler("lu.civ.ap", function(civilian, amount) {
    civilian.armour = amount;
});

addNetworkHandler("lu.civ.veh.warpin", function(civilian, vehicle, driver) {
    civilian.warpIntoVehicle(vehicle, driver)
});

addNetworkHandler("lu.civ.veh.eject", function(civilian) {
    civilian.removeFromVehicle();
});

addNetworkHandler("lu.civ.walk.pos", function(civilian, x, y) {
	let walkToPos = new Vec2(x, y);
    civilian.walkTo(walkToPos);
});

addNetworkHandler("lu.civ.walk.fwd", function(civilian, distance) {
	let frontPos = getPosInFrontOfPos(civilian.position, civilian.heading, distance);
	let walkToPos = new Vec2(frontPos[0], frontPos[1]);
    civilian.walkTo(walkToPos);
});

addNetworkHandler("lu.civ.walk.to", function(civilian, element) {
	let elementPos = element.position;
	let walkToPos = new Vec2(elementPos[0], elementPos[1]);
    civilian.walkTo(walkToPos);
});

addNetworkHandler("lu.civ.walkstyle", function(civilian, walkStyle) {
    civilian.walkStyle = walkStyle;
});

addNetworkHandler("lu.civ.run.pos", function(civilian, x, y) {
	let walkToPos = new Vec2(x, y);
    civilian.runTo(walkToPos);
});

addNetworkHandler("lu.civ.walk.fwd", function(civilian, distance) {
	let frontPos = getPosInFrontOfPos(civilian.position, civilian.heading, distance);
	let walkToPos = new Vec2(frontPos[0], frontPos[1]);
    civilian.runTo(walkToPos);
});

addNetworkHandler("lu.civ.run.to", function(civilian, element) {
	let elementPos = element.position;
	let walkToPos = new Vec2(elementPos[0], elementPos[1]);
    civilian.runTo(walkToPos);
});

addNetworkHandler("lu.civ.duck", function(civilian) {
    civilian.duck();
});

addNetworkHandler("lu.civ.fu", function(civilian) {
    civilian.fuckU();
});

addNetworkHandler("lu.civ.hailtaxi", function(civilian) {
    civilian.hailTaxi();
});

addNetworkHandler("lu.civ.aimat", function(civilian, thing) {
    civilian.pointGunAt(thing);
});

addNetworkHandler("lu.civ.stay", function(civilian, state) {
    civilian.stayInSamePlace = state;
});

addNetworkHandler("lu.civ.collision", function(civilian, state) {
    civilian.collisionsEnabled = state;
});

addNetworkHandler("lu.civ.threat.add", function(civilian, threat) {
    civilian.setThreatSearch(threat);
});

addNetworkHandler("lu.civ.threat.heed", function(civilian, state) {
    civilian.heedThreats = state;
});

addNetworkHandler("lu.civ.threat.clr", function(civilian) {
    civilian.clearThreatSearch();
});

addNetworkHandler("lu.civ.veh.enter", function(civilian, veh, driver) {
    civilian.enterVehicle(veh, driver);
});

addNetworkHandler("lu.civ.veh.exit", function(civilian) {
    civilian.exitVehicle();
});

addNetworkHandler("lu.civ.veh.warpin", function(civilian, veh, driver) {
    civilian.warpIntoVehicle(veh, driver);
});

addNetworkHandler("lu.civ.veh.warpout", function(civilian) {
    civilian.removeFromVehicle();
});

addNetworkHandler("lu.civ.veh.seat", function(civilian, seat) {
    civilian.seat = seat;
});

addNetworkHandler("lu.civ.type", function(civilian, pedType) {
    civilian.pedType = pedType;
});

addNetworkHandler("lu.civ.wanderpath", function(civilian, wanderPath) {
    civilian.setWanderPath(wanderPath);
});

addNetworkHandler("lu.civ.say", function(civilian, speechID) {
    civilian.say(speechID);
});

addNetworkHandler("lu.civ.scale", function(civilian, scale) {
	console.log(scale);
	console.log(civilian.matrix);
	let newMatrix = civilian.matrix;
	newMatrix.setScale(scale);
    civilian.matrix = newMatrix;
});

addNetworkHandler("lu.civ.anim", function(civilian, animGroup) {
    civilian.animGroup = animGroup;
});

addNetworkHandler("lu.civ.removepart", function(civilian, bodyPart) {
    civilian.removeBodyPart(bodyPart);
});

addNetworkHandler("lu.civ.objective", function(civilian, objectiveID, x, y, z) {
    civilian.setObjective(objectiveID, x, y, z);
});

addNetworkHandler("lu.civ.wep.set", function(civilian, weaponID) {
    civilian.weapon = weaponID;
});

// =============================================================================
// -- Vehicle Functions

addNetworkHandler("lu.veh.hp", function(vehicle, health) {
    vehicle.health = health;
});

addNetworkHandler("lu.veh.type.base", function(vehicle, baseType) {
    vehicle.baseType = baseType;
});

addNetworkHandler("lu.veh.subType", function(vehicle, subType) {
    vehicle.subType = subType;
});

addNetworkHandler("lu.veh.col.1", function(vehicle, colour1) {
    vehicle.health = colour1;
});

addNetworkHandler("lu.veh.col.2", function(vehicle, colour2) {
    vehicle.colour2 = colour2;
});

addNetworkHandler("lu.veh.col.3", function(vehicle, colour3) {
	if(!doesGameHaveFourVehicleColours(game.game)) {
		return false;
	}
	
    vehicle.colour3 = colour3;
});

addNetworkHandler("lu.veh.col.4", function(vehicle, colour4) {
	if(!doesGameHaveFourVehicleColours(game.game)) {
		return false;
	}
	
    vehicle.colour4 = colour4;
});

addNetworkHandler("lu.veh.cruisespeed", function(vehicle, cruiseSpeed) {
    vehicle.setCarCruiseSpeed(cruiseSpeed);
});

addNetworkHandler("lu.veh.wander", function(vehicle) {
    vehicle.carWanderRandomly();
});

addNetworkHandler("lu.veh.drivestyle", function(vehicle, drivingStyle) {
    vehicle.setDrivingStyle(drivingStyle);
});

addNetworkHandler("lu.veh.mission", function(vehicle, mission) {
    vehicle.setCarMission(mission);
});

addNetworkHandler("lu.veh.fix", function(vehicle) {
    vehicle.fix();
});

// =============================================================================
// -- Train Functions

addNetworkHandler("lu.train.speed", function(train, speed) {
	if(train.type != ELEMENT_TRAIN) {
		return false;
	}
	
    train.speed = speed;
});

addNetworkHandler("lu.train.track.id", function(train, trackID) {	
	if(train.type != ELEMENT_TRAIN) {
		return false;
	}
	
    train.track = trackID;
});

addNetworkHandler("lu.train.track.pos", function(train, trackPosition) {
	if(train.type != ELEMENT_TRAIN) {
		return false;
	}
	
    train.trackPosition = trackPosition;
});

addNetworkHandler("lu.train.derailed", function(train, derailed) {
	if(train.type != ELEMENT_TRAIN) {
		return false;
	}
	
    train.derailed = derailed;
});

// =============================================================================
// -- Train Functions

addNetworkHandler("lu.garage.open", function(garage) {
    game.openGarage(garage);
});

addNetworkHandler("lu.garage.close", function(garage) {
    game.closeGarage(garage);
});


// ----------------------------------------------------------------------------

function getPosInFrontOfPos(pos, angle, distance) {
	let x = (pos[0]+((Math.cos(angle+(Math.PI/2)))*distance));
	let y = (pos[1]+((Math.sin(angle+(Math.PI/2)))*distance));
	let frontPos = new Vec3(x, y, pos[2]);
	
	return frontPos;
}