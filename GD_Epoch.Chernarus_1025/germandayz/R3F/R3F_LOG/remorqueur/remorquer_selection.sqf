/**
 * Remorque l'objet sélectionné (R3F_LOG_objet_selectionne) à un véhicule
 * 
 * @param 0 le remorqueur
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
	
	private ["_object", "_remorqueur"];
	
	_object = R3F_LOG_objet_selectionne;
	_remorqueur = _this select 0;
	
	if (!(isNull _object) && (alive _object) && !(_object getVariable "R3F_LOG_disabled")) then
	{
		if (isNull (_object getVariable "R3F_LOG_beingtransported") && (isNull (_object getVariable "R3F_LOG_beingmoved") || (!alive (_object getVariable "R3F_LOG_beingmoved")))) then
		{
			if (_object distance _remorqueur <= 15) then
			{
             	//The vehicle that is driving.   
                _tempobj = _remorqueur;		_countTransportedBy = 1;
				while{!isNull(_tempobj getVariable["R3F_LOG_beingtransported", objNull])} do {_countTransportedBy = _countTransportedBy + 1; _tempobj = _tempobj getVariable["R3F_LOG_beingtransported", objNull];};
				
                //The vehicle that is being towed.
				_tempobj = _object;		_countTowedVehicles = 1;
				while{!isNull(_tempobj getVariable["R3F_LOG_remorque", objNull])} do {_countTowedVehicles = _countTowedVehicles + 1; _tempobj = _tempobj getVariable["R3F_LOG_remorque", objNull];};
                
                if(_countTransportedBy + _countTowedVehicles <= 2) then
                {
                	// On mémorise sur le réseau que le véhicule remorque quelque chose
					_remorqueur setVariable ["R3F_LOG_remorque", _object, true];
					// On mémorise aussi sur le réseau que le canon est attaché en remorque
					_object setVariable ["R3F_LOG_beingtransported", _remorqueur, true];
					
					// On place le joueur sur le côté du véhicule, ce qui permet d'éviter les blessure et rend l'animation plus réaliste
					player attachTo [_remorqueur, [
						(boundingBox _remorqueur select 1 select 0),
						(boundingBox _remorqueur select 0 select 1) + 1,
						(boundingBox _remorqueur select 0 select 2) - (boundingBox player select 0 select 2)
					]];
					
					player setDir 270;
					player setPos (getPos player);
					
					player playMove "AinvPknlMstpSlayWrflDnon_medic";
					sleep 2;
					
					// Attacher à l'arrière du véhicule au ras du sol
					_object attachTo [_remorqueur, [
						0,
						(boundingBox _remorqueur select 0 select 1) + (boundingBox _object select 0 select 1) +0, //vehicle tow distance (default +3) +10 ends in pushing -Star
						(boundingBox _remorqueur select 0 select 2) - (boundingBox _object select 0 select 2)
					]];
					
					R3F_LOG_objet_selectionne = objNull;
					
					detach player;
					
					// Si l'objet est une arme statique, on corrige l'orientation en fonction de la direction du canon
					if (_object isKindOf "StaticWeapon") then
					{
						private ["_azimut_canon"];
						
						_azimut_canon = ((_object weaponDirection (weapons _object select 0)) select 0) atan2 ((_object weaponDirection (weapons _object select 0)) select 1);
						
						// Seul le D30 a le canon pointant vers le véhicule
						if !(_object isKindOf "D30_Base") then
						{
							_azimut_canon = _azimut_canon + 180;
						};
						
						// On est obligé de demander au serveur de tourner l'objet pour nous
						R3F_ARTY_AND_LOG_PUBVAR_setDir = [_object, (getDir _object)-_azimut_canon];
						if (isServer) then
						{
							["R3F_ARTY_AND_LOG_PUBVAR_setDir", R3F_ARTY_AND_LOG_PUBVAR_setDir] spawn R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir;
						}
						else
						{
							publicVariable "R3F_ARTY_AND_LOG_PUBVAR_setDir";
						};
					};
					
					sleep 5;    
                } else {
                	player globalChat "You can't tow more than one vehicle.";    
                };
			}
			else
			{
				player globalChat format [Tow_settings_action_remorquer_selection_trop_loin, getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
			};
		}
		else
		{
			player globalChat format [Tow_settings_action_remorquer_selection_objet_transporte, getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
		};
	};
	
	R3F_LOG_mutex_local_verrou = false;
};