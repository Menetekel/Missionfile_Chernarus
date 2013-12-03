
#include "R3F_Realism_Configuration.cfg"

#ifdef R3F_REALISM_USE_WEIGHT
_l0=[]execVM"R3F_realism\R3F_Weight\R3F_DoWeight.sqf";
#endif

#ifdef R3F_REALISM_USE_TIRED
_l0=[]execVM"R3F_realism\R3F_Tired\R3F_Tired_Init.sqf";
#endif
