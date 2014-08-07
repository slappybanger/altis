/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_I_G_Story_Protagonist_F",nil,7500],
			["U_I_G_resistanceLeader_F",nil,11500]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,850],
			["H_Shemag_olive",nil,850],
			["H_ShemagOpen_khk",nil,800],
			["H_MilCap_oucamo",nil,1200],
			["H_Bandanna_camo",nil,650]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Bandanna_tan",nil,1200],
			["G_Balaclava_blk",nil,1200],
			["G_Balaclava_combat",nil,1200],
			["G_Balaclava_lowprofile",nil,1200],
			["G_Balaclava_oli",nil,1200],
			["G_Bandanna_aviator",nil,1200],
			["G_Bandanna_beast",nil,1200],
			["G_Bandanna_blk",nil,1200],
			["G_Bandanna_oli",nil,1200],
			["G_Bandanna_khk",nil,1200],
			["G_Bandanna_shades",nil,1200],
			["G_Bandanna_sport"  ,nil,1200]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_BandollierB_cbr",nil,4500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000]
		];
	};
};