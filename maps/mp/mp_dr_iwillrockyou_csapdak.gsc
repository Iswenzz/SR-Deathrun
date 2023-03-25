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
}


CsapdaEffekt(nev)
{
	level.modelek[nev] Hide();
	PlayFX(level.effektek["ver1"], level.modelek[nev] GetOrigin());
	wait 0.25;
	if (nev == "csapda6") PlayFX(level.effektek["ver2"], level.modelek[nev] GetOrigin() + (0, 0, 8));
	else PlayFX(level.effektek["ver2"], level.modelek[nev] GetOrigin() - (0, 0, 6));
	level.modelek[nev] Delete();
}

CsapdaFigyelmeztetes(nev)
{
	piros = "jelzes_" + nev + "_piros";
	kek = "jelzes_" + nev + "_kek";
	orig = level.brushok[kek] GetOrigin();
	if (nev == "csapda1") orig += (0, 6, 0);
	else if (nev == "csapda2" || nev == "csapda3" || nev == "csapda4" || nev == "csapda5") orig += (6, 0, 0);
	else if (nev == "csapda6" || nev == "csapda7" || nev == "csapda8") orig += (-6, 0, 0);
	
	level.brushok[kek] Delete();
	level.brushok[piros] Show();
	PlayFX(level.effektek["csapda"], orig);
}


Csapda1()
{
	for (i = 0; i < level.brushok["csapda1_oszlop"].size; i++)
	{
		thread Csapda1_Seged2(level.triggerek["csapda1_oszlop"][i], level.brushok["csapda1_oszlop"][i]);
		wait 0.1;
	}
	
	thread Csapda1_Szuro();
	
	level.triggerek["csapda1"] waittill("trigger", kivalto);
	CsapdaEffekt("csapda1");
	CsapdaFigyelmeztetes("csapda1");
	
	for (i = 0; i < level.brushok["csapda1_emel"].size; i++)
	{
		random_wait = RandomIntRange(0, 2);
		random_wait_mennyi = RandomFloatRange(0.0, 0.2);
		random_irany = RandomIntRange(0, 2);
		
		if (random_irany == 0) level.brushok["csapda1_emel"][i] MoveZ(512, 1.5);
		else if (random_irany == 1) level.brushok["csapda1_emel"][i] MoveZ(-512, 1.5);
		
		level.brushok["csapda1_emel"][i] thread Csapda1_Seged1();
		level.brushok["csapda1_emel"][i] thread TorlesIdoUtan(4);
		
		if (random_wait == 0) wait random_wait_mennyi;
	}
}
Csapda1_Seged1()
{
	random_forgas_irany = RandomIntRange(0, 2);
	random_forgas_szog = RandomIntRange(1, 46);
	random_forgas_ido = RandomFloatRange(0.1, 2.0);
	
	wait 1;
	
	if (random_forgas_irany == 0) self RotateRoll(random_forgas_szog, random_forgas_ido);
	else if (random_forgas_irany == 1) self RotatePitch(random_forgas_szog, random_forgas_ido);
}
Csapda1_Seged2(trig, oszlop)
{
	while (true)
	{
		trig waittill("trigger", kivalto);
		
		if (!IsDefined(kivalto.oszlop)) kivalto.oszlop = true;
		
		orig = Spawn("script_origin", kivalto GetOrigin());
		kivalto LinkTo(orig);
		orig MoveZ(1030, 6, 2, 2);
		oszlop MoveZ(1024, 6, 2, 2);
		orig waittill("movedone");
		kivalto UnLink();
		orig Delete();
		wait 3;
		oszlop MoveZ(-1024, 1);
		oszlop waittill("movedone");
	}
}
Csapda1_Szuro()
{
	while (true)
	{
		level.triggerek["csapda1_szuro"] waittill("trigger", kivalto);
		
		if (!IsDefined(kivalto.oszlop)) kivalto Suicide();
	}
}


Csapda2()
{
	veltomb = KulonbozoRandomTomb(0, 5, 3);
	waitrnd1 = RandomFloatRange(0.1, 1.5);
	waitrnd2 = RandomFloatRange(0.1, 1.5);
	
	level.triggerek["csapda2"] waittill("trigger", kivalto);
	CsapdaEffekt("csapda2");
	CsapdaFigyelmeztetes("csapda2");
	
	level.brushok["csapda2"][veltomb[0]] MoveX(-512, 3, 1, 1);
	wait waitrnd1;
	level.brushok["csapda2"][veltomb[1]] MoveX(512, 3, 1, 1);
	wait waitrnd2;
	level.brushok["csapda2"][veltomb[2]] MoveX(-512, 3, 1, 1);
	level.brushok["csapda2"][veltomb[2]] waittill("movedone");
	
	thread OdaVissza(level.brushok["csapda2"][veltomb[0]], "X", 1024, 6, "mindorokke", 2, 2);
	wait waitrnd1;
	thread OdaVissza(level.brushok["csapda2"][veltomb[1]], "X", -1024, 6, "mindorokke", 2, 2);
	wait waitrnd2;
	thread OdaVissza(level.brushok["csapda2"][veltomb[2]], "X", 1024, 6, "mindorokke", 2, 2);
}


Csapda3()
{
	rnd1 = RandomIntRange(0, 4);
	rnd2 = KulonbozoRandom(0, 4, rnd1);
	
	level.triggerek["csapda3"] waittill("trigger", kivalto);
	CsapdaEffekt("csapda3");
	CsapdaFigyelmeztetes("csapda3");
	
	level.brushok["csapda3"][rnd1] MoveZ(393, 1);
	level.brushok["csapda3"][rnd2] MoveZ(393, 1);
	wait 0.5;
	thread Csapda3_Seged(level.triggerek["csapda3_halal"][rnd1]);
	thread Csapda3_Seged(level.triggerek["csapda3_halal"][rnd2]);
	wait 5;
	level.brushok["csapda3"][rnd1] MoveZ(-250, 4);
	level.brushok["csapda3"][rnd2] MoveZ(-250, 4);
	wait 2;
	level notify("csapda2_off");
}
Csapda3_Seged(trig)
{
	level endon("csapda2_off");
	
	while (true)
	{
		trig waittill("trigger", kivalto);
		kivalto Suicide();
	}
}


Csapda4()
{
	num = RandomIntRange(0, 2);
	rnd = "csapda4_" + num;
	
	level.triggerek["csapda4"] waittill("trigger", kivalto);
	CsapdaEffekt("csapda4");
	CsapdaFigyelmeztetes("csapda4");
	
	for (i = 0; i < level.brushok[rnd].size; i++)
	{
		if (num == 0) level.brushok[rnd][i] MoveX(248, 2);
		else level.brushok[rnd][i] MoveX(-248, 2);
	}
}


Csapda5()
{
	num = RandomIntRange(0, 2);
	rnd = "csapda5_" + num;
	
	level.triggerek["csapda5"] waittill("trigger", kivalto);
	CsapdaEffekt("csapda5");
	CsapdaFigyelmeztetes("csapda5");
	
	level.brushok[rnd] Delete();
}


Csapda6()
{
	for (i = 0; i < level.brushok["csapda6_platform"].size; i++)
	{
		level.brushok["csapda6_platform"][i] LinkTo(level.brushok["csapda6_ladder"][i]);
	}
	
	level.triggerek["csapda6"] waittill("trigger", kivalto);
	CsapdaEffekt("csapda6");
	CsapdaFigyelmeztetes("csapda6");
	
	thread OdaVissza(level.brushok["csapda6_ladder"][0], "X", 400, 5, "mindorokke");
	thread OdaVissza(level.brushok["csapda6_ladder"][1], "X", -500, 5, "mindorokke");
	thread OdaVissza(level.brushok["csapda6_ladder"][3], "X", -475, 5, "mindorokke");
	level.brushok["csapda6_ladder"][2] MoveX(-208, 2.5);
	level.brushok["csapda6_ladder"][4] MoveX(104, 2.5);
	level.brushok["csapda6_ladder"][4] waittill("movedone");
	thread OdaVissza(level.brushok["csapda6_ladder"][2], "X", 416, 5, "mindorokke");
	thread OdaVissza(level.brushok["csapda6_ladder"][4], "X", -432, 5, "mindorokke");
}


Csapda7()
{
	level.triggerek["csapda7"] waittill("trigger", kivalto);
	CsapdaEffekt("csapda7");
	CsapdaFigyelmeztetes("csapda7");
	
	
	for (i = 0; i < level.brushok["csapda7_korok"].size; i++)
	{
		irany = undefined;
		if (RandomIntRange(0, 2) == 0) irany = "right";
		else irany = "left";
		level.brushok["csapda7_korok"][i] thread Forgatas("Z", irany, RandomFloatRange(2.0, 3.5), "mindorokke");
	}
	for (i = 0; i < level.brushok["csapda7_forgok"].size; i++)
	{
		irany = undefined;
		if (RandomIntRange(0, 2) == 0) irany = "right";
		else irany = "left";
		level.brushok["csapda7_forgok"][i] thread Forgatas("Z", irany, RandomFloatRange(4.0, 6.0), "mindorokke");
	}
	for (i = 0; i < level.brushok["csapda7_negyzetek"].size; i++)
	{
		thread OdaVissza(level.brushok["csapda7_negyzetek"][i], "Z", RandomIntRange(80, 110), RandomFloatRange(1.0, 2.0), "mindorokke", 0.4, 0.4);
	}
	level.brushok["csapda7_mozog"] MoveX(-236, 2);
	level.brushok["csapda7_mozog"] waittill("movedone");
	thread OdaVissza(level.brushok["csapda7_mozog"], "X", 432, 4, "mindorokke", 1, 1);
}


Csapda8()
{
	num = RandomIntRange(0, 3);
	rnd = "csapda8_" + num;
	
	thread maps\mp\_drown::init(level.triggerek["csapda8_viz"], level.triggerek["csapda8_felszin"]);
	
	level.triggerek["csapda8"] waittill("trigger", kivalto);
	CsapdaEffekt("csapda8");
	CsapdaFigyelmeztetes("csapda8");
	
	level.brushok[rnd] MoveY(80, 2, 0.5, 0.5);
	level.brushok[rnd] waittill("movedone");
	level.brushok[rnd] MoveZ(8, 2, 0.5, 0.5);
}


Nehezites1()
{
	for (i = 0; i < level.brushok["nehezites1_forog"].size; i++)
	{
		level.brushok["nehezites1_forog"][i] LinkTo(level.brushok["nehezites1_forog_fo"]);
	}
	level.brushok["nehezites1_forog_fo"] thread Forgatas("Z", "left", 5, "mindorokke");
	
	for (i = 0; i < level.brushok["nehezites1"].size; i++)
	{
		thread Nehezites1_Seged(level.brushok["nehezites1"][i]);
		wait 2;
	}
}
Nehezites1_Seged(brush)
{
	orig1 = (0, -6784, 788);
	orig2 = (1024, -6784, 788);
	orig3 = (1024, -5760, 788);
	orig4 = (0, -5760, 788);
	
	brush MoveTo(orig4, 4);
	brush waittill("movedone");
	
	while (true)
	{
		brush MoveTo(orig1, 8);
		brush waittill("movedone");
		
		brush MoveTo(orig2, 8);
		brush waittill("movedone");
		
		brush MoveTo(orig3, 8);
		brush waittill("movedone");
		
		brush MoveTo(orig4, 8);
		brush waittill("movedone");
	}
}