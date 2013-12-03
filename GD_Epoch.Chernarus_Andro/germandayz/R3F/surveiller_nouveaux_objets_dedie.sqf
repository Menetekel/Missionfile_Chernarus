
#include "R3F_ARTY_disable_enable.sqf"

#ifdef R3F_ARTY_enable
sleep 0.1;private["_l0","_l1","_l2","_l3","_l4"];_l0=[];while{true}do{_l1=vehicles-_l0;_l2=count _l1;if(_l2>0)then{for[{_l3=0},{_l3<_l2},{_l3=_l3+1}]do{_l4=_l1 select _l3;if({_l4 isKindOf _x}count R3F_ARTY_CFG_pieces_artillerie>0)then{[_l4]spawn R3F_ARTY_FNCT_piece_init_dedie;};sleep(18/_l2);};_l0=_l0+_l1;}else{sleep 18;};};#endif