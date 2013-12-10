/*
 * This file contains the configuration variables of the logistics system.
 * Important note : All the classes names which inherits from the ones used in configuration variables will be also available.
 */

/*
 * There are two ways to manage new objects with the logistics system. The first is to add these objects in the
 * folowing appropriate lists. The second is to create a new external file in the /addons_config/ directory,
 * according to the same scheme as the existing ones, and to add a #include at the end of this current file.
 */

// Einstellungen by Andro 
 
/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/*
 * List of class names of (ground or air) vehicles which can tow towables objects.
 */
R3F_LOG_CFG_remorqueurs =
[
"TowingTractor",
"tractorOld",
"tractor",
"Kamaz",
"MTVR_DES_EP1",
"Ural_UN_EP1"
];// e.g. : "MyTowingVehicleClassName1", "MyTowingVehicleClassName2"

/*
 * List of class names of towables objects.
 */
R3F_LOG_CFG_objets_remorquables =
[
"S1203_ambulance_EP1",
"S1203_TK_CIV_EP1",
"HMMWV_M1035_DES_EP1",
"HMMWV_Ambulance",
"HMMWV_Ambulance_CZ_DES_EP1",
"HMMWV_DES_EP1",
"HMMWV_DZ",
"GAZ_Vodnik_MedEvac",
"LandRover_CZ_EP1",
"LandRover_TK_CIV_EP1",
"BTR40_TK_INS_EP1", 
"BTR40_TK_GUE_EP1", 
"BAF_Offroad_D", 
"BAF_Offroad_W",
"HMMWV_Terminal_EP1",
"HMMWV_M998A2_SOV_DES_EP1_DZE",
"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
"LandRover_MG_TK_EP1_DZE",
"LandRover_Special_CZ_EP1_DZE",
"Offroad_DSHKM_Gue_DZE",
"GAZ_Vodnik_DZE",
"UAZ_MG_TK_EP1_DZE", 
"UAZ_MG_CDF", 
"UAZ_AGS30_CDF", 
"BTR40_MG_TK_INS_EP1", 
"BTR40_MG_TK_GUE_EP1", 
"BAF_Jackal2_L2A1_D", 
"BAF_Jackal2_GMG_D", 
"BAF_Jackal2_GMG_W", 
"BAF_Jackal2_L2A1_w", 
"hilux1_civil_1_open",
"hilux1_civil_2_covered",
"hilux1_civil_3_open_EP1",
"datsun1_civil_1_open",
"datsun1_civil_2_covered",
"datsun1_civil_3_open",
"VIL_asistvan_DZE", 
"ArmoredSUV_PMC_DZE",
"Pickup_PK_GUE_DZE",
"Pickup_PK_INS_DZE",
"Pickup_PK_TK_GUE_EP1_DZE",
"Skoda",
"SkodaBlue",
"SkodaGreen",
"SkodaRed",
"VolhaLimo_TK_CIV_EP1",
"Volha_1_TK_CIV_EP1",
"Volha_2_TK_CIV_EP1",
"VWGolf",
"car_hatchback",
"car_sedan",
"GLT_M300_LT",
"GLT_M300_ST",
"Lada1",
"Lada1_TK_CIV_EP1",
"Lada2",
"Lada2_TK_CIV_EP1",
"LadaLM",
"policecar", 
"SUV_Blue",
"SUV_Camo",
"SUV_Charcoal",
"SUV_Green",
"SUV_Orange",
"SUV_Pink",
"SUV_Red",
"SUV_Silver",
"SUV_TK_CIV_EP1",
"SUV_White",
"SUV_Yellow",
"UAZ_CDF",
"UAZ_INS",
"UAZ_RU",
"UAZ_Unarmed_TK_CIV_EP1",
"UAZ_Unarmed_TK_EP1",
"UAZ_Unarmed_UN_EP1"
];// e.g. : "MyTowableObjectClassName1", "MyTowableObjectClassName2"


/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/*
 * List of class names of air vehicles which can lift liftables objects.
 */
R3F_LOG_CFG_heliporteurs =
[
"BAF_Merlin_HC3_D", 
"CH_47F_EP1_DZE"	
]; // e.g. : "MyLifterVehicleClassName1", "MyLifterVehicleClassName2"

/*
 * List of class names of liftables objects.
 */
R3F_LOG_CFG_objets_heliportables =
[
"S1203_ambulance_EP1",
"S1203_TK_CIV_EP1",
"HMMWV_M1035_DES_EP1",
"HMMWV_Ambulance",
"HMMWV_Ambulance_CZ_DES_EP1",
"HMMWV_DES_EP1",
"HMMWV_DZ",
"GAZ_Vodnik_MedEvac",
"LandRover_CZ_EP1",
"LandRover_TK_CIV_EP1",
"BTR40_TK_INS_EP1", 
"BTR40_TK_GUE_EP1", 
"BAF_Offroad_D", 
"BAF_Offroad_W", 
"HMMWV_Terminal_EP1", 
"HMMWV_M998A2_SOV_DES_EP1_DZE",
"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
"LandRover_MG_TK_EP1_DZE",
"LandRover_Special_CZ_EP1_DZE",
"Offroad_DSHKM_Gue_DZE",
"GAZ_Vodnik_DZE",
"UAZ_MG_TK_EP1_DZE", 
"UAZ_MG_CDF", 
"UAZ_AGS30_CDF", 
"BTR40_MG_TK_INS_EP1", 
"BTR40_MG_TK_GUE_EP1", 
"BAF_Jackal2_L2A1_D", 
"BAF_Jackal2_GMG_D", 
"BAF_Jackal2_GMG_W", 
"BAF_Jackal2_L2A1_w", 
"hilux1_civil_1_open",
"hilux1_civil_2_covered",
"hilux1_civil_3_open_EP1",
"datsun1_civil_1_open",
"datsun1_civil_2_covered",
"datsun1_civil_3_open",
"VIL_asistvan_DZE", 
"ArmoredSUV_PMC_DZE",
"Pickup_PK_GUE_DZE",
"Pickup_PK_INS_DZE",
"Pickup_PK_TK_GUE_EP1_DZE",
"Skoda",
"SkodaBlue",
"SkodaGreen",
"SkodaRed",
"VolhaLimo_TK_CIV_EP1",
"Volha_1_TK_CIV_EP1",
"Volha_2_TK_CIV_EP1",
"VWGolf",
"car_hatchback",
"car_sedan",
"GLT_M300_LT",
"GLT_M300_ST",
"Lada1",
"Lada1_TK_CIV_EP1",
"Lada2",
"Lada2_TK_CIV_EP1",
"LadaLM",
"policecar", 
"SUV_Blue",
"SUV_Camo",
"SUV_Charcoal",
"SUV_Green",
"SUV_Orange",
"SUV_Pink",
"SUV_Red",
"SUV_Silver",
"SUV_TK_CIV_EP1",
"SUV_White",
"SUV_Yellow",
"UAZ_CDF",
"UAZ_INS",
"UAZ_RU",
"UAZ_Unarmed_TK_CIV_EP1",
"UAZ_Unarmed_TK_EP1",
"UAZ_Unarmed_UN_EP1"
];// e.g. : "MyLiftableObjectClassName1", "MyLiftableObjectClassName2"


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
 * This section use a quantification of the volume and/or weight of the objets.
 * The arbitrary referencial used is : an ammo box of type USVehicleBox "weights" 12 units.
 * Note : the priority of a declaration of capacity to another corresponds to their order in the tables.
 *   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40,
 *   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones
 *   in "Truck", will have a capacity of 40.
 */

/*
 * List of class names of (ground or air) vehicles which can transport transportables objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 */
R3F_LOG_CFG_transporteurs =
[
["Ural_CDF",90],
["Ural_UN_EP1",90],
["UralOpen_CDF",90], 
["Ural_TK_CIV_EP1",90],
["Ural_UN_EP1",90],
["V3S_Open_TK_CIV_EP1",90],
["V3S_Open_TK_EP1",90],
["Kamaz",90],
["MTVR_DES_EP1",90],
["V3S_Civ",90],
["V3S_TK_EP1_DZE",90],
["V3S_RA_TK_GUE_EP1_DZE",90],
["UralCivil_DZE",90],
["UralCivil2_DZE",90],
["KamazOpen_DZE",90],
["MTVR",90],
["BAF_Merlin_HC3_D",30],
["CH_47F_EP1_DZE",40],
["AN2_DZ",10],
["C130J_US_EP1",120],
["MV22_DZ",30]
]; // e.g. : ["MyTransporterClassName1", itsCapacity], ["MyTransporterClassName2", itsCapacity]

/**
 * List of class names of transportables objects.
 * The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles).
 */
R3F_LOG_CFG_objets_transportables =
[
["Mi1007_Civilian_DZ",100],
["AH6X_DZ",100], 
["MH6J_DZ",100],
["CSJ_GyroC",100],
["CSJ_GyroCover",100],
["CSJ_GyroP",100],
["BAF_Merlin_HC3_D",100],
["UH60M_MEV_EP100",100],
["CH_47F_EP100_DZE",100],
["UH100H_DZE",100],
["UH100Y_DZE",100],
["UH60M_EP100_DZE",100],
["Mi1007_DZE",100],
["MH60S",100],
["UH100H_TK_EP100",100],
["GNT_C10085",100],
["GNT_C10085C",100],
["GNT_C10085R",100],
["GNT_C10085U",100],
["MMT_Civ",10],
["Old_bike_TK_INS_EP100",10],
["TT650_Civ",10],
["TT650_Ins",10],
["TT650_TK_CIV_EP100",10],
["ATV_CZ_EP100",10],
["ATV_US_EP100",10],
["M100030_US_DES_EP100",10],
["Old_moto_TK_Civ_EP100",10],
["tractor",100],
["tractorOld",100], 
["TowingTractor",100], 
["S100203_ambulance_EP100",100],
["S100203_TK_CIV_EP100",100],
["HMMWV_M100035_DES_EP100",100],
["HMMWV_Ambulance",100],
["HMMWV_Ambulance_CZ_DES_EP100",100],
["HMMWV_DES_EP100",100],
["HMMWV_DZ",100],
["GAZ_Vodnik_MedEvac",100],
["LandRover_CZ_EP100",100],
["LandRover_TK_CIV_EP100",100],
["BTR40_TK_INS_EP100",100],
["BTR40_TK_GUE_EP100",100],
["BAF_Offroad_D",100],
["BAF_Offroad_W",100],
["HMMWV_Terminal_EP1",100],
["HMMWV_M998A2_SOV_DES_EP100_DZE",100],
["HMMWV_M1001005100_M2_CZ_DES_EP100_DZE",100],
["LandRover_MG_TK_EP100_DZE",100],
["LandRover_Special_CZ_EP100_DZE",100],
["Offroad_DSHKM_Gue_DZE",100],
["GAZ_Vodnik_DZE",100],
["UAZ_MG_TK_EP100_DZE",100],
["UAZ_MG_CDF",100],
["UAZ_AGS30_CDF",100],
["BTR40_MG_TK_INS_EP100",100],
["BTR40_MG_TK_GUE_EP100",100],
["BAF_Jackal2_L2A100_D",100],
["BAF_Jackal2_GMG_D",100],
["BAF_Jackal2_GMG_W",100],
["BAF_Jackal2_L2A100_w",100],
["hilux100_civil_100_open",100],
["hilux100_civil_2_covered",100],
["hilux100_civil_3_open_EP100",100],
["datsun100_civil_100_open",100],
["datsun100_civil_2_covered",100],
["datsun100_civil_3_open",100],
["VIL_asistvan_DZE",100],
["ArmoredSUV_PMC_DZE",100],
["Pickup_PK_GUE_DZE",100],
["Pickup_PK_INS_DZE",100],
["Pickup_PK_TK_GUE_EP100_DZE",100],
["Skoda",100],
["SkodaBlue",100],
["SkodaGreen",100],
["SkodaRed",100],
["VolhaLimo_TK_CIV_EP100",100],
["Volha_100_TK_CIV_EP100",100],
["Volha_2_TK_CIV_EP100",100],
["VWGolf",100],
["car_hatchback",100],
["car_sedan",100],
["GLT_M300_LT",100],
["GLT_M300_ST",100],
["Lada100",100],
["Lada100_TK_CIV_EP100",100],
["Lada2",100],
["Lada2_TK_CIV_EP100",100],
["LadaLM",100],
["policecar",100],
["SUV_Blue",100],
["SUV_Camo",100],
["SUV_Charcoal",100],
["SUV_Green",100],
["SUV_Orange",100],
["SUV_Pink",100],
["SUV_Red",100],
["SUV_Silver",100],
["SUV_TK_CIV_EP100",100],
["SUV_White",100],
["SUV_Yellow",100],
["UAZ_CDF",100],
["UAZ_INS",100],
["UAZ_RU",100],
["UAZ_Unarmed_TK_CIV_EP100",100],
["UAZ_Unarmed_TK_EP100",100],
["UAZ_Unarmed_UN_EP100",100]
]; // e.g. : ["MyTransportableObjectClassName1", itsCost], ["MyTransportableObjectClassName2", itsCost]

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects moveables by player.
 * Liste des noms de classes des objets transportables par le joueur.
 */
R3F_LOG_CFG_objets_deplacables =
[
	// e.g. : "MyMovableObjectClassName1", "MyMovableObjectClassName2"
];

/*
 * List of files adding objects in the arrays of logistics configuration (e.g. R3F_LOG_CFG_remorqueurs)
 * Add an include to the new file here if you want to use the logistics with a new addon.
 * 
 * Liste des fichiers ajoutant des objets dans les tableaux de fonctionnalités logistiques (ex : R3F_LOG_CFG_remorqueurs)
 * Ajoutez une inclusion vers votre nouveau fichier ici si vous souhaitez utilisez la logistique avec un nouvel addon.
 */
//#include "addons_config\ACE_OA_objects.sqf"
//#include "addons_config\BAF_objects.sqf"
//#include "addons_config\arma2_CO_objects.sqf"