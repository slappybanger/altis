/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
if(!isNull life_corpse) then {
	_handle = [life_corpse] spawn life_fnc_dropItems;
};

{
	_item = _x;
	_value = missionNamespace getVariable _item;
	
	if(_value > 0) then {
		missionNamespace setVariable[_x,0];
	};
} foreach (life_inv_items + ["life_cash"]);

//Reset our weight and other stuff
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_curWep_h = "";
life_cash = 0; //Make sure we don't get our cash back.
life_respawned = false;
life_iamdead = false;
player playMove "amovpercmstpsnonwnondnon";

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		//_handle = [] spawn life_fnc_copLoadout;
		_handle = [] spawn life_fnc_loadGear;
	};
	case civilian: {
		_handle = [] spawn life_fnc_civLoadout;
	};
	
	case independent: {
		if(player call life_fnc_isADAC) then {_handle = [] spawn life_fnc_adacLoadout;}
		else {_handle = [] spawn life_fnc_medicLoadout;};
	};	
	case east: {
		_handle = [] spawn life_fnc_rebLoadout;
	};
	waitUntil {scriptDone _handle};
};

if (playerSide == west) then {
	RemoveAllWeapons player; // Cop's kriegen ihr gesaved'es gear, wo auch waffen enthalten sind -> entfernen
	player addWeapon "hgun_P07_snds_F";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if(life_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	life_is_arrested = false;
	[player,TRUE] spawn life_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[[player,life_copRecieve,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
};

[] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate; //Request update of hud.