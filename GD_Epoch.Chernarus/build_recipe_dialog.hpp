class Build_Recipe_Dialog
{
    idd = -1;
    onLoad="uiNamespace setVariable ['Build_Recipe_Dialog', _this select 0]";
    movingenable = true;
    onUnLoad="uiNamespace setVariable ['Build_Recipe_Dialog', nil]";
    
    class Controls
    {

class backroundImage: RscPicture
{
	idc = 1;
    text = "buildRecipeBook\images\BackRound.paa";
x = 0.29375 * safezoneW + safezoneX;
y = 0.224947 * safezoneH + safezoneY;
w = 0.511042 * safezoneW;
h = 0.547125 * safezoneH;
};
    
        class RecipeFrame: RscFrame
        {
            idc = 1800;
            text = "Base Building Recipe Book";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.224947 * safezoneH + safezoneY;
            w = 0.511042 * safezoneW;
            h = 0.547125 * safezoneH;
        };
        class ObjectImage: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.622981 * safezoneW + safezoneX;
            y = 0.334363 * safezoneH + safezoneY;
            w = 0.162083 * safezoneW;
            h = 0.30952 * safezoneH;
        };
        class TankImage: RscPicture
        {
            idc = 1201;
            text = "dayz_equip\textures\equip_tanktrap_kit_CA.paa";
            x = 0.313086 * safezoneW + safezoneX;
            y = 0.334968 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Tank Trap";
        };
		class WireImage: RscPicture
        {
            idc = 1202;
            text = "dayz_equip\textures\equip_wire_CA.paa";
            x = 0.313086 * safezoneW + safezoneX;
            y = 0.389979 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Wire Fence";
        };
        class SandImage: RscPicture
        {
            idc = 1203;
            text = "dayz_equip\textures\equip_sandbag_CA.paa";
            x = 0.313086 * safezoneW + safezoneX;
            y = 0.444989 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Sand Bags";
        };
        class LogImage: RscPicture
        {
            idc = 1204;
            text = "dayz_equip\textures\equip_woodpile_CA.paa";
            x = 0.313086 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Wood";
        };
        class ScrapImage: RscPicture
        {
            idc = 1205;
            text = "dayz_equip\textures\equip_genericparts_CA.paa";
            x = 0.313086 * safezoneW + safezoneX;
            y = 0.555011 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Scrap Metal";
        };
        class GrenadeImage: RscPicture
        {
            idc = 1206;
            text = "\CA\weapons\data\equip\m_M67_CA.paa";
            x = 0.313086 * safezoneW + safezoneX;
            y = 0.610021 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Grenades";
        };
        class ClassNameFrame: RscFrame
        {
            idc = 1801;
            text = "Materials needed:";
            x = 0.300195 * safezoneW + safezoneX;
            y = 0.29371 * safezoneH + safezoneY;
            w = 0.498542 * safezoneW;
            h = 0.37526 * safezoneH;
        };
        class TankQtyText: RscText
        {
            idc = 1000;
            text = "x 1";
            x = 0.338867 * safezoneW + safezoneX;
            y = 0.334968 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };
        class WiresQty: RscText
        {
            idc = 1001;
            text = "1";
            x = 0.338867 * safezoneW + safezoneX;
            y = 0.444989 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };
        class SandQty: RscText
        {
            idc = 1002;
            text = "1";
            x = 0.338867 * safezoneW + safezoneX;
            y = 0.389979 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };
        class LogsQty: RscText
        {
            idc = 1003;
            text = "1";
            x = 0.338867 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };
        class ScrapQty: RscText
        {
            idc = 1004;
            text = "1";
            x = 0.338867 * safezoneW + safezoneX;
            y = 0.555011 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };
        class GrenadeQty: RscText
        {
            idc = 1005;
            text = "1";
            x = 0.338867 * safezoneW + safezoneX;
            y = 0.610021 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };
        class PrevButton: RscButton
        {
            idc = 1603;
            text = "Previous Page";
            x = 0.356641 * safezoneW + safezoneX;
            y = 0.692537 * safezoneH + safezoneY;
            w = 0.0886457 * safezoneW;
            h = 0.0521932 * safezoneH;
            action = "_nil=[]ExecVM 'buildRecipeBook\prevBuildRecipe.sqf'";
        };
        class ClassNameText: RscText
        {
            idc = 1006;
            text = "CLASS NAME ";
            x = 0.313086 * safezoneW + safezoneX;
            y = 0.252452 * safezoneH + safezoneY;
            w = 0.377474 * safezoneW;
            h = 0.0175092 * safezoneH;
        };
        class NextButton: RscButton
        {
            idc = 1604;
            text = "Next Page";
            x = 0.653125 * safezoneW + safezoneX;
            y = 0.692537 * safezoneH + safezoneY;
            w = 0.0886457 * safezoneW;
            h = 0.0521932 * safezoneH;
            action = "_nil=[]ExecVM 'buildRecipeBook\nextBuildRecipe.sqf'";
        };
        class ShowButton: RscButton
        {
            idc = 1600;
            text = "Build!";
            x = 0.466211 * safezoneW + safezoneX;
            y = 0.692537 * safezoneH + safezoneY;
            w = 0.0751041 * safezoneW;
            h = 0.051254 * safezoneH;
            action = "closeDialog 0;_nil=[]ExecVM 'dayz_code\compile\player_basebuild.sqf'";
        };
        class ShowListButton: RscButton
        {
            idc = 1601;
            text = "Show List";
            x = 0.556445 * safezoneW + safezoneX;
            y = 0.692537 * safezoneH + safezoneY;
            w = 0.0751041 * safezoneW;
            h = 0.051254 * safezoneH;
            action = "closeDialog 0;_nil=[]ExecVM 'buildRecipeBook\build_recipe_list_dialog.sqf'";
        };
        
        class ReqFrame: RscFrame
        {
            idc = 1802;
            text = "Requirements";
            x = 0.49043 * safezoneW + safezoneX;
            y = 0.334968 * safezoneH + safezoneY;
            w = 0.12198 * safezoneW;
            h = 0.302945 * safezoneH;
        };
        class ToolboxImage: RscPicture
        {
            idc = 1207;
            text = "dayz_equip\textures\equip_toolbox_CA.paa";
            x = 0.509766 * safezoneW + safezoneX;
            y = 0.362474 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Tank Trap";
        };
        class EToolImage: RscPicture
        {
            idc = 1208;
            text = "dayz_equip\textures\equip_etool_CA.paa";
            x = 0.509766 * safezoneW + safezoneX;
            y = 0.403732 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Tank Trap";
        };
        class TimeImage: RscPicture
        {
            idc = 1209;
            text = "buildRecipeBook\images\timer.paa";
            x = 0.509766 * safezoneW + safezoneX;
            y = 0.444989 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Tank Trap";
        };
        class InBuildingText: RscText
        {
            idc = 1007;
            text = "In Building:";
            x = 0.496875 * safezoneW + safezoneX;
            y = 0.486247 * safezoneH + safezoneY;
            w = 0.0542709 * safezoneW;
            h = 0.0249579 * safezoneH;
        };
        class OnRoadText: RscText
        {
            idc = 1008;
            text = "On Road:";
            x = 0.496875 * safezoneW + safezoneX;
            y = 0.513753 * safezoneH + safezoneY;
            w = 0.0542709 * safezoneW;
            h = 0.0249579 * safezoneH;
        };
        class RscText_1009: RscText
        {
            idc = 1009;
            text = "In Town:";
            x = 0.496875 * safezoneW + safezoneX;
            y = 0.541258 * safezoneH + safezoneY;
            w = 0.0542709 * safezoneW;
            h = 0.0249579 * safezoneH;
        };
        class RemText: RscText
        {
            idc = 1010;
            text = "Removable:";
            x = 0.496875 * safezoneW + safezoneX;
            y = 0.568763 * safezoneH + safezoneY;
            w = 0.0542709 * safezoneW;
            h = 0.0249579 * safezoneH;
        };
        class building: RscText
        {
            idc = 1014;
            text = "building";
            x = 0.561328 * safezoneW + safezoneX;
            y = 0.486247 * safezoneH + safezoneY;
            w = 0.0297918 * safezoneW;
            h = 0.0221405 * safezoneH;
        };
        class road: RscText
        {
            idc = 1011;
            text = "etool";
            x = 0.561328 * safezoneW + safezoneX;
            y = 0.513753 * safezoneH + safezoneY;
            w = 0.0297918 * safezoneW;
            h = 0.0221405 * safezoneH;
        };
        class town: RscText
        {
            idc = 1012;
            text = "False";
            x = 0.561328 * safezoneW + safezoneX;
            y = 0.541258 * safezoneH + safezoneY;
            w = 0.0297918 * safezoneW;
            h = 0.0221405 * safezoneH;
        };
        class removable: RscText
        {
            idc = 1013;
            text = "False";
            x = 0.561328 * safezoneW + safezoneX;
            y = 0.568763 * safezoneH + safezoneY;
            w = 0.0297918 * safezoneW;
            h = 0.0221405 * safezoneH;
        };
        class chance: RscText
        {
            idc = 1018;
            text = "Chance: 30% (50% lt)";
            x = 0.497396 * safezoneW + safezoneX;
            y = 0.60002 * safezoneH + safezoneY;
            w = 0.0959376 * safezoneW;
            h = 0.0221405 * safezoneH;
        };

        class time: RscText
        {
            idc = 1015;
            text = "False";
            x = 0.561328 * safezoneW + safezoneX;
            y = 0.444989 * safezoneH + safezoneY;
            w = 0.0297918 * safezoneW;
            h = 0.0221405 * safezoneH;
        };
        class etool: RscText
        {
            idc = 1016;
            text = "False";
            x = 0.561328 * safezoneW + safezoneX;
            y = 0.403732 * safezoneH + safezoneY;
            w = 0.0297918 * safezoneW;
            h = 0.0221405 * safezoneH;
        };
        class toolbox: RscText
        {
            idc = 1017;
            text = "False";
            x = 0.561328 * safezoneW + safezoneX;
            y = 0.362474 * safezoneH + safezoneY;
            w = 0.0297918 * safezoneW;
            h = 0.0221405 * safezoneH;
        };
		class Gold10ozImage: RscPicture
        {
            idc = 1207;
            text = "\z\addons\dayz_epoch\pictures\equip_gold_bar_10oz_CA.paa";
            x = 0.413086 * safezoneW + safezoneX;
            y = 0.334968 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Gold10oz";
        };
		class GoldImage: RscPicture
        {
            idc = 1208;
            text = "\z\addons\dayz_epoch\pictures\equip_gold_bar_CA.paa";
            x = 0.413086 * safezoneW + safezoneX;
            y = 0.389979 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Gold";
        };
        class Silver10ozImage: RscPicture
        {
            idc = 1209;
            text = "\z\addons\dayz_epoch\pictures\equip_silver_bar_10oz_CA.paa";
            x = 0.413086 * safezoneW + safezoneX;
            y = 0.444989 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Silver10oz";
        };
        class PoleImage: RscPicture
        {
            idc = 1210;
            text = "\z\addons\dayz_epoch\pictures\equip_pipe_CA.paa";
            x = 0.413086 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Pole";
        };
        class PlywoodImage: RscPicture
        {
            idc = 1211;
            text = "\z\addons\dayz_epoch\pictures\equip_plywood_CA.paa";
            x = 0.413086 * safezoneW + safezoneX;
            y = 0.555011 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "PlyWood";
        };
        class BurlapImage: RscPicture
        {
            idc = 1212;
            text = "\z\addons\dayz_epoch\pictures\equip_burlap_ca.paa";
            x = 0.413086 * safezoneW + safezoneX;
            y = 0.610021 * safezoneH + safezoneY;
            w = 0.019375 * safezoneW;
            h = 0.0315319 * safezoneH;
            tooltip = "Burlap";
        };
		class Gold10ozQtyText: RscText
        {
            idc = 1019;
            text = "x 1";
            x = 0.438867 * safezoneW + safezoneX;
            y = 0.334968 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };
		class Silver10ozQty: RscText
        {
            idc = 1020;
            text = "1";
            x = 0.438867 * safezoneW + safezoneX;
            y = 0.389979 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };
        class GoldQty: RscText
        {
            idc = 1021;
            text = "1";
            x = 0.438867 * safezoneW + safezoneX;
            y = 0.444989 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };

        class PoleQty: RscText
        {
            idc = 1022;
            text = "1";
            x = 0.438867 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };
        class WoodPlywoodQty: RscText
        {
            idc = 1023;
            text = "1";
            x = 0.438867 * safezoneW + safezoneX;
            y = 0.555011 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };
        class BurlapQty: RscText
        {
            idc = 1024;
            text = "1";
            x = 0.438867 * safezoneW + safezoneX;
            y = 0.610021 * safezoneH + safezoneY;
            w = 0.050625 * safezoneW;
            h = 0.0277753 * safezoneH;
        };
    };
};