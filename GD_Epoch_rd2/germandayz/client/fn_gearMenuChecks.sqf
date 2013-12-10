private ["_cTarget","_isOk","_display","_inVehicle"];
disableSerialization;
if (isNil "inSafezone") then {
    inSafezone = false;
};
_display = (_this select 0);
_inVehicle = (vehicle player) != player;
_cTarget = cursorTarget;
if(_inVehicle) then {
	_cTarget = (vehicle player);
};

_isOk = false;
{
	if(!_isOk) then {
		_isOk = _cTarget isKindOf _x;
	};
} forEach ["LandVehicle","Air", "Ship"];

if((locked _cTarget) and _isOk and (((vehicle player) distance _cTarget) < 12)) then {
	cutText [(localize "str_epoch_player_7") , "PLAIN DOWN"];
	_display closeDisplay 1;
};
if ((_cTarget isKindOf "Man") && (alive _cTarget) && !(isNull unitBackpack _cTarget) && (player distance _cTarget < 5) && !_inVehicle && inSafeZone) then {
	_friendlies = player getVariable ["friendlyTo",[]];
	_ownerID = _cTarget getVariable["CharacterID","0"];
	_friendliesOwn = _cTarget getVariable ["friendlyTo",[]];
	_ownerIDOwn = player getVariable["CharacterID","0"];
	if !((_ownerID in _friendlies) and (_ownerIDOwn in _friendliesOwn)) then {
		cutText ["Cannot access gear from other players in a safezone! \n Tag your tag your friend as 'friendly' to get access to his gear!" , "PLAIN DOWN"]; //SKARONATOR AWESOME
		_display closeDisplay 1;	//DAMN OTHER ADMINS WHO ARE TRYING TO COPYPASTE THINGS OUT OF MY MISSION <3
	};		
};