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


EndInditasa()
{
	thread ElsoEnd();
	thread Old();
	thread Ninja();
	thread Aim();
	thread Heavy();
}


//Az endszob�ba val� bejut�s�rt �s az endkiv�laszt��rt felel
ElsoEnd()
{
	level.triggerek["elsoend"] waittill("trigger", kivalto);
	kivalto thread Elso_HalalFigyelo();
	kivalto thread Elso_KilepesFigyelo();
	level.elsoEndelo = kivalto;
	IPrintLnBold(kivalto.name + level.stringek["map_endelve1"]);
	IPrintLnBold(level.stringek["map_endelve2"]);
	level.brushok["endelzaro_1"] MoveZ(-183, 0.1);
	level.brushok["endelzaro_2"] MoveZ(-183, 0.1);
	level.brushok["endelzaro_3"] MoveZ(-183, 0.1);
	level.triggerek["csapoajto"] waittill("trigger", masikkivalto);
	level.triggerek["csapoajto"] Delete();
	level.brushok["csapoajto"] NotSolid();
	wait 3;
	level.brushok["csapoajto"] Solid();
	level.brushok["endelzaro_1"] Delete();
	level.brushok["endelzaro_2"] Delete();
	level.brushok["endelzaro_3"] Delete();
}

Elso_HalalFigyelo()
{
	self waittill("death");
	if (level.melyikEnd == "megnincs")	level.brushok["multiend"] MoveX(330, 3);
}
Elso_KilepesFigyelo()
{
	while (true)
	{
		level waittill("disconnected", jatekos);
		if (jatekos == self) break;
	}
	if (level.melyikEnd == "megnincs")	level.brushok["multiend"] MoveX(330, 3);
}


//Az "OLD" endj�t�k
Old()
{
	level.triggerek["end_old"] waittill("trigger", kivalto);
	level notify("akti_teleport");
	level.melyikEnd = "old";
	level.activ.killingspree = 0;
	level.activ SetMoveSpeedScale(GetDVARFloat("dr_activators_speed"));
	thread KillingSpreeHang();
	level.brushok["heavy_ajtozar"] MoveZ(109, 1);
	level.brushok["ninja_ajtozar"] MoveZ(109, 1);
	level.brushok["aim_ajtozar"] MoveZ(109, 1);
	level.triggerek["end_ninja"] Delete();
	level.triggerek["end_aim"] Delete();
	level.triggerek["end_heavy"] Delete();
	fagyaszto = Spawn("script_origin", level.activ.origin);
	fxhely = level.activ.origin;
	level.activ LinkTo(fagyaszto);
	maps\mp\mp_dr_buggedlikehell::AktivatorTeleportEffekt(fxhely, false);
	level.brushok["multiend"] MoveX(330, 3);
	wait 2.5;
	level.activ PlayLocalSound("teleport");
	wait 2.5;
	level.activ UnLink();
	level.activ SetOrigin((3736, -7005, 280));
	level.activ.angles = (0, 90, 0);

	level.brushok["old_elzaro"] MoveZ(-525, 3);
	Earthquake(0.9, 3.5, (3768, -6472, 424), 600);
}


//A "NINJA" endj�t�k
Ninja()
{
	thread Ninja_Teleportalo();
	while (true)
	{
		level.triggerek["end_ninja"] waittill("trigger", kivalto);
		if (level.elsoEndMegvolt == false)
		{
			level.elsoEndMegvolt = true;
			level.melyikEnd = "ninja";
			level.activ.killingspree = 0;
			thread KillingSpreeHang();

			level.brushok["heavy_ajtozar"] MoveZ(109, 1);
			level.brushok["old_ajtozar"] MoveZ(109, 1);
			level.brushok["aim_ajtozar"] MoveZ(109, 1);
			level.triggerek["end_old"] Delete();
			level.triggerek["end_aim"] Delete();
			level.triggerek["end_heavy"] Delete();
			level.brushok["multiend"] MoveX(330, 3);

			level.activ TakeAllWeapons();
			level.activ GiveWeapon("colt45_mp");
			wait 0.1;
			level.activ SwitchToWeapon("colt45_mp");
			wait 0.2;
			level.activ SetWeaponAmmoStock(level.activ GetCurrentWeapon(), 0);
			level.activ SetWeaponAmmoClip(level.activ GetCurrentWeapon(), 0);
			level.activ thread ToltenyTorlo();

			level notify("akti_teleport");
			wait 0.1;
			level.activ SetOrigin((3824, -8640, -632));
		}
		kivalto thread Ninja_HalalFigyelo();
		kivalto thread Ninja_KilepesFigyelo();
		kivalto SetMoveSpeedScale(GetDVARFloat("dr_jumpers_speed"));
		level.activ SetMoveSpeedScale(GetDVARFloat("dr_activators_speed"));

		kivalto TakeAllWeapons();
		kivalto GiveWeapon("colt45_mp");
		wait 0.1;
		kivalto SwitchToWeapon("colt45_mp");
		wait 0.2;
		kivalto SetWeaponAmmoStock(kivalto GetCurrentWeapon(), 0);
		kivalto SetWeaponAmmoClip(kivalto GetCurrentWeapon(), 0);
		kivalto thread ToltenyTorlo();
		kivalto SetOrigin((3152, -8640, -632));

		level waittill("ninja_kovetkezo");
	}
}
Ninja_Teleportalo()
{
	while (true)
	{
		level.triggerek["ninja_teleport"] waittill("trigger", kivalto);
		wait 1.5;
		if (kivalto != level.activ) kivalto SetOrigin((3152, -8640, -632));
		else kivalto SetOrigin((3824, -8640, -632));
	}
}
Ninja_HalalFigyelo()
{
	self waittill("death");
	level notify("ninja_kovetkezo");
}
Ninja_KilepesFigyelo()
{
	while (true)
	{
		level waittill("disconnected", jatekos);
		if (jatekos == self) break;
	}
	level notify("ninja_kovetkezo");
}


//Az "AIM" endj�t�k
Aim()
{
	while (true)
	{
		level.triggerek["end_aim"] waittill("trigger", kivalto);
		if (level.elsoEndMegvolt == false)
		{
			level.elsoEndMegvolt = true;
			level.melyikEnd = "aim";

			level.brushok["heavy_ajtozar"] MoveZ(109, 1);
			level.brushok["old_ajtozar"] MoveZ(109, 1);
			level.brushok["ninja_ajtozar"] MoveZ(109, 1);
			level.triggerek["end_old"] Delete();
			level.triggerek["end_ninja"] Delete();
			level.triggerek["end_heavy"] Delete();
			level.brushok["multiend"] MoveX(330, 3);
			level.activ.killingspree = 0;
			thread KillingSpreeHang();

			level notify("akti_teleport");
			wait 0.1;
			level.activ SetOrigin((2336, -7388, -600));

			thread Aim_JumperReset();
		}
		kivalto thread Aim_HalalFigyelo();
		kivalto thread Aim_KilepesFigyelo();
		kivalto SetMoveSpeedScale(GetDVARFloat("dr_jumpers_speed"));
		level.activ SetMoveSpeedScale(GetDVARFloat("dr_activators_speed"));

		level.activ TakeAllWeapons();
		level.activ GiveWeapon("colt45_mp");
		wait 0.1;
		level.activ SwitchToWeapon("colt45_mp");
		wait 0.2;
		level.activ SetWeaponAmmoStock(level.activ GetCurrentWeapon(), 80);
		level.activ SetWeaponAmmoClip(level.activ GetCurrentWeapon(), 80);

		kivalto TakeAllWeapons();
		kivalto GiveWeapon("colt45_mp");
		wait 0.1;
		kivalto SwitchToWeapon("colt45_mp");
		wait 0.2;
		kivalto SetWeaponAmmoStock(kivalto GetCurrentWeapon(), 80);
		kivalto SetWeaponAmmoClip(kivalto GetCurrentWeapon(), 80);

		kivalto SetOrigin((2336, -7708, -600));

		kivalto thread Aim_Jumper();
		level.activ thread Aim_Akti();

		level waittill("aim_vege", melyik);
		if (melyik == "akti") kivalto thread Aim_JumperHalal();
		else if (melyik == "jumper") level.activ thread Aim_AktiHalal(kivalto);

		level waittill("aim_kovetkezo");
	}
}
Aim_Jumper()
{
	level endon("aim_vege");

	level.brushok["aim_jumper"][2] MoveZ(86, 0.5);
	level.brushok["aim_jumper"][2] waittill("movedone");
	level.triggerek["aim_jumper"][2] waittill("trigger", kivalto1);
	level.brushok["aim_jumper"][2] Hide();
	level.brushok["aim_jumper"][2] MoveZ(-86, 0.1);
	level.brushok["aim_jumper"][2] waittill("movedone");
	level.brushok["aim_jumper"][2] Show();

	level.brushok["aim_jumper"][1] MoveZ(-86, 0.5);
	level.brushok["aim_jumper"][1] waittill("movedone");
	level.triggerek["aim_jumper"][1] waittill("trigger", kivalto1);
	level.brushok["aim_jumper"][1] Hide();
	level.brushok["aim_jumper"][1] MoveZ(86, 0.1);
	level.brushok["aim_jumper"][1] waittill("movedone");
	level.brushok["aim_jumper"][1] Show();

	level.brushok["aim_jumper"][3] MoveZ(-86, 0.5);
	level.brushok["aim_jumper"][3] waittill("movedone");
	level.triggerek["aim_jumper"][3] waittill("trigger", kivalto1);
	level.brushok["aim_jumper"][3] Hide();
	level.brushok["aim_jumper"][3] MoveZ(86, 0.1);
	level.brushok["aim_jumper"][3] waittill("movedone");
	level.brushok["aim_jumper"][3] Show();

	level.brushok["aim_jumper"][0] MoveZ(86, 0.5);
	level.brushok["aim_jumper"][0] waittill("movedone");
	level.triggerek["aim_jumper"][0] waittill("trigger", kivalto1);
	level.brushok["aim_jumper"][0] Hide();
	level.brushok["aim_jumper"][0] MoveZ(-86, 0.1);
	level.brushok["aim_jumper"][0] waittill("movedone");
	level.brushok["aim_jumper"][0] Show();

	level.brushok["aim_jumper"][6] MoveZ(-86, 0.5);
	level.brushok["aim_jumper"][6] waittill("movedone");
	level.triggerek["aim_jumper"][6] waittill("trigger", kivalto1);
	level.brushok["aim_jumper"][6] Hide();
	level.brushok["aim_jumper"][6] MoveZ(86, 0.1);
	level.brushok["aim_jumper"][6] waittill("movedone");
	level.brushok["aim_jumper"][6] Show();

	level.brushok["aim_jumper"][4] MoveZ(86, 0.5);
	level.brushok["aim_jumper"][4] waittill("movedone");
	level.triggerek["aim_jumper"][4] waittill("trigger", kivalto1);
	level.brushok["aim_jumper"][4] Hide();
	level.brushok["aim_jumper"][4] MoveZ(-86, 0.1);
	level.brushok["aim_jumper"][4] waittill("movedone");
	level.brushok["aim_jumper"][4] Show();

	level.brushok["aim_jumper"][5] MoveZ(86, 0.5);
	level.brushok["aim_jumper"][5] waittill("movedone");
	level.triggerek["aim_jumper"][5] waittill("trigger", kivalto1);
	level.brushok["aim_jumper"][5] Hide();
	level.brushok["aim_jumper"][5] MoveZ(-86, 0.1);
	level.brushok["aim_jumper"][5] waittill("movedone");
	level.brushok["aim_jumper"][5] Show();

	level notify("aim_vege", "jumper");
}
Aim_Akti()
{
	level endon("aim_vege");

	level.brushok["aim_akti"][2] MoveZ(-86, 0.5);
	level.brushok["aim_akti"][2] waittill("movedone");
	level.triggerek["aim_akti"][2] waittill("trigger", kivalto1);
	level.brushok["aim_akti"][2] Hide();
	level.brushok["aim_akti"][2] MoveZ(86, 0.1);
	level.brushok["aim_akti"][2] waittill("movedone");
	level.brushok["aim_akti"][2] Show();

	level.brushok["aim_akti"][1] MoveZ(-86, 0.5);
	level.brushok["aim_akti"][1] waittill("movedone");
	level.triggerek["aim_akti"][1] waittill("trigger", kivalto1);
	level.brushok["aim_akti"][1] Hide();
	level.brushok["aim_akti"][1] MoveZ(86, 0.1);
	level.brushok["aim_akti"][1] waittill("movedone");
	level.brushok["aim_akti"][1] Show();

	level.brushok["aim_akti"][3] MoveZ(86, 0.5);
	level.brushok["aim_akti"][3] waittill("movedone");
	level.triggerek["aim_akti"][3] waittill("trigger", kivalto1);
	level.brushok["aim_akti"][3] Hide();
	level.brushok["aim_akti"][3] MoveZ(-86, 0.1);
	level.brushok["aim_akti"][3] waittill("movedone");
	level.brushok["aim_akti"][3] Show();

	level.brushok["aim_akti"][0] MoveZ(86, 0.5);
	level.brushok["aim_akti"][0] waittill("movedone");
	level.triggerek["aim_akti"][0] waittill("trigger", kivalto1);
	level.brushok["aim_akti"][0] Hide();
	level.brushok["aim_akti"][0] MoveZ(-86, 0.1);
	level.brushok["aim_akti"][0] waittill("movedone");
	level.brushok["aim_akti"][0] Show();

	level.brushok["aim_akti"][6] MoveZ(-86, 0.5);
	level.brushok["aim_akti"][6] waittill("movedone");
	level.triggerek["aim_akti"][6] waittill("trigger", kivalto1);
	level.brushok["aim_akti"][6] Hide();
	level.brushok["aim_akti"][6] MoveZ(86, 0.1);
	level.brushok["aim_akti"][6] waittill("movedone");
	level.brushok["aim_akti"][6] Show();

	level.brushok["aim_akti"][4] MoveZ(86, 0.5);
	level.brushok["aim_akti"][4] waittill("movedone");
	level.triggerek["aim_akti"][4] waittill("trigger", kivalto1);
	level.brushok["aim_akti"][4] Hide();
	level.brushok["aim_akti"][4] MoveZ(-86, 0.1);
	level.brushok["aim_akti"][4] waittill("movedone");
	level.brushok["aim_akti"][4] Show();

	level.brushok["aim_akti"][5] MoveZ(86, 0.5);
	level.brushok["aim_akti"][5] waittill("movedone");
	level.triggerek["aim_akti"][5] waittill("trigger", kivalto1);
	level.brushok["aim_akti"][5] Hide();
	level.brushok["aim_akti"][5] MoveZ(-86, 0.1);
	level.brushok["aim_akti"][5] waittill("movedone");
	level.brushok["aim_akti"][5] Show();

	level notify("aim_vege", "akti");
}
Aim_JumperReset()
{
	alap = [];
	alap[0] = level.brushok["aim_jumper"][0] GetOrigin();
	alap[1] = level.brushok["aim_jumper"][1] GetOrigin();
	alap[2] = level.brushok["aim_jumper"][2] GetOrigin();
	alap[3] = level.brushok["aim_jumper"][3] GetOrigin();
	alap[4] = level.brushok["aim_jumper"][4] GetOrigin();
	alap[5] = level.brushok["aim_jumper"][5] GetOrigin();
	alap[6] = level.brushok["aim_jumper"][6] GetOrigin();

	while (true)
	{
		level waittill("aim_vege", melyik);
		wait 0.5;

		if (melyik == "akti")
		{
			level.brushok["aim_jumper"][0] MoveTo(alap[0], 0.05);
			level.brushok["aim_jumper"][1] MoveTo(alap[1], 0.05);
			level.brushok["aim_jumper"][2] MoveTo(alap[2], 0.05);
			level.brushok["aim_jumper"][3] MoveTo(alap[3], 0.05);
			level.brushok["aim_jumper"][4] MoveTo(alap[4], 0.05);
			level.brushok["aim_jumper"][5] MoveTo(alap[5], 0.05);
			level.brushok["aim_jumper"][6] MoveTo(alap[6], 0.05);
			wait 0.1;
			level.brushok["aim_jumper"][0] Show();
			level.brushok["aim_jumper"][1] Show();
			level.brushok["aim_jumper"][2] Show();
			level.brushok["aim_jumper"][3] Show();
			level.brushok["aim_jumper"][4] Show();
			level.brushok["aim_jumper"][5] Show();
			level.brushok["aim_jumper"][6] Show();
		}
	}
}
Aim_JumperHalal()
{
	hang = Spawn("script_origin", (2286, -7704, -624));
	self SetOrigin((2320, -7715, -693));
	fagyaszto = Spawn("script_origin", self.origin);
	self LinkTo(fagyaszto);
	wait 1;
	level.modelek["aim_jumper"] MoveZ(-200, 2);
	wait 4;
	PlayFX(level.effektek["shotgun"], (2286, -7704, -624), AnglesToForward(0, 0, 0), AnglesToUp(0, 0, 0));
	hang PlaySound("shot");
	self FinishPlayerDamage(level.activ, level.activ, 99999, 0, "MOD_PISTOL_BULLET", "winchester1200_grip_mp", self.origin, self.angles, "head", 0);

	level notify("aim_kovetkezo");

	wait 1;
	level.modelek["aim_jumper"] MoveZ(200, 4);
}
Aim_AktiHalal(jumper)
{
	hang = Spawn("script_origin", (2286, -7384, -624));
	level.activ SetOrigin((2320, -7386, -693));
	fagyaszto = Spawn("script_origin", level.activ.origin);
	level.activ LinkTo(fagyaszto);
	wait 1;
	level.modelek["aim_akti"] MoveZ(-200, 2);
	wait 3;
	PlayFX(level.effektek["shotgun"], (2286, -7384, -624), AnglesToForward(0, 0, 0), AnglesToUp(0, 0, 0));
	hang PlaySound("shot");
	level.activ FinishPlayerDamage(jumper, jumper, 99999, 0, "MOD_PISTOL_BULLET", "winchester1200_grip_mp", level.activ.origin, level.activ.angles, "head", 0);

	wait 1;
	level.modelek["aim_akti"] MoveZ(200, 4);
}
Aim_HalalFigyelo()
{
	self waittill("death");
	level notify("aim_vege", "egyiksem");
	wait 0.5;
	level notify("aim_kovetkezo");
}
Aim_KilepesFigyelo()
{
	while (true)
	{
		level waittill("disconnected", jatekos);
		if (jatekos == self) break;
	}
	level notify("aim_vege", "egyiksem");
	wait 0.5;
	level notify("aim_kovetkezo");
}

//A "HEAVY" endj�t�k
Heavy()
{
	jumperorig = [];
	jumperorig[0] = (2560, -10036, -528);
	jumperorig[1] = (2560, -9860, -528);
	jumperorig[2] = (2560, -9684, -528);
	jumperorig[3] = (2560, -9476, -528);
	jumperorig[4] = (2560, -9300, -528);
	level.triggerek["end_heavy"] waittill("trigger", kivalto1);
	level.activ.killingspree = 0;
	thread KillingSpreeHang();
	level.melyikEnd = "heavy";
	level notify("akti_teleport");
	level.brushok["old_ajtozar"] MoveZ(109, 1);
	level.brushok["ninja_ajtozar"] MoveZ(109, 1);
	level.brushok["aim_ajtozar"] MoveZ(109, 1);
	level.triggerek["end_ninja"] Delete();
	level.triggerek["end_aim"] Delete();
	level.triggerek["end_old"] Delete();
	level.activ SetOrigin((6080, -10052, -448));
	jatekosok = GetEntArray("player", "classname");
	for (i = 0; i < jatekosok.size; i++)
	{
		jatekosok[i] TakeAllWeapons();
		jatekosok[i] GiveWeapon("knife_mp");
		vel = RandomIntRange(0, 5);
		wait 0.2;
		jatekosok[i] SwitchToWeapon("knife_mp");
		jatekosok[i] thread ToltenyTorlo("heavy_ended");
		jatekosok[i] SetMoveSpeedScale(GetDVARFloat("dr_jumpers_speed"));
		if (jatekosok[i] != level.activ) jatekosok[i] SetOrigin(jumperorig[vel]);
	}
	level.activ SetMoveSpeedScale(GetDVARFloat("dr_activators_speed"));
	thread Heavy_Korok_1();
	thread Heavy_Korok_2();
	thread Heavy_Negyzet();
	thread Heavy_Teleportalo();
	thread Lebegteto(level.modelek["heavy"], 30, "jobb");

	level.triggerek["heavy"] waittill("trigger", kivalto2);
	kivalto2 notify("heavy_ended");
	level.modelek["heavy"] Delete();
	kivalto2 GiveWeapon("rpd_acog_mp");
	kivalto2 GiveStartAmmo("rpd_acog_mp");
	wait 0.1;
	kivalto2 SwitchToWeapon("rpd_acog_mp");
}
Heavy_Korok_1()
{
	while(true)
	{
		level.brushok["heavy_kor1"] RotateYaw(360, 2.5);
		level.brushok["heavy_kor2"] RotateYaw(-360, 2.5);
		level.brushok["heavy_kor3"] RotateYaw(360, 2.5);
		wait 2.5;
	}
}
Heavy_Korok_2()
{
	while(true)
	{
		level.brushok["heavy_kor1"] MoveZ(448, 4);
		level.brushok["heavy_kor2"] MoveZ(448, 4);
		level.brushok["heavy_kor3"] MoveZ(448, 4);
		level.brushok["heavy_kor3"] waittill("movedone");
		wait 1;
		level.brushok["heavy_kor1"] MoveZ(-448, 4);
		level.brushok["heavy_kor2"] MoveZ(-448, 4);
		level.brushok["heavy_kor3"] MoveZ(-448, 4);
		level.brushok["heavy_kor3"] waittill("movedone");
		wait 1;
	}
}
Heavy_Negyzet()
{
	while (true)
	{
		level.brushok["heavy_negyzet"] MoveY(-640, 1.8);
		level.brushok["heavy_negyzet"] waittill("movedone");
		level.brushok["heavy_negyzet"] MoveY(640, 1.8);
		level.brushok["heavy_negyzet"] waittill("movedone");
	}
}
Heavy_Teleportalo()
{
	jumperorig = [];
	jumperorig[0] = (2560, -10036, -528);
	jumperorig[1] = (2560, -9860, -528);
	jumperorig[2] = (2560, -9684, -528);
	jumperorig[3] = (2560, -9476, -528);
	jumperorig[4] = (2560, -9300, -528);
	while (true)
	{
		level.triggerek["heavy_teleport"] waittill("trigger", kivalto);
		if (kivalto != level.activ)
		{
			vel = RandomIntRange(0, 5);
			kivalto SetOrigin(jumperorig[vel]);
		}
		else
		{
			kivalto SetOrigin((6080, -10052, -448));
		}
	}
}