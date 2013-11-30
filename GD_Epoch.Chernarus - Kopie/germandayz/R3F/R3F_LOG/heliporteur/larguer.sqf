/**
 * Larguer un objet en train d'être héliporté
 * 
 * @param 0 l'héliporteur
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
	
	private ["_heliporteur", "_object"];
	
	_heliporteur = _this select 0;
	_object = _heliporteur getVariable "R3F_LOG_heliporte";
	
	// On mémorise sur le réseau que le véhicule n'héliporte plus rien
	_heliporteur setVariable ["R3F_LOG_heliporte", objNull, true];
	// On mémorise aussi sur le réseau que l'objet n'est plus attaché
	_object setVariable ["R3F_LOG_beingtransported", objNull, true];
	
	detach _object;
	
	_object setPos [getPos _object select 0, getPos _object select 1, 0];
	_object setVelocity [0, 0, 0];
	
	player globalChat format [Tow_settings_action_heliport_larguer_fait, getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
	
	R3F_LOG_mutex_local_verrou = false;
};