/**
 * Charger l'objet déplacé par le joueur dans un transporteur
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	R3F_LOG_mutex_local_verrou = true;
	
	private ["_object", "_classes_transporteurs", "_towingvehicle", "_i"];
	
	_object = R3F_LOG_joueur_deplace_objet;
	
	_towingvehicle = nearestObjects [_object, R3F_LOG_classes_transporteurs, 22];
	// Parce que le transporteur peut être un objet transportable
	_towingvehicle = _towingvehicle - [_object];
	
	if (count _towingvehicle > 0) then
	{
		_towingvehicle = _towingvehicle select 0;
		
		if (alive _towingvehicle && ([0,0,0] distance velocity _towingvehicle < 6) && (getPos _towingvehicle select 2 < 2) && !(_towingvehicle getVariable "R3F_LOG_disabled")) then
		{
			private ["_objets_charges", "_chargement_actuel", "_cout_capacite_objet", "_chargement_maxi"];
			
			_objets_charges = _towingvehicle getVariable "R3F_LOG_objets_charges";
			
			// Calcul du chargement actuel
			_chargement_actuel = 0;
			{
				for [{_i = 0}, {_i < count R3F_LOG_CFG_objets_transportables}, {_i = _i + 1}] do
				{
					if (_x isKindOf (R3F_LOG_CFG_objets_transportables select _i select 0)) exitWith
					{
						_chargement_actuel = _chargement_actuel + (R3F_LOG_CFG_objets_transportables select _i select 1);
					};
				};
			} forEach _objets_charges;
			
			// Recherche de la capacité de l'objet
			_cout_capacite_objet = 99999;
			for [{_i = 0}, {_i < count R3F_LOG_CFG_objets_transportables}, {_i = _i + 1}] do
			{
				if (_object isKindOf (R3F_LOG_CFG_objets_transportables select _i select 0)) exitWith
				{
					_cout_capacite_objet = (R3F_LOG_CFG_objets_transportables select _i select 1);
				};
			};
			
			// Recherche de la capacité maximale du transporteur
			_chargement_maxi = 0;
			for [{_i = 0}, {_i < count R3F_LOG_CFG_transporteurs}, {_i = _i + 1}] do
			{
				if (_towingvehicle isKindOf (R3F_LOG_CFG_transporteurs select _i select 0)) exitWith
				{
					_chargement_maxi = (R3F_LOG_CFG_transporteurs select _i select 1);
				};
			};
			
			// Si l'objet loge dans le véhicule
			if (_chargement_actuel + _cout_capacite_objet <= _chargement_maxi) then
			{
				// On mémorise sur le réseau le nouveau contenu du véhicule
				_objets_charges = _objets_charges + [_object];
				_towingvehicle setVariable ["R3F_LOG_objets_charges", _objets_charges, true];
				
				player globalChat Tow_settings_action_charger_deplace_en_cours;
				
				// Faire relacher l'objet au joueur (si il l'a dans "les mains")
				R3F_LOG_joueur_deplace_objet = objNull;
				sleep 2;
				
				// Choisir une position dégagée (sphère de 50m de rayon) dans le ciel dans un cube de 9km^3
				private ["_nb_tirage_pos", "_position_attache"];
				_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
				_nb_tirage_pos = 1;
				while {(!isNull (nearestObject _position_attache)) && (_nb_tirage_pos < 25)} do
				{
					_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
					_nb_tirage_pos = _nb_tirage_pos + 1;
				};
				
				_object attachTo [R3F_LOG_PUBVAR_point_attache, _position_attache];
				
				player globalChat format [Tow_settings_action_charger_deplace_fait, getText (configFile >> "CfgVehicles" >> (typeOf _towingvehicle) >> "displayName")];
			}
			else
			{
				player globalChat Tow_settings_action_charger_deplace_pas_assez_de_place;
			};
		};
	};
	
	R3F_LOG_mutex_local_verrou = false;
};