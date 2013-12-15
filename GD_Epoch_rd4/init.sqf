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
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
freshSpawn = 2; //0 - Normal Spawn / 1 - fresh spawn as zombie / 2 - fresh spawn as player
DZE_FriendlySaving = true; //true - safe 5 most recent friendlies / false - disable
dayz_spawnselection = 1; // DayZ Spawnselection / 1 = enabled // 0 = disabled, No current spawn limits.

MaxHeliCrashes= 5; // Default = 5
MaxVehicleLimit = 300; // Default = 50
MaxDynamicDebris = 50; // Default = 100

dayz_MapArea = 10000; // Default = 14000
dayz_maxLocalZombies = 18; // Default = 30 
dayz_paraSpawn = true;

dayz_minpos = -1; //fix for Spawn on Coast after disconnect in a Car - Epoch 1.0.3 bug default 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 2; // Default: 8
dayz_tameDogs = false;
DynamicVehicleDamageLow = 10; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildingLimit = 300; //Max buildings within 30m

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;

//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
call compile preprocessFileLineNumbers "germandayz\client\compiles.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";//Compile vehicle configs
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf"; //former trader.sqf
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

//Clear Zeds and add Safezone
[] execVM "germandayz\safezone\safezone.sqf";
//_gdepoch = [] execVM "germandayz\safezone\safezone.sqf";
//[[4063.4226, 11664.19, 0],100] execVM "germandayz\safezone\clearZed.sqf"; //-> Bash
//[[11447.472, 11364.504, 0],100] execVM "germandayz\safezone\clearZed.sqf"; //-> Klen
//[[12944.227,12766.889, 0],100] execVM "germandayz\safezone\clearZed.sqf"; //-> Hero
if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	player_build = compile preprocessFileLineNumbers "germandayz\client\player_build.sqf"; //Line#140  ->  dayz_characterID >> dayz_playerUID
//	fn_gearMenuChecks = compile preprocessFileLineNumbers "germandayz\client\fn_gearMenuChecks.sqf";
	fnc_usec_selfActions =	compile preprocessFileLineNumbers "germandayz\client\fn_selfActions.sqf";
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
// Anti Hack 
//	if (true) then {
//		[] execVM "\z\addons\dayz_code\system\antihack.sqf";
//	};

	//Lights
if (true) then {
//[0,0,true,true,true,58,280,600,[0.698, 0.556, 0.419],"Generator_DZ",0.1] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
};
};

//if (true) then {
//	#include "\z\addons\dayz_code\system\REsec.sqf"
//};

//Start Dynamic Weather
if(true) then {
	execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";
};
//#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

//GD EDITS
dayZ_serverName = "GD-RD4";
if (!isNil "dayZ_serverName") then {
	[] spawn {
		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		waituntil {!(isNull (findDisplay 46))};
		5 cutRsc ["wm_disp","PLAIN"];
		((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText dayZ_serverName;
	};
};

// Random Stuff
[] execVM "germandayz\R3F\init.sqf";
//[] execVM "germandayz\missions\addmarkers.sqf";
//[] execVM "germandayz\missions\addmarkers75.sqf";
//Map Additions
//[] execVM "germandayz\map\nwa.sqf";
//[] execVM "germandayz\map\west_kamenka.sqf";
//call compile preprocessFileLineNumbers "germandayz\AI\UPSMON\scripts\Init_UPSMON.sqf";
//call compile preprocessfile "germandayz\AI\SHK_pos\shk_pos_init.sqf";
//[] execVM "germandayz\AI\SARGE\SAR_AI_init.sqf";

//Experimental
//Map Additions
//[] execVM "\z\addons\dayz_server\germandayz\map\nwa.sqf";
//[] execVM "\z\addons\dayz_server\germandayz\map\west_kamenka.sqf";
//call compile preprocessFileLineNumbers "\z\addons\dayz_server\germandayz\AI\UPSMON\scripts\Init_UPSMON.sqf";
//call compile preprocessfile "\z\addons\dayz_server\germandayz\AI\SHK_pos\shk_pos_init.sqf";
//[] execVM "\z\addons\dayz_server\germandayz\AI\SARGE\SAR_AI_init.sqf";