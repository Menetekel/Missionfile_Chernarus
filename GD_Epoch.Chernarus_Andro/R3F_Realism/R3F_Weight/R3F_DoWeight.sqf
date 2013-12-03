
#include "R3F_WEIGHT_Configuration.cfg"
call compile preprocessFile"R3F_Realism\R3F_Weight\R3F_Weight_Fnct.sqf";private["_l0","_l1","_l2","_l3","_l4"];disableSerialization;R3F_Weight=call R3F_WEIGHT_FNCT_GetWeight;_l4="";_l0=0;while{true}do{sleep R3F_WEIGHT_SHORT_DELAY;
#ifdef R3F_WEIGHT_SHOW_WEIGHT
_l3=findDisplay ARMA2_RSCDISPLAYGEARBOX;_l1=((str _l3)!="No display");
#else
_l1=false;
#endif
if(_l1)then{R3F_Weight=call R3F_WEIGHT_FNCT_GetWeight;if(_l4=="")then{_l2=_l3 displayCtrl ARMA2_CAPTIONGEARBOX;_l4=ctrlText _l2;};_l2=_l3 displayCtrl ARMA2_CAPTIONGEARBOX;_l2 ctrlSetText format[localize"STR_R3F_WEIGHT_InGearBox",_l4,R3F_Weight];_l0=0;}else{if(_l0>R3F_WEIGHT_LONG_DELAY)then{R3F_Weight=call R3F_WEIGHT_FNCT_GetWeight;_l0=0;};_l0=_l0+1;};};