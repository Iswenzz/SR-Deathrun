/* THANK YOU Pol

Icomar — heute um 22:59 Uhr
If I call it in the script with ambientPlay, I can hear it once, but is that the right way?

Pol — heute um 23:02 Uhr
if it's just once, use this to play it in a desired coordinate

playSoundAtLocation(sound, location, iTime)
{
    m = spawn("script_model", location);
    wait 0.05;
    m playSound(sound);
    wait iTime;
    m delete();
    return;
}

level thread playSoundAtLocation("foo", (312, 10, 20), 5);
ambientplay is meant to play a looping sound as "background" / ambient
*/

/*
while(isAlive( self ))
PlayFXOnTag( fx, self, "j_head" );
PlayFXOnTag( fx, self, "j_neck" );
PlayFXOnTag( fx, self, "j_shoulder_le" );
PlayFXOnTag( fx, self, "j_shoulder_ri" );
PlayFXOnTag( fx, self, "j_spinelower" );
PlayFXOnTag( fx, self, "j_knee_ri" );
PlayFXOnTag( fx, self, "j_knee_le" );
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
	
	setDvar("bg_falldamagemaxheight", 20000 );
	setDvar("bg_falldamageminheight", 15000 );
	
	precacheShellshock("death");
	precacheItem ("winchester1200_mp");
	
	init_global();
	
	thread trap_01();
	thread trap_02();
	thread trap_03();
	thread trap_04();
	thread trap_05();
	thread trap_06();
	
	thread startdoor();
	thread obj_01_02_move();
	thread endmap();
	thread bounce();
	thread bounce_scrt();
	thread fountain_01();
	thread fountain_02();
	thread fountain_03();
	thread recharge_hp();
	thread rope();
	thread ruby_rotate();
	thread toilet();
	thread endrotate();
	
	thread lava();
	thread water();
	thread water_splash();
	thread death_01();
	thread death_02();
	
	thread open_secret_door();
	thread secret_spawn_01();
	thread secret_spawn_02();
	thread secret_spawn_03();
	thread secret_spawn_04();
	thread secret_spawn_05();
	thread secret_spawn_06();
	thread secret_wall_teleport();
	thread secret_shortcut();
	thread secret_wall_02();
	thread secret_brick();
	thread secret_wall();
	thread secret_wall2();
	
	thread jump_respawn();
	thread jumproom_entry();
	thread jump_get_gun();
	
	thread kniferoom_entry();
	
	thread sniperoom_entry();
	
	thread endroom_rope();
	
	thread credits_obj();
	thread credits();
	
	addTriggerToList( "trap_01_trigger" );
    addTriggerToList( "trap_02_trigger" );
    addTriggerToList( "trap_03_trigger" );
    addTriggerToList( "trap_04_trigger" );
    addTriggerToList( "trap_05_trigger" );
    addTriggerToList( "trap_06_trigger" );
}

/*********************************************************************************/

init_global()
{
	SetExpFog( 2000, 2000, .99, .8, .54, 3 );
	
	level.fx_firepowder = LoadFX( "custom/distortional_firepowder" );
	level.fx_distortion = LoadFX( "custom/distortion" );
	level.fx_fire_up = LoadFX( "custom/fire_pad" );
	level.fx_fire_area = LoadFX( "custom/fire_area" );
	level.fx_glow = LoadFX( "custom/glow_red" );
	level.fx_ruby = LoadFX( "custom/glow_ruby" );
	level.fx_lava_heat = LoadFX( "custom/distortion_heat" );
	level.fx_lava_flys = LoadFX( "custom/lava_flys" );
	level.fx_ash = LoadFX( "custom/lava_ash" );
	level.fx_wave = LoadFX( "custom/wave" );
	level.fx_wave_splash = LoadFX( "custom/wave_splash" );
	level.fx_toilet = LoadFX( "custom/stinky_explosion" );
	level.fx_endporter_snipe = LoadFX( "custom/supernova_r" );
	level.fx_endporter_knife = LoadFX( "custom/supernova_g" );
	level.fx_endporter_jump = LoadFX( "custom/supernova_b" );
	level.fx_teleport = LoadFX( "custom/teleport" );
	level.fx_portal = LoadFX( "custom/green_portal" );
	level.fx_soot = LoadFX( "custom/soot" );
	level.fx_magic = LoadFX( "custom/magic_explosion" );
	level.fx_firefly = LoadFX( "custom/firefly" );
	level.fx_mannequin = LoadFX( "custom/mannequin" );
	
	level.obj_01 = getEnt( "trap_02_obj_01", "targetname" );
	level.obj_02 = getEnt( "trap_02_obj_02", "targetname" );
}

playSoundAtLocation(sound, location)
{
    origin = spawn("script_model", location);
    origin playSound(sound);
    origin delete();
    return;
}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];
	
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


/*********************************************************************************/

trap_01()
{
	floor = getEnt( "trap_01_obj_01", "targetname" );
	trigger = getEnt( "trap_01_trigger", "targetname" );
	floor moveZ( -16, 1);
	
	trigger sethintstring( "Press ^1[USE]^7 to activate" );
    trigger waittill ( "trigger", player );
	
	trigger sethintstring( "^1ACTIVATED" );
	playSoundAtLocation( "drum_02", player.origin );
	
	floor moveZ(16, 1);
	wait 1;
	
	floor delete();
}

trap_02()
{
	trigger = getEnt( "trap_02_trigger", "targetname" );
	
	fx_origin_01 = getEnt( "trap_02_origin_01", "targetname" );
	fx_origin_02 = getEnt( "trap_02_origin_02", "targetname" );
	
	trigger sethintstring( "Press ^1[USE]^7 to activate" );
    trigger waittill ( "trigger", player );
	
	trigger sethintstring( "^1ACTIVATED" );
	playSoundAtLocation( "drum_02", player.origin );
	
	fx_origin_01 linkTo(level.obj_01);
	fx_origin_02 linkTo(level.obj_02);
	
	for(i = 0; i < 10; i++)
	{		
		level.obj_01 Hide();
		level.obj_02 Hide();
		level.obj_01 notSolid();
		level.obj_02 notSolid();
		
		playFx ( level.fx_firepowder, fx_origin_01.origin );
		playFx ( level.fx_firepowder, fx_origin_02.origin );
		wait randomInt(5) + 1;
		
		playFx ( level.fx_distortion, fx_origin_01.origin );
		playFx ( level.fx_distortion, fx_origin_02.origin );
		wait 2;
		
		level.obj_01 Show();
		level.obj_02 Show();
		level.obj_01 Solid();
		level.obj_02 Solid();
		wait randomInt(7) + 2 + i;
	}
}

trap_03()
{
	trigger = getEnt( "trap_03_trigger", "targetname" );
	spikes_01 = getEnt( "trap_03_spikes_01", "targetname" );
	spikes_02 = getEnt( "trap_03_spikes_02", "targetname" );
	spikes_01_hurt = getEnt( "trap_03_hurt_01", "targetname" );
	spikes_02_hurt = getEnt( "trap_03_hurt_02", "targetname" );
	
	spikes_01_hurt enableLinkTo();
	spikes_01_hurt linkTo(spikes_01);
	
	spikes_02_hurt enableLinkTo();
	spikes_02_hurt linkTo(spikes_02);
	
	spikes_01 notSolid();
	spikes_02 notSolid();
	
	spikes_01 moveY(416, 1);
	spikes_02 moveY(416, 1);
	
	trigger sethintstring( "Press ^1[USE]^7 to activate" );
    trigger waittill ( "trigger", player );
	
	trigger sethintstring( "^1ACTIVATED" );
	playSoundAtLocation( "drum_02", player.origin );
	
	spikes_01 moveY(-416, .2);
	wait .5;
	
	spikes_02 moveY(-416, .2);
	wait 3;
	
	spikes_01 moveY(416, 5);
	wait .5;
	
	spikes_02 moveY(416, 5);
	wait 6;
}

trap_04()
{
	trigger = getEnt( "trap_04_trigger", "targetname" );
	target =getEnt( "trap_04_target", "targetname" );
		
	trigger sethintstring( "Press ^1[USE]^7 to activate" );
    trigger waittill ( "trigger", player );
	
	trigger sethintstring( "^1ACTIVATED" );
	playSoundAtLocation( "drum_02", player.origin );
	
	while(1)
	{
		target moveY(-352, 4, 1, 3);
		target waittill("movedone");
		target moveY(352, 4, 1, 3);
		target waittill("movedone");
	}
}

trap_05()
{
	trigger = getEnt( "trap_05_trigger", "targetname" );
	down = getEnt( "trap_05_down_entity", "targetname" );
	top = getEnt( "trap_05_top_entity", "targetname" );
	
	top moveZ(48, 1);
	down moveZ(-136, 1);
	
	trigger sethintstring( "Press ^1[USE]^7 to activate" );
    trigger waittill ( "trigger", player );
	
	trigger sethintstring( "^1ACTIVATED" );
	playSoundAtLocation( "drum_02", player.origin );
	
	top moveZ(-48, 3, 1, 2);
	down moveZ(136, 3, 1, 2);
	wait 3;
}

trap_06()
{
	trigger = getEnt( "trap_06_trigger", "targetname" );
	pusher = getEnt( "trap_06_pusher", "targetname" );
	
	pusher moveX(272, 1);
	
	trigger sethintstring( "Press ^1[USE]^7 to activate" );
    trigger waittill ( "trigger", player );
	
	trigger sethintstring( "^1ACTIVATED" );
	playSoundAtLocation( "drum_02", player.origin );
	
	while(1)
	{
		pusher moveX(-272, 3, 2, 1);
		pusher waittill("movedone");
		pusher moveX(272, 3, 1, 2);
		pusher waittill("movedone");
	}
}

/*********************************************************************************/

startdoor()
{
	target = getEnt("start_door", "targetname");
	fx_01 = getEnt("start_door_fx_01", "targetname");
	fx_02 = getEnt("start_door_fx_02", "targetname");
	
	level waittill("round_started");
	ambientPlay ("fibonacci");
	wait 13;
	
	EarthQuake( .1, 5, fx_02.origin, 1100 );
	
	playFx ( level.fx_soot, fx_01.origin );
	wait .1;
	
	playFx ( level.fx_soot, fx_02.origin );
	
	musicPlay ("door_opening");
	target moveZ( -170, 7, 4, 3);
}

obj_01_02_move()
{
	while(1)
	{
		level.obj_01 moveZ( -32, 3, 2, 1);
		level.obj_02 moveZ( 32, 3, 2, 1);
		wait 3.1;
		
		level.obj_01 moveZ( 32, 3, 2, 1);
		level.obj_02 moveZ( -32, 3, 2, 1);
		wait 3.1;
	}
}

endmap()
{
	trigger = getEnt("end_map_trigger", "targetname");
	
	trigger waittill ( "trigger", player );
	musicPlay ("drum");
	
	endroom_fx();
}

bounce(player)
{
	trigger = getEnt( "trigger_bounce", "targetname" );
	multiplyer = 3;
	strenght = 180;
	
	while(1)
	{
    	trigger waittill ( "trigger", player );
		
		if (isalive(player) && isdefined(player))
		{
			oldpos = player.origin;
			playFx( level.fx_fire_up, player.origin );
			musicPlay ("jump_pad");
		
			for(i = 0; i < multiplyer; i++)
			{
				player.health += strenght;
				player finishPlayerDamage(player, level.jumpattacker, strenght, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0);
			}
		}
	}
}

bounce_scrt(player)
{
	trigger = getEnt( "trigger_bounce_scrt", "targetname" );
	multiplyer = 3;
	strenght = 200;
	
	while(1)
	{
    	trigger waittill ( "trigger", player );
		
		if (isalive(player) && isdefined(player))
		{
			oldpos = player.origin;
			playFx( level.fx_fire_up, player.origin );
			musicPlay ("jump_pad");
		
			for(i = 0; i < multiplyer; i++)
			{
				player.health += strenght;
				player finishPlayerDamage(player, level.jumpattacker, strenght, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0);
			}
		}
	}
}

fountain_01()
{
	f1 = getEnt( "fountain1", "targetname" );
	f4 = getEnt( "fountain4", "targetname" );
	f5 = getEnt( "fountain5", "targetname" );
	
	lava_stream_01 = getEnt( "lava_01_stream_origin", "targetname" );
	lava_stream_04 = getEnt( "lava_04_stream_origin", "targetname" );
	lava_stream_05 = getEnt( "lava_05_stream_origin", "targetname" );
	
	while(1)
	{
		f1 moveZ ( -160, 3, 2, 1);
		f4 moveZ ( -160, 3, 2, 1);
		f5 moveZ ( -160, 3, 2, 1);
		wait 4;
		f1 moveZ ( 160, 3, 2, 1);
		f4 moveZ ( 160, 3, 2, 1);
		f5 moveZ ( 160, 3, 2, 1);
		wait 5;
	}
}

fountain_02()
{
	f2 = getEnt( "fountain2", "targetname" );
	f7 = getEnt( "fountain7", "targetname" );
	
	lava_stream_02 = getEnt( "lava_02_stream_origin", "targetname" );
	lava_stream_07 = getEnt( "lava_07_stream_origin", "targetname" );
	
	wait 3;
	
	while(1)
	{
		f2 moveZ ( -160, 3, 2, 1);
		f7 moveZ ( -160, 3, 2, 1);
		wait 4;
		f2 moveZ ( 160, 3, 2, 1);
		f7 moveZ ( 160, 3, 2, 1);
		wait 5;
	}
}

fountain_03()
{
	f3 = getEnt( "fountain3", "targetname" );
	f6 = getEnt( "fountain6", "targetname" );
	
	lava_stream_03 = getEnt( "lava_03_stream_origin", "targetname" );
	lava_stream_06 = getEnt( "lava_06_stream_origin", "targetname" );
	
	wait 6;
	
	while(1)
	{
		f3 moveZ ( -160, 3, 2, 1);
		f6 moveZ ( -160, 3, 2, 1);
		wait 4;
		f3 moveZ ( 160, 3, 2, 1);
		f6 moveZ ( 160, 3, 2, 1);
		wait 5;
	}
}

recharge_hp()
{
	trigger = getEnt( "heal_trigger", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		player.health = 100;
		player iPrintln("> You got healed by Icomar");
		wait .7;
	}
}

rope()
{
	trigger = getEnt( "trigger_rope", "targetname" );
	rope_src_origin = getEnt( "rope_src_origin", "targetname" );
	rope_dest_origin = getEnt ( "rope_dest_origin", "targetname" );
	rope_drop_origin = getEnt ( "rope_drop_origin", "targetname" );
	
	trigger sethintstring("Press ^1[USE]^7 to rope" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		if (isalive(player) && isdefined(player))
		{			
			player disableWeapons();
			thread rope_move(player, rope_src_origin, rope_dest_origin, rope_drop_origin);
			wait 1;
		}
	}
}

rope_move(player, src, dest, drop) // thx 2 Arfy
{
	// rope_origin = player;
	
	src_model = spawn ( "script_model", (5, 7, 1));
	src_model.origin = player.origin;
	src_model.angles = player.angles;
	
	player LinkTo(src_model);
	src_model moveTo(src.origin, 1, 0.5, 0.5);
	wait 1;
	
	thread do_rope_fx(player, 7);
	src_model moveTo(dest.origin, 4, 1, 1 );
	wait 3.5;
		
	src_model moveTo(drop.origin, 1, 0.5, 0.5 );
	wait 1.5;
			
	player enableWeapons();
	
	player UnLink();
	src_model delete();
}

ruby_rotate()
{
	rubys[0] = getEnt( "trap_01_ruby_rotate", "targetname" );
	rubys[1] = getEnt( "trap_02_ruby_rotate", "targetname" );
	rubys[2] = getEnt( "trap_03_ruby_rotate", "targetname" );
	rubys[3] = getEnt( "trap_04_ruby_rotate", "targetname" );
	rubys[4] = getEnt( "trap_05_ruby_rotate", "targetname" );
	rubys[5] = getEnt( "trap_06_ruby_rotate", "targetname" );
	
	while(1)
	{
		for(i = 0; i < 6; i++)
		{
			rubys[i] rotateYaw(69, 4);
			rubys[i] moveZ(12, 2, 1, 1);
		}
		wait 2;
		
		for(i = 0; i < 6; i++)
			rubys[i] moveZ(-12, 2, 1, 1);
		
		wait 2;
	}
}

do_rope_fx(player, loop)
{
	for(i = 0; i < loop; i++)
	{
		PlayFXOnTag( level.fx_firefly, player, "j_head" );
		wait .5;
	}
}

toilet(player)
{
	trigger = getEnt( "toilet_trigger", "targetname" );
	toilet = getEnt( "toilet_origin", "targetname" );
	teleport = getEnt( "toilet_teleport_origin", "targetname" );
	
	trigger sethintstring("^7Something is stuck in the toilet??" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		playSoundAtLocation("fart", player.origin);
		
		playFx ( level.fx_toilet, toilet.origin );
		Earthquake( .3, 3, player.origin, 850 );
		player disableWeapons();
		wait .2;
		
		player ShellShock( "death", 6 );
		wait 3;
		
		iPrintLnBold("^8" + player.name + " ^7is contaminated!");
		
		player EnableWeapons();
		player setOrigin(teleport.origin);
		player setPlayerAngles(teleport.angles);
		wait .1;
		
		playFx ( level.fx_teleport, teleport.origin );
	}
}

endrotate()
{
	target = getEnt( "end_rotate", "targetname" );
	
	while(1)
	{
		target rotateYaw(180, 5, 2, 3);
		wait 5.5;
		
		target rotateYaw(180, 5, 2, 3);
		wait 5.5;
	}
}

/*********************************************************************************/

lava()
{
	lava_01 = getEnt( "lava_01_origin", "targetname" );
	lava_02 = getEnt( "lava_02_origin", "targetname" );
	lava_03 = getEnt( "lava_03_origin", "targetname" );
	lava_04 = getEnt( "lava_04_origin", "targetname" );
	
	wait 10;
	playFx ( level.fx_lava_heat, lava_01.origin );
	playFx ( level.fx_lava_flys, lava_01.origin );

	wait 10;
	playFx ( level.fx_lava_heat, lava_02.origin );
	playFx ( level.fx_lava_flys, lava_02.origin );
	
	wait 10;
	playFx ( level.fx_lava_heat, lava_03.origin );
	playFx ( level.fx_lava_flys, lava_03.origin );
	
	playFx ( level.fx_ash, lava_04.origin );
}

water()
{
	water_01 = getEnt( "fx_water_01", "targetname" );
	water_02 = getEnt( "fx_water_02", "targetname" );
	water_03 = getEnt( "fx_water_03", "targetname" );
	water_04 = getEnt( "fx_water_04", "targetname" );
	water_05 = getEnt( "fx_water_05", "targetname" );
	water_06 = getEnt( "fx_water_06", "targetname" );
	water_07 = getEnt( "fx_water_07", "targetname" );
	water_08 = getEnt( "fx_water_08", "targetname" );
	water_09 = getEnt( "fx_water_09", "targetname" );
	water_10 = getEnt( "fx_water_10", "targetname" );
	water_11 = getEnt( "fx_water_11", "targetname" );
	water_12 = getEnt( "fx_water_12", "targetname" );
	water_13 = getEnt( "fx_water_13", "targetname" );
	water_14 = getEnt( "fx_water_14", "targetname" );
	water_15 = getEnt( "fx_water_15", "targetname" );
	
	wait 5;
	
	while(1)
	{		
		// island
		playFx ( level.fx_wave, water_04.origin, AnglesToForward((-90, 80, 0)) );
		playFx ( level.fx_wave, water_06.origin, AnglesToForward((-90, 165, 0)) );
		playFx ( level.fx_wave, water_07.origin);
		playFx ( level.fx_wave, water_08.origin, AnglesToForward((-90, -100, 0)) );
		playFx ( level.fx_wave, water_09.origin, AnglesToForward((-90, -40, 0)) );
		playFx ( level.fx_wave, water_10.origin, AnglesToForward((-90, 0, 0)) );
		wait 2;
		
		//side (ruby)
		playFx ( level.fx_wave, water_01.origin); // spawn
		playFx ( level.fx_wave, water_02.origin, AnglesToForward((-90, -135, 0)) );
		playFx ( level.fx_wave, water_03.origin, AnglesToForward((-90, -145, 0)) );
		playFx ( level.fx_wave, water_05.origin, AnglesToForward((-90, 115, 0)) );
		playFx ( level.fx_wave, water_11.origin, AnglesToForward((-90, -40, 0)) );
		playFx ( level.fx_wave, water_12.origin, AnglesToForward((-90, 30, 0)) );
		playFx ( level.fx_wave, water_13.origin, AnglesToForward((-90, 45, 0)) );
		playFx ( level.fx_wave, water_14.origin, AnglesToForward((-90, 90, 0)) );
		playFx ( level.fx_wave, water_15.origin, AnglesToForward((-90, 135, 0)) );
		wait 2;
	}
}

water_splash()
{
	splash_01 = getEnt( "fx_water_splash_01", "targetname" );
	splash_02 = getEnt( "fx_water_splash_02", "targetname" );
	splash_03 = getEnt( "fx_water_splash_03", "targetname" );
	splash_04 = getEnt( "fx_water_splash_04", "targetname" );
	splash_05 = getEnt( "fx_water_splash_05", "targetname" );
	
	splashes = [];
	splashes[0] = splash_01;
	splashes[1] = splash_02;
	splashes[2] = splash_03;
	splashes[3] = splash_04;
	splashes[4] = splash_05;
	
	wait 5;
	
	while(1)
	{
		playFx ( level.fx_wave_splash, splashes[randomInt(5)].origin);
		wait randomInt(10) + 5;
	}
}

playDeathSound(player)
{
	x = 1 + RandomInt(30);

	if( x < 10 ) {playSoundAtLocation("scream_01", player.origin);}
    if( x > 9 && x < 20 ) {playSoundAtLocation("scream_02", player.origin);}
    if( x >= 30 ) {playSoundAtLocation("scream_03", player.origin);}
	
	wait .5;
}

death_01(player)
{
	trigger = getEnt( "trigger_death_01", "targetname" );
	
	while(1)
	{		
		trigger waittill ( "trigger", player );
		playDeathSound(player);
	}
}

death_02(player)
{
	trigger = getEnt( "trigger_death_02", "targetname" );
	
	while(1)
	{		
		trigger waittill ( "trigger", player );
		playDeathSound(player);
	}
}

/*********************************************************************************/

secret_fog()
{
	while(1)
	{
		SetExpFog( 2000, 2000, .76, 0, 0, 3 );
		wait 3;
			
		SetExpFog( 1500, 1500, .99, .8, .54, 3 );
		wait 3;
	}
}

open_secret_door()
{
	trigger = getEnt("secret_trigger", "targetname");
	door = getEnt("secret_wall", "targetname");
	hurt = getEnt("secret_box_hurt", "targetname");
	
	trigger waittill ( "trigger", player );
	hurt delete();
	
	iPrintLnBold("^1" + player.name + " ^7unlocked a secret track!");
	
	ambientStop (2);
	playSoundAtLocation("secret_opening", player.origin);
	door notSolid();
	
	wait 3;
	
	ambientPlay ("supa_dupa_fly");
	secret_fog();
}

secret_spawn_01()
{
	trigger = getEnt( "secret_spawn_01", "targetname" );
	spawn = getEnt( "spawn_origin_01", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		player finishPlayerDamage(player, level.jumpattacker, 5, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0);
		thread do_secret_respawn(player, spawn);
	}
}

secret_spawn_02()
{
	trigger = getEnt( "secret_spawn_02", "targetname" );
	spawn = getEnt( "spawn_origin_02", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		player finishPlayerDamage(player, level.jumpattacker, 5, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0);
		thread do_secret_respawn(player, spawn);
	}
}

secret_spawn_03()
{
	trigger = getEnt( "secret_spawn_03", "targetname" );
	spawn = getEnt( "spawn_origin_03", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		player finishPlayerDamage(player, level.jumpattacker, 5, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0);
		thread do_secret_respawn(player, spawn);
	}
}

secret_spawn_04()
{
	trigger = getEnt( "secret_spawn_04", "targetname" );
	spawn = getEnt( "spawn_origin_04", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		player finishPlayerDamage(player, level.jumpattacker, 5, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0);
		thread do_secret_respawn(player, spawn);
	}
}

secret_spawn_05()
{
	trigger = getEnt( "secret_spawn_05", "targetname" );
	spawn = getEnt( "spawn_origin_05", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		player finishPlayerDamage(player, level.jumpattacker, 5, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0);
		thread do_secret_respawn(player, spawn);
	}
}

secret_spawn_06()
{
	trigger = getEnt( "secret_spawn_06", "targetname" );
	spawn = getEnt( "secret_wall_porter_origin_02", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		iPrintLnBold("^8" + player.name + " turned on the sweat mode!");
		thread do_secret_respawn(player, spawn);
	}
}

secret_wall_teleport(player)
{
	trigger = getEnt( "secret_wall_porter_trigger", "targetname" );
	teleport = getEnt( "secret_wall_porter_origin", "targetname" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		thread do_secret_respawn(player, teleport);
	}
}

do_secret_respawn(player, spawn)
{
	player setOrigin( spawn.origin );
	player setPlayerAngles( spawn.angles );
	
	if (isalive(player) && isdefined(player))
	{	
		playSoundAtLocation( "spawn", spawn.origin );
		playFx ( level.fx_teleport, spawn.origin );
	}
}

secret_shortcut(player)
{
	trigger = getEnt( "secret_shortcut_trigger", "targetname" );
	
	trigger waittill ( "trigger", player );
	
	playSoundAtLocation( "the_way", player.origin );
	iPrintLnBold("^1" + player.name + " ^7is on a better way...");
}

secret_wall_02()
{
	brick_01_trigger = getEnt( "secret_trigger_brick_06", "targetname" );
	brick_02_trigger = getEnt( "secret_trigger_brick_07", "targetname" );
	brick_01 = getEnt( "secret_brick_06", "targetname" );
	brick_02 = getEnt( "secret_brick_07", "targetname" );
	brick_03 = getEnt( "secret_brick_08", "targetname" );
	brick_04 = getEnt( "secret_brick_09", "targetname" );
	
	brick_01 moveY(32, 1);
	brick_02 moveY(16, 1);
	brick_03 moveY(32, 1);
	brick_04 moveY(-48, 1);
	
	brick_01_trigger waittill ( "trigger", player );
	musicPlay ("brick_move");
	brick_01_trigger delete();
	brick_01 moveY(16, 5, 4, 1);
	wait 5.5;
	musicPlay ("start_brick_move");
	wait .5;
	
	brick_02_trigger waittill ( "trigger", player );
	musicPlay ("brick_move");
	brick_02_trigger delete();
	brick_02 moveY(16, 5, 4, 1);
	wait 5.5;
	musicPlay ("start_brick_move");
	wait .5;
	
	musicPlay ("brick_move");
	brick_03 moveY(200, 5, 4, 1);
	brick_04 moveY(48, 5, 4, 1);
	wait 5.5;
	musicPlay ("start_brick_move");
	wait .5;
	
	musicPlay ("brick_move");
	brick_03 moveX(-160, 5, 4, 1);
	wait 5;
	musicPlay ("start_brick_move");
}

secret_wall()
{
	brick_01_trigger = getEnt( "secret_trigger_brick_01", "targetname" );
	brick_02_trigger = getEnt( "secret_trigger_brick_02", "targetname" );
	brick_03_trigger = getEnt( "secret_trigger_brick_03", "targetname" );
	brick_04_trigger = getEnt( "secret_trigger_brick_04", "targetname" );
	brick_01 = getEnt( "secret_brick_01", "targetname" );
	brick_02 = getEnt( "secret_brick_02", "targetname" );
	brick_03 = getEnt( "secret_brick_03", "targetname" );
	brick_04 = getEnt( "secret_brick_04", "targetname" );
	brick_05 = getEnt( "secret_brick_05", "targetname" );
	
	brick_01 moveX(-48, 1);
	brick_02 moveX(64, 1);
	brick_03 moveX(-40, 1);
	brick_04 moveX(-48, 1);
	brick_05 moveY(-64, 1);
	
	brick_01_trigger waittill ( "trigger", player );
	musicPlay ("brick_move");
	brick_01_trigger delete();
	brick_01 moveX(48, 5, 4, 1);
	wait 5;
	musicPlay ("start_brick_move");
	wait .5;
	
	brick_02_trigger waittill ( "trigger", player );
	musicPlay ("brick_move");
	brick_02_trigger delete();
	brick_02 moveX(16, 5, 4, 1);
	wait 5;
	musicPlay ("start_brick_move");
	wait .5;
	
	brick_03_trigger waittill ( "trigger", player );
	musicPlay ("start_brick_move");
	brick_03_trigger delete();
	brick_03 moveX(-4, .3);
	wait 1;
	
	musicPlay ("brick_move");
	brick_03 moveZ(50, 5, 4, 1);
	wait 5;
	
	brick_04_trigger waittill ( "trigger", player );
	musicPlay ("brick_move");
	brick_04_trigger delete();
	iPrintLnBold("^1" + player.name + " ^7unlocked a shortcut...");
	brick_04 moveX(48, 5, 4, 1);
	wait 5;
	
	brick_05 moveY(-96, 6, 5, 1);
	wait 6;
}

secret_wall2()
{
	trigger = getEnt( "secret_trigger_brick_ac", "targetname" );
	mannequin = getEnt( "trigger_mannequin", "targetname" );
	brick = getEnt( "secret_brick_ac", "targetname" );
	
	brick moveY(16, 1);
	
	trigger waittill ( "trigger", player );
	trigger delete();
	
	musicPlay ("brick_move");
	brick moveY(-16, 5, 4, 1);
	wait .5;
	musicPlay ("start_brick_move");
	
	wait 2;
	mannequin SetHintString( "^0Release the ghost!" );
	mannequin waittill ( "trigger", player );
	player thread get_mannequin();
	
	player iPrintLnBold("Press ^1FRAG ^7to place a ghost!");
	mannequin delete();
}

secret_brick()
{
	fx_origin = getEnt( "find_brick_origin", "targetname" );
	bricks[0] = getEnt( "find_brick_01", "targetname" );
	bricks[1] = getEnt( "find_brick_02", "targetname" );
	bricks[2] = getEnt( "find_brick_03", "targetname" );
	bricks[3] = getEnt( "find_brick_04", "targetname" );
	bricks[4] = getEnt( "find_brick_05", "targetname" );
	bricks[5] = getEnt( "find_brick_06", "targetname" );
	bricks[6] = getEnt( "find_brick_07", "targetname" );
	bricks[7] = getEnt( "find_brick_08", "targetname" );
	triggers[0] = getEnt( "find_brick_01_trigger", "targetname" );
	triggers[1] = getEnt( "find_brick_02_trigger", "targetname" );
	triggers[2] = getEnt( "find_brick_03_trigger", "targetname" );
	triggers[3] = getEnt( "find_brick_04_trigger", "targetname" );
	triggers[4] = getEnt( "find_brick_05_trigger", "targetname" );
	triggers[5] = getEnt( "find_brick_06_trigger", "targetname" );
	triggers[6] = getEnt( "find_brick_07_trigger", "targetname" );
	triggers[7] = getEnt( "find_brick_08_trigger", "targetname" );
	
	bricks[0] moveY(16, 1);
	bricks[1] moveY(16, 1);
	bricks[2] moveX(16, 1);
	bricks[3] moveX(16, 1);
	bricks[4] moveY(-16, 1);
	bricks[5] moveY(-16, 1);
	bricks[6] moveX(-16, 1);
	bricks[7] moveX(-16, 1);
	wait 1;
	
	level waittill("round_started");
	
	x = (randomInt(bricks.size));
	iPrintln("[" + x + "] Map by ^1Icomar");
	
	wait 1;
	
	triggers[x] waittill ( "trigger", player );
	
	if (x == 0)
		bricks[0] moveY(-16, .3);
	if (x == 1)
		bricks[1] moveY(-16, .3);
	if (x == 2)
		bricks[2] moveX(-16, .3);
	if (x == 3)
		bricks[3] moveX(-16, .3);
	if (x == 4)
		bricks[4] moveY(16, .3);
	if (x == 5)
		bricks[5] moveY(16, .3);
	if (x == 6)
		bricks[6] moveX(16, .3);
	if (x == 7)
		bricks[7] moveX(16, .3);
	
	musicPlay ("start_brick_move");
	
	playFx ( level.fx_portal, fx_origin.origin );
	thread secret_get_magic();
}

/*********************************************************************************/

secret_get_magic()
{
	trigger = getEnt("trigger_secret_get_magic","targetname");
	
	trigger sethintstring( "^8Get magic bullets" );
	trigger waittill("trigger", player);
	
	bullet_amount = (randomInt(10) + 1);
	
	if (bullet_amount == 1)
		player iPrintLnBold ("Sorry, only ^1one ^7magic bullet for you!");
	else
		player iPrintLnBold ("^8" + bullet_amount + " ^7magic bullets for you!");
	
	player thread magic_bullets(bullet_amount);
	trigger delete();
}

magic_bullets(bullets)
{
	self endon("disconnect");
	self endon("death");
	
	for(i = bullets - 1; i >= 0; i--)
	{		
		self waittill("weapon_fired");
		
		head_origin = self gettagorigin("j_head");
		trace = bullettrace(head_origin, head_origin + AnglesToForward(self getplayerangles()) * 100000, true, self)["position"];
		
		PlayFX( level.fx_magic, trace );
		RadiusDamage( trace, 200, 100, 20, self );
		EarthQuake( .3, 1, trace, 600 );
		
		if (i == 1)
			self iPrintLn (i + " bullet left!");
		else
			self iPrintLn (i + " bullets left!");
	}
}

/*********************************************************************************/

jump_respawn()
{
	respawn_trigger = getEnt("jump_respawn_trigger","targetname");
	level.jump_respawn_activator = getEnt("jump_respawn_activator_origin","targetname");
	level.jump_respawn_jumper = getEnt("jump_respawn_jumper_origin","targetname");
	
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

jumproom_entry()
{
	entry_trigger = getEnt("trigger_jump_room_entry","targetname");
	
	entry_trigger SetHintString( "^1Jump Room" );
	
	while(1)
	{
		entry_trigger waittill("trigger", player);
		
		thread prepare_endroom(player, "Jump Room", level.jump_respawn_jumper, level.jump_respawn_activator, "knife_mp", 0);
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
		wait 1.8;
	}
}

/*********************************************************************************/

kniferoom_entry()
{
	entry_trigger = getEnt("trigger_knife_room_entry","targetname");
	knife_respawn_activator = getEnt("knife_respawn_activator_origin","targetname");
	knife_respawn_jumper = getEnt("knife_respawn_jumper_origin","targetname");
	
	entry_trigger SetHintString( "^1Knife Room" );
	
	while(1)
	{
		entry_trigger waittill("trigger", player);
		
		thread prepare_endroom(player, "Knife Room", knife_respawn_jumper, knife_respawn_activator, "knife_mp", 0);
	}
}

/*********************************************************************************/

sniperoom_entry()
{
	entry_trigger = getEnt("trigger_sniper_room_entry","targetname");
	snipe_respawn_activator = getEnt("sniper_respawn_activator_origin","targetname");
	snipe_respawn_jumper = getEnt("sniper_respawn_jumper_origin","targetname");
	
	entry_trigger SetHintString( "^1Snipe Room" );
	
	while(1)
	{
		entry_trigger waittill("trigger", player);
		
		thread prepare_endroom(player, "Sniper Room", snipe_respawn_jumper, snipe_respawn_activator, "m40a3_mp", 1);
	}
}

/*********************************************************************************/

endroom_rope()
{
	trigger = getEnt("endroom_rope_entry","targetname");
	start = getEnt("endroom_rope_start","targetname");
	end = getEnt("endroom_rope_end","targetname");
	drop = getEnt("endroom_rope_drop","targetname");
	
	trigger sethintstring("Press ^1[USE]^7 to rope" );
	
	while(1)
	{
		trigger waittill ( "trigger", player );
		
		if(!isdefined(trigger))
            return;
		
		trigger sethintstring("^1Wait till its your turn!" );
		
		if (isalive(player) && isdefined(player))
		{			
			player disableWeapons();
			
			src_model = spawn ( "script_model", (5, 7, 1));
			src_model.origin = player.origin;
			src_model.angles = player.angles;
			
			player LinkTo(src_model);
			src_model moveTo(start.origin, 1, 0.5, 0.5);
			wait 1;
			
			thread do_rope_fx(player, 8);
			src_model moveTo(end.origin, 4, 3, 1 );
			wait 4;
			
			src_model moveTo(drop.origin, 1, 0.5, 0.5 );
			wait 1.1;
			
			player enableWeapons();
			src_model delete();
			
			player common_scripts\utility::waittill_any("death", "disconnect");
			
			noti = SpawnStruct();
			noti.notifyText = "^1" + player.name + "^7 died";
			noti.duration = 3;
			noti.glowcolor = (0, 0.9, 2);
			players = getEntArray( "player", "classname" );
		
			for( i=0;i<players.size;i++ )
				players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
			wait .1;
			
			trigger sethintstring("Press ^1[USE]^7 to rope" );
		}
	}
}

prepare_endroom(player, choice, jumper_origin, acti_origin, gun, is2nd)
{
	player takeallweapons();
    level.activ takeallweapons();
	
	player freezeControls(1);
	level.activ freezeControls(1);
	
	noti = SpawnStruct();
	noti.titleText = choice;
	noti.notifyText = "^1" + player.name + "^7 VS ^1" + level.activ.name;
	noti.duration = 5;
	noti.glowcolor = (0, 0.9, 2);
	players = getEntArray( "player", "classname" );
		
	for( i=0;i<players.size;i++ )
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		
	player setOrigin( jumper_origin.origin );
	player setPlayerangles( jumper_origin.angles );
		
	level.activ setOrigin( acti_origin.origin );
	level.activ setPlayerangles( acti_origin.angles );
		
	player GiveWeapon(gun);
	level.activ GiveWeapon(gun);
	
	if(is2nd == 1)
	{
		player GiveMaxAmmo(gun);
		level.activ GiveMaxAmmo(gun);
		
		player GiveWeapon("remington700_mp");
		player GiveMaxAmmo("remington700_mp");
		level.activ GiveWeapon("remington700_mp");
		level.activ GiveMaxAmmo("remington700_mp");
	}
	
	wait .05;
		
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
	start.glowcolor = ( 0, 1, 0 );
	start setText( "^73" );
	start SetPulseFX( 100, 4000, 500 );
	wait 1.2;
	start setText( "^72" );
	start SetPulseFX( 100, 4000, 500 );
	wait 1.2;
		
	player enableWeapons(1);
	level.activ enableWeapons(1);
		
	player switchToWeapon(gun);
	level.activ switchToWeapon(gun);
		
	start setText( "^71" );
	start SetPulseFX( 100, 4000, 500 );
	wait 1.4;
	
	start setText( "^1FIGHT!" );
	start SetPulseFX( 100, 4000, 500 );
		
	player freezeControls(0);
	level.activ freezeControls(0);
	wait .05;
}

endroom_fx()
{
	fx_jump = getEnt("jump_room_fx_porter","targetname");
	fx_knife = getEnt("knife_room_fx_porter","targetname");
	fx_snipe = getEnt("sniper_room_fx_porter","targetname");
	
	PlayFX( level.fx_endporter_jump, fx_jump.origin );
	wait .3;
	
	PlayFX( level.fx_endporter_knife, fx_knife.origin );
	wait .3;
	
	PlayFX( level.fx_endporter_snipe, fx_snipe.origin );
	wait .3;
}

/*********************************************************************************/

credits_obj()
{
	ruby = getEnt( "credits_ruby", "targetname" );
	
	ruby notSolid();
	
	while(1)
	{
		ruby rotateYaw(69, 4);
		ruby moveZ(-12, 2, 1, 1);
		wait 2;
		ruby moveZ(12, 2, 1, 1);
		wait 2;
	}
}

get_mannequin()
{
	self endon("disconnect");
	self endon("death");
	
	while(1)
	{		
		if (self FragButtonPressed())
		{
			PlayFX( level.fx_mannequin, self.origin);
			wait 5;
		}
		
		wait .1;
	}
}

credits(player)
{
	trigger = getEnt( "credits_trigger", "targetname" );
	
	while(1)
	{
		trigger sethintstring( "^9Credits" );
		trigger waittill( "trigger", player );
	
		iPrintln("> Map by ^1Icomar");
		wait 1.4;
		
		iPrintln("> Big thanks to ^1Arfy ^7for scripting help!");
		wait 1.4;
		
		iPrintln("> Thanks to ^1Nennius ^7for the deathrun memes!");
		wait 1.4;
		
		iPrintln("> Thanks to ^1Glenbob ^7for the deathrun memes!");
		wait 1.4;
		
		iPrintln("> Thanks to ^1Pol ^7for the sound effect script!");
		wait 5;
	}
}

info(title, label, glowcolor, duration)
{
	info = SpawnStruct();
	info.titleText = title;
	info.notifyText = label;
	info.glowcolor = glowcolor;
	info.duration = duration;
	
	players = getEntArray("player", "classname");
	
	for(i = 0; i < players.size; i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(info);
}