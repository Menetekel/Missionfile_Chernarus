/**
 * Initialise un véhicule remorqueur
 * 
 * @param 0 le remorqueur
 */

private ["_remorqueur", "_is_inactive", "_remorque"];

_remorqueur = _this select 0;

_is_inactive = _remorqueur getVariable "R3F_LOG_disabled";
if (isNil "_is_inactive") then
{
	_remorqueur setVariable ["R3F_LOG_disabled", false];
};

// Définition locale de la variable si elle n'est pas définie sur le réseau
_remorque = _remorqueur getVariable "R3F_LOG_remorque";
if (isNil "_remorque") then
{
	_remorqueur setVariable ["R3F_LOG_remorque", objNull, false];
};

_remorqueur addAction [("<t color=""#dddd00"">" + Tow_settings_action_remorquer_deplace + "</t>"), "germandayz\R3F\R3F_LOG\remorqueur\remorquer_deplace.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_remorquer_deplace_valide"];

_remorqueur addAction [("<t color=""#eeeeee"">" + Tow_settings_action_remorquer_selection + "</t>"), "germandayz\R3F\R3F_LOG\remorqueur\remorquer_selection.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_remorquer_selection_valide"];