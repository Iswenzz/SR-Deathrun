/*
+-------------------------------------------------------------------+
|                                                                   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   ++++|   \++++|  |++++|  |___________|+++++++/        \+++++++   |
|   ++++|    \+++|  |++++|  |++++++++++++++++++/    __    \++++++   |
|   ++++|  \  \++|  |++++|  |+++++++++++++++++/    /++\    \+++++   |
|   ++++|  |\  \+|  |++++|  |___________|++++|    |++++|    |++++   |
|   ++++|  |+\  \|  |++++|  |++++++++++++++++|    |++++|    |++++   |
|   ++++|  |++\  \  |++++|  |+++++++++++++++++\    \++/    /+++++   |
|   ++++|  |+++\    |++++|  |++++++++++++++++++\          /++++++   |
|   ++++|__|++++\___|++++|__|___________|+++++++\________/+++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|                                                                   |
+-------------------------------------------------------------------+


BuggedLikeHell Deathrun Map Script by club27|Neo
mp_dr_buggedlikehell


	 Supported mods: Deathrun
	 Traps: 11
	 Secrets: 4
	 Difficulty: Medium (hard for the first few rounds)
	 Included songs: Innerpartysystem - Don't Stop | PSY - Gangname Style | Taio Cruz - Hangover | Hollywood Undead - Been To Hell | DJ Fresh - Gold Dust
	 Author: Neo (club27|Neo)
	 Additional help: Dr. Uzi (club27|Dr. Uzi)
	 Closed-beta testers: club27 teammembers, Whetley
	 Phase: RELEASE (allowed to use on every public server)
	 [Phase is either: PRE-ALPHA | ALPHA | CLOSED-BETA | OPEN-BETA | RELEASE CANDIDATE | RELEASE]


Copyright (c) club27|Neo | All rights reserved.

PLEASE DO NOT COPY WITHOUT PERMISSION (if you have already extracted it from the .ff),
instead add me on XFire (name: gribmate) and we can talk about it
*/



#include maps\mp\_neo_common;


CsapdakInditasa()
{
	thread Csapda1();
	thread Csapda2();
	thread Csapda3();
	thread Csapda4();
	thread Csapda5();
	thread Csapda6();
	thread Csapda7();
	thread Csapda8();
	
	thread Nehezites1();
	thread Nehezites2();
}


//Elsõ csapda: Buggos négyzetek
Csapda1()
{
    level.triggerek["csapda1"] waittill("trigger", kivalto);
	level.triggerek["csapda1"] Delete();
	PlayFX(level.effektek["aktivcsapda"], level.originek["csapda1"].origin);
	level.modelek["csapda1"] Delete();
	
	if (RandomIntRange(1, 101) > 50)
	{
		for (i = 1; i < 5; i++)
		{
			level.brushok["csapda1"][i] NotSolid();
		}
	}
	else
	{
		for (i = 5; i < 9; i++)
		{
			level.brushok["csapda1"][i] NotSolid();
		}
	}
    wait 5;
    level.brushok["csapda1_platform"] MoveX(-1022, 3);
}


//Második csapda: Buggos tüskék a mennyezeten
Csapda2()
{
    level.triggerek["csapda2"] waittill("trigger", kivalto);
	level.triggerek["csapda2"] Delete();
	PlayFX(level.effektek["aktivcsapda"], level.originek["csapda2"].origin);
	level.modelek["csapda2"] Delete();
	
	thread CsapdaGyilkos(level.triggerek["csapda2_halal"]);
	for (i = 0; i < level.brushok["csapda2_tuskek"].size; i++)
	{
		level.brushok["csapda2_tuskek"][i] MoveZ(-140, 0.5);
	}
	level.brushok["csapda2"] MoveZ(-140, 0.5);
	level.brushok["csapda2"] waittill("movedone");
	thread Csapda2_Seged();
	for(i = 0; i < 4000; i++)
    {
		for (x = 0; x < level.brushok["csapda2_tuskek"].size; x++)
		{
			level.brushok["csapda2_tuskek"][x] MoveZ(3, 0.001);
		}
		level.brushok["csapda2"] MoveZ(3, 0.001);
		wait 0.002;
		for (x = 0; x < level.brushok["csapda2_tuskek"].size; x++)
		{
			level.brushok["csapda2_tuskek"][x] MoveZ(-3, 0.001);
		}
		level.brushok["csapda2"] MoveZ(-3, 0.001);
		wait 0.002;
    }
}
//!!!Direkt meghívása TILOS, a Csapda2() hívja meg!!!
Csapda2_Seged()
{
	wait 4;
	level.triggerek["csapda2_halal"] Delete();
	level.brushok["csapda2"] Delete();
	for (i = 0; i< level.brushok["csapda2_tuskek"].size; i++)
	{
		level.brushok["csapda2_tuskek"][i] Delete();
	}
}
//!!!Direkt meghívása TILOS, a csapdák hívják meg!!!
CsapdaGyilkos(halaltrigger)
{
	wait 0.5;
	while (true)
	{
		halaltrigger waittill("trigger", kivalto);
		tamado = Spawn("script_origin", kivalto.origin);
		kivalto FinishPlayerDamage(tamado, tamado, 99999, 0, "MOD_UNKNOWN", "ak47_mp", kivalto.origin, AnglesToForward((0,0,0)), "none", 0);
	}
}


//Harmadik csapda: Buggos elektródák a vízben
Csapda3()
{
	hang_alap1 = Spawn("script_origin", (-588, -9374, 332));
	hang_alap2 = Spawn("script_origin", (-436, -9374, 332));
	hang1 = Spawn("script_origin", (-934, -9060, 206));
	hang2 = Spawn("script_origin", (-398, -9838, 188));
	hang3 = Spawn("script_origin", (-176, -8970, 192));
	hang4 = Spawn("script_origin", (-634, -9762, 196));
	hang5 = Spawn("script_origin", (-850, -9782, 186));
	hang6 = Spawn("script_origin", (-484, -9012, 186));
	hang7 = Spawn("script_origin", (-156, -9820, 174));
    level.triggerek["csapda3"] waittill("trigger", kivalto);
	level.triggerek["csapda3"] Delete();
	PlayFX(level.effektek["aktivcsapda"], level.originek["csapda3"].origin);
	level.modelek["csapda3"] Delete();
	PlayFX(level.effektek["szikra"], (-588, -9374, 332));
	PlayFX(level.effektek["szikra"], (-436, -9374, 332));
	hang_alap1 PlaySound("spark");
	hang_alap2 PlaySound("spark");
	wait 0.5;
	thread Csapda3_Seged(level.triggerek["csapda3_halal1"]);
	thread Csapda3_Seged(level.triggerek["csapda3_halal2"]);
	hang1 PlaySound("spark");
	PlayFX(level.effektek["szikra"], (-934, -9060, 206));
	wait 0.2;
	hang2 PlaySound("spark");
	PlayFX(level.effektek["szikra"], (-398, -9838, 188));
	wait 0.8;
	hang3 PlaySound("spark");
	PlayFX(level.effektek["szikra"], (-176, -8970, 192));
	wait 1;
	hang4 PlaySound("spark");
	PlayFX(level.effektek["szikra"], (-634, -9762, 196));
	wait 0.5;
	hang5 PlaySound("spark");
	PlayFX(level.effektek["szikra"], (-850, -9782, 186));
	wait 1;
	hang6 PlaySound("spark");
	PlayFX(level.effektek["szikra"], (-484, -9012, 186));
	wait 0.5;
	hang7 PlaySound("spark");
	PlayFX(level.effektek["szikra"], (-156, -9820, 174));
	level.triggerek["csapda3_halal1"] Delete();
	level.triggerek["csapda3_halal2"] Delete();
}
//!!!Direkt meghívása TILOS, a Csapda2() hívja meg!!!
Csapda3_Seged(halaltrigger)
{
	while (true)
	{
		halaltrigger waittill("trigger", kivalto);
		kivalto thread Csapda3_Gyilkos();
	}
}
Csapda3_Gyilkos()
{
	self endon("death");
	
	tamado = Spawn("script_origin", self.origin);
	for (i = 0; i < 100; i++)
	{
		self FinishPlayerDamage(tamado, tamado, 10, 0, "MOD_UNKNOWN", "ak47_mp", self.origin, AnglesToForward((0,0,0)), "none", 0);
		wait 0.3;
	}
}


//Negyedik csapda: buggos fal
Csapda4()
{
    level.triggerek["csapda4"] waittill("trigger", kivalto);
	level.triggerek["csapda4"] Delete();
	PlayFX(level.effektek["aktivcsapda"], level.originek["csapda4"].origin);
	level.modelek["csapda4"] Delete();
	
	vel1 = RandomIntRange(0, 4);
	vel2 = KulonbozoRandom(0,4, vel1);
	index1 = "csapda4_fal_" + vel1;
	index2 = "csapda4_fal_" + vel2;
	for (i = 0; i < level.brushok[index1].size; i++)
	{
		level.brushok[index1][i] Solid();
	}
	for (i = 0; i < level.brushok[index2].size; i++)
	{
		level.brushok[index2][i] Solid();
	}
}


//Ötödik csapda: buggos forgóplatform
Csapda5()
{
    level.triggerek["csapda5"] waittill("trigger", kivalto);
	level.triggerek["csapda5"] Delete();
	PlayFX(level.effektek["aktivcsapda"], level.originek["csapda5"].origin);
	level.modelek["csapda5"] Delete();
	
	level.brushok["csapda5"] NotSolid();
	level.brushok["csapda5"] RotateRoll(-720, 8);
	level.brushok["csapda5"] waittill("rotatedone");
	level.brushok["csapda5"] Solid();
}


//Hatodik csapda: buggos tolóplatform
Csapda6()
{
	veletlen = RandomIntRange(0, 4);
    level.triggerek["csapda6"] waittill("trigger", kivalto);
	level.triggerek["csapda6"] Delete();
	PlayFX(level.effektek["aktivcsapda"], level.originek["csapda6"].origin);
	level.modelek["csapda6"] Delete();
	
	for (i = 0; i < level.brushok["csapda6_tuskek"].size; i++)
	{
		level.brushok["csapda6_tuskek"][i] NotSolid();
		level.brushok["csapda6_tuskek"][i] MoveX(-992, 1.5);
	}
	level.brushok["csapda6_oszlop"] NotSolid();
	level.brushok["csapda6_platform"] NotSolid();
	level.brushok["csapda6_oszlop"] MoveX(-992, 1.5);
	level.brushok["csapda6_platform"] MoveX(-992, 1.5);
	wait 0.75;
	level.brushok["csapda6_eltunik"][veletlen] Delete();
	
	level.brushok["csapda6_platform"] waittill("movedone");
	
	wait 0.75;
	for (i = 0; i < level.brushok["csapda6_tuskek"].size; i++)
	{
		level.brushok["csapda6_tuskek"][i] MoveX(992, 1.5);
	}
	level.brushok["csapda6_oszlop"] MoveX(992, 1.5);
	level.brushok["csapda6_platform"] MoveX(992, 1.5);
	
	level.brushok["csapda6_platform"] waittill("movedone");
	
	for (i = 0; i < level.brushok["csapda6_tuskek"].size; i++)
	{
		level.brushok["csapda6_tuskek"][i] Solid();
	}
	level.brushok["csapda6_oszlop"] Solid();
	level.brushok["csapda6_platform"] Solid();
}


//Hetedik csapda: tûzsugarak
Csapda7()
{
	thread Csapda7_Gaz("csapda7aktivalva_1", 1672);
	thread Csapda7_Gaz("csapda7aktivalva_2", 1848);
	thread Csapda7_Gaz("csapda7aktivalva_3", 1992);
	thread Csapda7_Gaz("csapda7aktivalva_4", 2168);
    level.triggerek["csapda7"] waittill("trigger", kivalto);
	level.triggerek["csapda7"] Delete();
	PlayFX(level.effektek["aktivcsapda"], level.originek["csapda7"].origin);
	level.modelek["csapda7"] Delete();
	
	thread Csapda7_Gyilkos();
	level notify("csapda7aktivalva_1");
	thread Csapda7_Tuz(1672);
	thread TobbTriggerFigyeles(level.triggerek["csapda7_halal"][0], "csapda7_halal", 1);
	wait 0.5;
	level notify("csapda7aktivalva_2");
	thread Csapda7_Tuz(1848);
	thread TobbTriggerFigyeles(level.triggerek["csapda7_halal"][1], "csapda7_halal", 2);
	wait 0.5;
	level notify("csapda7aktivalva_3");
	thread Csapda7_Tuz(1992);
	thread TobbTriggerFigyeles(level.triggerek["csapda7_halal"][2], "csapda7_halal", 3);
	wait 0.5;
	level notify("csapda7aktivalva_4");
	thread Csapda7_Tuz(2168);
	thread TobbTriggerFigyeles(level.triggerek["csapda7_halal"][3], "csapda7_halal", 4);
	wait 4;
	level.triggerek["csapda7_halal"][0] Delete();
	wait 0.5;
	level.triggerek["csapda7_halal"][1] Delete();
	wait 0.5;
	level.triggerek["csapda7_halal"][2] Delete();
	wait 0.5;
	level.triggerek["csapda7_halal"][3] Delete();
}
//!!!Direkt meghívása TILOS, a Csapda7() hívja meg!!!
Csapda7_Gyilkos()
{
	while (true)
	{
		level waittill("csapda7_halal", melyik, kivalto);
		kivalto thread Csapda7_Gyilkos_Seged();
	}
}
//!!!Direkt meghívása TILOS, a Csapda7_Gyilkos() hívja meg!!!
Csapda7_Gyilkos_Seged()
{
	self endon("death");
	
	tamado = Spawn("script_origin", self.origin);
	for (i = 0; i < 100; i++)
	{
		self FinishPlayerDamage(tamado, tamado, 10, 0, "MOD_UNKNOWN", "ak47_mp", self.origin, AnglesToForward((0,0,0)), "none", 0);
		wait 0.3;
	}
}
//!!!Direkt meghívása TILOS, a Csapda7() hívja meg!!!
Csapda7_Gaz(end, koord)
{
	level endon(end);
	
	while (true)
	{
		PlayFX(level.effektek["gazsugar"], (koord, -5689, 712), (0, -90, 0), (270, 0, 0));
		PlayFX(level.effektek["gazsugar"], (koord, -6217, 712), (0, 90, 0), (270, 0, 0));
		wait 1;
	}
}
//!!!Direkt meghívása TILOS, a Csapda7() hívja meg!!!
Csapda7_Tuz(koord)
{
	hang1 = Spawn("script_origin", (koord, -5698, 704));
	hang2 = Spawn("script_origin", (koord, -6210, 704));
	PlayFX(level.effektek["kis_szikra"], (koord, -5698, 704));
	hang1 PlaySound("spark");
	PlayFX(level.effektek["kis_szikra"], (koord, -6210, 704));
	hang2 PlaySound("spark");
	wait 0.3;
	for (i = 0; i < 130; i += 30)
	{
		PlayFX(level.effektek["gaztuz"], (koord, -5689 - i, 712), (0, -90, 0), (270, 0, 0));
		PlayFX(level.effektek["gaztuz"], (koord, -6217 + i, 712), (0, 90, 0), (270, 0, 0));
	}
	PlayFX(level.effektek["vegtelen_szikra"], (koord, -5698, 704));
	PlayFX(level.effektek["vegtelen_szikra"], (koord, -6210, 704));
}


//Nyolcadik csapda: buggos híd
Csapda8()
{
	vel1 = RandomIntRange(0, 4);
	vel2 = KulonbozoRandom(0, 4, vel1);
	
    level.triggerek["csapda8"] waittill("trigger", kivalto);
	level.triggerek["csapda8"] Delete();
	PlayFX(level.effektek["aktivcsapda"], level.originek["csapda8"].origin);
	level.modelek["csapda8"] Delete();
	
	level.brushok["csapda8"][vel1] Hide();
	level.brushok["csapda8"][vel2] Hide();
	for (i = 0; i < level.brushok["csapda8"].size; i++)
	{
		if (i != vel1 && i != vel2) level.brushok["csapda8"][i] NotSolid();
	}
}



//Elsõ nehezítés: mozgó platformok
Nehezites1()
{
	thread OdaVissza(level.brushok["nehezites1_bal"], "X", -280, 3);
	wait (RandomIntRange(0, 11) * 0.2);
	thread OdaVissza(level.brushok["nehezites1_jobb"], "X", 280, 3);
	wait (RandomIntRange(0, 11) * 0.2);
	thread OdaVissza(level.brushok["nehezites1_lefel"][0], "Y", -224, 3);
	wait (RandomIntRange(0, 11) * 0.2);
	thread OdaVissza(level.brushok["nehezites1_lefel"][1], "Y", -224, 3);
	wait (RandomIntRange(0, 11) * 0.2);
	thread OdaVissza(level.brushok["nehezites1_lefel"][2], "Y", -224, 3);
	wait (RandomIntRange(0, 11) * 0.2);
	thread OdaVissza(level.brushok["nehezites1_lefel"][3], "Y", -224, 3);
}


Nehezites2()
{
	vel1_1 = RandomIntRange(0, 4);
	vel1_2 = KulonbozoRandom(0, 4, vel1_1);
	vel2_1 = RandomIntRange(0, 4);
	vel2_2 = KulonbozoRandom(0, 4, vel2_1);
	vel3_1 = RandomIntRange(0, 4);
	vel3_2 = KulonbozoRandom(0, 4, vel3_1);
	level.brushok["nehezites2_1"][vel1_1] Solid();
	level.brushok["nehezites2_1"][vel1_2] Solid();
	level.brushok["nehezites2_2"][vel2_1] Solid();
	level.brushok["nehezites2_2"][vel2_2] Solid();
	level.brushok["nehezites2_3"][vel3_1] Solid();
	level.brushok["nehezites2_3"][vel3_2] Solid();
}