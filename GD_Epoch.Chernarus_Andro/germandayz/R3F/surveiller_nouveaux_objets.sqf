
#include "R3F_ARTY_disable_enable.sqf"

#include "R3F_LOG_disable_enable.sqf"
sleep 0.1;private["_l0","_l1","_l2","_l3","_l4","_l5"];
#ifdef R3F_LOG_enable
_l0=R3F_LOG_CFG_objets_deplacables+R3F_LOG_CFG_objets_heliportables+R3F_LOG_CFG_objets_remorquables+R3F_LOG_classes_objets_transportables;
#endif
_l1=[];while{true}do{if!(isNull player)then{_l2=(vehicles+nearestObjects[player,["Static"],80])-_l1;_l3=count _l2;if(_l3>0)then{for[{_l4=0},{_l4<_l3},{_l4=_l4+1}]do{_l5=_l2 select _l4;
#ifdef R3F_LOG_enable
if({_l5 isKindOf _x}count _l0>0)then{[_l5]spawn R3F_LOG_FNCT_objet_init;};if({_l5 isKindOf _x}count R3F_LOG_CFG_heliporteurs>0)then{[_l5]spawn R3F_LOG_FNCT_heliporteur_init;};if({_l5 isKindOf _x}count R3F_LOG_CFG_remorqueurs>0)then{[_l5]spawn R3F_LOG_FNCT_remorqueur_init;};if({_l5 isKindOf _x}count R3F_LOG_classes_transporteurs>0)then{[_l5]spawn R3F_LOG_FNCT_transporteur_init;};
#endif

#ifdef R3F_ARTY_enable
if({_l5 isKindOf _x}count R3F_ARTY_CFG_pieces_artillerie>0)then{[_l5]spawn R3F_ARTY_FNCT_piece_init;};if({_l5 isKindOf _x}count R3F_ARTY_CFG_calculateur_interne>0)then{_l5 addAction[("<t color=""#dddd00"">"+STR_R3F_ARTY_action_ouvrir_dlg_SM+"</t>"),"germandayz\R3F\R3F_ARTY\poste_commandement\ouvrir_dlg_saisie_mission.sqf",nil,6,false,true,"","vehicle player==_target"];};if({_l5 isKindOf _x}count R3F_ARTY_CFG_calculateur_externe>0)then{_l5 addAction[("<t color=""#dddd00"">"+STR_R3F_ARTY_action_ouvrir_dlg_SM+"</t>"),"germandayz\R3F\R3F_ARTY\poste_commandement\ouvrir_dlg_saisie_mission.sqf",nil,6,true,true,"","vehicle player==player"];};if(typeOf _l5=="SatPhone")then{[_l5]spawn R3F_ARTY_FNCT_calculateur_init;};
#endif
sleep(18/_l3);};_l1=_l1+_l2;}else{sleep 18;};}else{sleep 2;};};