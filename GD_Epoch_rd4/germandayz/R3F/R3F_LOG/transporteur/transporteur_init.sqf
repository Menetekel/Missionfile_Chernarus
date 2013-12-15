/**
 * Initialise un véhicule transporteur
 * 
 * @param 0 le transporteur
 */

private ["_towingvehicle", "_is_inactive", "_objets_charges"];

_towingvehicle = _this select 0;

_is_inactive = _towingvehicle getVariable "R3F_LOG_disabled";
if (isNil "_is_inactive") then
{
	_towingvehicle setVariable ["R3F_LOG_disabled", false];
};

// Définition locale de la variable si elle n'est pas définie sur le réseau
_objets_charges = _towingvehicle getVariable "R3F_LOG_objets_charges";
if (isNil "_objets_charges") then
{
	_towingvehicle setVariable ["R3F_LOG_objets_charges", [], false];
};

_towingvehicle addAction [("<t color=""#dddd00"">" + Tow_settings_action_charger_deplace + "</t>"), "germandayz\R3F\R3F_LOG\transporteur\charger_deplace.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_charger_deplace_valide"];

_towingvehicle addAction [("<t color=""#eeeeee"">" + Tow_settings_action_charger_selection + "</t>"), "germandayz\R3F\R3F_LOG\transporteur\charger_selection.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_charger_selection_valide"];

_towingvehicle addAction [("<t color=""#dddd00"">" + Tow_settings_action_contenu_vehicule + "</t>"), "germandayz\R3F\R3F_LOG\transporteur\voir_contenu_vehicule.sqf", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_contenu_vehicule_valide"];