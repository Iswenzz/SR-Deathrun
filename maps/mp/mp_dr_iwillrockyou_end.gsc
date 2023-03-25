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

EndInditasa()
{
	thread ElsoEnd();
	thread Old();
	thread LightningKnife();
	thread RockingSniper();
	thread MetalRacing();
}


ElsoEnd()
{
	level.triggerek["elsoend"] waittill("trigger", kivalto);
	kivalto FreezeControls(true);
	kivalto thread Elso_HalalFigyelo();
	kivalto thread Elso_KilepesFigyelo();
	level.elsoEndelo = kivalto;
	IPrintLnBold(kivalto.name + level.stringek["map_endelve1"]);
	IPrintLnBold(level.stringek["map_endelve2"]);
	wait 2;

	orig = Spawn("script_origin", kivalto GetOrigin());
	kivalto LinkTo(orig);
	kivalto FreezeControls(false);
	orig MoveZ(-450, 6, 2, 2);
	orig waittill("movedone");

	kivalto UnLink();
	orig Delete();
}

Elso_HalalFigyelo()
{
	self waittill("death");
	if (!IsDefined(level.melyikEnd))
	{
		level.brushok["multiend"] MoveX(540, 5, 2, 2);
		level.elsoEndelo = undefined;
	}
}
Elso_KilepesFigyelo()
{
	while (true)
	{
		level waittill("disconnected", jatekos);
		if (jatekos == self) break;
	}
	if (!IsDefined(level.melyikEnd))
	{
		level.brushok["multiend"] MoveX(540, 5, 2, 2);
		level.elsoEndelo = undefined;
	}
}


Old()
{
	level.triggerek["end_old"] waittill("trigger", kivalto);

	level.melyikEnd = "old";
	level.elsoEndMegvolt = true;
	level.triggerek["end_knife"] Delete();
	level.triggerek["end_sniper"] Delete();
	level.triggerek["end_racing"] Delete();
	if (level.titok3 != "old")
	{
		level.brushok["endelzaro_knife"] MoveZ(216, 2);
		level.brushok["endelzaro_sniper"] MoveZ(216, 2);
		level.brushok["endelzaro_racing"] MoveZ(216, 2);
	}
	level.brushok["multiend"] MoveX(540, 5, 2, 2);
	wait 3;

	level notify("akti_teleport");
	wait 0.1;
	level.activ UnLink();
	level.activ SetOrigin(level.originek["old"] GetOrigin());
	level.activ SetPlayerAngles(level.originek["old"].angles);
	level.brushok["end_oldelzaro"] MoveZ(142, 0.1);
	wait 1;

	level.brushok["end_oldajto"] MoveX(210, 5, 2, 2);
	Earthquake(0.75, 5, level.originek["old"] GetOrigin(), 750);
}


LightningKnife()
{
	while (true)
	{
		level.triggerek["end_knife"] waittill("trigger", kivalto);

		if (!level.elsoEndMegvolt)
		{
			level.melyikEnd = "lightningknife";
			level.elsoEndMegvolt = true;
			level.triggerek["end_old"] Delete();
			level.triggerek["end_sniper"] Delete();
			level.triggerek["end_racing"] Delete();
			if (level.titok3 != "knife")
			{
				level.brushok["endelzaro_old"] MoveZ(216, 2);
				level.brushok["endelzaro_sniper"] MoveZ(216, 2);
				level.brushok["endelzaro_racing"] MoveZ(216, 2);
			}
			level.brushok["multiend"] MoveX(540, 5, 2, 2);

			level notify("akti_teleport");
			wait 0.1;
			level.activ UnLink();
			level.activ SetClientDVAR("cg_thirdperson", 0);
			level.activ thread ToltenyTorlo("mindorokke");

			thread EsoEffekt();
			thread EsoHang();
			thread VillamEffekt();
		}
		level.activ SetMoveSpeedScale(GetDVARFloat("dr_activators_speed"));
		level.activ SetOrigin(level.originek["knife_akti"] GetOrigin());
		level.activ SetPlayerAngles(level.originek["knife_akti"].angles);

		kivalto thread Knife_HalalFigyelo();
		kivalto thread Knife_KilepesFigyelo();
		thread Knife_HalalVillam();
		kivalto SetMoveSpeedScale(GetDVARFloat("dr_jumpers_speed"));
		kivalto thread ToltenyTorlo("mindorokke");

		kivalto SetOrigin(level.originek["knife_jumper"] GetOrigin());
		kivalto SetPlayerAngles(level.originek["knife_jumper"].angles);

		level waittill("knife_kovetkezo");
	}
}
Knife_HalalFigyelo()
{
	self waittill("death");
	level notify("knife_kovetkezo");
}
Knife_KilepesFigyelo()
{
	while (true)
	{
		level waittill("disconnected", jatekos);
		if (jatekos == self) break;
	}
	level notify("knife_kovetkezo");
}
EsoEffekt()
{
	SetExpFog(1, 600, 0.4, 0.4, 0.5, 5);
	PlayFX(level.effektek["kod"], level.originek["global_effekt"] GetOrigin());
	SetDVAR("r_specularColorScale", 75);
	while (true)
	{
		PlayFX(level.effektek["eso"], level.originek["global_effekt"] GetOrigin());
		wait 0.25;
	}
}
EsoHang()
{
	while (true)
	{
		level.originek["global_effekt"] PlaySound("storm");
		wait 10;
	}
}
VillamEffekt()
{
	while (true)
	{
		rnd = RandomIntRange(0, 2);
		if (rnd == 0)
		{
			PlayFX(level.effektek["villam_1"], level.originek["global_effekt"] GetOrigin());
			PlayFX(level.effektek["villam_2"], level.originek["global_effekt"] GetOrigin());
		}
		else
		{
			PlayFX(level.effektek["villam_nagy"], level.originek["global_effekt"] GetOrigin());
		}

		wait RandomFloatRange(0.1, 5.0);
	}
}
Knife_HalalVillam()
{
	while (true)
	{
		level waittill("player_killed", who, eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
		if ((eInflictor == level.activ || attacker == level.activ) || who == level.activ)
		{
			orig = who GetOrigin();
			PlayFX(level.effektek["killer_villam"], orig);
			orig PlaySound("lightning");
			wait 0.5;
			PlayFX(level.effektek["killer_villam_impact"], orig);
			PlayFX(level.effektek["killer_villam"], orig);
			orig PlaySound("lightning");
			wait 0.5;
			PlayFX(level.effektek["killer_villam"], orig);
		}
	}
}


RockingSniper()
{
	while (true)
	{
		level.triggerek["end_sniper"] waittill("trigger", kivalto);

		if (!level.elsoEndMegvolt)
		{
			level.melyikEnd = "rockingsniper";
			level.elsoEndMegvolt = true;
			level.triggerek["end_old"] Delete();
			level.triggerek["end_knife"] Delete();
			level.triggerek["end_racing"] Delete();
			if (level.titok3 != "sniper")
			{
				level.brushok["endelzaro_old"] MoveZ(216, 2);
				level.brushok["endelzaro_knife"] MoveZ(216, 2);
				level.brushok["endelzaro_racing"] MoveZ(216, 2);
			}
			level.brushok["multiend"] MoveX(540, 5, 2, 2);

			Falak();

			level notify("akti_teleport");
			wait 0.1;
			level.activ UnLink();
			level.activ SetClientDVAR("cg_thirdperson", 0);
		}
		thread Modelek();

		level.activ SetMoveSpeedScale(GetDVARFloat("dr_activators_speed"));
		level.activ SetOrigin(level.originek["sniper_akti"] GetOrigin());
		level.activ SetPlayerAngles(level.originek["sniper_akti"].angles);
		level.activ VeletlenSniperFegyver();

		kivalto thread Sniper_HalalFigyelo();
		kivalto thread Sniper_KilepesFigyelo();
		kivalto SetMoveSpeedScale(GetDVARFloat("dr_jumpers_speed"));
		kivalto SetOrigin(level.originek["sniper_jumper"] GetOrigin());
		kivalto SetPlayerAngles(level.originek["sniper_jumper"].angles);
		kivalto VeletlenSniperFegyver();

		level waittill("sniper_kovetkezo");
	}
}
Sniper_HalalFigyelo()
{
	self waittill("death");
	level notify("sniper_kovetkezo");
}
Sniper_KilepesFigyelo()
{
	while (true)
	{
		level waittill("disconnected", jatekos);
		if (jatekos == self) break;
	}
	level notify("sniper_kovetkezo");
}
VeletlenSniperFegyver()
{
	self TakeAllWeapons();

	fegyver = undefined;
	switch (RandomIntRange(0, 5))
	{
		case 0:
			fegyver = "m40a3_mp";
		break;
		case 1:
			fegyver = "m21_mp";
		break;
		case 2:
			fegyver = "dragunov_mp";
		break;
		case 3:
			fegyver = "remington700_mp";
		break;
		case 4:
			fegyver = "barrett_mp";
		break;
		default:
			//Sose �r�nk ide...
		break;
	}

	self GiveWeapon(fegyver);
	wait 0.1;
	self SwitchToWeapon(fegyver);

	wait 0.2;

	self SetWeaponAmmoStock(level.activ GetCurrentWeapon(), 80);
	self SetWeaponAmmoClip(level.activ GetCurrentWeapon(), 80);
}
Falak()
{
	mennyi = RandomIntRange(3, 5);
	falak = KulonbozoRandomTomb(0, 7, mennyi);
	for (i = 0; i < falak.size; i++)
	{
		level.brushok["sniper_falak"][falak[i]] Delete();
	}
	wait 0.1;

	level.brushok["sniper_falak"] = GetEntArray("brush_sniper_falak", "targetname");
	for (i = 0; i < level.brushok["sniper_falak"].size; i++)
	{
		offset_X = RandomIntRange(-256, 257);
		offset_Y = RandomIntRange(-256, 257);
		irany = RandomIntRange(0, 2);
		if (irany == 0) irany = "right";
		else irany = "left";
		ido = RandomFloatRange(20.0, 25.0);
		level.brushok["sniper_falak"][i] MoveX(offset_X, 0.1);
		level.brushok["sniper_falak"][i] MoveY(offset_Y, 0.1);
		level.brushok["sniper_falak"][i] thread Forgatas("Z", irany, ido, "mindorokke");
	}
}
Modelek()
{
	if (IsDefined(level.end_sniper_modelek) && level.end_sniper_modelek.size != 0)
	{
		for (i = 0; i < level.end_sniper_modelek.size; i++)
		{
			level.end_sniper_modelek[i] Delete();
		}
	}
	mennyi = RandomIntRange(28, 34);
	helyek = KulonbozoRandomTomb(0, 36, mennyi);
	for (i = 0; i < helyek.size; i++)
	{
		hely = level.originek["sniper_modelek"][helyek[i]] GetOrigin();
		offset_X = RandomIntRange(0, 257);
		offset_Y = RandomIntRange(0, 257);
		hely += (offset_X, offset_Y, 506);
		model = undefined;
		switch (RandomIntRange(0, 6))
		{
			case 0:
				model = "prop_misc_rock_boulder_04";
			break;
			case 1:
				model = "com_bomb_objective";
			break;
			case 2:
				model = "ch_crate64x64";
			break;
			case 3:
				model = "com_barrel_biohazard_dirt";
			break;
			case 4:
				model = "vehicle_80s_hatch1_silv_destructible_mp";
			break;
			case 5:
				model = "vehicle_80s_hatch1_brn_destructible_mp";
			break;
			default:
				//Sose �r�nk ide...
			break;
		}
		level.end_sniper_modelek[i] = Spawn("script_model", hely);
		level.end_sniper_modelek[i] DetachAll();
		level.end_sniper_modelek[i] SetModel(model);
		level.end_sniper_modelek[i] thread ModelBeallit();
		wait 0.1;
	}
}
ModelBeallit()
{
	self RotateYaw(RandomIntRange(0, 271), 3, 1, 1);
	self MoveZ(-512, 1, 0.3, 0.3);
}


MetalRacing()
{
	level.triggerek["end_racing"] waittill("trigger", kivalto);

	level.melyikEnd = "heavy";
	level.elsoEndMegvolt = true;
	level.triggerek["end_knife"] Delete();
	level.triggerek["end_sniper"] Delete();
	level.triggerek["end_old"] Delete();
	if (level.titok3 != "racing")
	{
		level.brushok["endelzaro_old"] MoveZ(216, 2);
		level.brushok["endelzaro_knife"] MoveZ(216, 2);
		level.brushok["endelzaro_sniper"] MoveZ(216, 2);
	}

	thread MetalRacing_AktiResz();
	thread MetalRacing_JumperResz();
	thread MetalRacing_AktiEnd();
	thread MetalRacing_JumperEnd();
	thread MetalRacing_Leeses();

	level notify("akti_teleport");
	wait 0.1;
	level.activ UnLink();
	jatekosok = GetEntArray("player", "classname");
	for (i = 0; i < jatekosok.size; i++)
	{
		if (jatekosok[i] == level.activ)
		{
			jatekosok[i] SetMoveSpeedScale(GetDVARFloat("dr_activators_speed"));
			jatekosok[i] SetOrigin(level.originek["racing_akti"] GetOrigin());
		}
		else
		{
			jatekosok[i] SetMoveSpeedScale(GetDVARFloat("dr_jumpers_speed"));
			jatekosok[i] SetOrigin(level.originek["racing_jumpers"][RandomIntRange(0, 11)] GetOrigin());
		}
	}
}
MetalRacing_AktiResz()
{
	thread OdaVissza(level.brushok["racing_akti"][0], "Y", 384, 3, "racing_end", 1, 1);
	thread OdaVissza(level.brushok["racing_akti"][1], "Y", -384, 3, "racing_end", 1, 1);
}
MetalRacing_JumperResz()
{
	irany = undefined;
	for (i = 0; i < level.brushok["racing_forog"].size; i++)
	{
		rnd = RandomIntRange(0, 2);
		if (rnd == 0) irany = "right";
		else irany = "left";
		level.brushok["racing_forog"][i] thread Forgatas("Z", irany, RandomFloatRange(5.0, 10.0), "racing_end");
	}
	for (i = 0; i < level.brushok["racing_forog_2"].size; i++)
	{
		rnd = RandomIntRange(0, 2);
		if (rnd == 0) irany = "right";
		else irany = "left";
		level.brushok["racing_forog_2"][i] thread Forgatas("X", irany, RandomFloatRange(2.5, 5.5), "racing_end");
	}
}
MetalRacing_Leeses()
{
	while (true)
	{
		level.triggerek["racing_leeses"] waittill("trigger", kivalto);
		if (kivalto == level.activ) kivalto SetOrigin(level.originek["racing_akti"] GetOrigin());
		else kivalto SetOrigin(level.originek["racing_jumpers"][RandomIntRange(0, 11)] GetOrigin());
	}
}
MetalRacing_AktiEnd()
{
	level endon("racing_jumper_win");

	while (true)
	{
		level.triggerek["racing_akti"] waittill("trigger", kivalto);
		if (kivalto == level.activ)
		{
			level.triggerek["racing_jumper"] Delete();
			level notify("racing_akti_win");
			break;
		}
	}


	jatekosok = GetEntArray("player", "classname");
	for (i = 0; i < jatekosok.size; i++)
	{
		if (jatekosok[i] == level.activ)
		{
			jatekosok[i] SetOrigin(level.originek["racing_raketa"][5] GetOrigin());
			jatekosok[i].angles = level.originek["racing_raketa"][5].angles;
		}
		else
		{
			vel = RandomIntRange(0, level.originek["racing_raketa_halal"].size);
			jatekosok[i] SetOrigin(level.originek["racing_raketa_halal"][vel] GetOrigin());
			jatekosok[i].angles = level.originek["racing_raketa_halal"][vel].angles;
		}
	}

	thread BigBoom();
}
MetalRacing_JumperEnd()
{
	level endon("racing_akti_win");

	while (true)
	{
		level.triggerek["racing_jumper"] waittill("trigger", kivalto);
		if (kivalto != level.activ)
		{
			level.triggerek["racing_akti"] Delete();
			level notify("racing_jumper_win");
			break;
		}
	}


	jatekosok = GetEntArray("player", "classname");
	for (i = 0; i < jatekosok.size; i++)
	{
		if (jatekosok[i] == level.activ)
		{
			jatekosok[i] SetOrigin(level.originek["racing_raketa_cel"] GetOrigin());
			jatekosok[i].angles = level.originek["racing_raketa_cel"].angles;
		}
		else
		{
			vel = RandomIntRange(0, level.originek["racing_raketa"].size);
			jatekosok[i] SetOrigin(level.originek["racing_raketa"][vel] GetOrigin());
			jatekosok[i].angles = level.originek["racing_raketa"][vel].angles;
		}
	}

	thread BigBoom();
}


BigBoom()
{
	effekt = Spawn("script_origin", (-2048, 3072, -4016));
	for (i = 0; i < level.brushok["raketa_reszek"].size; i++)
	{
		level.brushok["raketa_reszek"][i] NotSolid();
	}
	level.brushok["raketa_fo"] NotSolid();

	level.brushok["raketa_fo"] MoveTo(level.originek["racing_raketa_start"] GetOrigin(), 0.1);
	level.brushok["raketa_fo"] RotateRoll(180, 0.1);

	wait 2;

	cel = level.originek["racing_raketa_cel"] GetOrigin() - (0, 0, 128);
	level.brushok["raketa_fo"] MoveTo(cel, 10, 8);

	wait 3;

	effekt PlaySound("bigboom");

	wait 3;

	Earthquake(0.75, 6, effekt GetOrigin(), 2000);

	wait 3;

	PlayFX(level.effektek["bigboom1"], level.originek["racing_raketa_cel"] GetOrigin());
	PlayFX(level.effektek["bigboom2"], level.originek["racing_raketa_cel"] GetOrigin());
	wait 1;
	PlayFX(level.effektek["bigboom3"], level.originek["racing_raketa_cel"] GetOrigin());

	thread BigBoom_Halal();

	wait 1;
	for (i = 0; i < level.brushok["raketa_reszek"].size; i++)
	{
		level.brushok["raketa_reszek"][i] Delete();
	}
	level.brushok["raketa_fo"] Delete();
}
BigBoom_Halal()
{
	while (true)
	{
		level.triggerek["racing_raketa"] waittill("trigger", kivalto);
		if (!IsDefined(kivalto.bigboom))
		{
			kivalto thread BigBoom_Halal_Seged();
			kivalto.bigboom = true;
		}
	}
}
BigBoom_Halal_Seged()
{
	self endon("death");

	tamado = Spawn("script_origin", self.origin);
	while (true)
	{
		self FinishPlayerDamage(tamado, tamado, 10, 0, "MOD_UNKNOWN", "ak47_mp", self.origin, AnglesToForward((0,0,0)), "none", 0);
		wait 0.25;
	}
}