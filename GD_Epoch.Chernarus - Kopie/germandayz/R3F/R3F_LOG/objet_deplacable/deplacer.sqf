/**
 * Fait déplacer un objet par le joueur. Il garde l'objet tant qu'il ne le relâche pas ou ne meurt pas.
 * L'objet est relaché quand la variable R3F_LOG_joueur_deplace_objet passe à objNull ce qui terminera le script
 * 
 * @param 0 l'objet à déplacer
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
	
	R3F_LOG_objet_selectionne = objNull;
	
	private ["_object", "_est_calculateur", "_arme_principale", "_action_menu", "_azimut_canon"];
	
	_object = _this select 0;
	
	// Si l'objet est un calculateur d'artillerie, on laisse le script spécialisé gérer
	_est_calculateur = _object getVariable "R3F_ARTY_est_calculateur";
	if !(isNil "_est_calculateur") then
	{
		R3F_LOG_mutex_local_verrou = false;
		[_object] execVM "germandayz\R3F\R3F_ARTY\poste_commandement\deplacer_calculateur.sqf";
	}
	else
	{
		_object setVariable ["R3F_LOG_beingmoved", player, true];
		
		R3F_LOG_joueur_deplace_objet = _object;
		
		// Sauvegarde et retrait de l'arme primaire
		_arme_principale = primaryWeapon player;
		if (_arme_principale != "") then
		{
			player playMove "AidlPercMstpSnonWnonDnon04";
			sleep 2;
			player removeWeapon _arme_principale;
		}
		else {sleep 0.5;};
		
		// Si le joueur est mort pendant le sleep, on remet tout comme avant
		if (!alive player) then
		{
			R3F_LOG_joueur_deplace_objet = objNull;
			_object setVariable ["R3F_LOG_beingmoved", objNull, true];
			// Car attachTo de "charger" positionne l'objet en altitude :
			_object setPos [getPos _object select 0, getPos _object select 1, 0];
			_object setVelocity [0, 0, 0];
			
			R3F_LOG_mutex_local_verrou = false;
		}
		else
		{
			_object attachTo [player, [
				0,
				(((boundingBox _object select 1 select 1) max (-(boundingBox _object select 0 select 1))) max ((boundingBox _object select 1 select 0) max (-(boundingBox _object select 0 select 0)))) + 1,
				1]
			];
			
			if (count (weapons _object) > 0) then
			{
				// Le canon doit pointer devant nous (sinon on a l'impression de se faire empaler)
				_azimut_canon = ((_object weaponDirection (weapons _object select 0)) select 0) atan2 ((_object weaponDirection (weapons _object select 0)) select 1);
				
				// On est obligé de demander au serveur de tourner le canon pour nous
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
			
			R3F_LOG_mutex_local_verrou = false;
			
			_action_menu = player addAction [("<t color=""#dddd00"">" + Tow_settings_action_relacher_objet + "</t>"), "germandayz\R3F\R3F_LOG\objet_deplacable\relacher.sqf", nil, 5, true, true];
			
			// On limite la vitesse de marche et on interdit de monter dans un véhicule tant que l'objet est porté
			while {!isNull R3F_LOG_joueur_deplace_objet && alive player} do
			{
				if (vehicle player != player) then
				{
					player globalChat STR_R3F_LOG_ne_pas_monter_dans_vehicule;
					player action ["eject", vehicle player];
					sleep 1;
				};
				
				if ([0,0,0] distance (velocity player) > 2.8) then
				{
					player globalChat STR_R3F_LOG_courir_trop_vite;
					player playMove "AmovPpneMstpSnonWnonDnon";
					sleep 1;
				};
				
				sleep 0.25;
			};
			
			// L'objet n'est plus porté, on le repose
			detach _object;
			_object setPos [getPos _object select 0, getPos _object select 1, 0];
			_object setVelocity [0, 0, 0];
			
			player removeAction _action_menu;
			R3F_LOG_joueur_deplace_objet = objNull;
			
			_object setVariable ["R3F_LOG_beingmoved", objNull, true];
			
			// Restauration de l'arme primaire
			if (alive player && _arme_principale != "") then
			{
				player addWeapon _arme_principale;
				player selectWeapon _arme_principale;
				player selectWeapon (getArray (configFile >> "cfgWeapons" >> _arme_principale >> "muzzles") select 0);
			};
		};
	};
};