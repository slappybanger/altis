_pathtotools = "fusionsmenu\admin\tools\";
_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';


if ((getPlayerUID player) in ["76561198030241549", "76561197989320695", "76561198068609909", "76561198076320576", "76561197985341100", "76561197988496339", "76561198118515568", "76561198011512873"]) then { //all admins
	adminmenu =
	[
		["Fusions Menu",true],
			["Tools", [4], "#USER:ToolsMenu", -5, [["expression", ""]], "1", "1"],
			["", [-1], "", -5, [["expression", ""]], "1", "0"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
	];
	
	ToolsMenu =
	[
		["Tools",true],
			["Teleport", [2],  "", -5, [["expression", format[_EXECscript1,"teleport.sqf"]]], "1", "1"],
			["Teleport Player To Me", [3],  "", -5, [["expression", format[_EXECscript1,"tptome.sqf"]]], "1", "1"],
			["Spectate Player", [4],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
			["Script Console", [5], "", -5, [["expression", format[_EXECscript1, "startconsole.sqf"]]], "1", "1"],
			//["God Mode on/off", [6], "", -5, [["expression", format[_EXECscript1, "gm.sqf"]]], "1", "1"],		
			["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
	];
		
	showCommandingMenu "#USER:adminmenu";
}