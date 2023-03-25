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


IWillRockYou Deathrun Map Script by club27|Neo
mp_dr_iwillrockyou


	 Supported mods: Deathrun
	 Traps: 9
	 Secrets: 4
	 Difficulty: Medium
	 Included songs:
			Papa Roach - Last Resort
			AC/DC - Highway to Hell
			Metallica - For Whom the Bell Tolls
			Manowar - Die for Metal
			Queen - We Will Rock You
	 Author: Neo (club27|Neo)
	 Additional help: AoD'Rycoon (Phaedrean)
	 Closed-beta testers: Dr. Uzi, HunDonTaki, Bhuba, osko, lots of other deathrunners on club27 Deathrun Server
	 Phase: RELEASE (ready playable version, suited for public worldwide usage)
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
	thread Titok4();
}


Titok1()
{
	level.triggerek["titok1_elso"] waittill("trigger", kivalto1);
	
	IPrintLn(kivalto1.name + level.stringek["titok_kapcsolo"]);
	
	level.triggerek["titok1_masodik"] waittill("trigger", kivalto2);
	
	if (kivalto1 != kivalto2) return;
	
	IPrintLn(kivalto1.name + level.stringek["titok_loves"]);
	
	level.triggerek["titok1_harmadik"] waittill("trigger", kivalto3);
	
	if (kivalto2 != kivalto3) return;
	
	IPrintLnBold(kivalto2.name + level.stringek["titok1"]);
	level.brushok["titok1_ajto"] NotSolid();
	wait 3;
	level.brushok["titok1_ajto"] Solid();
	level.brushok["titok1_ajto2"] Delete();
}


Titok2()
{
	level.triggerek["csapda1_oszlop"][5] waittill("trigger", kivalto1);
	
	kivalto1 IPrintLn(level.stringek["titok2_elozetes_1"]);
	
	level.triggerek["titok2_plusz"] waittill("trigger", kivalto2);
	
	if (kivalto1 != kivalto2) return;
	
	kivalto2 IPrintLn(level.stringek["titok2_elozetes_2"]);

	level.triggerek["titok2"] waittill("trigger", kivalto3);
	
	if (kivalto2 != kivalto3) return;
	
	IPrintLnBold(kivalto3.name + level.stringek["titok2_1"]);
	kivalto3.maxhealth = 500;
	kivalto3.health = 500;
	wait 0.5;
	kivalto3 thread braxi\_mod::giveLife();
	wait 1;
	kivalto3 thread braxi\_mod::giveLife();
	IPrintLnBold(level.stringek["titok2_2"]);
	wait 5;
	kivalto3 Hide();
	wait 60;
	kivalto3 Show();
}


Titok3()
{
	level.triggerek["titok3_aktivalas"] waittill("trigger", kivalto1);
	
	level.triggerek["titok3_hely"] waittill("trigger", kivalto2);
	
	if (kivalto1 != kivalto2) return;
	
	thread Titok3_Ajto();
	thread TobbTriggerFigyeles(level.triggerek["titok3_old"], "titok3", "old");
	thread TobbTriggerFigyeles(level.triggerek["titok3_knife"], "titok3", "knife");
	thread TobbTriggerFigyeles(level.triggerek["titok3_sniper"], "titok3", "sniper");
	thread TobbTriggerFigyeles(level.triggerek["titok3_racing"], "titok3", "racing");
	
	level waittill("titok3", melyik, kivalto3);
	switch (melyik)
	{
		case "old":
			level.brushok["endelzaro_knife"] MoveZ(216, 2);
			level.brushok["endelzaro_sniper"] MoveZ(216, 2);
			level.brushok["endelzaro_racing"] MoveZ(216, 2);
			IPrintLnBold(kivalto3.name + level.stringek["titok3"] + " ^6Old!");
			level.titok3 = "old";
		break;
		case "knife":
			level.brushok["endelzaro_old"] MoveZ(216, 2);
			level.brushok["endelzaro_sniper"] MoveZ(216, 2);
			level.brushok["endelzaro_racing"] MoveZ(216, 2);
			IPrintLnBold(kivalto3.name + level.stringek["titok3"] + " ^6Lightning Knife!");
			level.titok3 = "knife";
		break;
		case "sniper":
			level.brushok["endelzaro_old"] MoveZ(216, 2);
			level.brushok["endelzaro_knife"] MoveZ(216, 2);
			level.brushok["endelzaro_racing"] MoveZ(216, 2);
			IPrintLnBold(kivalto3.name + level.stringek["titok3"] + " ^6Rocking Sniper!");
			level.titok3 = "sniper";
		break;
		case "racing":
			level.brushok["endelzaro_old"] MoveZ(216, 2);
			level.brushok["endelzaro_knife"] MoveZ(216, 2);
			level.brushok["endelzaro_sniper"] MoveZ(216, 2);
			IPrintLnBold(kivalto3.name + level.stringek["titok3"] + " ^6Metal Racing!");
			level.titok3 = "racing";
		break;
	}
	
	wait 2;
	
	orig = Spawn("script_origin", kivalto3 GetOrigin());
	kivalto3 LinkTo(orig);
	orig MoveZ(-304, 2, 0.75, 0.75);
	orig waittill("movedone");
	kivalto3 UnLink();
}
Titok3_Ajto()
{
	level.brushok["titok3_ajto"] NotSolid();
	wait 2;
	level.brushok["titok3_ajto"] Solid();
}

Titok4()
{	
	while (true)
	{
		level.triggerek["titok4_be"] waittill("trigger", jatekos);
		if (!IsDefined(jatekos.titok4) || jatekos.titok4 == false)
		{
			thread Titok4_Seged(jatekos);
		}
	}
}
Titok4_Seged(jatekos)
{
	orig1 = (0, -6272, 788);
	orig3 = (1024, -5760, 788);
	orig4 = (0, -5760, 788);
	
	jatekos.titok4 = true;
	orig = Spawn("script_origin", jatekos GetOrigin());
	jatekos LinkTo(orig);
	orig MoveTo(orig3, 4);
	orig waittill("movedone");
	orig MoveTo(orig4, 8);
	orig waittill("movedone");
	orig MoveTo(orig1, 4);
	jatekos UnLink();
	orig Delete();
	jatekos.titok4 = false;
}