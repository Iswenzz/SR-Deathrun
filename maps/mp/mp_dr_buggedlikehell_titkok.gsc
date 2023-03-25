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


TitkokInditasa()
{
	thread Titok1();
	thread Titok2();
	thread Titok3();
}


//Az elsõ rejtett részért felel (fegyverek)
Titok1()
{
	thread Lebegteto(level.modelek["titok1_m14"], 20, "jobb");
	wait 0.2;
	thread Lebegteto(level.modelek["titok1_skorpion"], 20, "bal");
	wait 1;
	thread Lebegteto(level.modelek["titok1_ak47"], 20, "jobb");
	wait 0.3;
	thread Lebegteto(level.modelek["titok1_r700"], 20, "bal");
	
	level.triggerek["titok1_nyito"] waittill("trigger", kivalto1);
	IPrintLnBold("^3" + kivalto1.name + level.stringek["titok1_1"]);
	while (true)
	{
		level.triggerek["titok1_ajto"] waittill("trigger", kivalto2);
		if (kivalto1 == kivalto2) break;
	}
	IPrintLnBold("^3" + kivalto2.name + level.stringek["titok1_2"]);
	thread TobbTriggerFigyeles(level.triggerek["titok1_ak47"], "fegyver_kivalasztva", "ak47");
	thread TobbTriggerFigyeles(level.triggerek["titok1_r700"], "fegyver_kivalasztva", "r700");
	thread TobbTriggerFigyeles(level.triggerek["titok1_m14"], "fegyver_kivalasztva", "m14");
	thread TobbTriggerFigyeles(level.triggerek["titok1_scorpion"], "fegyver_kivalasztva", "skorpion");
	level.brushok["titok1_letra"] NotSolid();
	level.brushok["titok1"] NotSolid();
	wait 1;
	level.brushok["titok1_letra"] Solid();
	level.brushok["titok1"] Solid();
	level waittill("fegyver_kivalasztva", melyik, kivalto);
	switch (melyik)
	{
		case "ak47":
			IPrintLnBold("^3" + kivalto.name + level.stringek["titok1_fegyver1"]);
			kivalto GiveWeapon("ak47_mp");
			kivalto GiveStartAmmo("ak47_mp");
			wait 0.5;
			kivalto SetOrigin(level.originek["titok1"].origin);
			wait 0.5;
			kivalto SwitchToWeapon("ak47_mp");
		break;
		case "r700":
			IPrintLnBold("^3" + kivalto.name + level.stringek["titok1_fegyver2"]);
			kivalto GiveWeapon("remington700_mp");
			kivalto GiveStartAmmo("remington700_mp");
			wait 0.5;
			kivalto SetOrigin(level.originek["titok1"].origin);
			wait 0.5;
			kivalto SwitchToWeapon("remington700_mp");
		break;
		case "m14":
			IPrintLnBold("^3" + kivalto.name + level.stringek["titok1_fegyver3"]);
			kivalto GiveWeapon("m14_mp");
			kivalto GiveStartAmmo("m14_mp");
			wait 0.5;
			kivalto SetOrigin(level.originek["titok1"].origin);
			wait 0.5;
			kivalto SwitchToWeapon("m14_mp");
		break;
		case "skorpion":
			IPrintLnBold("^3" + kivalto.name + level.stringek["titok1_fegyver4"]);
			kivalto GiveWeapon("skorpion_mp");
			kivalto GiveStartAmmo("skorpion_mp");
			wait 0.5;
			kivalto SetOrigin(level.originek["titok1"].origin);
			wait 0.5;
			kivalto SwitchToWeapon("skorpion_mp");
		break;
	}
}


//A második rejtett részért felel (zeneválasztás)
Titok2()
{	
	level.triggerek["titok2_hasznal"] waittill("trigger", kivalto);
	IPrintLnBold("^9" + kivalto.name + level.stringek["titok2_mindenki"]);
	kivalto LinkTo(level.originek["titok2"]);
	level.originek["titok2"] MoveY(-100, 1.5);
	level.originek["titok2"] waittill("movedone");
	level.originek["titok2"] MoveZ(160, 1.5);
	level.originek["titok2"] waittill("movedone");
	kivalto UnLink();
	kivalto IPrintLnBold(level.stringek["titok2_kivalto"]);
	thread TobbTriggerFigyeles(level.triggerek["titok2_zenealap"], "zene_kivalasztva", "0");
	thread TobbTriggerFigyeles(level.triggerek["titok2_zene1"], "zene_kivalasztva", "1");
	thread TobbTriggerFigyeles(level.triggerek["titok2_zene2"], "zene_kivalasztva", "2");
	thread TobbTriggerFigyeles(level.triggerek["titok2_zene3"], "zene_kivalasztva", "3");
	thread TobbTriggerFigyeles(level.triggerek["titok2_zene4"], "zene_kivalasztva", "4");
	level waittill("zene_kivalasztva", melyik, kivalto);
	switch (melyik)
	{
		case "0":
			IPrintLnBold("^2" + kivalto.name + level.stringek["titok2_zenealap"]);
		break;
		case "1":
			IPrintLnBold("^2" + kivalto.name + level.stringek["titok2_zene1"]);
			AmbientStop(1);
			wait 2;
			AmbientPlay("hangover");
		break;
		case "2":
			IPrintLnBold("^2" + kivalto.name + level.stringek["titok2_zene2"]);
			AmbientStop(1);
			wait 2;
			AmbientPlay("gangnamstyle");
		break;
		case "3":
			IPrintLnBold("^2" + kivalto.name + level.stringek["titok2_zene3"]);
			AmbientStop(1);
			wait 2;
			AmbientPlay("beentohell");
		break;
		case "4":
			IPrintLnBold("^2" + kivalto.name + level.stringek["titok2_zene4"]);
			AmbientStop(1);
			wait 2;
			AmbientPlay("golddust");
		break;
	}
	wait 1;
	kivalto SetOrigin(level.originek["leeses_5"].origin);
}


//A harmadik rejtett részért felel (ajándék)
Titok3()
{
	kivaltok = [];
	
	level.triggerek["titok3_letra"] waittill("trigger", kivalto);
	kivaltok[0] = kivalto;
	level.brushok["titok3_ajto"] NotSolid();
	while (true)
	{
		level.triggerek["titok3_csirke"] waittill("trigger", kivalto);
		kivaltok[1] = kivalto;
		if (kivaltok[0] == kivaltok[1])
		{
			level.modelek["titok3"] PlaySound("chicken");
			PlayFX(level.effektek["ver1"], (-1196, -10016, 210));
			wait 0.5;
			PlayFX(level.effektek["ver2"], (-1196, -10016, 200));
			level.modelek["titok3"] Delete();
			break;
		}
	}
	while (true)
	{
		level.triggerek["titok3_fal"] waittill("trigger", kivalto);
		kivaltok[2] = kivalto;
		if (kivaltok[1] == kivaltok[2]) break;
	}
	
	thread Titok3_Fal();
	thread Titok3_Ellenor(kivaltok[2]);
	
	level waittill("titok3_OK");
	
	titok3 = newHudElem();
	titok3.font = "objective";
	titok3.fontScale = 3;
	titok3 SetText(kivaltok[2].name + level.stringek["titok3_nyitva"]);
	titok3.alignX = "center";
	titok3.alignY = "top";
	titok3.horzAlign = "center";
	titok3.vertAlign = "top";
	titok3.x = 0;
	titok3.y = 50;
	titok3.sort = -1;
	titok3.alpha = 1;
	titok3.glowColor = (0.8, 0, 0.8);
	titok3.glowAlpha = 1;
	titok3.foreground = true;
	
	kivaltok[2] IPrintLnBold(level.stringek["titok3_nyito_1"]);
	kivaltok[2] SetMoveSpeedScale(1.5);
	kivaltok[2].maxhealth = 300;
	kivaltok[2].health = 300;
	kivaltok[2] IPrintLnBold(level.stringek["titok3_nyito_2"]);
	wait 0.5;
	kivaltok[2] GiveWeapon("defaultweapon_mp");
    kivaltok[2] GiveStartAmmo("defaultweapon_mp");
    kivaltok[2] SwitchToWeapon("defaultweapon_mp");
	kivaltok[2] thread braxi\_mod::giveLife();
	kivaltok[2] thread braxi\_rank::giveRankXp("bonus", 250);
	kivaltok[2] IPrintLnBold(level.stringek["titok3_nyito_3"]);
	wait 2;
	kivaltok[2] SetOrigin(level.originek["titok3"].origin);
	wait 2;
	titok3 Destroy();
}
Titok3_Fal()
{
	level.brushok["titok3_bejarat"] NotSolid();
	wait 5;
	level.brushok["titok3_bejarat"] Solid();
}
Titok3_Ellenor(titok_nyito)
{
	notified = false;
	
	while (true)
	{
		level.triggerek["titok3_ellenor"] waittill("trigger", kivalto);
		if (kivalto != titok_nyito)
		{
			kivalto IPrintLnBold(level.stringek["titok3_rossz_1"]);
			kivalto IPrintLnBold(level.stringek["titok3_rossz_2"]);
			spawn = GetEntArray("mp_jumper_spawn", "classname");
			kivalto SetOrigin(spawn[37].origin);
			kivalto.angles = spawn[37].angles;
		}
		else if (!notified)
		{
			notified = true;
			level notify("titok3_OK");
		}
	}
}