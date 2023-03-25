/*
  __  __               _             _____                               
 |  \/  |             | |           |_   _|                              
 | \  / | __ _ _ __   | |__  _   _    | |  ___ ___  _ __ ___   __ _ _ __ 
 | |\/| |/ _` | '_ \  | '_ \| | | |   | | / __/ _ \| '_ ` _ \ / _` | '__|
 | |  | | (_| | |_) | | |_) | |_| |  _| || (_| (_) | | | | | | (_| | |   
 |_|  |_|\__,_| .__/  |_.__/ \__, | |_____\___\___/|_| |_| |_|\__,_|_|   
              | |             __/ |                                      
              |_|            |___/                                      
*/

main()
{
	maps\mp\_load::main();
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar( "r_specularcolorscale", "1" );
    setdvar( "r_glowbloomintensity0", ".25" );
    setdvar( "r_glowbloomintensity1", ".25" );
    setdvar( "r_glowskybleedintensity0", ".3" );
	
    setdvar( "compassmaxrange", "1800" );
	
	setDvar("bg_falldamagemaxheight", 650 );
	setDvar("bg_falldamageminheight", 550 );
	
	precacheItem ("winchester1200_mp");
	precacheItem ("ak74u_mp");
	precacheItem ("uzi_mp");
	precacheItem ("mp5_mp");
	precacheItem ("barrett_mp" );

	thread addTestClients();
	
	addTriggerToList( "trap_01_trigger" );
    addTriggerToList( "trap_02_trigger" );
    addTriggerToList( "trap_03_trigger" );
    addTriggerToList( "trap_04_trigger" );
    addTriggerToList( "trap_05_trigger" );
    addTriggerToList( "trap_06_trigger" );
	addTriggerToList( "trap_07_trigger" );
	addTriggerToList( "trap_08_trigger" );
	addTriggerToList( "trap_09_trigger" );
	addTriggerToList( "trap_10_trigger" );
	
	thread init_fx();
	thread init_on_start();
	thread init_traps();
}

/*********************************************************************************/

init_fx()
{	
	level.fx_firefly = LoadFX("custom/firefly");
	level.fx_clouds = LoadFX("custom/clouds");
	level.fx_blood = LoadFX("custom/blood");
	level.fx_heal = LoadFX("custom/heal");
	level.fx_gold = LoadFX("custom/gold_glow");
	level.fx_gold_pickup = LoadFX("custom/gold_pickup");
	level.fx_heal_glow = LoadFX("custom/heal_base");
	level.fx_burn = LoadFX("custom/burn_death");
	level.fx_teleporter = LoadFX("custom/porter");
	level.fx_eye = LoadFX("custom/glitter");
	level.fx_eye_friendly = LoadFX("custom/glitter_green");
	level.fx_eye_charge = LoadFX("custom/eye_charge");
	level.fx_eye_explosion = LoadFX("custom/eye_explosion");
	level.fx_eye_projectile = LoadFX("custom/eye_projectile");
	level.fx_eye_smoke = LoadFX("custom/giant_smoke");
	level.fx_eye_giant_charge = LoadFX("custom/giant_eye_charge");
	level.fx_eye_flash = LoadFX("custom/eye_flash");
	level.fx_target_player = LoadFX("custom/target_player");
	level.fx_fire_up = LoadFX("custom/fire_pad");
	level.fx_lava = LoadFX("custom/lava_cloudeye");
	level.fx_lava_small = LoadFX("custom/lava_cloudeye_small");
	level.fx_steam = LoadFX("custom/steam");
}

init_on_start()
{	
	steam_1 = getEnt("steam_origin_01", "targetname");
	steam_2 = getEnt("steam_origin_02", "targetname");
	steam_3 = getEnt("steam_origin_03", "targetname");
	steam_4 = getEnt("steam_origin_04", "targetname");
	steam_5 = getEnt("steam_origin_05", "targetname");
	
	level waittill("round_started"); // THX Arfy, this is gold
	
	playFx (level.fx_clouds, (424, -440, -4200));
	SetExpFog(850, 1550, .88, .88, .88, 3);
	
	ambientPlay ("chupa");
	wait .1;
	
	thread init_misc();
	
	wait 2;
	startdoor();
	
	thread exec_steam(steam_1);
	thread exec_steam(steam_2);
	thread exec_steam(steam_3);
	thread exec_steam(steam_4);
	thread exec_steam(steam_5);
	wait 3;
	
	iPrintln("> Map by ^1Icomar");
	wait 1.4;
		
	iPrintln("> Big thanks to ^1Arfy ^7for scripting/mapping/testing help!");
	wait 1.4;
		
	iPrintln("> Thanks to ^1Nennius ^7for sound support!");
	wait 1.4;
}

init_misc()
{	
	players = getEntArray("player", "classname");
	
	for(i = 0; i < level.players.size; i++)
	{
		players[i].isHealed = false;	// already got healed
		players[i].isLucky = false;		// already got lucky
		players[i].secretNum = 0;		// needs to be 3 to enter secret room
	}
	
	level.isTeleport = true; 	// deactivates acti teleporter if chosen old
	level.playerInRoom = ""; 	// current jumper in room
	level.gold_found = 0; 		// gold bars which got picked up
	level.gold_max = 10; 		// max gold amount which spawns
	wait .1;
	
	level.guns[0] = "winchester1200_mp";
	level.guns[1] = "ak74u_mp";
	level.guns[2] = "uzi_mp";
	level.guns[3] = "mp5_mp";
	level.guns[4] = "barrett_mp";
	
	thread eye();
	wait .1;
	
	thread platform_01();
	thread jump_pad();
	thread jump_pad_2();
	thread jump_pad_jump_room_1();
	thread jump_pad_jump_room_2();
	wait .1;
	
	thread rope();
	thread door();
	thread end_sound();
	thread activator_secret();
	thread enter_eye_room();
	wait .1;
	
	thread init_gold_blocks();
	wait .1;
	
	thread activator_teleport_01();
	thread activator_teleport_02();
	thread activator_teleport_03();
	thread activator_teleport_04();
	wait .1;
	
	thread heal_01();
	thread heal_02();
	wait .1;
	
	thread lava_01();
	thread lava_02();
	thread lava_03();
	wait .1;
	
	thread room_jump();
	thread room_snipe();
	thread room_old();
	wait .1;
	
	thread room_snipe_flying_objects();
	thread room_snipe_kill();
	thread eye_secret_object_rotate();
	wait .1;
	
	thread spikes_damage();
	thread fred_and_mike();
	thread secret_respawn_01();
	thread open_secret();
	thread door_end();
}

init_traps()
{
	wait 1;
	
	thread init_trap_01();
	thread init_trap_02();
	thread init_trap_03();
	thread init_trap_04();
	thread init_trap_05();
	thread init_trap_06();
	thread init_trap_07();
	thread init_trap_08();
	thread init_trap_09();
	thread init_trap_10();
}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];
	
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

/*STARTDOOR***********************************************************************/

startdoor()
{
	door_fragment_01 = getEnt("door_fragment_01", "targetname");
	door_fragment_02 = getEnt("door_fragment_02", "targetname");
	door_fragment_03 = getEnt("door_fragment_03", "targetname");
	door_fragment_04 = getEnt("door_fragment_04", "targetname");
	door_fragment_05 = getEnt("door_fragment_05", "targetname");
	door_fragment_06 = getEnt("door_fragment_06", "targetname");
	door_fragment_07 = getEnt("door_fragment_07", "targetname");
	door_fragment_08 = getEnt("door_fragment_08", "targetname");
	door_fragment_09 = getEnt("door_fragment_09", "targetname");
	door_fragment_10 = getEnt("door_fragment_10", "targetname");
	door_fragment_11 = getEnt("door_fragment_11", "targetname");
	door_fragment_12 = getEnt("door_fragment_12", "targetname");
	door_fragment_13 = getEnt("door_fragment_13", "targetname");
	door_fragment_14 = getEnt("door_fragment_14", "targetname");
	wait .1;
	
	thread exec_move_down(door_fragment_01);
	wait .1;
	
	thread exec_move_down(door_fragment_02);
	wait .1;
	
	thread exec_move_down(door_fragment_03);
	wait .1;
	
	thread exec_move_down(door_fragment_04);
	wait .1;
	
	thread exec_move_down(door_fragment_05);
	wait .1;
	
	thread exec_move_down(door_fragment_06);
	wait .1;
	
	thread exec_move_down(door_fragment_07);
	wait .1;
	
	thread exec_move_down(door_fragment_08);
	wait .1;
	
	thread exec_move_down(door_fragment_09);
	wait .1;
	
	thread exec_move_down(door_fragment_10);
	wait .1;
	
	thread exec_move_down(door_fragment_11);
	wait .1;
	
	thread exec_move_down(door_fragment_12);
	wait .1;
	
	thread exec_move_down(door_fragment_13);
	wait .1;
	
	thread exec_move_down(door_fragment_14);
	wait .1;
}

/*TRAP*01*************************************************************************/

init_trap_01()
{
	showcase = getEnt("trap_01_showcase", "targetname");
	trigger = getEnt("trap_01_trigger", "targetname");
	
	spikes_1 = getEnt("trap_01_spikes_01", "targetname");
	spikes_2 = getEnt("trap_01_spikes_02", "targetname");
	spikes_3 = getEnt("trap_01_spikes_03", "targetname");
	
	dmg_1 = getEnt("trap_01_spikes_01_dmg", "targetname");
	dmg_2 = getEnt("trap_01_spikes_02_dmg", "targetname");
	dmg_3 = getEnt("trap_01_spikes_03_dmg", "targetname");
	
	trigger sethintstring( "Press ^1USE^7 to activate" );
	
	spikes_1 notSolid();
	spikes_2 notSolid();
	spikes_3 notSolid();
	
	dmg_1 enableLinkTo();
	dmg_2 enableLinkTo();
	dmg_3 enableLinkTo();
	
	dmg_1 linkTo(spikes_1);
	dmg_2 linkTo(spikes_2);
	dmg_3 linkTo(spikes_3);
	
	spikes_1 moveZ(-120, .5);
	spikes_2 moveZ(-120, .5);
	spikes_3 moveZ(-120, .5);
	wait .5;
	
	thread exec_trap_01(trigger, spikes_1, spikes_2, spikes_3);
	thread showcase_trap(showcase);
	thread kill_trap(dmg_1);
	thread kill_trap(dmg_2);
	thread kill_trap(dmg_3);
	wait 1;
}

exec_trap_01(trigger, object_1, object_2, object_3)
{
	trigger waittill ( "trigger", player );
	trigger sethintstring( "^1ACTIVATED" );
	
	while(1)
	{
		play_sound("woosh", (64, 1216, -424));
		play_sound("woosh", (-576, 1216, -424));
		object_1 moveZ(120, .1);
		object_3 moveZ(120, .1);
		wait 1;
		
		object_1 moveZ(-120, 1, .7, .2);
		object_3 moveZ(-120, 1, .7, .2);
		wait 1.5;
		
		play_sound("woosh", (-256, 1216, -424));
		object_2 moveZ(120, .1);
		wait 1;
		
		object_2 moveZ(-120, 1, .7, .2);
		wait 1.5;
	}
}

/*TRAP*02*************************************************************************/

init_trap_02()
{
	showcase = getEnt("trap_02_showcase", "targetname");
	trigger = getEnt("trap_02_trigger", "targetname");
	
	object = getEnt("trap_02_object", "targetname");
	
	dmg = getEnt("trap_02_dmg", "targetname");
	
	trigger sethintstring( "Press ^1USE^7 to activate" );
	
	dmg enableLinkTo();
	dmg linkTo(object);
	
	object notSolid();
	
	object moveZ(100, .5);
	wait .5;
	
	thread showcase_trap(showcase);
	thread kill_trap(dmg);
	thread exec_trap_02(trigger, object);
	wait 1;
}

exec_trap_02(trigger, object)
{
	trigger waittill ( "trigger", player );
	trigger sethintstring( "^1ACTIVATED" );
	
	play_sound("hydraulic", (-1024, 640, -272));
	object moveZ(-100, 7);
	wait 6;
	
	thread exec_trap_02_spin(object);
	wait 2;
}

exec_trap_02_spin(object)
{
	while(1)
	{
		object rotateRoll(90, .4);
		wait .4;
	}
}

/*TRAP*03*************************************************************************/

init_trap_03()
{
	showcase = getEnt("trap_03_showcase", "targetname");
	trigger = getEnt("trap_03_trigger", "targetname");
	
	object = getEnt("trap_03_object", "targetname");
		
	trigger sethintstring( "Press ^1USE^7 to activate" );
	
	thread showcase_trap(showcase);
	thread exec_trap_03(trigger, object);
	wait 1;
}

exec_trap_03(trigger, object)
{
	trigger waittill ( "trigger", player );
	trigger sethintstring( "^1ACTIVATED" );
	
	playFx(level.fx_lava_small, (-896, -144, -592));
	wait .1;
	
	play_sound("hydraulic", (-774, -144, -504));
	object moveX(272, 7);
	wait 8;
	
	object delete();
}

/*TRAP*04*************************************************************************/

init_trap_04()
{
	showcase = getEnt("trap_04_showcase", "targetname");
	trigger = getEnt("trap_04_trigger", "targetname");
	
	spinner_1 = getEnt("trap_04_spinner_01", "targetname");
	spinner_2 = getEnt("trap_04_spinner_02", "targetname");
	spinner_3 = getEnt("trap_04_spinner_03", "targetname");
	spinner_4 = getEnt("trap_04_spinner_04", "targetname");
	spinner_5 = getEnt("trap_04_spinner_05", "targetname");
		
	dmg_1 = getEnt("trap_04_dmg_01", "targetname");
	dmg_2 = getEnt("trap_04_dmg_02", "targetname");
	dmg_3 = getEnt("trap_04_dmg_03", "targetname");
	dmg_4 = getEnt("trap_04_dmg_04", "targetname");
	dmg_5 = getEnt("trap_04_dmg_05", "targetname");
		
	trigger sethintstring( "Press ^1USE^7 to activate" );
	
	spinner_1 notSolid();
	spinner_2 notSolid();
	spinner_3 notSolid();
	spinner_4 notSolid();
	spinner_5 notSolid();
	
	dmg_1 enableLinkTo();
	dmg_2 enableLinkTo();
	dmg_3 enableLinkTo();
	dmg_4 enableLinkTo();
	dmg_5 enableLinkTo();
	
	dmg_1 linkTo(spinner_1);
	dmg_2 linkTo(spinner_2);
	dmg_3 linkTo(spinner_3);
	dmg_4 linkTo(spinner_4);
	dmg_5 linkTo(spinner_5);
	
	spinner_1 moveZ(-144, .5);
	spinner_2 moveZ(-144, .5);
	spinner_3 moveZ(-144, .5);
	spinner_4 moveZ(-144, .5);
	spinner_5 moveZ(-144, .5);
	wait .5;
	
	thread showcase_trap(showcase);
	thread exec_trap_04(trigger, spinner_1, spinner_2, spinner_3, spinner_4, spinner_5);
	thread kill_trap(dmg_1);
	thread kill_trap(dmg_2);
	thread kill_trap(dmg_3);
	thread kill_trap(dmg_4);
	thread kill_trap(dmg_5);
	wait 1;
}

exec_trap_04(trigger, object_1, object_2, object_3, object_4, object_5)
{
	trigger waittill ( "trigger", player );
	trigger sethintstring( "^1ACTIVATED" );
	
	play_sound("hydraulic", (-936, -832, -760));
	object_1 moveZ(144, 7);
	object_2 moveZ(144, 7);
	object_3 moveZ(144, 7);
	object_4 moveZ(144, 7);
	object_5 moveZ(144, 7);
	wait 2;
	
	thread exec_trap_04_spin(object_1);
	thread exec_trap_04_spin(object_2);
	thread exec_trap_04_spin(object_3);
	thread exec_trap_04_spin(object_4);
	thread exec_trap_04_spin(object_5);
	wait 6;
	
	thread exec_trap_04_moveX(object_1, 192);
	thread exec_trap_04_moveY(object_2, object_3, 304);
	thread exec_trap_04_moveX(object_4, 368);
	thread exec_trap_04_moveX(object_5, -368);
}

exec_trap_04_spin(object)
{
	while(1)
	{
		object rotateYaw(90, .3);
		wait .3;
	}
}

exec_trap_04_moveX(object, dist)
{
	while(1)
	{
		object moveX(dist, 3, 1.5, 1.5);
		wait 3;
		object moveX(0 - dist, 3, 1.5, 1.5);
		wait 3;
	}
}

exec_trap_04_moveY(object_1, object_2, dist)
{
	while(1)
	{
		object_1 moveY(0 - dist, 3, 1.5, 1.5);
		object_2 moveY(dist, 3, 1.5, 1.5);
		wait 3;
		object_1 moveY(dist, 3, 1.5, 1.5);
		object_2 moveY(0 - dist, 3, 1.5, 1.5);
		wait 3;
	}
}

/*TRAP*05*************************************************************************/

init_trap_05()
{
	showcase = getEnt("trap_05_showcase", "targetname");
	trigger = getEnt("trap_05_trigger", "targetname");
	
	object = getEnt("trap_05_object", "targetname");
	object hide();
		
	trigger sethintstring( "Press ^1USE^7 to activate" );
	
	object moveZ(-4, .5);
	wait .5;
	
	thread showcase_trap(showcase);
	thread exec_trap_05(trigger, object);
	wait 1;
}

exec_trap_05(trigger, object)
{
	trigger waittill ( "trigger", player );
	trigger sethintstring( "^1ACTIVATED" );
	
	object moveZ(4, .5);
	wait .5;
	
	object show();
}

/*TRAP*06*************************************************************************/

init_trap_06()
{
	showcase = getEnt("trap_06_showcase", "targetname");
	trigger = getEnt("trap_06_trigger", "targetname");
	
	object_1 = getEnt("trap_06_object_01", "targetname");
	object_2 = getEnt("trap_06_object_02", "targetname");
	object_remove = getEnt("trap_06_object_remove", "targetname");
		
	trigger sethintstring( "Press ^1USE^7 to activate" );
	
	thread showcase_trap(showcase);
	thread exec_trap_06(trigger, object_remove, object_1, object_2);
	wait 1;
}

exec_trap_06(trigger, remove, object_1, object_2)
{
	trigger waittill ( "trigger", player );
	trigger sethintstring( "^1ACTIVATED" );
	
	x = randomInt(2);
	remove delete();
	
	if(x == 0)
	{
		object_1 delete();
		
		while(1)
		{
			object_2 moveZ(-48, 5, 2.5, 2.5);
			wait 5;
			object_2 moveZ(48, 5, 2.5, 2.5);
			wait 5;
		}
	}
	
	if(x == 1)
	{
		object_2 delete();
		
		while(1)
		{
			object_1 moveZ(-48, 5, 2.5, 2.5);
			wait 5;
			object_1 moveZ(48, 5, 2.5, 2.5);
			wait 5;
		}
	}
}

/*TRAP*07*************************************************************************/

init_trap_07()
{
	showcase = getEnt("trap_07_showcase", "targetname");
	trigger = getEnt("trap_07_trigger", "targetname");

	trigger sethintstring( "Press ^1USE^7 to activate" );
	
	thread showcase_trap(showcase);
	
	trigger waittill ( "trigger", player );
	trigger sethintstring( "^1ACTIVATED" );
	
	level.friendly_fx delete();
	triggerFx(spawnFx (level.fx_eye, (-40, 532, -1548)));
	level.isFriendly = false;
}

/*TRAP*08*************************************************************************/

init_trap_08()
{
	showcase = getEnt("trap_08_showcase", "targetname");
	trigger = getEnt("trap_08_trigger", "targetname");
	
	object_1 = getEnt("trap_08_object_01", "targetname");
	object_2 = getEnt("trap_08_object_02", "targetname");
	
	dmg_1 = getEnt("trap_08_dmg_01", "targetname");
	dmg_2 = getEnt("trap_08_dmg_02", "targetname");
	
	object_1 notSolid();
	object_2 notSolid();
	
	dmg_1 enableLinkTo();
	dmg_2 enableLinkTo();
	
	dmg_1 linkTo(object_1);
	dmg_2 linkTo(object_2);
	wait .05;
		
	trigger sethintstring( "Press ^1USE^7 to activate" );
	
	object_1 rotateRoll(-67.5, .5);
	object_2 rotateRoll(-67.5, .5);
	wait .5;
	
	thread showcase_trap(showcase);
	thread exec_trap_08(trigger, object_1, object_2);
	thread kill_trap(dmg_1);
	thread kill_trap(dmg_2);
	wait 1;
}

exec_trap_08(trigger, object_1, object_2)
{
	trigger waittill ( "trigger", player );
	trigger sethintstring( "^1ACTIVATED" );
	
	object_1 rotateRoll(135, 3, 1.5, 1.5);
	wait 3;
	
	while(1)
	{
		object_1 rotateRoll(-135, 3, 1.5, 1.5);
		object_2 rotateRoll(135, 3, 1.5, 1.5);
		wait 3;
		object_1 rotateRoll(135, 3, 1.5, 1.5);
		object_2 rotateRoll(-135, 3, 1.5, 1.5);
		wait 3;
	}
}

/*TRAP*09*************************************************************************/

init_trap_09()
{
	showcase = getEnt("trap_09_showcase", "targetname");
	trigger = getEnt("trap_09_trigger", "targetname");
	
	object = getEnt("trap_09_object", "targetname");
		
	trigger sethintstring( "Press ^1USE^7 to activate" );
	
	thread showcase_trap(showcase);
	thread exec_trap_09(trigger, object);
	wait 1;
}

exec_trap_09(trigger, object)
{
	trigger waittill ( "trigger", player );
	trigger sethintstring( "^1ACTIVATED" );
	
	while(1)
	{
		object rotatePitch(-90, 1.7);
		wait 1.7;
	}
}

/*TRAP*10*************************************************************************/

init_trap_10()
{
	showcase = getEnt("trap_10_showcase", "targetname");
	trigger = getEnt("trap_10_trigger", "targetname");
	
	object_1 = getEnt("trap_10_object_01", "targetname");
	object_2 = getEnt("trap_10_object_02", "targetname");
	object_3 = getEnt("trap_10_object_03", "targetname");
		
	trigger sethintstring( "Press ^1USE^7 to activate" );
	
	object_1 moveY(192, .5);
	object_3 moveY(192, .5);
	wait .5;
	
	thread showcase_trap(showcase);
	thread exec_trap_10(trigger, object_1, object_2, object_3);
	wait 1;
}

exec_trap_10(trigger, object_1, object_2, object_3)
{
	trigger waittill ( "trigger", player );
	trigger sethintstring( "^1ACTIVATED" );
	
	thread exec_trap_10_moveY(object_1, 136);
	wait 1;
	
	thread exec_trap_10_moveY(object_2, 136);
	wait 1;
	
	thread exec_trap_10_moveY(object_3, 136);
	wait 1;
}

exec_trap_10_moveY(object, dist)
{
	while(1)
	{
		object moveY(dist, 2, 1.5, .5);
		object waittill("movedone");
		
		object moveY(0 - dist, 2, .5, 1.5);
		object waittill("movedone");
	}
}

/*SNIPE*ROOM*PREPARE**************************************************************/

room_snipe_flying_objects()
{
	object_1 = getEnt("room_sniper_flying_object_01", "targetname");
	object_2 = getEnt("room_sniper_flying_object_02", "targetname");
	object_3 = getEnt("room_sniper_flying_object_03", "targetname");
	
	thread exec_flying_object(object_1, 90);
	wait 2;
	
	thread exec_flying_object(object_2, 70);
	wait 2;
	
	thread exec_flying_object(object_3, 30);
	wait 1.5;
}

room_snipe_kill()
{
	trigger = getEnt("room_sniper_kill_trigger", "targetname");
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		if(isAlive(level.playerInRoom) && isAlive(level.activ))
		{
			if( player.pers[ "team" ] != "spectator" )
			{
				if( player.pers[ "team" ] == "allies" )
					thread exec_dmg(player, level.activ, 1000);
			
				if( player.pers[ "team" ] == "axis" )
					thread exec_dmg(player, level.playerInRoom, 1000);
			}
		}
		else
		{
			level.activ setOrigin( level.snipe_respawn_activator.origin );
			level.activ setPlayerangles( level.snipe_respawn_activator.angles );
		}
		
		wait 2;
	}
}

room_snipe()
{
	level.snipe_entry_trigger = getEnt("snipe_room_entry", "targetname");
	level.snipe_respawn_activator = getEnt("snipe_respawn_activator_origin", "targetname");
	level.snipe_respawn_jumper = getEnt("snipe_respawn_jumper_origin", "targetname");
	
	level.snipe_entry_trigger setHintString( "^2Snipe Room" );
	
	thread room_snipe_flying_objects();
	thread room_snipe_kill();
	
	while(1)
	{
		level.snipe_entry_trigger waittill("trigger", player);
		
		if(level.freeRun)
			continue;
		
		if(!isDefined(level.snipe_entry_trigger))
            return;
		
		if(isDefined(level.jump_entry_trigger) || isDefined(level.old_entry_trigger))
		{
			level.jump_entry_trigger delete();
			level.old_entry_trigger delete();
		}
		
		level.snipe_entry_trigger setHintString("^1Wait till its your turn!" );
		
		if (isalive(player) && isdefined(player))
		{	
			level.playerInRoom = player;
		
			thread prepare_endroom(player, "Snipe Room", level.snipe_respawn_jumper, level.snipe_respawn_activator, "m40a3_mp", 1);
			wait .05;
			
			player common_scripts\utility::waittill_any("death", "disconnect");
			exec_death_notification("^1" + player.name + "^7 died");
		}
		
		level.snipe_entry_trigger setHintString( "^2Snipe Room" );
	}
}

/*JUMP*ROOM*PREPARE***************************************************************/

room_jump_flying_objects()
{
	object_1 = getEnt("room_jump_flying_object_01", "targetname");
	object_2 = getEnt("room_jump_flying_object_02", "targetname");
	object_3 = getEnt("room_jump_flying_object_03", "targetname");
	
	thread exec_flying_object(object_1, 90);
	wait 2;
	
	thread exec_flying_object(object_2, 70);
	wait 2;
	
	thread exec_flying_object(object_3, 20);
	wait 1.5;
}

room_jump_respawn()
{
	respawn_trigger = getEnt("jump_trigger_respawn","targetname");
	
	while(1)
	{
		respawn_trigger waittill ( "trigger", player );
	
		if( player.pers[ "team" ] != "spectator" )
		{
			if( player.pers[ "team" ] == "allies" )
			{
				player SetPlayerAngles ( level.jump_respawn_jumper.angles );
				player SetOrigin ( level.jump_respawn_jumper.origin );
			}
			if( player.pers[ "team" ] == "axis" )
			{
				player SetPlayerAngles ( level.jump_respawn_activator.angles );
				player SetOrigin ( level.jump_respawn_activator.origin );
			}
		}
	}
}

jump_get_gun()
{
	gun_trigger = getEnt("jump_gun_trigger","targetname");
	
	while(1)
	{
		gun_trigger waittill ( "trigger", player );

		player GiveWeapon( "winchester1200_mp" );
		player GiveMaxAmmo( "winchester1200_mp" );
		player switchToWeapon( "winchester1200_mp" );
		wait 1;
	}
}

room_jump()
{
	level.jump_entry_trigger = getEnt("jump_room_entry", "targetname");
	level.jump_respawn_activator = getEnt("jump_respawn_activator_origin", "targetname");
	level.jump_respawn_jumper = getEnt("jump_respawn_jumper_origin", "targetname");
	
	level.jump_entry_trigger setHintString( "^2Jump Room" );
	
	thread jump_get_gun();
	thread room_jump_respawn();
	thread room_jump_flying_objects();
	
	while(1)
	{
		level.jump_entry_trigger waittill("trigger", player);
		
		if(level.freeRun)
			continue;
		
		if(!isDefined(level.jump_entry_trigger))
            return;
		
		if(isDefined(level.snipe_entry_trigger) || isDefined(level.old_entry_trigger))
		{
			level.snipe_entry_trigger delete();
			level.old_entry_trigger delete();
		}
		
		level.jump_entry_trigger setHintString("^1Wait till its your turn!" );
		
		if (isalive(player) && isdefined(player))
		{	
			level.playerInRoom = player;
		
			thread prepare_endroom(player, "Jump Room", level.jump_respawn_jumper, level.jump_respawn_activator, "knife_mp", 0);
			wait .05;
			
			player common_scripts\utility::waittill_any("death", "disconnect");
			exec_death_notification("^1" + player.name + "^7 died");
		}
		
		level.jump_entry_trigger setHintString( "^2Jump Room" );
	}
}

/*OLD*ROOM*PREPARE****************************************************************/

room_old()
{
	level.old_entry_trigger = getEnt("old_room_entry", "targetname");
	old_entry = getEnt("old_door", "targetname");
	wall = getEnt("old_wall", "targetname");
	
	level.old_entry_trigger setHintString( "^2Old" );
	
	level.old_entry_trigger waittill("trigger", player);
	
	level.jump_entry_trigger delete();
	level.snipe_entry_trigger delete();
	
	level.isTeleport = false;
	
	if(isDefined(level.activ))
	{
		level.activ setOrigin( level.acti_teleporter.origin );
		level.activ setPlayerAngles( level.acti_teleporter.angles );
	}
	
	exec_room_notification("OLD", "^1" + player.name + "^7 has chosen old");
	
	old_entry moveZ(-144, 3, .5, 2.5);
	wait 3;
	
	wall moveZ(144, 3, .5, 2.5);
	wait 3;
}

/*ENDROOMS************************************************************************/

prepare_endroom(player, choice, jumper_origin, acti_origin, gun, is2nd)
{	
	player takeallweapons();
	player freezeControls(1);
	player setOrigin(jumper_origin.origin);
	player setPlayerangles(jumper_origin.angles);
	player GiveWeapon(gun);
	
	if(isDefined(level.activ))
	{
		level.activ takeallweapons();
		level.activ freezeControls(1);
		level.activ setOrigin(acti_origin.origin);
		level.activ setPlayerangles(acti_origin.angles);
		level.activ GiveWeapon(gun);
		
		exec_room_notification(choice, "^1" + player.name + "^7 VS ^1" + level.activ.name);
	}
	
	if(is2nd == 1)
	{
		player GiveMaxAmmo(gun);
		player GiveWeapon("remington700_mp");
		player GiveMaxAmmo("remington700_mp");
		
		if(isDefined(level.activ))
		{
			level.activ GiveMaxAmmo(gun);
			level.activ GiveWeapon("remington700_mp");
			level.activ GiveMaxAmmo("remington700_mp");
		}
	}
	
	start = NewHudElem();
	start.alignX = "center";
	start.alignY = "middle";
	start.horzalign = "center";
	start.vertalign = "middle";
	start.alpha = 1;
	start.x = 0;
	start.y = -50;
	start.font = "objective";
	start.fontscale = 3;
	start.glowalpha = 1;
	start.glowcolor = ( 1, 1, 1 );
	start setText( "^73" );
	start SetPulseFX( 100, 4000, 500 );
	wait 1;
	
	start setText( "^72" );
	start SetPulseFX( 100, 4000, 500 );
	wait 1;
		
	player enableWeapons(1);
	player switchToWeapon(gun);
	
	if(isDefined(level.activ))
	{
		level.activ enableWeapons(1);
		level.activ switchToWeapon(gun);
	}
	
	start setText( "^71" );
	start SetPulseFX( 100, 4000, 500 );
	wait 1.5;
	
	start setText( "^1FIGHT!" );
	start SetPulseFX( 100, 4000, 500 );
	wait .2;
		
	player freezeControls(0);
	
	if(isDefined(level.activ))
		level.activ freezeControls(0);
	
	wait .05;
	
	if(is2nd == 1)
	{
		steam_1 = getEnt ( "steam_origin_09", "targetname" );
		steam_2 = getEnt ( "steam_origin_10", "targetname" );
		steam_3 = getEnt ( "steam_origin_11", "targetname" );
		steam_4 = getEnt ( "steam_origin_12", "targetname" );
		steam_5 = getEnt ( "steam_origin_13", "targetname" );
		steam_6 = getEnt ( "steam_origin_14", "targetname" );
		wait .05;
		
		thread exec_steam(steam_1);
		thread exec_steam(steam_2);
		thread exec_steam(steam_3);
		thread exec_steam(steam_4);
		thread exec_steam(steam_5);
		thread exec_steam(steam_6);
		wait .2;
	}
}

/*********************************************************************************/

platform_01()
{
	trigger = getEnt ( "platform_01_trigger", "targetname" );
	platform = getEnt ( "platform_01", "targetname" );
	
	trigger enableLinkTo();
	trigger linkTo(platform);
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		move_to_pos(platform, -1024, 160, -552, 5, 1, 4);
		wait 1;
		
		move_to_pos(platform, -1024, 864, -472, 5, 1, 4);
		wait 1;
	}
}

door()
{
	trigger = getEnt ( "door_eye_trigger", "targetname" );
	object = getEnt ( "door_eye", "targetname" );
	
	trigger waittill ( "trigger", player );
	
	wait .5;
	playFx(level.fx_lava, (-40, 536, -2200));
	wait .05;
		
	object moveZ(144, 6);
	wait 7;
		
	object delete();
}

end_sound()
{
	trigger = getEnt ( "trigger_sound_end", "targetname" );
	
	steam_1 = getEnt ( "steam_origin_06", "targetname" );
	steam_2 = getEnt ( "steam_origin_07", "targetname" );
	steam_3 = getEnt ( "steam_origin_08", "targetname" );
	
	trigger waittill ( "trigger", player );
	
	musicPlay ("drum");
	wait .2;
	
	thread exec_steam(steam_1);
	thread exec_steam(steam_2);
	thread exec_steam(steam_3);
	wait .5;
}

/*JUMP*PADS***********************************************************************/

jump_pad()
{
	trigger = getEnt ( "trigger_jump_pad", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		thread exec_bounce(player, 4, 175);
	}
}

jump_pad_2()
{
	trigger = getEnt ( "trigger_jump_pad_2", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		thread exec_bounce(player, 3, 180);
	}
}

jump_pad_jump_room_1()
{
	trigger = getEnt ( "trigger_jump_pad_jump_room_01", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		thread exec_bounce(player, 3, 190);
	}
}

jump_pad_jump_room_2()
{
	trigger = getEnt ( "trigger_jump_pad_jump_room_02", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		thread exec_bounce(player, 3, 190);
	}
}

/*********************************************************************************/

open_secret()
{
	trigger = getEnt ( "trigger_open_secret", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		if(player.secretNum < 3)
		{
			playFx( level.fx_blood, (1216, 1020, -1904));
			player.secretNum++;
		}
	}
}

rope()
{
	trigger = getEnt ( "trigger_rope", "targetname" );
	start_origin = getEnt ( "origin_rope_start", "targetname" );
	end_origin = getEnt ( "origin_rope_end", "targetname" );
	
	trigger setHintString("Press ^1USE^7 to rope" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		thread exec_rope(player, start_origin, end_origin, 6, 5, 1);
		wait .7;
	}
}

/*EYE*****************************************************************************/

eye_secret_object_rotate()
{
	object_01 = getEnt ( "eye_secret_spinning_object_01", "targetname" );
	object_02 = getEnt ( "eye_secret_spinning_object_02", "targetname" );
	object_03 = getEnt ( "eye_secret_spinning_object_03", "targetname" );
	object_04 = getEnt ( "eye_secret_spinning_object_04", "targetname" );
	
	thread exec_flying_object(object_01, 70);
	wait 2;
	
	thread exec_flying_object(object_02, 120);
	wait 2;
	
	thread exec_flying_object(object_03, 180);
	wait 2;
	
	thread exec_flying_object(object_04, 10);
	wait .5;
}

enter_eye_room()
{
	trigger = getEnt ( "trigger_enter_eye_room", "targetname" );
	origin = getEnt ( "secret_area_spawn_01", "targetname" );
	fail = getEnt ( "secret_area_fail_spawn", "targetname" );
	
	respawn_trigger_01 = getEnt ( "secret_area_respawn", "targetname" );
	respawn_trigger_02 = getEnt ( "secret_area_respawn_02", "targetname" );
	respawn_trigger_03 = getEnt ( "secret_area_respawn_03", "targetname" );
	
	trigger_platform_finish = getEnt ( "trigger_secret_area_finish", "targetname" );	
	
	platform_02_origin = getEnt ( "secret_area_spawn_03", "targetname" );
	platform_03_origin = getEnt ( "secret_area_spawn_04", "targetname" );
	platform_finish_origin = getEnt ( "secret_area_finish", "targetname" );
	
	wait 5;
	playFx (level.fx_clouds, (20480, 9624, -5120));
	thread secret_teleport_area(respawn_trigger_01, origin);
	thread secret_teleport_area(respawn_trigger_02, platform_02_origin);
	thread secret_teleport_area(respawn_trigger_03, platform_03_origin);
	
	thread secret_teleport_area(trigger_platform_finish, platform_finish_origin);
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		play_sound("hhh", (296, 568, -1544));
		
		if(player.secretNum >= 3)
			exec_teleport(player, origin);
		else
			exec_teleport(player, fail);
		
		wait .05;
	}
}

secret_teleport_area(trigger, origin)
{
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		player freezeControls(1);
		
		exec_teleport(player, origin);
		wait .2;
		
		player freezeControls(0);
	}
}

eye()
{
	eye = getEnt("eye", "targetname");
	trigger = getEnt("eye_get_target_trigger", "targetname");
	
	time = 60;
	level.timer = time;
	
	wait 1;
	eye notSolid();
	eye_origin = Spawn("script_model", (40, 534, -1548));
	eye_origin setModel("tag_origin");
	eye_origin linkTo(eye);
	
	level.isFriendly = true;
	level.isTargeting = false;
	
	level.friendly_fx = spawnFx(level.fx_eye_friendly, (-40, 532, -1548));
	triggerFx(level.friendly_fx);
	wait .05;
	
	thread look_at_random_pos(eye);
	
	while(1)
	{	
		trigger waittill ( "trigger", player );
		level.isTargeting = true;

		if(!isDefined(level.ghost))
		{			
			if (isDefined(player) && isAlive(player))
			{	
				if(level.timer > 0)
				{
					eye_math(player, eye);
					eye_origin.angles = eye.angles;
					level.timer--;
				}
				else
				{
					eye_math(player, eye);
					eye_origin.angles = eye.angles;
					
					if(isDefined(level.isFriendly) && !level.isFriendly)
					{
						level.timer = time;
						thread eye_charge(eye_origin, time, player);
					}
				}
			}
		}
		else
		{			
			if (isDefined(player) && isAlive(player) && !level.player.ghost)
			{	
				if(level.timer > 0)
				{
					eye_math(player, eye);
					eye_origin.angles = eye.angles;
					level.timer--;
				}
				else
				{
					eye_math(player, eye);
					eye_origin.angles = eye.angles;
				
					if(isDefined(level.isFriendly) && !level.isFriendly)
					{
						level.timer = time;
						thread eye_charge(eye_origin, time, player);
					}
				}
			}	
		}
		
		wait .05;
	}
}

look_at_random_pos(object)
{
	pos_01 = spawn("script_origin", (40, 672, -1496));
	pos_02 = spawn("script_origin", (136, 442, -1466));
	pos_03 = spawn("script_origin", (102, 615, -1648));
	pos_04 = spawn("script_origin", (-168, 927, -1544));
	pos_05 = spawn("script_origin", (548, 644, -1544));
	
	while(!level.isTargeting)
	{
		x = randomInt(5);
				
		if(x == 0)
			eye_math(pos_01, object);
		if(x == 1)
			eye_math(pos_02, object);
		if(x == 2)
			eye_math(pos_03, object);
		if(x == 3)
			eye_math(pos_04, object);
		if(x == 4)
			eye_math(pos_05, object);
		
		wait 1;
	}
}

eye_math(object, eye) // biiiig thx to Arfy <3
{
	nX = object.origin[0] - eye.origin[0];
	nY = object.origin[1] - eye.origin[1];
	nZ = object.origin[2] - eye.origin[2];
	
	d_2d = distance2D(eye.origin, object.origin);
		
	anglePitch = ATan(nZ/d_2d);
	anglePitch = 0 - anglePitch - 10;
		
	angleYaw = ATan(nY/nX);
        
	if(nX < 0 && nY > 0)
		angleYaw = angleYaw + 180;
        
	if(nY < 0 && nX < 0)
		angleYaw = angleYaw + 180;
        
	newAngles = (anglePitch, angleYaw, 0);
	eye rotateTo(newAngles, .05);
				
	wait .05;
}

eye_charge(object, time, player)
{
	play_sound("laser_explosion", (40, 534, -1548));
	
	PlayFxOnTag(level.fx_eye_charge, object, "tag_origin");
	earthquake( .3, 3, object.origin, 900 ); // fx_target_player
	thread play_fx_on_bone(level.fx_target_player, player);
	wait 1;
	
	thread play_fx_on_bone(level.fx_target_player, player);
	wait 1;
	
	thread play_fx_on_bone(level.fx_target_player, player);
	wait 1;
	
	thread play_fx_on_bone(level.fx_target_player, player);
	
	PlayFX(level.fx_eye_projectile, object.origin, AnglesToForward(object.angles));
	wait .2;
	
	trace = bulletTrace(object.origin, object.origin + AnglesToForward(object.angles) * 100000, true, undefined)["position"];
	PlayFX(level.fx_eye_explosion, trace);
	
	earthquake(.8, 1, trace, 600);
	radiusDamage(trace, 300, 90, 10, undefined);
}

play_fx_on_bone(fx, player)
{
	PlayFXOnTag( fx, player, "j_head" );
	PlayFXOnTag( fx, player, "j_neck" );
	PlayFXOnTag( fx, player, "j_shoulder_le" );
	PlayFXOnTag( fx, player, "j_shoulder_ri" );
	PlayFXOnTag( fx, player, "j_spinelower" );
	PlayFXOnTag( fx, player, "j_knee_ri" );
	PlayFXOnTag( fx, player, "j_knee_le" );
	wait .05;
}

/*SPIKES***************************************************************************/

spikes_damage()
{
	trigger = getEnt ( "lava_01_death_trigger", "targetname" );
	
	thread kill_lava(trigger);
}

/*LAVA****************************************************************************/

lava_01()
{
	trigger = getEnt ( "spikes_damage", "targetname" );
	
	thread kill_trap(trigger);
}

lava_02()
{
	trigger = getEnt ( "lava_02_death_trigger", "targetname" );
	
	thread kill_lava(trigger);
}

lava_03()
{
	trigger = getEnt ( "lava_03_death_trigger", "targetname" );
	
	thread kill_lava(trigger);
}

/*HEAL****************************************************************************/

heal_01()
{
	heal_object = getEnt ( "heal_object_01", "targetname" );
	trigger = getEnt ( "heal_trigger_01", "targetname" );
	
	thread exec_object_rotate(heal_object);
	
	playFx(level.fx_heal_glow, (-162, 1824, -1576));
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		exec_heal(player);
		wait 3;
	}
}

heal_02()
{
	heal_object = getEnt ( "heal_object_02", "targetname" );
	trigger = getEnt ( "heal_trigger_02", "targetname" );
	
	thread exec_object_rotate(heal_object);
	
	playFx(level.fx_heal_glow, (922, 208, -1576));
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		exec_heal(player);
		wait 3;
	}
}

/*TELEPORTER**********************************************************************/

activator_teleport_01()
{
	trigger = getEnt( "activator_teleport_trigger_01", "targetname" );
	teleporter = getEnt( "activator_teleport_origin_01", "targetname" );
	
	fx = spawnFx (level.fx_teleporter, (-320, 1824, -1976));
	triggerFx(fx);
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		if(level.isTeleport)
		{
			player setOrigin( teleporter.origin );
			player setPlayerAngles( teleporter.angles );
		}
		else
			break;
		
		wait .05;
	}
	
	fx delete();
	trigger delete();
}

activator_teleport_02()
{
	trigger = getEnt( "activator_teleport_trigger_02", "targetname" );
	teleporter = getEnt( "activator_teleport_origin_02", "targetname" );
	
	fx = spawnFx (level.fx_teleporter, (-544, -3392, -2328));
	triggerFx(fx);
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		if(level.isTeleport)
		{
			player setOrigin( teleporter.origin );
			player setPlayerAngles( teleporter.angles );
		}
		else
			break;
		
		wait .05;
	}
	
	fx delete();
	trigger delete();
}

activator_teleport_03()
{
	trigger = getEnt( "activator_teleport_trigger_03", "targetname" );
	
	fx = spawnFx (level.fx_teleporter, (1448, -3104, -2328));
	triggerFx(fx);
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		if(level.isTeleport)
			player setOrigin((-832, -3392, -2344));
		else
			break;
		
		wait .05;
	}
	
	fx delete();
	trigger delete();
}

activator_teleport_04()
{
	trigger = getEnt( "activator_teleport_trigger_04", "targetname" );
	level.acti_teleporter = getEnt( "activator_teleport_origin_04", "targetname" );
	
	fx = spawnFx (level.fx_teleporter, (-1112, -3392, -2328));
	triggerFx(fx);
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		if(level.isTeleport)
		{
			player setOrigin( level.acti_teleporter.origin );
			player setPlayerAngles( level.acti_teleporter.angles );
		}
			
		else
			break;
		
		wait .05;
	}
	
	fx delete();
	trigger delete();
}

activator_secret()
{
	trigger = getEnt( "trigger_garbage", "targetname" );
	enter = getEnt( "enter_activator_secret", "targetname" );
	
	trigger setHintString("Just garbage...");
	
	enter waittill ( "trigger", player );
	
	player iPrintLnBold("WTF!?");
	trigger setHintString("There is something in the trash!");
	wait .5;
	
	trigger waittill ( "trigger", player );
	
	x = randomInt(level.guns.size);
	
	if (!level.trapsDisabled)
	{
		iPrintLnBold("^2" + player.name + " ^7found a gun!");
		player GiveWeapon(give_random_weapon(x));
		player GiveMaxAmmo(give_random_weapon(x));
		player switchToWeapon(give_random_weapon(x));
	}
	else
	{
		play_sound("hanoi", player.origin);
		iPrintLnBold("^2" + player.name + " ^7found some trash");
	}
}

/*FRED*AND*MIKE*******************************************************************/

fred_and_mike()
{
	fred = getEnt( "fred", "targetname" );
	mike = getEnt( "mike", "targetname" );
	trigger = getEnt( "fred_and_mike_trigger", "targetname" );
	pet_trigger = getEnt( "pet_trigger", "targetname" );
	
	fred moveZ(-50, .5);
	mike moveZ(-50, .5);
	fred notSolid();
	mike notSolid();
	wait .05;
		
	luck = randomInt(11);
	
	trigger waittill ( "trigger", player );
	wait .5;
	
	iPrintLnBold("^2" + player.name + "^7 found someones home...");
	
	if(luck > 0 && luck <= 5) // fred shows
	{
		fred moveZ(50, 3, 1.5, 1.5);
		wait 3;

		pet_trigger setHintString("^2Pet Fred!");
		
		while(1)
		{
			pet_trigger waittill ( "trigger", player );
			
			if(!isDefined(level.ghost))
			{
				fred rotateYaw(360, 1, .2, .8);
				wait .5;
			
				exec_luck(player, 1);
				wait .5;
			}
			else
				if(!player.ghost)
				{
					fred rotateYaw(360, 1, .2, .8);
					wait .5;
			
					exec_luck(player, 1);
					wait .5;
				}
				else
					player suicide();
		}
	}
	
	if(luck > 5 && luck <= 10) // mike shows
	{
		mike moveZ(50, 3, 1.5, 1.5);
		wait 3;
		
		pet_trigger setHintString("^2Pet Mike!");
		
		while(1)
		{
			pet_trigger waittill ( "trigger", player );
			
			if(!isDefined(level.ghost))
			{
				mike rotateYaw(-360, 1, .2, .8);
				wait .5;
			
				exec_luck(player, 2);
				wait .5;
			}
			else
				if(!player.ghost)
				{
					mike rotateYaw(-360, 1, .2, .8);
					wait .5;
					
					exec_luck(player, 2);
					wait .5;
				}
				else
					player suicide();
		}
	}
	
	if(luck == 0) // both are showing
	{
		fred moveZ(50, 3, 1.5, 1.5);
		mike moveZ(50, 3, 1.5, 1.5);
		wait 3;
		
		pet_trigger setHintString("^2Pet Fred & Mike!");
		
		while(1)
		{
			pet_trigger waittill ( "trigger", player );
			
			if(!isDefined(level.ghost))
			{
				fred rotateYaw(360, 1, .2, .8);
				mike rotateYaw(-360, 1, .2, .8);
				wait .5;
			
				exec_luck(player, 0);
				wait .5;
			}
			else
				if(!player.ghost)
				{
					fred rotateYaw(360, 1, .2, .8);
					mike rotateYaw(-360, 1, .2, .8);
					wait .5;
					
					exec_luck(player, 0);
					wait .5;
				}
				else
					player suicide();
		}
	}
}

/*SECRET**************************************************************************/

secret_respawn_01()
{
	trigger = getEnt( "secret_respawn_gold", "targetname" );
	spawn = getEnt( "secret_respawn_gold_origin", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		exec_teleport(player, spawn);
		wait .05;
	}
}

/*GOLD*BLOCKS*********************************************************************/

isDublicated(array, x, index)
{
	for(i = 0; i < index; i ++)
        if(array[i] == x)
            return true;
		  
    return false;
}

init_gold_blocks()
{
	gold[0] = getEnt( "gold_block_01", "targetname" );
	gold[1] = getEnt( "gold_block_02", "targetname" );
	gold[2] = getEnt( "gold_block_03", "targetname" );
	gold[3] = getEnt( "gold_block_04", "targetname" );
	gold[4] = getEnt( "gold_block_05", "targetname" );
	gold[5] = getEnt( "gold_block_06", "targetname" );
	gold[6] = getEnt( "gold_block_07", "targetname" );
	gold[7] = getEnt( "gold_block_08", "targetname" );
	gold[8] = getEnt( "gold_block_09", "targetname" );
	gold[9] = getEnt( "gold_block_10", "targetname" );
	gold[10] = getEnt( "gold_block_11", "targetname" );
	gold[11] = getEnt( "gold_block_12", "targetname" );
	gold[12] = getEnt( "gold_block_13", "targetname" );
	gold[13] = getEnt( "gold_block_14", "targetname" );
	gold[14] = getEnt( "gold_block_15", "targetname" );
	gold[15] = getEnt( "gold_block_16", "targetname" );
	gold[16] = getEnt( "gold_block_17", "targetname" );
	gold[17] = getEnt( "gold_block_18", "targetname" );
	gold[18] = getEnt( "gold_block_19", "targetname" );
	gold[19] = getEnt( "gold_block_20", "targetname" );
	
	thread end_eye();
	random_gold = [];
	
	for(i = 0; i < gold.size; i++)
		gold[i] hide();
	
	for(i = 0; i < level.gold_max; i++)
	{
		random_gold[i] = randomInt(gold.size);
		
		while(isDublicated(random_gold, random_gold[i], i))
			random_gold[i] = randomInt(gold.size);
	}
	
	wait .5; // wait till gold spawns
	
	for(i = 0; i < random_gold.size; i++)
	{
		thread exec_object_rotate(gold[random_gold[i]]);
		
		wait .5; // gold spawn delay for each gold bar
		PlayFx(level.fx_gold_pickup, gold[random_gold[i]].origin);
		
		fx[i] = spawnFx (level.fx_gold, gold[random_gold[i]].origin);
		triggerFx(fx[i]);
		
		gold[random_gold[i]] show();
		
		trigger[i] = spawn("trigger_radius", gold[random_gold[i]].origin, 0, 16, 16);
		thread on_gold_pickup(trigger[i], gold[random_gold[i]], fx[i]);
	}
}

on_gold_pickup(trigger, gold, fx)
{
	trigger waittill ( "trigger", player );
	
	PlayFx(level.fx_gold_pickup, gold.origin);
	play_sound("cash", gold.origin);
	player braxi\_rank::giveRankXP("", 20);
	wait .05;
	
	thread count_gold(player);
	
	trigger delete();
	
	fx delete();
	gold delete();
}

count_gold(player)
{
	if(level.gold_found >= 0 && level.gold_found < level.gold_max)
	{
		level.gold_found++;
		
		if(level.gold_found == 1)
		{
			iPrintLnBold("^3" + player.name + " ^7found the first gold bar!");
			gold_hud();
		}
		else if(level.gold_found == level.gold_max)
			iPrintLnBold("^3" + player.name + " ^7found the last gold bar!");
		else
			iPrintLnBold("^3" + player.name + " ^7found a gold bar!");
	}
	
	return;
}

gold_hud()
{	
	level.gold_counter = newHudElem();
	level.gold_counter.x = -5;
	level.gold_counter.y = -80;
	level.gold_counter.horzAlign = "right";	
	level.gold_counter.vertAlign = "middle";
	level.gold_counter.alignX = "right";
	level.gold_counter.alignY = "middle";
	level.gold_counter.sort = -1;
	level.gold_counter.foreground = 1;
	level.gold_counter.archived = false;
	level.gold_counter.alpha = 1;
	level.gold_counter.glowColor = (.3, .3, 0);
	level.gold_counter.glowAlpha = .1;
	level.gold_counter.fontScale = 1.4;
	level.gold_counter.hideWhenInMenu = false;
	level.gold_counter.color = (1, 1, .95);
	level.gold_counter.label = &"Gold bars: &&1/10";
	
	while(1)
	{
		level.gold_counter setValue(level.gold_found);
		wait .7;
	}
}

door_end()
{
	trigger = getEnt( "door_trigger_end", "targetname" );
	trigger_hp = getEnt( "end_hp_trigger", "targetname" );
	door = getEnt( "locked_door", "targetname" );
	
	trigger waittill ( "trigger", player );
	
	trigger_hp setHintString("Get your ^3HP ^7boost!");
	
	door moveZ(-144, 3);
	wait 3;
	
	door delete();
	
	while(1)
	{
		trigger_hp waittill ( "trigger", player );
		
		player iPrintLnBold("Here you go!");
		
		player.health = 200;
		wait 1;
	}
}

end_eye()
{
	trigger = getEnt( "trigger_gold_eye", "targetname" );
	rock = getEnt( "rock_gold_eye", "targetname" );
	eye = getEnt( "gold_eye", "targetname" );
	
	eye linkTo(rock);
	wait .05;
	
	rock hide();
	eye hide();
	
	rock moveZ(-6600, 3);
	wait 3;
	
	trigger setHintString("^1GOLD ^7is the key!?");
	
	while(1)
	{
		if(level.gold_max == level.gold_found)
			break;
	
		wait 1;
	}
	
	trigger setHintString("Press ^1USE ^7to summon the eye!");
	trigger waittill ( "trigger", player );
	
	trigger delete();
	
	play_sound("earthquake", (2064, 2772, -3064));
	fx = spawnFx (level.fx_eye_smoke, (1800, 5716, -8125));
	triggerFx(fx);
	
	earthQuake( 1.5, 20, eye.origin, 8000 );
	rock show();
	rock moveZ(6600, 15);
	wait 15;
	
	fx delete();
	
	play_sound("impact", (2064, 2772, -3064));
	fx_charge = spawnFx (level.fx_eye_giant_charge, (1744, 3974, -3200));
	triggerFx(fx_charge);
	wait 5;
	
	play_sound("stun", eye.origin);
	playFx(level.fx_eye_flash, (1812, 2856, -3172));
	wait .5;
	
	play_sound("evil_laugh", eye.origin);
	wait 1;
	
	fx_charge delete();
	eye show();
	wait .5;
	
	players = getEntArray("player", "classname");
	
	for(i = 0; i < players.size; i++)
	{
		if(isDefined(players[i]) && isAlive(players[i]))
        {
			for(xp = -3; xp < level.gold_max; xp++)
				players[i] braxi\_rank::giveRankXp( "activator" );
		}
		
		wait .1;
	}
}

/*NOTIFICATIONS*******************************************************************/

exec_death_notification(text)
{
	players = getEntArray("player", "classname");
	
	notification = SpawnStruct();
	notification.notifyText = text;
	notification.duration = 5;
	notification.glowcolor = (.9, .9, 0);
		
	for(i = 0; i < players.size; i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(notification);
}

exec_room_notification(title, text)
{
	players = getEntArray("player", "classname");
	
	notification = SpawnStruct();
	notification.titleText = title;
	notification.notifyText = text;
	notification.duration = 5;
	notification.glowcolor = (.9, .9, 0);
		
	for(i = 0; i < players.size; i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(notification);
}

/*FUNCTIONS***********************************************************************/

move_to_pos(target, x, y, z, time, time_start, time_end)
{
	target moveTo((x, y, z), time, time_start, time_end);
	target waittill ("movedone");
}

exec_bounce(player, multiplyer, strenght)
{
	if (isAlive(player) && isDefined(player))
	{
		oldpos = player.origin;
		playFx( level.fx_fire_up, player.origin);
		
		play_sound("jump_pad", player.origin);
		
		for(i = 0; i < multiplyer; i++)
		{
			player.health += strenght;
			player finishPlayerDamage(player, level.jumpattacker, strenght, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90, 180, 0)), "none", 0);
		}
		
		wait .5;
	}
}

exec_rope(player, src, dest, time, time_start, time_end)
{
	player disableWeapons();
	
	src_model = spawn ( "script_model", (5, 7, 1));
	src_model.origin = player.origin;
	src_model.angles = player.angles;
	
	player LinkTo(src_model);
	src_model moveTo(src.origin, 1, .3, .7);
	wait 1;
	
	thread do_rope_fx(player, time);
	src_model moveTo(dest.origin, time, time_start, time_end);
	wait time;
	
	player enableWeapons();
	player UnLink();
	src_model delete();
}

do_rope_fx(player, time)
{
	loop = time * 2;
	
	for(i = 0; i < loop; i++)
	{
		PlayFXOnTag( level.fx_firefly, player, "j_head" );
		wait .5;
	}
}

play_sound(sound, location)
{
    origin = spawn("script_model", location);
    origin playSound(sound);
    origin delete();
	
    return;
}

kill_trap(trigger)
{
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		exec_death(player);
		wait .05;
	}
}

exec_death(player)
{
	PlayFXOnTag( level.fx_blood, player, "j_spinelower" );
	PlayFXOnTag( level.fx_blood, player, "j_neck" );
	
	player suicide();
	wait .05;
}

kill_lava(trigger)
{	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		exec_burn(player);
		wait .05;
	}
}

exec_burn(player)
{
	PlayFX(level.fx_burn, player.origin);
	
	player suicide();
	wait .05;
}

showcase_trap(object)
{
	object notSolid();
	
	while(1)
	{
		object moveZ(2, 2, 1, 1);
		wait 2;
		
		object moveZ(-2, 2, 1, 1);
		wait 2;
	}
}

exec_object_rotate(object)
{
	object notSolid();
	
	while(isDefined(object))
	{
		if (isDefined(object))
			object rotateYaw(120, 6);
		
		if(isDefined(object))
			object moveZ(4, 3, 1.5, 1.5);
		
		wait 3;
		
		if(isDefined(object))
			object moveZ(-4, 3, 1.5, 1.5);
		
		wait 3;
	}
}

exec_heal(player)
{
	if(isDefined(player.isHealed) && !player.isHealed)
	{		
		if(player.health < 100)
		{
			player.isHealed = true;
			
			PlayFXOnTag( level.fx_heal, player, "j_spinelower" );
			
			for(i = player.health; i < 100; i++)
			{
				player.health++;
				wait .1;
			}
			
			player iPrintLnBold("^2You were healed!");
		}
		else
			player iPrintLnBold("^1You are not hurt!");
	}
	else
		player iPrintLnBold("^1You already have been healed before!");

	wait .05;
}

exec_flying_object(object, yaw)
{
	object notSolid();
	
	while(1)
	{
		object rotateYaw(yaw, 14);
		
		object moveZ(-128, 7, 3.5, 3.5);
		wait 7;
		
		object moveZ(128, 7, 3.5, 3.5);
		wait 7;
	}
}

exec_dmg(player, attacker, dmg)
{
	PlayFXOnTag( level.fx_blood, player, "j_spinelower" );
	player finishPlayerDamage(player, attacker, dmg, 0, "MOD_PROJECTILE", "m40a3_mp", player.origin, attacker.angles, "none", 0);
	wait .05;
}

give_random_weapon(x)
{
	gun = level.guns[x];
	wait .05;
	
	return gun;
}

exec_teleport(player, dest)
{
	player setOrigin(dest.origin);
	player setPlayerAngles(dest.angles);
}

exec_luck(player, luck)
{
	if (!level.freeRun || level.trapsDisabled)
	{
		if(isDefined(player.isLucky) && !player.isLucky)
		{
			x = randomInt(level.guns.size);
			
			if (luck == 0)
			{
				player iPrintLnBold("Fred and Mike are happy to see you on deathrun!");
				player braxi\_rank::giveRankXp( "trap_activation" );
				
				player GiveWeapon(give_random_weapon(x));
				player GiveMaxAmmo(give_random_weapon(x));
				player switchToWeapon(give_random_weapon(x));
			}
			
			if (luck == 1)
			{
				player iPrintLnBold("Fred gave you a gun!");
				player GiveWeapon(give_random_weapon(x));
				player GiveMaxAmmo(give_random_weapon(x));
				player switchToWeapon(give_random_weapon(x));
			}
		
			if (luck == 2)
			{
				player iPrintLnBold("Mike gave you a gun!");
				player GiveWeapon(give_random_weapon(x));
				player GiveMaxAmmo(give_random_weapon(x));
				player switchToWeapon(give_random_weapon(x));
			}
		
			player.isLucky = true;
		}
		else
		{
			player iPrintLnBold("^1You should leave now!");
			thread exec_dmg(player, level.activ, 5);
			wait .2;
		}
	}
	else
	{
		player iPrintLnBold("^3Freerun!!!");
		play_sound("hanoi", player.origin);
	}
}

exec_steam(object)
{
	play_sound("air_pressure", object.origin);
	
	playFx(level.fx_steam, object.origin, anglesToForward(object.angles));
	wait .5;
}

exec_move_down(object)
{
	object moveZ(-208, 1, .8, .2);
	wait 1.1;
	
	object delete();
}

/*TEST*CLIENTS********************************************************************/

addTestClients()
{
	setDvar("scr_testclients", "");
	wait 1;
	
	for(;;)
	{
		if(getDvarInt("scr_testclients") > 0)
			break;
		
		wait 1;
	}
	
	testClients = getdvarInt("scr_testclients");
	setDvar("scr_testclients", 0);
	
	for(i=0; i<testClients; i++)
	{
		ent[i] = addTestClient();

		if (!isdefined(ent[i]))
		{
			println("Could not add test client");
			wait 1;
			
			continue;
		}
		
		ent[i].pers["isBot"] = true;
		ent[i] thread testClient("autoassign");
	}
	
	thread addTestClients();
}

testClient(team)
{
	self endon( "disconnect" );

	while(!isdefined(self.pers["team"]))
		wait .05;
		
	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;
}