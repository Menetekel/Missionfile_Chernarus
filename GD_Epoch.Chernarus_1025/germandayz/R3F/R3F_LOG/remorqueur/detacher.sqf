/**
 * Détacher un objet d'un véhicule
 * 
 * @param 0 l'objet à détacher
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
	
	private ["_remorqueur", "_object"];
	
	_object = _this select 0;
	_remorqueur = _object getVariable "R3F_LOG_beingtransported";
	
	// Ne pas permettre de décrocher un objet s'il est porté héliporté
	if ({_remorqueur isKindOf _x} count R3F_LOG_CFG_remorqueurs > 0) then
	{
		// On mémorise sur le réseau que le véhicule remorque quelque chose
		_remorqueur setVariable ["R3F_LOG_remorque", objNull, true];
		// On mémorise aussi sur le réseau que le objet est attaché en remorque
		_object setVariable ["R3F_LOG_beingtransported", objNull, true];
		
		detach _object;
		_object setVelocity [0, 0, 0];
		
		player playMove "AinvPknlMstpSlayWrflDnon_medic";
		sleep 7;
		
		if ({_object isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
		{
			// Si personne n'a re-remorquer l'objet pendant le sleep 7
			if (isNull (_remorqueur getVariable "R3F_LOG_remorque") &&
				(isNull (_object getVariable "R3F_LOG_beingtransported")) &&
				(isNull (_object getVariable "R3F_LOG_beingmoved"))
			) then
			{
				[_object] execVM "germandayz\R3F\R3F_LOG\objet_deplacable\deplacer.sqf";
			};
		}
		else
		{
			player globalChat Tow_settings_action_detacher_fait;
		};
	}
	else
	{
		player globalChat Tow_settings_action_detacher_impossible_pour_ce_vehicule;
	};
	
	R3F_LOG_mutex_local_verrou = false;
};