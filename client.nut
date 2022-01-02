NetworkPrefix <- "";

addNetworkHandler("LU.NetworkPrefix", function(szNetworkPrefix) {
	::NetworkPrefix = szNetworkPrefix;
});

// =============================================================================
// -- Player Functions
// =============================================================================

// -----------------------------------------------------------------------------

addNetworkHandler("Player.SetWeapon", function(iPlayerId, iWeaponID, iAmmo) {
    getElementFromId(iPlayerId).giveWeapon(iWeaponID, iAmmo);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.ClearWeapons", function(iPlayerId) {
    getElementFromId(iPlayerId).clearWeapons();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.WantedLevel", function(iPlayerId, iWantedLevel) {
	getElementFromId(iPlayerId).wantedLevel = iWantedLevel;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Angle", function(iPlayerId, angle) {
	getElementFromId(iPlayerId).heading = angle;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Skin", function(iPlayerId, iSkinID) {
	getElementFromId(iPlayerId).skin = iSkinID;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Health", function(iPlayerId, iHealth) {
	getElementFromId(iPlayerId).health = iHealth;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Armour", function(iPlayerId, iArmour) {
	getElementFromId(iPlayerId).armour = iArmour;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Pos", function(iPlayerId, fX, fY, fZ) {
	getElementFromId(iPlayerId).position = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.Velocity", function(iPlayerId, fX, fY, fZ) {
	getElementFromId(iPlayerId).velocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.TurnVelocity", function(iPlayerId, fX, fY, fZ) {
	getElementFromId(iPlayerId).turnVelocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.RemoveFromVehicle", function(iPlayerId) {
    getElementFromId(iPlayerId).removeFromVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.SetAnim", function(iPlayerId, iAnimGroup) {
    getElementFromId(iPlayerId).animGroup = iAnimGroup;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.RemoveLimb", function(iPlayerId, iBodyPart) {
    getElementFromId(iPlayerId).removeBodyPart(iBodyPart);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.EnterVehicle", function(iPlayerId, pVehicle, iDoor) {
    getElementFromId(iPlayerId).enterVehicle(pVehicle, (iDoor == 0) ? true : false);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.ExitVehicle", function(iPlayerId) {
    getElementFromId(iPlayerId).exitVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.RemoveFromVehicle", function(iPlayerId) {
    getElementFromId(iPlayerId).removeFromVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Duck", function(iPlayerId) {
    getElementFromId(iPlayerId).duck();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.FuckYou", function(iPlayerId) {
    getElementFromId(iPlayerId).fuckU();
});

// =============================================================================
// -- Civilian Functions
// =============================================================================

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.SetWeapon", function(iCivilianId, weaponId, ammo) {
    getElementFromId(iCivilianId).giveWeapon(weaponId, ammo);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.ClearWeapons", function(iCivilianId) {
    getElementFromId(iCivilianId).clearWeapons();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.RemoveFromVehicle", function(iCivilianId) {
    getElementFromId(iCivilianId).removeFromVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.WalkTo", function(iCivilianId, pos) {
    getElementFromId(iCivilianId).walkTo(pos);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.RunTo", function(iCivilianId, pos) {
    getElementFromId(iCivilianId).runTo(pos);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.Duck", function(iCivilianId) {
    getElementFromId(iCivilianId).duck();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.FuckU", function(iCivilianId) {
    getElementFromId(iCivilianId).fuckU();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.HailTaxi", function(iCivilianId) {
    getElementFromId(iCivilianId).hailTaxi();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.AimAt", function(iCivilianId, thing) {
    getElementFromId(iCivilianId).pointGunAt(thing);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.AddThreat", function(iCivilianId, threat) {
    getElementFromId(iCivilianId).setThreatSearch(threat);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.ClearThreats", function(iCivilianId) {
    getElementFromId(iCivilianId).clearThreatSearch();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.EnterVehicle", function(iCivilianId, vehicle, driver) {
    getElementFromId(iCivilianId).enterVehicle(vehicle, driver);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.ExitVehicle", function(iCivilianId) {
    getElementFromId(iCivilianId).exitVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.RemoveFromVehicle", function(iCivilianId) {
    getElementFromId(iCivilianId).removeFromVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.SetWanderPath", function(iCivilianId, wanderPath) {
    getElementFromId(iCivilianId).setWanderPath(wanderPath);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.Say", function(iCivilianId, speechId) {
    getElementFromId(iCivilianId).say(speechId);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.SetAnim", function(iCivilianId, animGroup) {
    getElementFromId(iCivilianId).animGroup = animGroup;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.RemoveLimb", function(iCivilianId, bodyPart) {
    getElementFromId(iCivilianId).removeBodyPart(bodyPart);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.SetObjective", function(iCivilianId, objectiveId, x, y, z) {
    getElementFromId(iCivilianId).setObjective(objectiveId, x, y, z);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Civilian.SetWeapon", function(civilian, weaponId) {
    getElementFromId(iCivilianId).weapon = weaponId;
});

// =============================================================================
// -- Vehicle Functions
// =============================================================================

addNetworkHandler("Vehicle.Set.Health", function(pVehicle, iHealth) {
    getElementFromId(iVehicleId).health = iHealth;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Get.Health", function(pVehicle) {
    return getElementFromId(iVehicleId).health;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Set.Pos", function(pVehicle, fX, fY, fZ) {
    getElementFromId(iVehicleId).position = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Set.Velocity", function(pVehicle, fX, fY, fZ) {
    getElementFromId(iVehicleId).velocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Set.TurnVelocity", function(pVehicle, fX, fY, fZ) {
    getElementFromId(iVehicleId).turnVelocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Fix", function(pVehicle) {
    getElementFromId(iVehicleId).fix()
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Respawn", function(pVehicle) {
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Explode", function(pVehicle) {
});

// -----------------------------------------------------------------------------

addNetworkHandler("Vehicle.Set.SpawnPos", function(iVehicleId, fX, fY, fZ) {
});


addNetworkHandler("Vehicle.DriveTo", function(iVehicleId, fX, fY, fZ) {
	getElementFromId(iVehicleId).driveTo(fX, fY, fZ);
});

addNetworkHandler("Vehicle.Set.Colour1", function(iVehicleId, iColour) {
	getElementFromId(iVehicleId).colour1 = iColour;
});

addNetworkHandler("Vehicle.Set.Colour2", function(iVehicleId, iColour) {
	getElementFromId(iVehicleId).colour2 = iColour;
});

addNetworkHandler("Vehicle.Set.Colour3", function(iVehicleId, iColour) {
	if(game.game != GAME_GTA_SA && game.game != GAME_GTA_IV && game.game != GAME_GTA_IV_EFLC) {
		return false;
	}
	getElementFromId(iVehicleId).colour3 = iColour;
});

addNetworkHandler("Vehicle.Set.Colour4", function(iVehicleId, iColour) {
	if(game.game != GAME_GTA_SA && game.game != GAME_GTA_IV && game.game != GAME_GTA_IV_EFLC) {
		return false;
	}
	getElementFromId(iVehicleId).colour4 = iColour;
});

addNetworkHandler("Vehicle.Set.PaintJob", function(iVehicleId, iPaintJob) {
	if(game.game != GAME_GTA_SA) {
		return false;
	}
});

addNetworkHandler("Vehicle.AddComponent", function(iVehicleId, iComponent) {
	if(game.game != GAME_GTA_SA) {
		return false;
	}
});

addNetworkHandler("Vehicle.AddWeapon", function(iVehicleId, iWeapon) {
	if(game.game != GAME_GTA_SA) {
		return false;
	}
});

addNetworkHandler("Vehicle.Set.SpawnAngle", function(iVehicleId, fAngle) {
});

addNetworkHandler("Vehicle.Set.Siren", function(iVehicleId, bSiren) {
});

addNetworkHandler("Vehicle.Set.SirenLight", function(iVehicleId, bSirenLight) {
});

addNetworkHandler("Vehicle.Set.TaxiLight", function(iVehicleId, bTaxiLight) {
});

addNetworkHandler("Vehicle.Set.LightState", function(iVehicleId, bLightState) {
});

addNetworkHandler("Vehicle.Set.Locked", function(iVehicleId, bLocked) {
});

addNetworkHandler("Vehicle.SetEngineState", function(iVehicleId, bSetEngineState) {
});

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
		local colourB = toColour(0, 0, 0, floor(255.0*alpha)); // Background colour (black)
		drawing.drawRectangle(null, [hx, hy], [100, 8], colourB, colourB, colourB, colourB);
		local colour = toColour(floor(255.0-(health*255.0)), floor(health*255.0), 0, floor(255.0*alpha)); // Health bar colour (varies, depending on health)
		drawing.drawRectangle(null, [hx+2, hy+2], [(100-4)*health, 10-6], colour, colour, colour, colour);
	}

    // Go up 10 pixels to draw the next part
    y -= 10;

    // Armour Bar
	if(armour > 0.0) {
		local hx = x-100/2;
		local hy = y-10/2;
		local colourB = toColour(0, 0, 0, floor(255.0*alpha)); // Background colour (black)
		drawing.drawRectangle(null, [hx, hy], [100, 8], colourB, colourB, colourB, colourB);
		local colour = toColour(255, 255, 255, floor(255.0*alpha)); // Armour bar colour (white)
		drawing.drawRectangle(null, [hx+2, hy+2], [(100-4)*armour, 10-6], colour, colour, colour, colour);
	}

    // Go up another 30 pixels for the next part
    y -= 30;

    // Nametag
	if (font != null) {
		local size = font.measure(text, game.width, 0.0, 0.0, font.size, false, false);
		local colourT = toColour(255, 255, 255, floor(255.0*alpha));
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
		if(element.type == ELEMENT_PED) {
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
		//if(iv.isType(ELEMENT_PLAYER)) {
			if(iv != localPlayer) {
				updateNametags(iv);
			}
		//}
	}
});

// ----------------------------------------------------------------------------