// =============================================================================
// -- Player Functions
// =============================================================================

// -----------------------------------------------------------------------------

addNetworkHandler("Player.SetWeapon", function(player, weaponID, ammo) {
    player.giveWeapon(weaponID, ammo);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.ClearWeapons", function(pPlayer) {
    pPlayer.clearWeapons();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Set.WantedLevel", function(pPlayer, iWantedLevel) {
	::print("WANTEDLEVEL " + iWantedLevel);
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

addNetworkHandler("Player.Set.TurnVelocity", function(player, fX, fY, fZ) {
	player.turnVelocity = Vec3(fX, fY, fZ);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.RemoveFromVehicle", function(pPlayer) {
    pPlayer.removeFromVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.SetAnim", function(player, animGroup) {
    player.animGroup = animGroup;
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.RemoveLimb", function(player, bodyPart) {
    player.removeBodyPart(bodyPart);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.EnterVehicle", function(player, vehicle, driver) {
    player.enterVehicle(vehicle, driver);
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.ExitVehicle", function(player) {
    player.exitVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.RemoveFromVehicle", function(player) {
    player.removeFromVehicle();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.Duck", function(player) {
    player.duck();
});

// -----------------------------------------------------------------------------

addNetworkHandler("Player.FuckU", function(player) {
    player.fuckU();
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