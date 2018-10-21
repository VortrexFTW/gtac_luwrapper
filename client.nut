NetworkPrefix <- "";

addNetworkHandler("LU.NetworkPrefix", function(szNetworkPrefix) {
	::NetworkPrefix = szNetworkPrefix;
});

// =============================================================================
// -- Player Functions
// =============================================================================

// -----------------------------------------------------------------------------

addNetworkHandler("Player.SetWeapon", function(pPlayer, iWeaponID, iAmmo) {
    pPlayer.giveWeapon(iWeaponID, iAmmo);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.ClearWeapons", function(pPlayer) {
    pPlayer.clearWeapons();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.WantedLevel", function(pPlayer, iWantedLevel) {
	pPlayer.wantedLevel = iWantedLevel;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Angle", function(pPlayer, angle) {
	pPlayer.heading = angle;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Skin", function(pPlayer, iSkinID) {
	pPlayer.skin = iSkinID;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Health", function(pPlayer, iHealth) {
	pPlayer.health = iHealth;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Armour", function(pPlayer, iArmour) {
	pPlayer.armour = iArmour;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Pos", function(pPlayer, fX, fY, fZ) {
	pPlayer.position = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Velocity", function(pPlayer, fX, fY, fZ) {
	pPlayer.velocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.TurnVelocity", function(pPlayer, fX, fY, fZ) {
	pPlayer.turnVelocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.RemoveFromVehicle", function(pPlayer) {
    pPlayer.removeFromVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.SetAnim", function(pPlayer, iAnimGroup) {
    pPlayer.animGroup = iAnimGroup;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.RemoveLimb", function(pPlayer, iBodyPart) {
    pPlayer.removeBodyPart(iBodyPart);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.EnterVehicle", function(pPlayer, pVehicle, iDoor) {
    pPlayer.enterVehicle(pVehicle, (iDoor == 0) ? true : false);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.ExitVehicle", function(pPlayer) {
    pPlayer.exitVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.RemoveFromVehicle", function(pPlayer) {
    pPlayer.removeFromVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Duck", function(pPlayer) {
    pPlayer.duck();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.FuckYou", function(pPlayer) {
    pPlayer.fuckU();
});



// =============================================================================
// -- Civilian Functions
// =============================================================================

addNetworkHandler("lu.sync.civ", function(civilian) {
    // Sync the most rapidly updated ones first
	civilian.position = civilian.getData("Pos");
	civilian.velocity = civilian.getData("Velocity");
	civilian.turnVelocity = civilian.getData("TurnVelocity");
	civilian.heading = civilian.getData("Angle");
	civilian.health = civilian.getData("Health");
	civilian.armour = civilian.getData("Armour");
	
	civilian.skin = civilian.getData("Skin");
	civilian.alpha = civilian.getData("Alpha");
	civilian.wantedLevel = civilian.getData("WantedLevel");
	civilian.stayInSamePlace = civilian.getData("StayInSamePlace");
	civilian.collisionsEnabled = civilian.getData("Collisions");
	civilian.stayInSamePlace = civilian.getData("StayInSamePlace");
	civilian.heedThreats = civilian.getData("HeedThreats");
	
	if(civilian.getData("Vehicle").id != civilian.vehicle.id) {
		civilian.warpIntoVehicle(civilian.getData("Vehicle"), true)
	}
	
	civilian.invincible = player.getData("Immune");
	civilian.setProofs(player.getData("Immune"), player.getData("Immune"), player.getData("Immune"), player.getData("Immune"), player.getData("Immune"));
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.SetWeapon", function(player, weaponID, ammo) {
    player.giveWeapon(weaponID, ammo);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.ClearWeapons", function(player) {
    player.clearWeapons();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.RemoveFromVehicle", function(player) {
    player.removeFromVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.WalkTo", function(civilian, pos) {
    civilian.walkTo(pos);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.RunTo", function(civilian, pos) {
    civilian.runTo(pos);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.Duck", function(civilian) {
    civilian.duck();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.FuckU", function(civilian) {
    civilian.fuckU();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.HailTaxi", function(civilian) {
    civilian.hailTaxi();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.AimAt", function(civilian, thing) {
    civilian.pointGunAt(thing);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.AddThreat", function(civilian, threat) {
    civilian.setThreatSearch(threat);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.ClearThreats", function(civilian) {
    civilian.clearThreatSearch();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.EnterVehicle", function(civilian, vehicle, driver) {
    civilian.enterVehicle(vehicle, driver);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.ExitVehicle", function(civilian) {
    civilian.exitVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.RemoveFromVehicle", function(civilian) {
    civilian.removeFromVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.SetWanderPath", function(civilian, wanderPath) {
    civilian.setWanderPath(wanderPath);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.Say", function(civilian, speechID) {
    civilian.say(speechID);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.SetAnim", function(civilian, animGroup) {
    civilian.animGroup = animGroup;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.RemoveLimb", function(civilian, bodyPart) {
    civilian.removeBodyPart(bodyPart);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.SetObjective", function(civilian, objectiveID, x, y, z) {
    civilian.setObjective(objectiveID, x, y, z);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.SetWeapon", function(civilian, weaponID) {
    civilian.weapon = weaponID;
});

// =============================================================================
// -- Vehicle Functions
// =============================================================================

addNetworkHandler("Vehicle.Set.Health", function(pVehicle, iHealth) {
    pVehicle.health = iHealth;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Get.Health", function(pVehicle) {
    return pVehicle.health;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Set.Pos", function(pVehicle, fX, fY, fZ) {
    pVehicle.position = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Set.Velocity", function(pVehicle, fX, fY, fZ) {
    pVehicle.velocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Set.TurnVelocity", function(pVehicle, fX, fY, fZ) {
    pVehicle.turnVelocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Fix", function(pVehicle) {
    pVehicle.fix()
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Respawn", function(pVehicle) {
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Explode", function(pVehicle) {
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Set.SpawnPos", function(pVehicle, fX, fY, fZ) {
});


addNetworkHandler("Vehicle.DriveTo", function(pVehicle, fX, fY, fZ) {
	pVehicle.driveTo(fX, fY, fZ);
});

addNetworkHandler("Vehicle.Set.Colour1", function(pVehicle, iColour) {
	pVehicle.colour1 = iColour;
});

addNetworkHandler("Vehicle.Set.Colour2", function(pVehicle, iColour) {
	pVehicle.colour2 = iColour;
});

addNetworkHandler("Vehicle.Set.Colour3", function(pVehicle, iColour) {
	if(game.game != GAME_GTA_SA && game.game != GAME_GTA_IV && game.game != GAME_GTA_IV_EFLC) {
		return false;
	}
	pVehicle.colour3 = iColour;
});

addNetworkHandler("Vehicle.Set.Colour4", function(pVehicle, iColour) {
	if(game.game != GAME_GTA_SA && game.game != GAME_GTA_IV && game.game != GAME_GTA_IV_EFLC) {
		return false;
	}
	pVehicle.colour4 = iColour;
});

addNetworkHandler("Vehicle.Set.PaintJob", function(pVehicle, iPaintJob) {
	if(game.game != GAME_GTA_SA) {
		return false;
	}
});

addNetworkHandler("Vehicle.AddComponent", function(pVehicle, iComponent) {
	if(game.game != GAME_GTA_SA) {
		return false;
	}
});

addNetworkHandler("Vehicle.AddWeapon", function(pVehicle, iWeapon) {
	if(game.game != GAME_GTA_SA) {
		return false;
	}
});

addNetworkHandler("Vehicle.Set.SpawnAngle", function(pVehicle, fAngle) {
});

addNetworkHandler("Vehicle.Set.Siren", function(pVehicle, bSiren) {
});

addNetworkHandler("Vehicle.Set.SirenLight", function(pVehicle, bSirenLight) {
});

addNetworkHandler("Vehicle.Set.TaxiLight", function(pVehicle, bTaxiLight) {
});

addNetworkHandler("Vehicle.Set.LightState", function(pVehicle, bLightState) {
});

addNetworkHandler("Vehicle.Set.Locked", function(pVehicle, bLocked) {
});

addNetworkHandler("Vehicle.SetEngineState", function(pVehicle, bSetEngineState) {
});

addCommandHandler("ce", function(szCommand, szParams) {
	compilestring(szParams)();
	outputChatBox("Client code executed: " + szParams, COLOUR_AQUA);
});

addCommandHandler("cr", function(szCommand, szParams) {
	local szOutput = compilestring("return " + szParams)();
	outputChatBox("Client code returns: " + szOutput, COLOUR_AQUA);
});

"use strict";

// ----------------------------------------------------------------------------

local font = null;
local nametagColour = [
    [0,0,0],                    // (Invalid game)
    [51,153,255],               // GTA III
    [255, 182, 193],            // GTA Vice City
    [255, 255, 255],            // GTA San Andreas
    [255, 255, 255]             // GTA UNDERGROUND
];

// ----------------------------------------------------------------------------

addEventHandler("OnResourceStart", function(event, resource) {
	if(resource == thisResource) {
		local fontFile = openFile("pricedown.ttf", false);
		font = lucasFont.createFont(fontFile, 16.0);
	}
});

// ----------------------------------------------------------------------------

function createColour(alpha, red, green, blue) {
	return alpha.tointeger() << 24 | red.tointeger() << 16 | green.tointeger() << 8 | blue.tointeger();
}

// ----------------------------------------------------------------------------

function getDistance(pos1, pos2) {
	local dx = pos1.x - pos2.x;
	local dy = pos1.y - pos2.y;
	local dz = pos1.z - pos2.z;
	return sqrt(dx*dx + dy*dy + dz*dz);
}

// ----------------------------------------------------------------------------

function drawNametag(x, y, health, armour, text, alpha) {
	alpha *= 0.5;
    
    // Starts at bottom and works it's way up
    // -------------------------------------------
    // Health Bar
	if(health > 0.0) {
		local hx = x-100/2;
		local hy = y-10/2;
		local colourB = createColour(floor(255.0*alpha), 0, 0, 0); // Background colour (black)
		drawing.drawRectangle(null, [hx, hy], [100, 8], colourB, colourB, colourB, colourB);
		local colour = createColour(floor(255.0*alpha), floor(255.0-(health*255.0)), floor(health*255.0), 0); // Health bar colour (varies, depending on health)
		drawing.drawRectangle(null, [hx+2, hy+2], [(100-4)*health, 10-6], colour, colour, colour, colour);
	}
    
    // Go up 10 pixels to draw the next part
    y -= 10;
    
    // Armour Bar
	if(armour > 0.0) {
		local hx = x-100/2;
		local hy = y-10/2;
		local colourB = createColour(floor(255.0*alpha), 0, 0, 0); // Background colour (black)
		drawing.drawRectangle(null, [hx, hy], [100, 8], colourB, colourB, colourB, colourB);
		local colour = createColour(floor(255.0*alpha), 255, 255, 255); // Armour bar colour (white)
		drawing.drawRectangle(null, [hx+2, hy+2], [(100-4)*armour, 10-6], colour, colour, colour, colour);
	}
    
    // Go up another 30 pixels for the next part
    y -= 30;
    
    // Nametag
	if (font != null) {
		local size = font.measure(text, game.width, 0.0, 0.0, font.size, false, false);
		local colourT = createColour(floor(255.0*alpha), 255, 255, 255);
		font.render(text, [x-size.x/2, y-size.y/2], game.width, 0.0, 0.0, font.size, colourT, false, false, false, true);
	}
}

// ----------------------------------------------------------------------------

function updateNametags(element) {
	if(element == localPlayer) {
		return true;
	}
	
	if(element.getData("LU.Nametag") == 0) {
		return false;
	}

	local playerPos = localPlayer.position;
	local elementPos = element.position;
    
	elementPos.z += 0.9;
    
	local screenPos = getScreenFromWorldPosition(elementPos);
	local name = "";
	if(screenPos.z >= 0.0) {
		if(element.type == ELEMENT_CIVILIAN) {
			name = "Civilian " + element.id;
		} else {
			if(element.type == ELEMENT_PLAYER) {
				name = element.name;
			}		
		}
		
        local health = element.health/100.0;
		if(health > 1.0) health = 1.0;
        
        local armour = element.armour/100.0;
		if(armour > 1.0) armour = 1.0;        
		
        local distance = getDistance(playerPos,elementPos);
        if(distance < 30.0) {
			drawNametag(screenPos.x, screenPos.y, health, armour, name, 1.0-distance/30.0);
		}
	}
}

// ----------------------------------------------------------------------------

addEventHandler("OnDrawnHUD", function(event) {
	foreach(ii, iv in getPeds()) {
		if(iv != localPlayer) {
			updateNametags(iv);
		}
	}
});

// ----------------------------------------------------------------------------