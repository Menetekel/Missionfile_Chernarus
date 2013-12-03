/**
 * Initialise un objet déplaçable/héliportable/remorquable/transportable
 * 
 * @param 0 l'objet
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private ["_object", "_is_inactive", "_transported_by", "_moved_by"];

_object = _this select 0;

_is_inactive = _object getVariable "R3F_LOG_disabled";
if (isNil "_is_inactive") then
{
	_object setVariable ["R3F_LOG_disabled", false];
};

// Définition locale de la variable si elle n'est pas définie sur le réseau
_transported_by = _object getVariable "R3F_LOG_beingtransported";
if (isNil "_transported_by") then
{
	_object setVariable ["R3F_LOG_beingtransported", objNull, false];
};

// Définition locale de la variable si elle n'est pas définie sur le réseau
_moved_by = _object getVariable "R3F_LOG_beingmoved";
if (isNil "_moved_by") then
{
	_object setVariable ["R3F_LOG_beingmoved", objNull, false];
};

// Ne pas monter dans un véhicule qui est en cours de transport
_object addEventHandler ["GetIn",
{
	if (_this select 2 == player) then
	{
		_this spawn
		{
			if ((!(isNull (_this select 0 getVariable "R3F_LOG_beingmoved")) && (alive (_this select 0 getVariable "R3F_LOG_beingmoved"))) || !(isNull (_this select 0 getVariable "R3F_LOG_beingtransported"))) then
			{
				player action ["eject", _this select 0];
				player globalChat STR_R3F_LOG_transport_en_cours;
			};
		};
	};
}];

if ({_object isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
{
	_object addAction [("<t color=""#dddd00"">" + Tow_settings_action_deplacer_objet + "</t>"), "germandayz\R3F\R3F_LOG\objet_deplacable\deplacer.sqf", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_deplacer_objet_valide"];
};

if ({_object isKindOf _x} count R3F_LOG_CFG_objets_remorquables > 0) then
{
	if ({_object isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
	{
		_object addAction [("<t color=""#dddd00"">" + Tow_settings_action_remorquer_deplace + "</t>"), "germandayz\R3F\R3F_LOG\remorqueur\remorquer_deplace.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_remorquer_deplace_valide"];
	};
	
	_object addAction [("<t color=""#dddd00"">" + "Tow..." + "</t>"), "germandayz\R3F\R3F_LOG\remorqueur\selectionner_objet.sqf", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_selectionner_objet_remorque_valide"];
	
	_object addAction [("<t color=""#dddd00"">" + "Untow..." + "</t>"), "germandayz\R3F\R3F_LOG\remorqueur\detacher.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_detacher_valide"];
};

if ({_object isKindOf _x} count R3F_LOG_classes_objets_transportables > 0) then
{
	if ({_object isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
	{
		_object addAction [("<t color=""#dddd00"">" + Tow_settings_action_charger_deplace + "</t>"), "germandayz\R3F\R3F_LOG\transporteur\charger_deplace.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_charger_deplace_valide"];
	};
	
	_object addAction [("<t color=""#dddd00"">" + Tow_settings_action_selectionner_objet_charge + "</t>"), "germandayz\R3F\R3F_LOG\transporteur\selectionner_objet.sqf", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_selectionner_objet_charge_valide"];
};