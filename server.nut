// =============================================================================
// -- Setup and config and shit
// =============================================================================

// -----------------------------------------------------------------------------

function CreateVehicle(iModel, pPosition, fRotation, iColour1, iColour2, iGame = 1) {
	local pVehicle = GTAC.game.createVehicle(iModel, iGame);
	pVehicle.position = pPosition.GTACVector;
	pVehicle.heading = fRotation;
	addToWorld(pVehicle);
	LU.Vehicles[pVehicle.id] = ::LUVehicle(pVehicle);
}

// -----------------------------------------------------------------------------

// =============================================================================
// -- Event Hooks
// =============================================================================

GTAC.addEventHandler("OnResourceStart", function(pEvent, pResource) {
	foreach(ii, iv in GTAC.getClients()) {
		LU.Players[iv.index] = ::LUPlayer(iv);
	}

	foreach(ii, iv in GTAC.getElementsByType(ELEMENT_VEHICLE)) {
		LU.Vehicles[iv.id] = ::LUVehicle(iv);
	}

	foreach(ii, iv in GTAC.getElementsByType(ELEMENT_PED)) {
		if(!iv.isType(ELEMENT_PLAYER)) {
			LU.Civilians[iv.id] = ::LUCivilian(iv);
		}
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

	if(!LU.Vehicles[pVehicle.id]) {
		LU.Vehicles[pVehicle.id] = ::LUVehicle(pVehicle);
	}

	if(getroottable().rawin("onPlayerEnteringVehicle")) {
		local func = getroottable().rawget("onPlayerEnteringVehicle");
		if(type(func) == "function") {
			func.call(this, LU.Players[pClient.index], LU.Vehicles[pVehicle.id], iSeat);
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerExitingVehicle", function(pEvent, pClient, pVehicle) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(!LU.Vehicles[pVehicle.id]) {
		LU.Vehicles[pVehicle.id] = ::LUVehicle(pVehicle);
	}

	if(getroottable().rawin("onPlayerExitingVehicle")) {
		local func = getroottable().rawget("onPlayerExitingVehicle");
		if(type(func) == "function") {
			func.call(this, LU.Players[pClient.index], LU.Vehicles[pVehicle.id]);
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerExitedVehicle", function(pEvent, pClient, pVehicle) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(!LU.Vehicles[pVehicle.id]) {
		LU.Vehicles[pVehicle.id] = ::LUVehicle(pVehicle);
	}

	if(getroottable().rawin("onPlayerExitedVehicle")) {
		local func = getroottable().rawget("onPlayerExitedVehicle");
		if(type(func) == "function") {
			func.call(this, LU.Players[pClient.index], LU.Vehicles[pVehicle.id]);
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerEnteredVehicle", function(pEvent, pClient, pVehicle) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(!LU.Vehicles[pVehicle.id]) {
		LU.Vehicles[pVehicle.id] = ::LUVehicle(pVehicle);
	}

	if(getroottable().rawin("onPlayerEnteredVehicle")) {
		local func = getroottable().rawget("onPlayerEnteredVehicle");
		if(type(func) == "function") {
			func.call(this, LU.Players[pClient.index], LU.Vehicles[pVehicle.id], getPlayerVehicleSeat(pClient));
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerJoin", function(pEvent, pClient) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(getroottable().rawin("onPlayerConnect")) {
		local func = getroottable().rawget("onPlayerConnect");
		if(type(func) == "function") {
			func.call(this, LU.Players[pClient.index]);
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerJoined", function(pEvent, pClient) {
	if(!LU.Players[pClient.index]) {
		LU.Players[pClient.index] = ::LUPlayer(pClient);
	}

	if(getroottable().rawin("onPlayerJoin")) {
		local func = getroottable().rawget("onPlayerJoin");
		if(type(func) == "function") {
			func.call(this, LU.Players[pClient.index]);
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPlayerSpawn", function(pEvent, pPed) {
	//if(pPed.isType(ELEMENT_PLAYER)) {
		local pClient = getClientFromPlayerElement(pPed);
		if(!LU.Players[pClient.index]) {
			LU.Players[pClient.index] = ::LUPlayer(pClient);
		}

		if(getroottable().rawin("onPlayerSpawn")) {
			local func = getroottable().rawget("onPlayerSpawn");
			if(type(func) == "function") {
				func.call(this, LU.Players[pClient.index], false);
			}
		}
	//}
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
			// Need to use a custom spawn detection since GTAC client isn't set before onPedSpawn
			if(iv.getData("player") == null) {
				iv.setData("player", iv.player, false);
				GTAC.triggerEvent("OnPlayerSpawn", LU.Players[iv.index]);
			}

			if(iv.player.vehicle != null) {
				if(iv.player.getData("vehicle") == null) {
					iv.player.setData("vehicle", iv.player.vehicle, false);
					GTAC.triggerEvent("OnPlayerEnteredVehicle", null, iv, iv.player.vehicle, gtacGetPlayerVehicleSeat(iv));
				}
			} else {
				if(iv.player.getData("vehicle") != null) {
					GTAC.triggerEvent("OnPlayerExitedVehicle", null, iv, iv.player.getData("vehicle"));
					iv.player.removeData("vehicle");
				}
			}
		}
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPedEnterVehicle", function(pEvent, pPed, pVehicle, iSeat) {
	if(!LU.Vehicles[pVehicle.id]) {
		LU.Vehicles[pVehicle.id] = ::LUVehicle(pVehicle);
	}

	if(pPed.isType(ELEMENT_PLAYER)) {
		local pClient = getClientFromPlayerElement(pPed);
		if(!LU.Players[pClient.index]) {
			LU.Players[pClient.index] = ::LUPlayer(pClient);
		}

		GTAC.triggerEvent("OnPlayerEnteringVehicle", null, pClient, pVehicle, iSeat);
	}
});

// -----------------------------------------------------------------------------

GTAC.addEventHandler("OnPedExitVehicle", function(pEvent, pPed, pVehicle) {
	if(!LU.Vehicles[pVehicle.id]) {
		LU.Vehicles[pVehicle.id] = ::LUVehicle(pVehicle);
	}

	if(pPed.isType(ELEMENT_PLAYER)) {
		local pClient = getClientFromPlayerElement(pPed);
		if(!LU.Players[pClient.index]) {
			LU.Players[pClient.index] = ::LUPlayer(pClient);
		}

		GTAC.triggerEvent("OnPlayerExitingVehicle", null, pClient, pVehicle);
	}
});

// -----------------------------------------------------------------------------