// =============================================================================
// -- Setup and config and shit
// =============================================================================

// =============================================================================
// -- Player Functions
// =============================================================================

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.SetWeapon", function(iPlayerId, iWeaponID, iAmmo) {
    GTAC.getElementFromId(iPlayerId).giveWeapon(iWeaponID, iAmmo, true);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.ClearWeapons", function(iPlayerId) {
    GTAC.getElementFromId(iPlayerId).clearWeapons();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.Set.WantedLevel", function(iPlayerId, iWantedLevel) {
	GTAC.getElementFromId(iPlayerId).wantedLevel = iWantedLevel;
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.Set.Angle", function(iPlayerId, fAngle) {
	GTAC.getElementFromId(iPlayerId).heading = fAngle;
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.Set.Cash", function(iPlayerId, iAmount) {
	GTAC.getElementFromId(iPlayerId).money = iAmount;
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.Set.Skin", function(iPlayerId, iSkinID) {
	GTAC.getElementFromId(iPlayerId).skin = iSkinID;
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.Set.Health", function(iPlayerId, iHealth) {
	GTAC.getElementFromId(iPlayerId).health = iHealth;
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.Set.Armour", function(iPlayerId, iArmour) {
	GTAC.getElementFromId(iPlayerId).armour = iArmour;
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.Set.Pos", function(iPlayerId, fX, fY, fZ) {
	GTAC.getElementFromId(iPlayerId).position = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.Set.Velocity", function(iPlayerId, fX, fY, fZ) {
	GTAC.getElementFromId(iPlayerId).velocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.Set.TurnVelocity", function(iPlayerId, fX, fY, fZ) {
	GTAC.getElementFromId(iPlayerId).turnVelocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.RemoveFromVehicle", function(iPlayerId) {
    GTAC.getElementFromId(iPlayerId).removeFromVehicle();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.SetAnim", function(iPlayerId, iAnimGroup) {
    GTAC.getElementFromId(iPlayerId).animGroup = iAnimGroup;
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.RemoveLimb", function(iPlayerId, iBodyPart) {
    GTAC.getElementFromId(iPlayerId).removeBodyPart(iBodyPart);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.EnterVehicle", function(iPlayerId, pVehicle, iDoor) {
    GTAC.getElementFromId(iPlayerId).enterVehicle(pVehicle, (iDoor == 0) ? true : false);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.ExitVehicle", function(iPlayerId) {
    GTAC.getElementFromId(iPlayerId).exitVehicle();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.RemoveFromVehicle", function(iPlayerId) {
    GTAC.getElementFromId(iPlayerId).removeFromVehicle();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.Duck", function(iPlayerId) {
    GTAC.getElementFromId(iPlayerId).duck();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Player.FuckYou", function(iPlayerId) {
    GTAC.getElementFromId(iPlayerId).fuckU();
});

// =============================================================================
// -- Civilian Functions
// =============================================================================

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.SetWeapon", function(iCivilianId, weaponId, ammo) {
    GTAC.getElementFromId(iCivilianId).giveWeapon(weaponId, ammo);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.ClearWeapons", function(iCivilianId) {
    GTAC.getElementFromId(iCivilianId).clearWeapons();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.RemoveFromVehicle", function(iCivilianId) {
    GTAC.getElementFromId(iCivilianId).removeFromVehicle();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.WalkTo", function(iCivilianId, pos) {
    GTAC.getElementFromId(iCivilianId).walkTo(pos);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.RunTo", function(iCivilianId, pos) {
    GTAC.getElementFromId(iCivilianId).runTo(pos);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.Duck", function(iCivilianId) {
    GTAC.getElementFromId(iCivilianId).duck();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.FuckU", function(iCivilianId) {
    GTAC.getElementFromId(iCivilianId).fuckU();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.HailTaxi", function(iCivilianId) {
    GTAC.getElementFromId(iCivilianId).hailTaxi();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.AimAt", function(iCivilianId, thing) {
    GTAC.getElementFromId(iCivilianId).pointGunAt(thing);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.AddThreat", function(iCivilianId, threat) {
    GTAC.getElementFromId(iCivilianId).setThreatSearch(threat);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.ClearThreats", function(iCivilianId) {
    GTAC.getElementFromId(iCivilianId).clearThreatSearch();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.EnterVehicle", function(iCivilianId, vehicle, driver) {
    GTAC.getElementFromId(iCivilianId).enterVehicle(vehicle, driver);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.ExitVehicle", function(iCivilianId) {
    GTAC.getElementFromId(iCivilianId).exitVehicle();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.RemoveFromVehicle", function(iCivilianId) {
    GTAC.getElementFromId(iCivilianId).removeFromVehicle();
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.SetWanderPath", function(iCivilianId, wanderPath) {
    GTAC.getElementFromId(iCivilianId).setWanderPath(wanderPath);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.Say", function(iCivilianId, speechId) {
    GTAC.getElementFromId(iCivilianId).say(speechId);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.SetAnim", function(iCivilianId, animGroup) {
    GTAC.getElementFromId(iCivilianId).animGroup = animGroup;
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.RemoveLimb", function(iCivilianId, bodyPart) {
    GTAC.getElementFromId(iCivilianId).removeBodyPart(bodyPart);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.SetObjective", function(iCivilianId, objectiveId, x, y, z) {
    GTAC.getElementFromId(iCivilianId).setObjective(objectiveId, x, y, z);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Civilian.SetWeapon", function(civilian, weaponId) {
    GTAC.getElementFromId(iCivilianId).weapon = weaponId;
});

// =============================================================================
// -- Vehicle Functions
// =============================================================================

GTAC.addNetworkHandler("Vehicle.Set.Health", function(pVehicle, iHealth) {
    GTAC.getElementFromId(iVehicleId).health = iHealth;
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Vehicle.Get.Health", function(pVehicle) {
    return GTAC.getElementFromId(iVehicleId).health;
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Vehicle.Set.Pos", function(pVehicle, fX, fY, fZ) {
    GTAC.getElementFromId(iVehicleId).position = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Vehicle.Set.Velocity", function(pVehicle, fX, fY, fZ) {
    GTAC.getElementFromId(iVehicleId).velocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Vehicle.Set.TurnVelocity", function(pVehicle, fX, fY, fZ) {
    GTAC.getElementFromId(iVehicleId).turnVelocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Vehicle.Fix", function(pVehicle) {
    GTAC.getElementFromId(iVehicleId).fix()
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Vehicle.Respawn", function(pVehicle) {
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Vehicle.Explode", function(pVehicle) {
});

// -----------------------------------------------------------------------------

GTAC.addNetworkHandler("Vehicle.Set.SpawnPos", function(iVehicleId, fX, fY, fZ) {
});


GTAC.addNetworkHandler("Vehicle.DriveTo", function(iVehicleId, fX, fY, fZ) {
	GTAC.getElementFromId(iVehicleId).driveTo(fX, fY, fZ);
});

GTAC.addNetworkHandler("Vehicle.Set.Colour1", function(iVehicleId, iColour) {
	GTAC.getElementFromId(iVehicleId).colour1 = iColour;
});

GTAC.addNetworkHandler("Vehicle.Set.Colour2", function(iVehicleId, iColour) {
	GTAC.getElementFromId(iVehicleId).colour2 = iColour;
});

GTAC.addNetworkHandler("Vehicle.Set.Colour3", function(iVehicleId, iColour) {
	if(game.game != GAME_GTA_SA && game.game != GAME_GTA_IV && game.game != GAME_GTA_IV_EFLC) {
		return false;
	}
	GTAC.getElementFromId(iVehicleId).colour3 = iColour;
});

GTAC.addNetworkHandler("Vehicle.Set.Colour4", function(iVehicleId, iColour) {
	if(game.game != GAME_GTA_SA && game.game != GAME_GTA_IV && game.game != GAME_GTA_IV_EFLC) {
		return false;
	}
	GTAC.getElementFromId(iVehicleId).colour4 = iColour;
});

GTAC.addNetworkHandler("Vehicle.Set.PaintJob", function(iVehicleId, iPaintJob) {
	if(game.game != GAME_GTA_SA) {
		return false;
	}
});

GTAC.addNetworkHandler("Vehicle.AddComponent", function(iVehicleId, iComponent) {
	if(game.game != GAME_GTA_SA) {
		return false;
	}
});

GTAC.addNetworkHandler("Vehicle.AddWeapon", function(iVehicleId, iWeapon) {
	if(game.game != GAME_GTA_SA) {
		return false;
	}
});

GTAC.addNetworkHandler("Vehicle.Set.SpawnAngle", function(iVehicleId, fAngle) {
});

GTAC.addNetworkHandler("Vehicle.Set.Siren", function(iVehicleId, bSiren) {
});

GTAC.addNetworkHandler("Vehicle.Set.SirenLight", function(iVehicleId, bSirenLight) {
});

GTAC.addNetworkHandler("Vehicle.Set.TaxiLight", function(iVehicleId, bTaxiLight) {
});

GTAC.addNetworkHandler("Vehicle.Set.LightState", function(iVehicleId, bLightState) {
});

GTAC.addNetworkHandler("Vehicle.Set.Locked", function(iVehicleId, bLocked) {
});

GTAC.addNetworkHandler("Vehicle.SetEngineState", function(iVehicleId, bSetEngineState) {
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

GTAC.addEventHandler("OnResourceStart", function(event, resource) {
	if(resource == GTAC.thisResource) {
		font = GTAC.lucasFont.createDefaultFont(12.0, "Roboto", "Light");
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
	    local health = element.health/100.0;
		if(health > 1.0) health = 1.0;

        local armour = element.armour/100.0;
		if(armour > 1.0) armour = 1.0;

        local distance = getDistance(playerPos,elementPos);
        if(distance < 30.0) {
			drawNametag(screenPos.x, screenPos.y, health, armour, element.getData("LU.Name"), 1.0-distance/30.0);
		}
	}
}

// ----------------------------------------------------------------------------

GTAC.addEventHandler("OnDrawnHUD", function(event) {
	foreach(ii, iv in GTAC.getPeds()) {
		//if(iv.isType(ELEMENT_PLAYER)) {
			if(iv != localPlayer) {
				updateNametags(iv);
			}
		//}
	}
});

// ----------------------------------------------------------------------------