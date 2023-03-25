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


main()
{
	
	ValtozoBevezeto();
	KezdetiBevezeto();
	
	wait 1;
	
	maps\mp\_load::main();
	
	maps\mp\mp_dr_iwillrockyou_csapdak::CsapdakInditasa();
	maps\mp\mp_dr_iwillrockyou_titkok::TitkokInditasa();
	maps\mp\mp_dr_iwillrockyou_end::EndInditasa();
	thread maps\mp\Roll_the_Dice::RTDInditasa(level.triggerek["RTD"]);
	
	thread HazRobbanas();
	thread ZeneValasztas(); 
	thread To();
	thread AktiFal();
	thread AktiTeleport();
	thread Raketa();
	thread AktivatorPotlo();
	thread RTDAnnounce();
	thread NeoSpam(level.stringek["neospam"]);
	thread NeoConnect();
	thread KorVegeHang("victory", "defeat", "ace");
	thread HalalHang("killed");
}


ValtozoBevezeto()
{
	level.trapTriggers = [];
    level.triggerek = [];
    level.brushok = [];
	level.originek = [];
	level.modelek = [];
    level.stringek = [];
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
	level.triggerek["zene"] = [];
	level.triggerek["zene"][0] = GetEnt("trigger_zene_0", "targetname");
	level.triggerek["zene"][1] = GetEnt("trigger_zene_1", "targetname");
	level.triggerek["zene"][2] = GetEnt("trigger_zene_2", "targetname");
	level.triggerek["zene"][3] = GetEnt("trigger_zene_3", "targetname");
	level.triggerek["zene"][4] = GetEnt("trigger_zene_4", "targetname");
	level.triggerek["to_viz"] = GetEnt("trigger_to_viz", "targetname");
	level.triggerek["to_felszin"] = GetEnt("trigger_to_felszin", "targetname");
	level.triggerek["aktifal_1"] = GetEnt("trigger_aktifal_1", "targetname");
	level.triggerek["aktifal_2"] = GetEnt("trigger_aktifal_2", "targetname");
	level.triggerek["teleport_1"] = GetEnt("trigger_teleport_1", "targetname");
	level.triggerek["teleport_2"] = GetEnt("trigger_teleport_2", "targetname");
	level.triggerek["csapda1"] = GetEnt("trigger_csapda1", "targetname");
	level.triggerek["csapda1_szuro"] = GetEnt("trigger_csapda1_szuro", "targetname");
	level.triggerek["csapda1_oszlop"] = [];
	for (i = 0; i < 14; i++)
	{
		level.triggerek["csapda1_oszlop"][i] = GetEnt("trigger_csapda1_" + i, "targetname");
	}
	level.triggerek["csapda2"] = GetEnt("trigger_csapda2", "targetname");
	level.triggerek["csapda3"] = GetEnt("trigger_csapda3", "targetname");
	level.triggerek["csapda3_halal"] = [];
	level.triggerek["csapda3_halal"][0] = GetEnt("trigger_csapda3_halal_0", "targetname");
	level.triggerek["csapda3_halal"][1] = GetEnt("trigger_csapda3_halal_1", "targetname");
	level.triggerek["csapda3_halal"][2] = GetEnt("trigger_csapda3_halal_2", "targetname");
	level.triggerek["csapda3_halal"][3] = GetEnt("trigger_csapda3_halal_3", "targetname");
	level.triggerek["csapda4"] = GetEnt("trigger_csapda4", "targetname");
	level.triggerek["csapda5"] = GetEnt("trigger_csapda5", "targetname");
	level.triggerek["csapda6"] = GetEnt("trigger_csapda6", "targetname");
	level.triggerek["csapda7"] = GetEnt("trigger_csapda7", "targetname");
	level.triggerek["csapda8"] = GetEnt("trigger_csapda8", "targetname");
	level.triggerek["csapda8_viz"] = GetEnt("trigger_csapda8_viz", "targetname");
	level.triggerek["csapda8_felszin"] = GetEnt("trigger_csapda8_felszin", "targetname");
	level.triggerek["elsoend"] = GetEnt("trigger_elsoend", "targetname");
	level.triggerek["end_old"] = GetEnt("trigger_end_old", "targetname");
	level.triggerek["end_knife"] = GetEnt("trigger_end_knife", "targetname");
	level.triggerek["end_sniper"] = GetEnt("trigger_end_sniper", "targetname");
	level.triggerek["end_racing"] = GetEnt("trigger_end_racing", "targetname");
	level.triggerek["titok1_elso"] = GetEnt("trigger_titok1_elso", "targetname");
	level.triggerek["titok1_masodik"] = GetEnt("trigger_titok1_masodik", "targetname");
	level.triggerek["titok1_harmadik"] = GetEnt("trigger_titok1_harmadik", "targetname");
	level.triggerek["titok2"] = GetEnt("trigger_titok2", "targetname");
	level.triggerek["titok3_aktivalas"] = GetEnt("trigger_titok3_aktivalas", "targetname");
	level.triggerek["titok3_hely"] = GetEnt("trigger_titok3_hely", "targetname");
	level.triggerek["titok3_old"] = GetEnt("trigger_titok3_old", "targetname");
	level.triggerek["titok3_knife"] = GetEnt("trigger_titok3_knife", "targetname");
	level.triggerek["titok3_sniper"] = GetEnt("trigger_titok3_sniper", "targetname");
	level.triggerek["titok3_racing"] = GetEnt("trigger_titok3_racing", "targetname");
	level.triggerek["titok2_plusz"] = GetEnt("trigger_titok2_plusz", "targetname");
	level.triggerek["titok4_be"] = GetEnt("trigger_titok4_be", "targetname");
	level.triggerek["titok4_ki"] = GetEnt("trigger_titok4_ki", "targetname");
	level.triggerek["racing_akti"] = GetEnt("trigger_racing_akti", "targetname");
	level.triggerek["racing_jumper"] = GetEnt("trigger_racing_jumper", "targetname");
	level.triggerek["racing_leeses"] = GetEnt("trigger_racing_leeses", "targetname");
	level.triggerek["racing_raketa"] = GetEnt("trigger_racing_raketa", "targetname");
	
    
    //level.brushok[]
	level.brushok["kezdo_ablak1"] = GetEnt("brush_kezdo_ablak1", "targetname");
	level.brushok["kezdo_ablak2"] = GetEnt("brush_kezdo_ablak2", "targetname");
	level.brushok["kezdo_ajto1"] = GetEnt("brush_kezdo_ajto1", "targetname");
	level.brushok["kezdo_ajto2"] = GetEnt("brush_kezdo_ajto2", "targetname");
	level.brushok["kezdo_fal"] = [];
	level.brushok["kezdo_fal"][1] = [];
	level.brushok["kezdo_fal"][1] = GetEntArray("brush_kezdo_fal1", "targetname");
	level.brushok["kezdo_fal"][2] = [];
	level.brushok["kezdo_fal"][2] = GetEntArray("brush_kezdo_fal2", "targetname");
	level.brushok["kezdo_fal"][3] = [];
	level.brushok["kezdo_fal"][3] = GetEntArray("brush_kezdo_fal3", "targetname");
	level.brushok["kezdo_fal"][4] = [];
	level.brushok["kezdo_fal"][4] = GetEntArray("brush_kezdo_fal4", "targetname");
	level.brushok["zenefal"] = GetEnt("brush_zenefal", "targetname");
	level.brushok["zene"] = [];
	level.brushok["zene"][0] = GetEnt("brush_zene_0", "targetname");
	level.brushok["zene"][1] = GetEnt("brush_zene_1", "targetname");
	level.brushok["zene"][2] = GetEnt("brush_zene_2", "targetname");
	level.brushok["zene"][3] = GetEnt("brush_zene_3", "targetname");
	level.brushok["zene"][4] = GetEnt("brush_zene_4", "targetname");
	level.brushok["aktifal_1"] = GetEnt("brush_aktifal_1", "targetname");
	level.brushok["aktifal_2"] = GetEnt("brush_aktifal_2", "targetname");
	level.brushok["aktifal_tolo"] = GetEnt("brush_aktifal_tolo", "targetname");
	level.brushok["teleport_kapcsolo"] = GetEnt("brush_teleport_kapcsolo", "targetname");
	level.brushok["teleport_padlo"] = GetEnt("brush_teleport_padlo", "targetname");
	level.brushok["teleport1_forog_1"] = GetEntArray("brush_teleport1_forog_1", "targetname");
	level.brushok["teleport1_emelkedik"] = GetEntArray("brush_teleport1_emelkedik", "targetname");
	level.brushok["teleport2_forog_1"] = GetEntArray("brush_teleport2_forog_1", "targetname");
	level.brushok["teleport2_emelkedik"] = GetEntArray("brush_teleport2_emelkedik", "targetname");
	level.brushok["raketa_fo"] = GetEnt("brush_raketa_fo", "targetname");
	level.brushok["raketa_reszek"] = GetEntArray("brush_raketa_reszek", "targetname");
	level.brushok["nehezites1"] = GetEntArray("brush_nehezites1", "targetname");
	level.brushok["nehezites1_forog"] = GetEntArray("brush_nehezites1_forog", "targetname");
	level.brushok["nehezites1_forog_fo"] = GetEnt("brush_nehezites1_forog_fo", "targetname");
	level.brushok["csapda1_oszlop"] = [];
	for (i = 0; i < 14; i++)
	{
		level.brushok["csapda1_oszlop"][i] = GetEnt("brush_csapda1_" + i, "targetname");
	}
	level.brushok["csapda1_emel"] = GetEntArray("brush_csapda1_emel", "targetname");
	level.brushok["csapda2"] = [];
	level.brushok["csapda2"][0] = GetEnt("brush_csapda2_0", "targetname");
	level.brushok["csapda2"][1] = GetEnt("brush_csapda2_1", "targetname");
	level.brushok["csapda2"][2] = GetEnt("brush_csapda2_2", "targetname");
	level.brushok["csapda2"][3] = GetEnt("brush_csapda2_3", "targetname");
	level.brushok["csapda2"][4] = GetEnt("brush_csapda2_4", "targetname");
	level.brushok["csapda3"] = [];
	level.brushok["csapda3"][0] = GetEnt("brush_csapda3_0", "targetname");
	level.brushok["csapda3"][1] = GetEnt("brush_csapda3_1", "targetname");
	level.brushok["csapda3"][2] = GetEnt("brush_csapda3_2", "targetname");
	level.brushok["csapda3"][3] = GetEnt("brush_csapda3_3", "targetname");
	level.brushok["csapda4_0"] = GetEntArray("brush_csapda4_0", "targetname");
	level.brushok["csapda4_1"] = GetEntArray("brush_csapda4_1", "targetname");
	level.brushok["csapda5_0"] = GetEnt("brush_csapda5_0", "targetname");
	level.brushok["csapda5_1"] = GetEnt("brush_csapda5_1", "targetname");
	level.brushok["csapda6_platform"] = [];
	level.brushok["csapda6_platform"][0] = GetEnt("brush_csapda6_platform_0", "targetname");
	level.brushok["csapda6_platform"][1] = GetEnt("brush_csapda6_platform_1", "targetname");
	level.brushok["csapda6_platform"][2] = GetEnt("brush_csapda6_platform_2", "targetname");
	level.brushok["csapda6_platform"][3] = GetEnt("brush_csapda6_platform_3", "targetname");
	level.brushok["csapda6_platform"][4] = GetEnt("brush_csapda6_platform_4", "targetname");
	level.brushok["csapda6_ladder"] = [];
	level.brushok["csapda6_ladder"][0] = GetEnt("brush_csapda6_ladder_0", "targetname");
	level.brushok["csapda6_ladder"][1] = GetEnt("brush_csapda6_ladder_1", "targetname");
	level.brushok["csapda6_ladder"][2] = GetEnt("brush_csapda6_ladder_2", "targetname");
	level.brushok["csapda6_ladder"][3] = GetEnt("brush_csapda6_ladder_3", "targetname");
	level.brushok["csapda6_ladder"][4] = GetEnt("brush_csapda6_ladder_4", "targetname");
	level.brushok["csapda7_mozog"] = GetEnt("brush_csapda7_mozog", "targetname");
	level.brushok["csapda7_korok"] = GetEntArray("brush_csapda7_kor", "targetname");
	level.brushok["csapda7_kor_kulon"] = GetEnt("brush_csapda7_kor_kulon", "targetname");
	level.brushok["csapda7_kor_clip"] = GetEnt("brush_csapda7_kor_clip", "targetname");
	level.brushok["csapda7_forgok"] = GetEntArray("brush_csapda7_forog", "targetname");
	level.brushok["csapda7_negyzetek"] = GetEntArray("brush_csapda7_negyzet", "targetname");
	level.brushok["csapda8_0"] = GetEnt("brush_csapda8_0", "targetname");
	level.brushok["csapda8_1"] = GetEnt("brush_csapda8_1", "targetname");
	level.brushok["csapda8_2"] = GetEnt("brush_csapda8_2", "targetname");
	level.brushok["multiend"] = GetEnt("brush_multiend", "targetname");
	level.brushok["endelzaro_old"] = GetEnt("brush_endelzaro_old", "targetname");
	level.brushok["endelzaro_knife"] = GetEnt("brush_endelzaro_knife", "targetname");
	level.brushok["endelzaro_sniper"] = GetEnt("brush_endelzaro_sniper", "targetname");
	level.brushok["endelzaro_racing"] = GetEnt("brush_endelzaro_racing", "targetname");
	level.brushok["end_oldajto"] = GetEnt("brush_end_oldajto", "targetname");
	level.brushok["end_oldelzaro"] = GetEnt("brush_end_oldelzaro", "targetname");
	level.brushok["sniper_falak"] = GetEntArray("brush_sniper_falak", "targetname");
	level.brushok["titok1_ajto"] = GetEnt("brush_titok1_ajto", "targetname");
	level.brushok["titok1_ajto2"] = GetEnt("brush_titok1_ajto2", "targetname");
	level.brushok["titok3_ajto"] = GetEnt("brush_titok3_ajto", "targetname");
	level.brushok["racing_akti"] = GetEntArray("brush_racing_akti", "targetname");
	level.brushok["racing_forog"] = GetEntArray("brush_racing_forog", "targetname");
	level.brushok["racing_forog_2"] = GetEntArray("brush_racing_forog_2", "targetname");
	level.brushok["jelzes_csapda1_piros"] = GetEnt("brush_jelzes_csapda1_piros", "targetname");
	level.brushok["jelzes_csapda1_kek"] = GetEnt("brush_jelzes_csapda1_kek", "targetname");
	level.brushok["jelzes_csapda2_piros"] = GetEnt("brush_jelzes_csapda2_piros", "targetname");
	level.brushok["jelzes_csapda2_kek"] = GetEnt("brush_jelzes_csapda2_kek", "targetname");
	level.brushok["jelzes_csapda3_piros"] = GetEnt("brush_jelzes_csapda3_piros", "targetname");
	level.brushok["jelzes_csapda3_kek"] = GetEnt("brush_jelzes_csapda3_kek", "targetname");
	level.brushok["jelzes_csapda4_piros"] = GetEnt("brush_jelzes_csapda4_piros", "targetname");
	level.brushok["jelzes_csapda4_kek"] = GetEnt("brush_jelzes_csapda4_kek", "targetname");
	level.brushok["jelzes_csapda5_piros"] = GetEnt("brush_jelzes_csapda5_piros", "targetname");
	level.brushok["jelzes_csapda5_kek"] = GetEnt("brush_jelzes_csapda5_kek", "targetname");
	level.brushok["jelzes_csapda6_piros"] = GetEnt("brush_jelzes_csapda6_piros", "targetname");
	level.brushok["jelzes_csapda6_kek"] = GetEnt("brush_jelzes_csapda6_kek", "targetname");
	level.brushok["jelzes_csapda7_piros"] = GetEnt("brush_jelzes_csapda7_piros", "targetname");
	level.brushok["jelzes_csapda7_kek"] = GetEnt("brush_jelzes_csapda7_kek", "targetname");
	level.brushok["jelzes_csapda8_piros"] = GetEnt("brush_jelzes_csapda8_piros", "targetname");
	level.brushok["jelzes_csapda8_kek"] = GetEnt("brush_jelzes_csapda8_kek", "targetname");
	
	
	//level.originek[]
	level.originek["kezdo_kozep1"] = GetEnt("origin_kezdo_kozep1", "targetname");
	level.originek["kezdo_kozep2"] = GetEnt("origin_kezdo_kozep2", "targetname");
	level.originek["aktifal_1"] = GetEnt("origin_aktifal_1", "targetname");
	level.originek["aktifal_2"] = GetEnt("origin_aktifal_2", "targetname");
	level.originek["teleport1_kozeppont_1"] = GetEnt("origin_teleport1_kozeppont_1", "targetname");
	level.originek["teleport1_kozeppont_2"] = GetEnt("origin_teleport1_kozeppont_2", "targetname");
	level.originek["teleport2_kozeppont_1"] = GetEnt("origin_teleport2_kozeppont_1", "targetname");
	level.originek["teleport2_kozeppont_2"] = GetEnt("origin_teleport2_kozeppont_2", "targetname");
	level.originek["teleport_erkezes"] = GetEnt("origin_teleport_erkezes", "targetname");
	level.originek["raketa_ut"] = [];
	level.originek["raketa_ut"][0] = GetEnt("origin_raketa_0", "targetname");
	level.originek["raketa_ut"][1] = GetEnt("origin_raketa_1", "targetname");
	level.originek["raketa_ut"][2] = GetEnt("origin_raketa_2", "targetname");
	level.originek["raketa_ut"][3] = GetEnt("origin_raketa_3", "targetname");
	level.originek["raketa_ut"][4] = GetEnt("origin_raketa_4", "targetname");
	level.originek["raketa_ut"][5] = GetEnt("origin_raketa_5", "targetname");
	level.originek["global_effekt"] = GetEnt("origin_global_effekt", "targetname");
	level.originek["lampa"] = GetEntArray("origin_lampa", "targetname");
	level.originek["old"] = GetEnt("origin_old", "targetname");
	level.originek["knife_akti"] = GetEnt("origin_knife_akti", "targetname");
	level.originek["knife_jumper"] = GetEnt("origin_knife_jumper", "targetname");
	level.originek["sniper_akti"] = GetEnt("origin_sniper_akti", "targetname");
	level.originek["sniper_jumper"] = GetEnt("origin_sniper_jumper", "targetname");
	level.originek["sniper_modelek"] = GetEntArray("origin_sniper_models", "targetname");
	level.originek["racing_akti"] = GetEnt("origin_racing_akti", "targetname");
	level.originek["racing_jumpers"] = GetEntArray("origin_racing_jumper", "targetname");
	level.originek["racing_raketa"] = GetEntArray("origin_racing_raketa", "targetname");
	level.originek["racing_raketa_start"] = GetEnt("origin_racing_raketa_start", "targetname");
	level.originek["racing_raketa_cel"] = GetEnt("origin_racing_raketa_cel", "targetname");
	level.originek["racing_raketa_halal"] = GetEntArray("origin_racing_raketa_halal", "targetname");
	
	
	//level.modelek[]
	level.modelek["aktifal_1"] = GetEnt("model_aktifal_1", "targetname");
	level.modelek["aktifal_2"] = GetEnt("model_aktifal_2", "targetname");
	level.modelek["teleport"] = GetEnt("model_teleport", "targetname");
	level.modelek["teleport1_forog_2"] = GetEntArray("model_teleport1_forog_2", "targetname");
	level.modelek["teleport2_forog_2"] = GetEntArray("model_teleport2_forog_2", "targetname");
	level.modelek["csapda1"] = GetEnt("model_csapda1", "targetname");
	level.modelek["csapda2"] = GetEnt("model_csapda2", "targetname");
	level.modelek["csapda3"] = GetEnt("model_csapda3", "targetname");
	level.modelek["csapda4"] = GetEnt("model_csapda4", "targetname");
	level.modelek["csapda5"] = GetEnt("model_csapda5", "targetname");
	level.modelek["csapda6"] = GetEnt("model_csapda6", "targetname");
	level.modelek["csapda7"] = GetEnt("model_csapda7", "targetname");
	level.modelek["csapda8"] = GetEnt("model_csapda8", "targetname");
	
	
    //level.stringek[]
	level.stringek["zene"] = [];
	level.stringek["zene"][0] = " ^3has choosen ^2Papa Roach - Last Resort^3!";
	level.stringek["zene"][1] = " ^3has choosen ^4AC/DC - Highway To Hell^3!";
	level.stringek["zene"][2] = " ^3has choosen ^1Metallica - For Whom The Bell Tolls^3!";
	level.stringek["zene"][3] = " ^3has choosen ^9Manowar - Die for Metal^3!";
	level.stringek["zene"][4] = " ^3has choosen ^5Queen - We Will Rock You^3!";
	level.stringek["map_endelve1"] = " ^3ended the map FIRST.";
	level.stringek["map_endelve2"] = "^2He will choose an end-game now.";
	level.stringek["titok_kapcsolo"] = " ^1has pulled a hidden switch...";
	level.stringek["titok_loves"] = " ^1has shot a wall randomly...";
	level.stringek["titok1"] = " ^1has found a shorter way on the map!";
	level.stringek["titok2_elozetes_1"] = "^6Interesting choice of the 5th pillar...";
	level.stringek["titok2_elozetes_2"] = "^6Pressing F randomly on the map?";
	level.stringek["titok2_1"] = " ^9is blessed by the mapmaker. Lucky guy...";
	level.stringek["titok2_2"] = "^9He gets +2 lives, 500 HP and invisibility for 60 seconds!";
	level.stringek["titok3"] = " ^5has chosen the endgame secretly, he picked: ";
	level.stringek["RTD_announce"] = "^3You ^2can activate ^1RTD here ^2by pressing ^3->USE<-^2!";
	level.stringek["neospam"] = "^1--->^3Map made by ^2Neo^1<---";
	level.stringek["csapda1_oszlop"] = "^1Press ^3->USE<- ^1 to activate pillars!";
	
	
	//level.effektek[]
	level.effektek["fust"] = LoadFX("sajat/fust");
	level.effektek["robbanas"] = LoadFX("sajat/falrobbanas");
	level.effektek["kiloves"] = LoadFX("fire/launchtube_fire");
	level.effektek["kod"] = LoadFX("weather/cloud_bank_far");
	level.effektek["eso"] = LoadFX("weather/rain_heavy_cloudtype");
	level.effektek["villam_1"] = LoadFX("weather/lightning_a");
	level.effektek["villam_2"] = LoadFX("weather/lightning_b");
	level.effektek["villam_nagy"] = LoadFX("weather/lightning_bolt_lrg");
	level.effektek["ver1"] = LoadFX("impacts/deathfx_dogbite");
	level.effektek["ver2"] = LoadFX("impacts/deathfx_bloodpool_ambush");
	level.effektek["killer_villam"] = LoadFX("sajat/phaedrean_lightning");
	level.effektek["killer_villam_impact"] = LoadFX("sajat/phaedrean_lightning_impact");
	level.effektek["teleport"] = LoadFX("sajat/phaedrean_teleporter_fx");
	level.effektek["bigboom1"] = LoadFX("smoke/icbm_launch");
	level.effektek["bigboom2"] = LoadFX("explosions/nuke_explosion");
	level.effektek["bigboom3"] = LoadFX("explosions/nuke_cap_child");
	level.effektek["csapda"] = LoadFX("misc/light_glow_red_generic_pulse");
	
	
	//Egyéb változók
	level.elsoEndelo = undefined;
	level.elsoEndMegvolt = false;
	level.melyikEnd = undefined;
	level.end_sniper_modelek = [];
	level.titok3 = undefined;
}


KezdetiBevezeto()
{
	PreCacheShader("black");
	PreCacheShader("white");
	PreCacheShader("zene_acdc_kep");
	PreCacheShader("zene_dieformetal_kep");
	PreCacheShader("zene_lastresort_kep");
	PreCacheShader("zene_metallica_kep");
	PreCacheShader("zene_wewillrockyou_kep");
	PreCacheItem("rpg_mp");
	PreCacheItem("frag_grenade_mp");
	PreCacheItem("m40a3_mp");
	PreCacheItem("m21_mp");
	PreCacheItem("dragunov_mp");
	PreCacheItem("remington700_mp");
	PreCacheItem("barrett_mp");
	PreCacheModel("prop_misc_rock_boulder_04");
	PreCacheModel("com_bomb_objective");
	PreCacheModel("ch_crate64x64");
	PreCacheModel("com_barrel_biohazard_dirt");
	PreCacheModel("vehicle_80s_hatch1_silv_destructible_mp");
	PreCacheModel("vehicle_80s_hatch1_brn_destructible_mp");
	
	SetDVAR("r_specularcolorscale", "25");
	
	for (i = 0; i < 14; i++)
	{
		level.triggerek["csapda1_oszlop"][i] SetHintString(level.stringek["csapda1_oszlop"]);
	}
	
	for (i = 0; i < level.brushok["zene"].size; i++)
	{
		level.brushok["zene"][i] LinkTo(level.brushok["zenefal"]);
	}
	
	for (i = 0; i < level.brushok["raketa_reszek"].size; i++)
	{
		level.brushok["raketa_reszek"][i] LinkTo(level.brushok["raketa_fo"]);
	}

	level.brushok["aktifal_2"] Hide();
	
	level.brushok["teleport1_emelkedik"][0] LinkTo(level.brushok["teleport1_emelkedik"][1]);
	level.brushok["teleport2_emelkedik"][0] LinkTo(level.brushok["teleport2_emelkedik"][1]);
	for (i = 0; i < level.brushok["teleport1_forog_1"].size; i++)
	{
		level.brushok["teleport1_forog_1"][i] NotSolid();
	}
	for (i = 0; i < level.brushok["teleport2_forog_1"].size; i++)
	{
		level.brushok["teleport2_forog_1"][i] NotSolid();
	}
	level.brushok["teleport1_emelkedik"][0] NotSolid();
	level.brushok["teleport1_emelkedik"][1] NotSolid();
	level.brushok["teleport2_emelkedik"][0] NotSolid();
	level.brushok["teleport2_emelkedik"][1] NotSolid();
	
	level.modelek["teleport"] LinkTo(level.brushok["teleport_kapcsolo"]);
	
	level.brushok["csapda7_kor_kulon"] LinkTo(level.brushok["csapda7_kor_clip"]);
	level.brushok["csapda7_korok"][level.brushok["csapda7_korok"].size] = level.brushok["csapda7_kor_clip"];
	
	level.brushok["jelzes_csapda1_piros"] Hide();
	level.brushok["jelzes_csapda2_piros"] Hide();
	level.brushok["jelzes_csapda3_piros"] Hide();
	level.brushok["jelzes_csapda4_piros"] Hide();
	level.brushok["jelzes_csapda5_piros"] Hide();
	level.brushok["jelzes_csapda6_piros"] Hide();
	level.brushok["jelzes_csapda7_piros"] Hide();
	level.brushok["jelzes_csapda8_piros"] Hide();
}


HazRobbanas()
{
	level waittill("round_started", sorszam);
	wait 3;

	for (i = 0; i < level.brushok["kezdo_fal"][1].size; i++)
	{
		level.brushok["kezdo_fal"][1][i] MoveY(-80, 5);
	}
	for (i = 0; i < level.brushok["kezdo_fal"][3].size; i++)
	{
		level.brushok["kezdo_fal"][3][i] MoveY(80, 5);
	}
	for (i = 0; i < level.brushok["kezdo_fal"][2].size; i++)
	{
		level.brushok["kezdo_fal"][2][i] MoveX(-80, 5);
	}
	for (i = 0; i < level.brushok["kezdo_fal"][4].size; i++)
	{
		level.brushok["kezdo_fal"][4][i] MoveX(80, 5);
	}
	wait 0.5;
	
	PlayFX(level.effektek["fust"], level.originek["kezdo_kozep1"] GetOrigin());
	PlayFX(level.effektek["fust"], level.originek["kezdo_kozep2"] GetOrigin());
	Earthquake(0.9, 8, level.originek["kezdo_kozep1"] GetOrigin(), 750);
	
	level.brushok["kezdo_ablak1"] Delete();
	level.brushok["kezdo_ablak2"] Delete();
	level.brushok["kezdo_ajto1"] Delete();
	level.brushok["kezdo_ajto2"] Delete();
}


ZeneValasztas()
{
	thread TobbTriggerFigyeles(level.triggerek["zene"][0], "zene_kivalasztva", "0");
	thread TobbTriggerFigyeles(level.triggerek["zene"][1], "zene_kivalasztva", "1");
	thread TobbTriggerFigyeles(level.triggerek["zene"][2], "zene_kivalasztva", "2");
	thread TobbTriggerFigyeles(level.triggerek["zene"][3], "zene_kivalasztva", "3");
	thread TobbTriggerFigyeles(level.triggerek["zene"][4], "zene_kivalasztva", "4");
	
	kep = NewHudElem();
    kep.horzalign = "center";
	kep.vertalign = "middle";
	kep.x = -128;
	kep.y = -96;
	kep.alpha = 1;
	kep.hidden = false;
	kep.width = 256;
	kep.height = 192;
	kep.sort = 1001;
	
	level waittill("zene_kivalasztva", melyik, kivalto);
	switch (melyik)
	{
		case "0":
			IPrintLnBold("^2" + kivalto.name + level.stringek["zene"][0]);
			kep SetShader("zene_lastresort_kep", 256, 192);
			AmbientPlay("lastresort");
		break;
		case "1":
			IPrintLnBold("^2" + kivalto.name + level.stringek["zene"][1]);
			kep SetShader("zene_acdc_kep", 256, 192);
			AmbientPlay("highway");
		break;
		case "2":
			IPrintLnBold("^2" + kivalto.name + level.stringek["zene"][2]);
			kep SetShader("zene_metallica_kep", 256, 192);
			AmbientPlay("forwhom");
		break;
		case "3":
			IPrintLnBold("^2" + kivalto.name + level.stringek["zene"][3]);
			kep SetShader("zene_dieformetal_kep", 256, 192);
			AmbientPlay("dieformetal");
		break;
		case "4":
			IPrintLnBold("^2" + kivalto.name + level.stringek["zene"][4]);
			kep SetShader("zene_wewillrockyou_kep", 256, 192);
			AmbientPlay("wewillrockyou");
		break;
	}
	kep ScaleOverTime(4, 64, 48);
	for (i = 0; i < level.triggerek["zene"].size; i++)
	{
		level.triggerek["zene"][i] Delete();
	}
	level.brushok["zenefal"] MoveZ(-224, 5);
	level.brushok["zenefal"] waittill("movedone");
	kep Destroy();
	
	level notify("zene_kesz");
}


To()
{
	thread maps\mp\_drown::init(level.triggerek["to_viz"], level.triggerek["to_felszin"]);
}


AktiFal()
{
	level waittill("zene_kesz");
	
	thread AktiFal_Seged();
	level.triggerek["aktifal_1"] waittill("trigger", kivalto);
	
	PlayFX(level.effektek["robbanas"], level.originek["aktifal_1"] GetOrigin());
	level.modelek["aktifal_1"] Delete();
	wait 0.3;
	PlayFX(level.effektek["robbanas"], level.originek["aktifal_2"] GetOrigin());
	wait 0.1;
	level.brushok["aktifal_1"] Delete();
	level.brushok["aktifal_2"] Show();
}
AktiFal_Seged()
{
	level.triggerek["aktifal_2"] waittill("trigger", kivalto);
	
	PlayFX(level.effektek["robbanas"], level.originek["aktifal_1"] GetOrigin());
	level.modelek["aktifal_2"] Delete();
	wait 0.3;
	PlayFX(level.effektek["robbanas"], level.originek["aktifal_2"] GetOrigin());
	wait 0.1;
	level.brushok["aktifal_2"] Delete();
}


AktiTeleport()
{
	level endon("akti_teleport");

	level.triggerek["teleport_1"] waittill("trigger", kivalto);
	
	level.brushok["teleport_padlo"] MoveZ(-16, 1);
	wait 1;
	level.brushok["teleport_padlo"] MoveY(-16, 1);
	wait 1;
	level.brushok["teleport_kapcsolo"] MoveZ(90, 2);
	wait 2;
	
	level.triggerek["teleport_2"] waittill("trigger", kivalto);
	
	thread KapcsoloVissza();
	thread TeleportMozgas1();
	thread TeleportMozgas2();
	
	kivalto SetClientDVAR("cg_thirdperson", 1);	
	orig = Spawn("script_origin", kivalto GetOrigin());
	kivalto LinkTo(orig);	
	wait 1.5;
	PlayFX(level.effektek["teleport"], orig GetOrigin());
	wait 1;
	PlayFX(level.effektek["teleport"], level.originek["teleport_erkezes"] GetOrigin());
	wait 2;
	kivalto PlayLocalSound("teleport");
	wait 3.5;
	
	kivalto UnLink();
	orig Delete();
	kivalto SetOrigin(level.originek["teleport_erkezes"] GetOrigin());
	kivalto SetPlayerAngles(level.originek["teleport_erkezes"].angles);
	level notify("teleport_kesz_1");
	orig_uj = Spawn("script_origin", kivalto GetOrigin());
	kivalto LinkTo(orig_uj);
	
	wait 2;
	level notify("teleport_kesz_2");
	wait 1;
	
	kivalto UnLink();
	orig_uj Delete();
	kivalto SetClientDVAR("cg_thirdperson", 0);	
}
TeleportMozgas1()
{
	level.brushok["teleport1_emelkedik"][1] MoveZ(56, 1, 0.3, 0.3);
	for (i = 0; i < level.modelek["teleport1_forog_2"].size; i++)
	{
		level.modelek["teleport1_forog_2"][i] MoveZ(-108, 1, 0.3, 0.3);
	}
	level.modelek["teleport1_forog_2"][3] waittill("movedone");
	
	for (i = 0; i < level.brushok["teleport1_forog_1"].size; i++)
	{
		level.brushok["teleport1_forog_1"][i] LinkTo(level.originek["teleport1_kozeppont_1"]);
	}
	for (i = 0; i < level.modelek["teleport1_forog_2"].size; i++)
	{
		level.modelek["teleport1_forog_2"][i] LinkTo(level.originek["teleport1_kozeppont_2"]);
	}
	
	wait 0.5;
	
	thread OdaVissza(level.brushok["teleport1_emelkedik"][1], "Z", 72, 1.5, "teleport_kesz_1", 0.5, 0.5);
	
	level.originek["teleport1_kozeppont_1"] RotateYaw(3600, 12, 8, 2);
	level.originek["teleport1_kozeppont_2"] RotateYaw(-3600, 12, 8, 2);
}
TeleportMozgas2()
{
	for (i = 0; i < level.brushok["teleport2_forog_1"].size; i++)
	{
		level.brushok["teleport2_forog_1"][i] LinkTo(level.originek["teleport2_kozeppont_1"]);
	}
	for (i = 0; i < level.modelek["teleport2_forog_2"].size; i++)
	{
		level.modelek["teleport2_forog_2"][i] LinkTo(level.originek["teleport2_kozeppont_2"]);
	}
	
	wait 5;
	
	thread OdaVissza(level.brushok["teleport2_emelkedik"][1], "Z", 72, 1.5, "teleport_kesz_2", 0.5, 0.5);
	
	level.originek["teleport2_kozeppont_1"] RotateYaw(3600, 12, 2, 8);
	level.originek["teleport2_kozeppont_2"] RotateYaw(-3600, 12, 2, 8);	
	
	level waittill("teleport_kesz_2");
	wait 3;
	level.brushok["teleport2_emelkedik"][1] MoveZ(-300, 3, 2, 0.5);
	level.originek["teleport2_kozeppont_2"] MoveZ(300, 3, 2, 0.5);
}
KapcsoloVissza()
{
	level.brushok["teleport_kapcsolo"] MoveZ(-90, 2);
	wait 2;
	level.brushok["teleport_padlo"] MoveY(16, 1);
	wait 1;
	level.brushok["teleport_padlo"] MoveZ(16, 1);
}


Raketa()
{
	level waittill("round_started", sorszam);
	
	wait 5;
	
	level.brushok["raketa_fo"] MoveZ(1856, 8, 7, 0.9);
	level.brushok["raketa_fo"] waittill("movedone");
	
	orig = Spawn("script_origin", level.activ GetOrigin());
	level.activ LinkTo(orig);
	orig MoveY(-600, 3);
	level.brushok["aktifal_tolo"] MoveY(-468, 3);
	orig waittill("movedone");
	level.activ UnLink();
	orig Delete();
	
	level.brushok["raketa_fo"] MoveTo(level.originek["raketa_ut"][0] GetOrigin(), 4, 3, 0.9);
	wait 3.5;
	level.brushok["raketa_fo"] MoveTo(level.originek["raketa_ut"][1] GetOrigin(), 4, 3, 0.9);
	level.brushok["raketa_fo"] RotateRoll(70, 2);
	wait 3.8;
	level.brushok["raketa_fo"] MoveTo(level.originek["raketa_ut"][2] GetOrigin(), 4);
	level.brushok["raketa_fo"] RotateRoll(20, 2);
	wait 3.8;
	level.brushok["raketa_fo"] MoveTo(level.originek["raketa_ut"][3] GetOrigin(), 4);
	level.brushok["raketa_fo"] RotateRoll(30, 2);
	wait 3.8;
	level.brushok["raketa_fo"] MoveTo(level.originek["raketa_ut"][4] GetOrigin(), 4);
	level.brushok["raketa_fo"] RotateRoll(60, 2);
	wait 3.8;
	level.brushok["raketa_fo"] MoveTo(level.originek["raketa_ut"][5] GetOrigin(), 1);
	level.brushok["raketa_fo"] RotateRoll(-180, 2);
}


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


AktivatorPotlo()
{
	level waittill("round_started", szam);
	
	while (true)
	{
		eredeti = level.activ;
		orig = eredeti GetOrigin();
		
		while (eredeti == level.activ)
		{
			orig = level.activ GetOrigin();
			wait 1;
		}
		
		wait 1;
		level.activ SetOrigin(orig);
	}
}