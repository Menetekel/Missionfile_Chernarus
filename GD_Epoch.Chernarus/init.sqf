startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	1;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
enableRadio false;

// DayZ Epoch config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
MaxHeliCrashes= 5; // Default = 5
MaxVehicleLimit = 250; // Default = 50
MaxDynamicDebris = 50; // Default = 100
dayz_MapArea = 10000; // Default = 10000
dayz_animalDistance = 200;
dayz_zSpawnDistance = 600;
dayz_maxLocalZombies = 20; // Default = 30 
dayz_maxGlobalZombiesInit = 10;
dayz_maxGlobalZombiesIncrease = 5;
dayz_maxZeds = 200;
dayz_sellDistance = 35;
dayz_paraSpawn = false;		// DOT NOT ENABLE currently bugged in Epoch
spawnMarkerCount = 4; // Default: 4
dayz_maxAnimals = 4; // Default: 8
dayz_tameDogs = false;
DynamicVehicleDamageLow = 15; // Default: 0
DynamicVehicleDamageHigh = 90; // Default: 100
DZE_BuildingLimit = 300; //Max buildings within 30m


EpochEvents = [
["any","any","any","any",30,"crash_spawner"],
["any","any","any","any",0,"crash_spawner"],
["any","any","any","any",15,"supply_drop"]
];

dayz_fullMoonNights = true;

//Load in compiled functions
//EPOCH DEFAULT call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";  // Aenderung Andro
call compile preprocessFileLineNumbers "skaronator\clientfiles\variables.sqf";
progressLoadingScreen 0.1;
//EPOCH DEFAULT call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";  // Aenderung Andro
call compile preprocessFileLineNumbers "skaronator\clientfiles\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
//EPOCH DEFAULT call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";  // Aenderung Andro
call compile preprocessFileLineNumbers "germandayz\compiles.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "germandayz\server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;
	
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

/* BIS_Effects_* fixes from Dwarden */
BIS_Effects_EH_Killed = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\killed.sqf";
BIS_Effects_AirDestruction = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestruction.sqf";
BIS_Effects_AirDestructionStage2 = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestructionStage2.sqf";

BIS_Effects_globalEvent = {
	BIS_effects_gepv = _this;
	publicVariable "BIS_effects_gepv";
	_this call BIS_Effects_startEvent;
};

BIS_Effects_startEvent = {
	switch (_this select 0) do {
		case "AirDestruction": {
				[_this select 1] spawn BIS_Effects_AirDestruction;
		};
		case "AirDestructionStage2": {
				[_this select 1, _this select 2, _this select 3] spawn BIS_Effects_AirDestructionStage2;
		};
		case "Burn": {
				[_this select 1, _this select 2, _this select 3, false, true] spawn BIS_Effects_Burn;
		};
	};
};

"BIS_effects_gepv" addPublicVariableEventHandler {
	(_this select 1) call BIS_Effects_startEvent;
};

if ((!isServer) && (isNull player) ) then {
	waitUntil {!isNull player};
	waitUntil {time > 3};
};

if ((!isServer) && (player != player)) then {
	waitUntil {player == player};
	waitUntil {time > 3};
};

if (isServer) then {
	call compile preprocessFileLineNumbers "germandayz\dynamic_vehicle.sqf";				//Compile vehicle configs
	// Add trader citys
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	_gdepoch = [] execVM "germandayz\trader.sqf";
};
	_gdepoch = [] execVM "germandayz\safezone\safezone.sqf";
	//Clear Zeds
	[[4063.4226, 11664.19, 0],100] execVM "germandayz\safezone\clearZed.sqf"; //-> Bash
	[[11447.472, 11364.504, 0],100] execVM "germandayz\safezone\clearZed.sqf"; //-> Klen
	[[12944.227,12766.889, 0],100] execVM "germandayz\safezone\clearZed.sqf"; //-> Hero
if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_void = [] execVM "R3F_Realism\R3F_Realism_Init.sqf";
	/* CUSTOM STUFF SKARONATOR START */
	player_build = compile preprocessFileLineNumbers "skaronator\clientfiles\player_build.sqf"; //Line#140  ->  dayz_characterID >> dayz_playerUID
	player_unlockDoor = compile preprocessFileLineNumbers "skaronator\clientfiles\unlockDoor.sqf";
	fn_gearMenuChecks = compile preprocessFileLineNumbers "skaronator\clientfiles\fn_gearMenuChecks.sqf";
	fnc_usec_selfActions =	compile preprocessFileLineNumbers "skaronator\clientfiles\fn_selfActions.sqf";
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	_skaro = [] execVM "germandayz\playerUI_effects.sqf";
	_skaro = [] execVM "germandayz\refuel\refuel_selfActions.sqf";
	//Overwrite compiles.sqf //SKARONATOR
	/* CUSTOM STUFF SKARONATOR END */
		
	//Lights
	//[0,0,true,true,true,58,280,600,[0.698, 0.556, 0.419],"Generator_DZ",0.1] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	};
//#include "\z\addons\dayz_code\system\REsec.sqf"
//GD EDITS
dayZ_serverName = "GD-RD3";
if (!isNil "dayZ_serverName") then {
	[] spawn {
		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		waituntil {!(isNull (findDisplay 46))};
		5 cutRsc ["wm_disp","PLAIN"];
		((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText dayZ_serverName;
	};
};