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


main()
{
	
	ValtozoBevezeto();
	KezdetiBevezeto();
	
	wait 1;
	
	maps\mp\_load::main();
	
	maps\mp\mp_dr_buggedlikehell_csapdak::CsapdakInditasa();
	maps\mp\mp_dr_buggedlikehell_titkok::TitkokInditasa();
	maps\mp\mp_dr_buggedlikehell_end::EndInditasa();
	thread maps\mp\Roll_the_Dice::RTDInditasa(level.triggerek["RTD"]);
	
	thread SerulesMajdElet();
    thread AktivatorTeleportSzamlalo();
	thread AktivatorTeleport(level.triggerek["aktivatorteleport1"], level.originek["aktivator1"], level.originek["aktifagyaszto1"], (-1722, -2376, 68), level.stringek["aktivatorteleportsikeres1"]);
	thread AktivatorTeleport(level.triggerek["aktivatorteleport2"], level.originek["aktivator2"], level.originek["aktifagyaszto2"], (-1280, -9694, 240), level.stringek["aktivatorteleportsikeres2"]);
	thread AktivatorGyors();
	thread LeesesVisszaTeleportalo(level.triggerek["leeses_teleport_1"]);
	thread LeesesVisszaTeleportalo(level.triggerek["leeses_teleport_2"]);
	thread SzonyegAktivalo();
	thread VizFigyelo();
	thread NeoSpam(level.stringek["neospam"]);
	thread NeoConnect();
	thread RTDAnnounce();
	thread KorVegeHang("victory", "defeat", "ace");
	thread HalalHang("slained");
	
	level waittill("round_started", sorszam);
	AmbientPlay("dontstop");
}


//Bevezeti a scriptben használt változókat
ValtozoBevezeto()
{
	level.trapTriggers = [];
    level.triggerek = [];
    level.brushok = [];
	level.originek = [];
	level.modelek = [];
    level.stringek = [];
    level.szonyegekAktivalva = [];
	level.effektek = [];
	
	//level.trapTriggers[]
	level.trapTriggers[level.trapTriggers.size] = GetEnt("trigger_csapda1", "targetname");
	level.trapTriggers[level.trapTriggers.size] = GetEnt("trigger_csapda2", "targetname");
	level.trapTriggers[level.trapTriggers.size] = GetEnt("trigger_csapda3", "targetname");
	level.trapTriggers[level.trapTriggers.size] = GetEnt("trigger_csapda4", "targetname");
	level.trapTriggers[level.trapTriggers.size] = GetEnt("trigger_csapda5", "targetname");
	level.trapTriggers[level.trapTriggers.size] = GetEnt("trigger_csapda6", "targetname");
	level.trapTriggers[level.trapTriggers.size] = GetEnt("trigger_csapda7", "targetname");
	level.trapTriggers[level.trapTriggers.size] = GetEnt("trigger_csapda8", "targetname");

    //level.triggerek[]
	level.triggerek["RTD"] = GetEnt("trigger_rollthedice", "targetname");
	level.triggerek["RTD_announce"] = GetEnt("trigger_rtd_announce", "targetname");
	level.triggerek["aktispawn"] = GetEnt("trigger_aktispawn", "targetname");
	level.triggerek["jumperspawn"] = GetEnt("trigger_jumperspawn", "targetname");
	level.triggerek["jumperplatform"] = GetEnt("trigger_jumperplatform", "targetname");
	level.triggerek["aktigyors_be"] = GetEnt("trigger_aktigyors_be", "targetname");
	level.triggerek["aktigyors_ki"] = GetEnt("trigger_aktigyors_ki", "targetname");
    level.triggerek["esesiserules"] = GetEnt("trigger_esesiserules", "targetname");
	level.triggerek["aktivatorteleport1"] = GetEnt("trigger_aktivatorteleport1", "targetname");
	level.triggerek["aktivatorteleport2"] = GetEnt("trigger_aktivatorteleport2", "targetname");
	level.triggerek["leeses_teleport_1"] = GetEnt("trigger_leeses_teleport_1", "targetname");
	level.triggerek["leeses_teleport_2"] = GetEnt("trigger_leeses_teleport_2", "targetname");
	level.triggerek["szonyeg_kikapcsolo1"] = GetEnt("trigger_szonyeg_kikapcsolo1", "targetname");
	level.triggerek["szonyeg_kikapcsolo2"] = GetEnt("trigger_szonyeg_kikapcsolo2", "targetname");
	level.triggerek["szonyeg_kikapcsolo3"] = GetEnt("trigger_szonyeg_kikapcsolo3", "targetname");
	level.triggerek["csapda1"] = GetEnt("trigger_csapda1", "targetname");
	level.triggerek["csapda2"] = GetEnt("trigger_csapda2", "targetname");
	level.triggerek["csapda2_halal"] = GetEnt("trigger_csapda2_halal", "targetname");
	level.triggerek["csapda3"] = GetEnt("trigger_csapda3", "targetname");
	level.triggerek["csapda3_halal1"] = GetEnt("trigger_csapda3_halal1", "targetname");
	level.triggerek["csapda3_halal2"] = GetEnt("trigger_csapda3_halal2", "targetname");
	level.triggerek["viz_be"] = GetEnt("trigger_viz_be", "targetname");
	level.triggerek["viz_ki"] = GetEnt("trigger_viz_ki", "targetname");
	level.triggerek["csapda4"] = GetEnt("trigger_csapda4", "targetname");
	level.triggerek["csapda5"] = GetEnt("trigger_csapda5", "targetname");
	level.triggerek["csapda6"] = GetEnt("trigger_csapda6", "targetname");
	level.triggerek["csapda7"] = GetEnt("trigger_csapda7", "targetname");
	level.triggerek["csapda7_halal"] = [];
	level.triggerek["csapda7_halal"][0] = GetEnt("trigger_csapda7_1", "targetname");
	level.triggerek["csapda7_halal"][1] = GetEnt("trigger_csapda7_2", "targetname");
	level.triggerek["csapda7_halal"][2] = GetEnt("trigger_csapda7_3", "targetname");
	level.triggerek["csapda7_halal"][3] = GetEnt("trigger_csapda7_4", "targetname");
	level.triggerek["csapda8"] = GetEnt("trigger_csapda8", "targetname");
	level.triggerek["titok1_ajto"] = GetEnt("trigger_titok1_ajto", "targetname");
	level.triggerek["titok1_nyito"] = GetEnt("trigger_titok1_nyito", "targetname");
	level.triggerek["titok1_ak47"] = GetEnt("trigger_titok1_ak47", "targetname");
	level.triggerek["titok1_r700"] = GetEnt("trigger_titok1_r700", "targetname");
	level.triggerek["titok1_m14"] = GetEnt("trigger_titok1_m14", "targetname");
	level.triggerek["titok1_scorpion"] = GetEnt("trigger_titok1_scorpion", "targetname");
	level.triggerek["titok2_hasznal"] = GetEnt("trigger_titok2_hasznal", "targetname");
	level.triggerek["titok2_zenealap"] = GetEnt("trigger_titok2_zenealap", "targetname");
	level.triggerek["titok2_zene1"] = GetEnt("trigger_titok2_zene1", "targetname");
	level.triggerek["titok2_zene2"] = GetEnt("trigger_titok2_zene2", "targetname");
	level.triggerek["titok2_zene3"] = GetEnt("trigger_titok2_zene3", "targetname");
	level.triggerek["titok2_zene4"] = GetEnt("trigger_titok2_zene4", "targetname");
	level.triggerek["titok3_letra"] = GetEnt("trigger_titok3_letra", "targetname");
	level.triggerek["titok3_csirke"] = GetEnt("trigger_titok3_csirke", "targetname");
	level.triggerek["titok3_fal"] = GetEnt("trigger_titok3_fal", "targetname");
	level.triggerek["titok3_ellenor"] = GetEnt("trigger_titok3_ellenor", "targetname");
	level.triggerek["elsoend"] = GetEnt("trigger_elsoend", "targetname");
	level.triggerek["csapoajto"] = GetEnt("trigger_csapoajto", "targetname");
	level.triggerek["end_old"] = GetEnt("trigger_end_old", "targetname");
	level.triggerek["end_ninja"] = GetEnt("trigger_end_ninja", "targetname");
	level.triggerek["end_aim"] = GetEnt("trigger_end_aim", "targetname");
	level.triggerek["end_heavy"] = GetEnt("trigger_end_heavy", "targetname");
	level.triggerek["figyelem1"] = GetEnt("trigger_figyelem1", "targetname");
	level.triggerek["figyelem3"] = GetEnt("trigger_figyelem3", "targetname");
	level.triggerek["figyelem4"] = GetEnt("trigger_figyelem4", "targetname");
	level.triggerek["figyelem5"] = GetEnt("trigger_figyelem5", "targetname");
	level.triggerek["figyelem6"] = GetEnt("trigger_figyelem6", "targetname");
	level.triggerek["figyelem7"] = GetEnt("trigger_figyelem7", "targetname");
	level.triggerek["figyelem8"] = GetEnt("trigger_figyelem8", "targetname");
	level.triggerek["figyelem9"] = GetEnt("trigger_figyelem9", "targetname");
	level.triggerek["aim_jumper"] = [];
	level.triggerek["aim_jumper"][0] = GetEnt("trigger_aim_jumper_1", "targetname");
	level.triggerek["aim_jumper"][1] = GetEnt("trigger_aim_jumper_2", "targetname");
	level.triggerek["aim_jumper"][2] = GetEnt("trigger_aim_jumper_3", "targetname");
	level.triggerek["aim_jumper"][3] = GetEnt("trigger_aim_jumper_4", "targetname");
	level.triggerek["aim_jumper"][4] = GetEnt("trigger_aim_jumper_5", "targetname");
	level.triggerek["aim_jumper"][5] = GetEnt("trigger_aim_jumper_6", "targetname");
	level.triggerek["aim_jumper"][6] = GetEnt("trigger_aim_jumper_7", "targetname");
	level.triggerek["aim_akti"] = [];
	level.triggerek["aim_akti"][0] = GetEnt("trigger_aim_akti_1", "targetname");
	level.triggerek["aim_akti"][1] = GetEnt("trigger_aim_akti_2", "targetname");
	level.triggerek["aim_akti"][2] = GetEnt("trigger_aim_akti_3", "targetname");
	level.triggerek["aim_akti"][3] = GetEnt("trigger_aim_akti_4", "targetname");
	level.triggerek["aim_akti"][4] = GetEnt("trigger_aim_akti_5", "targetname");
	level.triggerek["aim_akti"][5] = GetEnt("trigger_aim_akti_6", "targetname");
	level.triggerek["aim_akti"][6] = GetEnt("trigger_aim_akti_7", "targetname");
	level.triggerek["heavy"] = GetEnt("trigger_heavy", "targetname");
	level.triggerek["heavy_teleport"] = GetEnt("trigger_heavy_teleport", "targetname");
	level.triggerek["ninja_teleport"] = GetEnt("trigger_ninja_teleport", "targetname");
	level.triggerek["szonyeg"] = [];
	for(i = 0; i < 42; i++)
	{
		celnev = "trigger_szonyeg_" + i;
		level.triggerek["szonyeg"][i] = GetEnt(celnev, "targetname");
	}
    
    //level.brushok[]
	level.brushok["csapda1"] = [];
	level.brushok["csapda1"][1] = GetEnt("brush_csapda1_1", "targetname");
	level.brushok["csapda1"][2] = GetEnt("brush_csapda1_2", "targetname");
	level.brushok["csapda1"][3] = GetEnt("brush_csapda1_3", "targetname");
	level.brushok["csapda1"][4] = GetEnt("brush_csapda1_4", "targetname");
	level.brushok["csapda1"][5] = GetEnt("brush_csapda1_5", "targetname");
	level.brushok["csapda1"][6] = GetEnt("brush_csapda1_6", "targetname");
	level.brushok["csapda1"][7] = GetEnt("brush_csapda1_7", "targetname");
	level.brushok["csapda1"][8] = GetEnt("brush_csapda1_8", "targetname");
	level.brushok["csapda1_platform"] = GetEnt("brush_csapda1_platform", "targetname");
	level.brushok["csapda2"] = GetEnt("brush_csapda2", "targetname");
	level.brushok["csapda2_tuskek"] = [];
	level.brushok["csapda2_tuskek"] = GetEntArray("brush_csapda2_tuskek", "targetname");
	level.brushok["csapda4_fal_0"] = [];
	level.brushok["csapda4_fal_0"] = GetEntArray("brush_csapda4_fal_0", "targetname");
	level.brushok["csapda4_fal_1"] = [];
	level.brushok["csapda4_fal_1"] = GetEntArray("brush_csapda4_fal_1", "targetname");
	level.brushok["csapda4_fal_2"] = [];
	level.brushok["csapda4_fal_2"] = GetEntArray("brush_csapda4_fal_2", "targetname");
	level.brushok["csapda4_fal_3"] = [];
	level.brushok["csapda4_fal_3"] = GetEntArray("brush_csapda4_fal_3", "targetname");
	level.brushok["csapda5"] = GetEnt("brush_csapda5", "targetname");
	level.brushok["csapda6_tuskek"] = [];
	level.brushok["csapda6_tuskek"] = GetEntArray("brush_csapda6_tuskek", "targetname");
	level.brushok["csapda6_eltunik"] = [];
	level.brushok["csapda6_eltunik"] = GetEntArray("brush_csapda6_eltunik", "targetname");
	level.brushok["csapda6_platform"] = GetEnt("brush_csapda6_platform", "targetname");
	level.brushok["csapda6_oszlop"] = GetEnt("brush_csapda6_oszlop", "targetname");
	level.brushok["csapda8"] = [];
	level.brushok["csapda8"] = GetEntArray("brush_csapda8", "targetname");
	level.brushok["nehezites1_jobb"] = GetEnt("brush_nehezites1_jobb", "targetname");
	level.brushok["nehezites1_bal"] = GetEnt("brush_nehezites1_bal", "targetname");
	level.brushok["nehezites1_kozep"] = GetEnt("brush_nehezites1_kozep", "targetname");
	level.brushok["nehezites1_lefel"] = [];
	level.brushok["nehezites1_lefel"] = GetEntArray("brush_nehezites1_lefel", "targetname");
	level.brushok["nehezites2_1"] = [];
	level.brushok["nehezites2_1"][0] = GetEnt("brush_nehezites2_1_0", "targetname");
	level.brushok["nehezites2_1"][1] = GetEnt("brush_nehezites2_1_1", "targetname");
	level.brushok["nehezites2_1"][2] = GetEnt("brush_nehezites2_1_2", "targetname");
	level.brushok["nehezites2_1"][3] = GetEnt("brush_nehezites2_1_3", "targetname");
	level.brushok["nehezites2_2"] = [];
	level.brushok["nehezites2_2"][0] = GetEnt("brush_nehezites2_2_0", "targetname");
	level.brushok["nehezites2_2"][1] = GetEnt("brush_nehezites2_2_1", "targetname");
	level.brushok["nehezites2_2"][2] = GetEnt("brush_nehezites2_2_2", "targetname");
	level.brushok["nehezites2_2"][3] = GetEnt("brush_nehezites2_2_3", "targetname");
	level.brushok["nehezites2_3"] = [];
	level.brushok["nehezites2_3"][0] = GetEnt("brush_nehezites2_3_0", "targetname");
	level.brushok["nehezites2_3"][1] = GetEnt("brush_nehezites2_3_1", "targetname");
	level.brushok["nehezites2_3"][2] = GetEnt("brush_nehezites2_3_2", "targetname");
	level.brushok["nehezites2_3"][3] = GetEnt("brush_nehezites2_3_3", "targetname");
	level.brushok["titok1"] = GetEnt("brush_titok1", "targetname");
	level.brushok["titok1_letra"] = GetEnt("brush_titok1_letra", "targetname");
	level.brushok["titok3_ajto"] = GetEnt("brush_titok3_ajto", "targetname");
	level.brushok["titok3_bejarat"] = GetEnt("brush_titok3_bejarat", "targetname");
	level.brushok["csapoajto"] = GetEnt("brush_csapoajto", "targetname");
	level.brushok["multiend"] = GetEnt("brush_multiend", "targetname");
	level.brushok["old_elzaro"] = GetEnt("brush_old_elzaro", "targetname");
	level.brushok["endelzaro_1"] = GetEnt("brush_endelzaro_1", "targetname");
	level.brushok["endelzaro_2"] = GetEnt("brush_endelzaro_2", "targetname");
	level.brushok["endelzaro_3"] = GetEnt("brush_endelzaro_3", "targetname");
	level.brushok["old_ajtozar"] = GetEnt("brush_old_ajtozar", "targetname");
	level.brushok["ninja_ajtozar"] = GetEnt("brush_ninja_ajtozar", "targetname");
	level.brushok["aim_ajtozar"] = GetEnt("brush_aim_ajtozar", "targetname");
	level.brushok["aim_jumper"] = [];
	level.brushok["aim_jumper"][0] = GetEnt("brush_aim_jumper_1", "targetname");
	level.brushok["aim_jumper"][1] = GetEnt("brush_aim_jumper_2", "targetname");
	level.brushok["aim_jumper"][2] = GetEnt("brush_aim_jumper_3", "targetname");
	level.brushok["aim_jumper"][3] = GetEnt("brush_aim_jumper_4", "targetname");
	level.brushok["aim_jumper"][4] = GetEnt("brush_aim_jumper_5", "targetname");
	level.brushok["aim_jumper"][5] = GetEnt("brush_aim_jumper_6", "targetname");
	level.brushok["aim_jumper"][6] = GetEnt("brush_aim_jumper_7", "targetname");
	level.brushok["aim_akti"] = [];
	level.brushok["aim_akti"][0] = GetEnt("brush_aim_akti_1", "targetname");
	level.brushok["aim_akti"][1] = GetEnt("brush_aim_akti_2", "targetname");
	level.brushok["aim_akti"][2] = GetEnt("brush_aim_akti_3", "targetname");
	level.brushok["aim_akti"][3] = GetEnt("brush_aim_akti_4", "targetname");
	level.brushok["aim_akti"][4] = GetEnt("brush_aim_akti_5", "targetname");
	level.brushok["aim_akti"][5] = GetEnt("brush_aim_akti_6", "targetname");
	level.brushok["aim_akti"][6] = GetEnt("brush_aim_akti_7", "targetname");
	level.brushok["heavy_ajtozar"] = GetEnt("brush_heavy_ajtozar", "targetname");
	level.brushok["heavy_kor1"] = GetEnt("brush_heavy_kor1", "targetname");
	level.brushok["heavy_kor2"] = GetEnt("brush_heavy_kor2", "targetname");
	level.brushok["heavy_kor3"] = GetEnt("brush_heavy_kor3", "targetname");
	level.brushok["heavy_negyzet"] = GetEnt("brush_heavy_negyzet", "targetname");
	for (i = 0; i < 42; i++)
	{
		nev = "szonyeg_" + i;
		celnev = "brush_szonyeg_" + i;
		level.brushok[nev] = GetEnt(celnev, "targetname");
	}
	level.brushok["szamlalo_1x"] = GetEnt("brush_szamlalo_1x", "targetname");
	level.brushok["szamlalo_2x"] = GetEnt("brush_szamlalo_2x", "targetname");
	for (i = 0; i < 10; i++)
	{
		nev = "szamlalo_x" + i;
		celnev = "brush_szamlalo_x" + i;
		level.brushok[nev] = GetEnt(celnev, "targetname");
	}
	
	//level.originek[]
	level.originek["aktivator1"] = GetEnt("origin_aktivatorhely1", "targetname");
	level.originek["aktivator2"] = GetEnt("origin_aktivatorhely2", "targetname");
	level.originek["aktifagyaszto1"] = GetEnt("origin_aktifagyaszto1", "targetname");
	level.originek["aktifagyaszto2"] = GetEnt("origin_aktifagyaszto2", "targetname");
	level.originek["leeses_1"] = GetEnt("origin_leeses_1", "targetname");
	level.originek["leeses_2"] = GetEnt("origin_leeses_2", "targetname");
	level.originek["leeses_3"] = GetEnt("origin_leeses_3", "targetname");
	level.originek["leeses_4"] = GetEnt("origin_leeses_4", "targetname");
	level.originek["leeses_5"] = GetEnt("origin_leeses_5", "targetname");
	level.originek["aktivatorteleport1"] = (-1720, -2376, 72);
	level.originek["titok1"] = GetEnt("origin_titok1", "targetname");
	level.originek["titok2"] = GetEnt("origin_titok2", "targetname");
	level.originek["titok3"] = GetEnt("origin_titok3", "targetname");
	level.originek["csapda1"] = GetEnt("origin_csapda1", "targetname");
	level.originek["csapda2"] = GetEnt("origin_csapda2", "targetname");
	level.originek["csapda3"] = GetEnt("origin_csapda3", "targetname");
	level.originek["csapda4"] = GetEnt("origin_csapda4", "targetname");
	level.originek["csapda5"] = GetEnt("origin_csapda5", "targetname");
	level.originek["csapda6"] = GetEnt("origin_csapda6", "targetname");
	level.originek["csapda7"] = GetEnt("origin_csapda7", "targetname");
	level.originek["csapda8"] = GetEnt("origin_csapda8", "targetname");
	level.originek["heavy_akti"] = GetEnt("heavy_akti", "targetname");
	level.originek["heavy_jumper_1"] = GetEnt("heavy_jumper_1", "targetname");
	level.originek["heavy_jumper_2"] = GetEnt("heavy_jumper_2", "targetname");
	level.originek["heavy_jumper_3"] = GetEnt("heavy_jumper_3", "targetname");
	level.originek["heavy_jumper_4"] = GetEnt("heavy_jumper_4", "targetname");
	level.originek["heavy_jumper_5"] = GetEnt("heavy_jumper_5", "targetname");
	
	
	//level.modelek[]
	level.modelek["csapda1"] = GetEnt("model_csapda1", "targetname");
	level.modelek["csapda2"] = GetEnt("model_csapda2", "targetname");
	level.modelek["csapda3"] = GetEnt("model_csapda3", "targetname");
	level.modelek["csapda4"] = GetEnt("model_csapda4", "targetname");
	level.modelek["csapda5"] = GetEnt("model_csapda5", "targetname");
	level.modelek["csapda6"] = GetEnt("model_csapda6", "targetname");
	level.modelek["csapda7"] = GetEnt("model_csapda7", "targetname");
	level.modelek["csapda8"] = GetEnt("model_csapda8", "targetname");
	level.modelek["titok1_ak47"] = GetEnt("model_titok1_ak47", "targetname");
	level.modelek["titok1_r700"] = GetEnt("model_titok1_r700", "targetname");
	level.modelek["titok1_m14"] = GetEnt("model_titok1_m14", "targetname");
	level.modelek["titok1_skorpion"] = GetEnt("model_titok1_skorpion", "targetname");
	level.modelek["titok3"] = GetEnt("model_titok3", "targetname");
	level.modelek["heavy"] = GetEnt("model_heavy", "targetname");
	level.modelek["aim_jumper"] = GetEnt("model_aim_jumper", "targetname");
	level.modelek["aim_akti"] = GetEnt("model_aim_akti", "targetname");
	

    //level.stringek[]
	level.stringek["neospam"] = "^1--->^3Map made by ^2Neo^1<---";
    level.stringek["eletvisszaadva"] = "^3Full health restored! ^2A gift by ^9club27 Team^2.";
	level.stringek["aktivatorteleportkezdodik"] = "^3Teleport sequence started. ^2Hold on!";
    level.stringek["aktivatorteleportsikeres1"] = "^9Successfully teleported to ^3Stage ^2#1^9!";
	level.stringek["aktivatorteleportsikeres2"] = "^9Successfully teleported to ^3Stage ^2#2^9!";
	level.stringek["nincsszonyeg"] = "^3All of the rugs have been gone... :( ^5So you have to be teleported!";
	level.stringek["titok1_1"] = " ^2made a perfect shot!";
	level.stringek["titok1_2"] = " ^2opened the hidden entrance!";
	level.stringek["titok1_fegyver1"] = " ^2got an AK-47!";
	level.stringek["titok1_fegyver2"] = " ^2got an R700!";
	level.stringek["titok1_fegyver3"] = " ^2got an M14!";
	level.stringek["titok1_fegyver4"] = " ^2got a Skorpion!";
	level.stringek["titok2_mindenki"] = " ^3is able now to change the ^6music^3!";
	level.stringek["titok2_kivalto"] = "^5Knife the music's picture to choose it!";
	level.stringek["titok2_zenealap"] = " ^9has decided to keep ^2Innerpartysystem - Don't Stop^9!";
	level.stringek["titok2_alap"] = "^3Or press ^1->USE<- ^3to keep the default music!";
	level.stringek["titok2_zene1"] = " ^9has choosen ^5Taio Cruz - Hangover^9!";
	level.stringek["titok2_zene2"] = " ^9has choosen ^6PSY - Gangnam Style^9!";
	level.stringek["titok2_zene3"] = " ^9has choosen ^3Hollywood Undead - Been To Hell^9!";
	level.stringek["titok2_zene4"] = " ^9has choosen ^7DJ Fresh - Gold Dust^9!";
	level.stringek["titok3_nyitva"] = " ^6is a superhero now!";
	level.stringek["titok3_nyito_1"] = "^2You have opened the ^6final secret^2!";
	level.stringek["titok3_nyito_2"] = "^3You got increased ^2health^3, ^1movement speed ^3and ^5GodWeapon^3!";
	level.stringek["titok3_nyito_3"] = "^3You also got ^2+250 XP ^3and an ^4extra life^3!";
	level.stringek["titok3_rossz_1"] = "^9You have tried to enter someone else's secret!";
	level.stringek["titok3_rossz_2"] = "^3You must restart the whole map now!";
	level.stringek["koszonet_club27"] = "^2Thanks to ^1c^2l^3u^4b^52^67 ^7T^8e^9a^3m^2!";
	level.stringek["koszonet_whetley"] = "^2Thanks to ^1W^2h^3e^4t^5l^6e^7y ^2for helping my first steps!";
	level.stringek["koszonet_druzi"] = "^2Thanks to ^1D^2r^3. ^4U^5z^6i ^2for additional help!";
	level.stringek["hint_szonyeg"] = "Press ^3->USE<- ^7to fly on the magical rugs!";
	level.stringek["hint_teleport"] = "Press ^3->USE<- ^7to teleport!";
	level.stringek["csapda1"] = "Press ^3->USE<- ^7to make a row of the platforms non-solid!";
	level.stringek["csapda2"] = "Press ^3->USE<- ^7to smash them with spikes!";
	level.stringek["csapda3"] = "Press ^3->USE<- ^7to make them feel shocked!";
	level.stringek["csapda4"] = "Press ^3->USE<- ^7to freeze some glass-pathes!";
	level.stringek["csapda5"] = "Press ^3->USE<- ^7to rotate the platform (and surprise ^^)!";
	level.stringek["csapda6"] = "Press ^3->USE<- ^7to make them scared like never before!";
	level.stringek["csapda7"] = "Press ^3->USE<- ^7to light the gas on fire.";
	level.stringek["csapda8"] = "Press ^3->USE<- ^7to make them confused.";
	level.stringek["map_endelve1"] = " ^3ended the map FIRST.";
	level.stringek["map_endelve2"] = "^2He will choose an end-game now.";
	level.stringek["csapoajto"] = "Press ^3->USE<- ^7to ^2END THE MAP^1!";
	level.stringek["figyelem1"] = "^1Jump and trust the mapper!";
	level.stringek["figyelem2"] = "^2Sometimes a whole row disappear...";
	level.stringek["figyelem3"] = "^3Looks like a bug... a deadly one.";
	level.stringek["figyelem4"] = "^4Puddles + electricity = death";
	level.stringek["figyelem5"] = "^5When reality doesn't matter, walls become your enemy";
	level.stringek["figyelem6"] = "^6Ah, you know this trap! Or not really?";
	level.stringek["figyelem7"] = "^7Be advised where to look for potential danger";
	level.stringek["figyelem8"] = "^8Gas + electricity = teddy bears... oh, wait... DEATH";
	level.stringek["figyelem9"] = "^9Not everything is what it seems... or doesn't seem";
	level.stringek["RTD_announce"] = "^3You ^2can activate ^1RTD here ^2by pressing ^3->USE<-^2!";
	
	
	//level.effektek[]
	level.effektek["aktivatorteleport"] = LoadFX("sajat/teleport");
	level.effektek["aktivatorteleport_fenyes"] = LoadFX("sajat/teleport_fenyes");
	level.effektek["ver1"] = LoadFX("impacts/deathfx_dogbite");
	level.effektek["ver2"] = LoadFX("impacts/deathfx_bloodpool");
	level.effektek["gazsugar"] = LoadFX("sajat/gazsugar");
	level.effektek["gaztuz"] = LoadFX("sajat/gaztuz");
	level.effektek["szikra"] = LoadFX("explosions/powerlines_b_large");
	level.effektek["vegtelen_szikra"] = LoadFX("sajat/vegtelen_szikra");
	level.effektek["kis_szikra"] = LoadFX("explosions/sparks_d");
	level.effektek["aktivcsapda"] = LoadFX("misc/light_glow_red_generic_pulse");
	level.effektek["shotgun"] = LoadFX("muzzleflashes/winch_flshview");


    //Egyéb változók
    level.aktivatorTeleportKesz = false;
	level.szonyegekTorolve = 0;
	
	level.elsoEndelo = undefined;
	level.elsoEndMegvolt = false;
	level.melyikEnd = "megnincs";
}


//Beállítja a kezdetben szükséges, de saját függvénnyel nem rendelkezõ dolgokat
KezdetiBevezeto()
{
	PreCacheItem("ak47_mp");
	PreCacheItem("remington700_mp");
	PreCacheItem("m14_mp");
	PreCacheItem("skorpion_mp");
	PreCacheItem("rpd_acog_mp");
	PreCacheItem("rpg_mp");
	PreCacheItem("barrett_mp");
	PreCacheItem("frag_grenade_mp");
	PreCacheItem("colt45_mp");
	PreCacheItem("winchester1200_grip_mp");
	

	SetDVAR("r_specularcolorscale", "1");
	SetDVAR("g_teamColor_Allies", "0, 1, 0");
	SetDVAR("g_teamColor_Axis", "1, 0, 0");
	
	level.triggerek["aktispawn"] SetHintString(level.stringek["koszonet_whetley"]);
	level.triggerek["jumperspawn"] SetHintString(level.stringek["koszonet_club27"]);
	level.triggerek["jumperplatform"] SetHintString(level.stringek["koszonet_druzi"]);
	level.triggerek["titok2_zenealap"] SetHintString(level.stringek["titok2_alap"]);
	level.triggerek["aktivatorteleport1"] SetHintString(level.stringek["hint_teleport"]);
	level.triggerek["aktivatorteleport2"] SetHintString(level.stringek["hint_teleport"]);
	level.triggerek["csapoajto"] SetHintString(level.stringek["csapoajto"]);
	for(i = 0; i < 42; i++)
	{
		level.triggerek["szonyeg"][i] SetHintString(level.stringek["hint_szonyeg"]);
	}
	level.triggerek["csapda1"] SetHintString(level.stringek["csapda1"]);
	level.triggerek["csapda2"] SetHintString(level.stringek["csapda2"]);
	level.triggerek["csapda3"] SetHintString(level.stringek["csapda3"]);
	level.triggerek["csapda4"] SetHintString(level.stringek["csapda4"]);
	level.triggerek["csapda5"] SetHintString(level.stringek["csapda5"]);
	level.triggerek["csapda6"] SetHintString(level.stringek["csapda6"]);
	level.triggerek["csapda7"] SetHintString(level.stringek["csapda7"]);
	level.triggerek["csapda8"] SetHintString(level.stringek["csapda8"]);
	level.triggerek["figyelem1"] SetHintString(level.stringek["figyelem1"]);
	level.triggerek["RTD"] SetHintString(level.stringek["figyelem2"]);
	level.triggerek["figyelem3"] SetHintString(level.stringek["figyelem3"]);
	level.triggerek["figyelem4"] SetHintString(level.stringek["figyelem4"]);
	level.triggerek["figyelem5"] SetHintString(level.stringek["figyelem5"]);
	level.triggerek["figyelem6"] SetHintString(level.stringek["figyelem6"]);
	level.triggerek["figyelem7"] SetHintString(level.stringek["figyelem7"]);
	level.triggerek["figyelem8"] SetHintString(level.stringek["figyelem8"]);
	level.triggerek["figyelem9"] SetHintString(level.stringek["figyelem9"]);
	
	for (i = 0; i < level.brushok["csapda4_fal_0"].size; i++)
	{
		level.brushok["csapda4_fal_0"][i] NotSolid();
	}
	for (i = 0; i < level.brushok["csapda4_fal_1"].size; i++)
	{
		level.brushok["csapda4_fal_1"][i] NotSolid();
	}
	for (i = 0; i < level.brushok["csapda4_fal_2"].size; i++)
	{
		level.brushok["csapda4_fal_2"][i] NotSolid();
	}
	for (i = 0; i < level.brushok["csapda4_fal_3"].size; i++)
	{
		level.brushok["csapda4_fal_3"][i] NotSolid();
	}
	for (i = 0; i < level.brushok["nehezites2_1"].size; i++)
	{
		level.brushok["nehezites2_1"][i] NotSolid();
	}
	for (i = 0; i < level.brushok["nehezites2_2"].size; i++)
	{
		level.brushok["nehezites2_2"][i] NotSolid();
	}
	for (i = 0; i < level.brushok["nehezites2_3"].size; i++)
	{
		level.brushok["nehezites2_3"][i] NotSolid();
	}
}


//(Esési)sérülést ad a játékosnak, majd visszaállítja a teljes életet
SerulesMajdElet()
{
	while (true)
	{
		level.triggerek["esesiserules"] waittill("trigger", kivalto);
		if (!kivalto.leesett)
		{
			tamado = Spawn("script_origin", kivalto.origin);
			kivalto FinishPlayerDamage(tamado, tamado, 90, 0, "MOD_FALLING", "jump_mp", kivalto.origin, AnglesToForward((0,0,0)), "none", 0);
			kivalto thread SerulesMajdElet_Seged();
			kivalto.leesett = true;
		}
		if (level.szonyegekTorolve == 42)
		{
			kivalto IPrintLnBold(level.stringek["nincsszonyeg"]);
			wait 2;
			kivalto SetOrigin(level.originek["titok1"]);
		}
	}
}
//!!!Direkt meghívása TILOS, a SerulesMajdElet() hívja meg!!!
SerulesMajdElet_Seged()
{
	wait 2;
	self.health = 100;
	self IPrintLnBold(level.stringek["eletvisszaadva"]);
}


//Visszaszámol egy textúra cserélgetésével, majd aktiválja a teleportot az aktivátor számára
AktivatorTeleportSzamlalo()
{
	level.brushok["szamlalo_1x"] Hide();
	for (i = 0; i < 10; i++)
	{
		nev = "szamlalo_x" + i;
		level.brushok[nev] Hide();
	}
	level.brushok["szamlalo_2x"] Show();
	level.brushok["szamlalo_x0"] Show();
	level waittill("round_started", hanyadik);
	
	wait 1;
	level.brushok["szamlalo_2x"] Hide();
	level.brushok["szamlalo_x0"] Hide();
	level.brushok["szamlalo_1x"] Show();
	level.brushok["szamlalo_x9"] Show();
	wait 1;
	level.brushok["szamlalo_x9"] Hide();
	level.brushok["szamlalo_x8"] Show();
	wait 1;
	level.brushok["szamlalo_x8"] Hide();
	level.brushok["szamlalo_x7"] Show();
	wait 1;
	level.brushok["szamlalo_x7"] Hide();
	level.brushok["szamlalo_x6"] Show();
	wait 1;
	level.brushok["szamlalo_x6"] Hide();
	level.brushok["szamlalo_x5"] Show();
	wait 1;
	level.brushok["szamlalo_x5"] Hide();
	level.brushok["szamlalo_x4"] Show();
	wait 1;
	level.brushok["szamlalo_x4"] Hide();
	level.brushok["szamlalo_x3"] Show();
	wait 1;
	level.brushok["szamlalo_x3"] Hide();
	level.brushok["szamlalo_x2"] Show();
	wait 1;
	level.brushok["szamlalo_x2"] Hide();
	level.brushok["szamlalo_x1"] Show();
	wait 1;
	level.brushok["szamlalo_x1"] Hide();
	level.brushok["szamlalo_x0"] Show();
	wait 1;
	level.brushok["szamlalo_1x"] Hide();
	level.brushok["szamlalo_x0"] Hide();
	level.brushok["szamlalo_x9"] Show();
	wait 1;
	level.brushok["szamlalo_x9"] Hide();
	level.brushok["szamlalo_x8"] Show();
	wait 1;
	level.brushok["szamlalo_x8"] Hide();
	level.brushok["szamlalo_x7"] Show();
	wait 1;
	level.brushok["szamlalo_x7"] Hide();
	level.brushok["szamlalo_x6"] Show();
	wait 1;
	level.brushok["szamlalo_x6"] Hide();
	level.brushok["szamlalo_x5"] Show();
	wait 1;
	level.brushok["szamlalo_x5"] Hide();
	level.brushok["szamlalo_x4"] Show();
	wait 1;
	level.brushok["szamlalo_x4"] Hide();
	level.brushok["szamlalo_x3"] Show();
	wait 1;
	level.brushok["szamlalo_x3"] Hide();
	level.brushok["szamlalo_x2"] Show();
	wait 1;
	level.brushok["szamlalo_x2"] Hide();
	level.brushok["szamlalo_x1"] Show();
	wait 1;
	level.brushok["szamlalo_x1"] Hide();
	level.brushok["szamlalo_x0"] Show();
	wait 1;
	level.brushok["szamlalo_x0"] Hide();
    level.aktivatorTeleportKesz = true;
}


//Elteleportálja az aktivátort a kezdõ helyére, ha a visszaszámlálás letelt
AktivatorTeleport(trigger, cel, fagyaszto, fxhely, uzenet)
{
	level endon("akti_teleport");
    while (true)
    {
        trigger waittill("trigger", kivalto);
        if (level.aktivatorTeleportKesz)
        {
			kivalto SetClientDVAR("cg_thirdperson", 1);
            kivalto LinkTo(fagyaszto);
            kivalto IPrintLnBold(level.stringek["aktivatorteleportkezdodik"]);
			wait 0.5;
			thread AktivatorTeleportEffekt(cel.origin, true);
			AktivatorTeleportEffekt(fxhely, false);
			wait 2.5;
			kivalto PlayLocalSound("teleport");
			wait 2.5;
			kivalto UnLink();
            kivalto SetOrigin(cel.origin);
			kivalto.angles = cel.angles;
            kivalto IPrintLnBold(uzenet);
			wait 2;
			kivalto SetClientDVAR("cg_thirdperson", 0);
        }
        else wait 0.25;
    }
}
AktivatorTeleportEffekt(hely, erkezesi)
{
	if (IsDefined(erkezesi) && erkezesi == true)
	{
		wait 2.5;
		PlayFX(level.effektek["aktivatorteleport_fenyes"], hely - (0, 0, 24));
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport"], hely - (0, 0, 16));
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport_fenyes"], hely - (0, 0, 8));
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport"], hely);
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport"], hely + (0, 0, 8));
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport"], hely + (0, 0, 16));
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport"], hely + (0, 0, 24));
	}
	else
	{
		PlayFX(level.effektek["aktivatorteleport_fenyes"], hely);
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport"], hely + (0, 0, 8));
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport_fenyes"], hely + (0, 0, 16));
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport"], hely + (0, 0, 24));
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport"], hely + (0, 0, 32));
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport"], hely + (0, 0, 40));
		wait 0.3;
		PlayFX(level.effektek["aktivatorteleport"], hely + (0, 0, 48));
	}
}


AktivatorGyors()
{
	while (true)
	{
		level.triggerek["aktigyors_be"] waittill("trigger", kivalto);
		level.activ SetMoveSpeedScale(2);
		level.triggerek["aktigyors_ki"] waittill("trigger", kivalto2);
		level.activ SetMoveSpeedScale(GetDVARFloat("dr_activators_speed"));
	}
}


//Visszateleportálja a szõnyegek körül leesett jumpereket
LeesesVisszaTeleportalo(trigger)
{
	while (true)
	{
		veletlen = RandomIntRange(1, 6);
		index = "leeses_" + veletlen;
		trigger waittill("trigger", kivalto);
		kivalto SetOrigin(level.originek[index].origin);
	}
}


//Mágikussá teszi a mágikus repülõ szõnyegeket
SzonyegAktivalo()
{
	for (i = 0; i < level.triggerek["szonyeg"].size; i++)
	{
		thread SzonyegTriggerek(i);
		wait 0.05;
	}
	while (true)
	{
		level waittill("szonyeg_triggelve", melyik, kivalto);
		legkisebbnev = "szonyeg_" + melyik;
		kivalto thread SzonyegMozgato(legkisebbnev);
		kivalto thread SzonyegHalalFigyelo(legkisebbnev);
		kivalto thread SzonyegHatarFigyelo1(legkisebbnev);
		kivalto thread SzonyegHatarFigyelo2(legkisebbnev, level.triggerek["szonyeg_kikapcsolo2"]);
		kivalto thread SzonyegHatarFigyelo2(legkisebbnev, level.triggerek["szonyeg_kikapcsolo3"]);
	}
}
//!!!Direkt meghívása TILOS, a SzonyegAktivalo() hívja meg!!!
SzonyegTriggerek(melyik)
{
	level.triggerek["szonyeg"][melyik] waittill("trigger", kivalto);
	level notify("szonyeg_triggelve", melyik, kivalto);
	level.triggerek["szonyeg"][melyik] Delete();
	level.szonyegekTorolve++;
}
//!!!Direkt meghívása TILOS, a SzonyegAktivalo() hívja meg!!!
SzonyegMozgato(index)
{
	self endon("death");
	self endon("szonyeg_off");
	
	szorzo = RandomIntRange(0, 20);
	hozzaado = RandomIntRange(1, 30);
	magassag = 1050 + (szorzo * hozzaado);
	self FreezeControls(true);
	level.brushok[index] MoveZ(magassag, 3, 2, 0.5);
	level.brushok[index] waittill("movedone");
	self FreezeControls(false);
	self AllowJump(false);
	level.brushok[index] LinkTo(self);
	wait 40;
	jatekosok = GetEntArray("player", "classname");
	tavolsagTomb =  [];
	for (i = 0; i < jatekosok.size; i++)
	{
		tavolsagTomb[i] = Distance(self.origin, jatekosok[i].origin);
	}
	level.brushok[index] UnLink();
	self AllowJump(true);
	talalat = true;
	while (talalat)
	{
		if (tavolsagTomb.size == 1) break;
		for (i = 0; i < tavolsagTomb.size; i++)
		{
			if (tavolsagTomb[i] < 72 && tavolsagTomb[i] > 1)
			{
				if (IsDefined(level.brushok[index]))
				level.brushok[index] Delete();
			}
			else if (i == (tavolsagTomb.size - 1)) talalat = false;
		}
	}
}
//!!!Direkt meghívása TILOS, a SzonyegAktivalo() hívja meg!!!
SzonyegHalalFigyelo(index)
{
	self waittill("death");
	level.brushok[index] UnLink();
	level.brushok[index] Delete();
	self AllowJump(true);
}
//!!!Direkt meghívása TILOS, a SzonyegAktivalo() hívja meg!!!
SzonyegHatarFigyelo1(index)
{
	while (true)
	{
		level.triggerek["szonyeg_kikapcsolo1"] waittill("trigger", kivalto);
		if (kivalto == self)
		{
			kivalto notify("szonyeg_off");
			jatekosok = GetEntArray("player", "classname");
			tavolsagTomb =  [];
			for (i = 0; i < jatekosok.size; i++)
			{
				tavolsagTomb[i] = Distance(self.origin, jatekosok[i].origin);
			}
			level.brushok[index] UnLink();
			self AllowJump(true);
			talalat = true;
			while (talalat)
			{
				if (tavolsagTomb.size == 1) break;
				for (i = 0; i < tavolsagTomb.size; i++)
				{
					if (tavolsagTomb[i] < 72 && tavolsagTomb[i] > 1)
					{
						if (IsDefined(level.brushok[index]))
						level.brushok[index] Delete();
					}
					else if (i == (tavolsagTomb.size - 1)) talalat = false;
				}
			}
		}
	}
}
//!!!Direkt meghívása TILOS, a SzonyegAktivalo() hívja meg!!!
SzonyegHatarFigyelo2(index, trigger)
{
	while (true)
	{
		trigger waittill("trigger", kivalto);
		if (kivalto == self)
		{
			kivalto notify("szonyeg_off");
			level.brushok[index] UnLink();
			level.brushok[index] Delete();
			self AllowJump(true);
		}
	}
}


//A víz-képernyõ (HUD elem) kirakásáért és törléséért felel
VizFigyelo()
{
	while (true)
	{
		level.triggerek["viz_be"] waittill("trigger", kivalto);
		if (kivalto.viz == false)
		{
			kivalto.viz = true;
			kivalto thread VizHUD();
		}
	}
}
//!!!Direkt meghívása TILOS, a VizFigyelo() hívja meg!!!
VizHUD()
{
    viz = NewClientHudElem(self);
    viz.horzalign = "fullscreen";
	viz.vertalign = "fullscreen";
	viz.alpha = 0.5;
	viz.color = (0, 0.5, 1);
	viz SetShader( "white", 640, 480 );
	while (true)
	{
		level.triggerek["viz_ki"] waittill("trigger", kivalto);
		if (kivalto == self)
		{
			kivalto.viz = false;
			if (IsDefined(viz)) viz Destroy();
			break;
		}
	}
}


//Figyelmezteti a játékosokat az RTD használatra
RTDAnnounce()
{
	while (true)
	{
		level.triggerek["RTD_announce"] waittill("trigger", kivalto);
		if (!IsDefined(kivalto.RTDannounced) || kivalto.RTDannounced == false)
		{
			kivalto.RTDannounced = true;
			kivalto IPrintLnBold(level.stringek["RTD_announce"]);
		}
	}
}