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
	
	setDvar("bg_falldamagemaxheight", 15000 );
	setDvar("bg_falldamageminheight", 10000 );
	
	precacheitem("deserteaglegold_mp");
	precacheItem ("winchester1200_mp");
	
	level.fx_teleport = LoadFX("custom/neondesert/teleport");
	level.fx_teleport_small = LoadFX("custom/neondesert/teleport_small");
	level.fx_teleport_act = LoadFX("custom/neondesert/teleport_interact");
	level.fx_teleport_while = LoadFX("custom/neondesert/teleport_while");
	level.fx_death = LoadFX("custom/neondesert/death");
	level.fx_trace = LoadFX("custom/neondesert/trace");
	level.fx_fw_pink = LoadFX("custom/neondesert/firework_pink");
	level.fx_fw_red = LoadFX("custom/neondesert/firework_red");
	level.fx_fw_yellow = LoadFX("custom/neondesert/firework_yellow");
	level.fx_fw_blue = LoadFX("custom/neondesert/firework_blue");
	level.fx_trace_small = LoadFX("custom/neondesert/trace_small");
	level.fx_trace_small_impact = LoadFX("custom/neondesert/trace_small_impact");
	level.fx_sun = LoadFX("custom/neondesert/retro_sun");
	level.fx_explosion = LoadFX("custom/neondesert/special_explosion");
	level.fx_air = LoadFX("custom/neondesert/air_steam");
	level.fx_blood = LoadFX("custom/blood_pool");
	
	thread addTriggerToList("trap1_trigger");
	thread addTriggerToList("trap2_trigger");
	thread addTriggerToList("trap3_trigger");
	thread addTriggerToList("trap4_trigger");
	thread addTriggerToList("trap5_trigger");
	thread addTriggerToList("trap6_trigger");
	thread addTriggerToList("trap7_trigger");
	
	thread on_start();
	
	thread init_trap_1("trap1_object1", "trap1_object2");
	thread init_trap_2("trap2_spikes1", "trap2_spikes2", "trap2_spikes1_hurt", "trap2_spikes2_hurt");
	thread init_trap_3("trap3_object");
	thread init_trap_4("trap4_object");
	thread init_trap_5("trap5_object");
	thread init_trap_6("trap6_object1", "trap6_object2");
	thread init_trap_7("trap7_object1", "trap7_object2");
	
	thread addTestClients();
}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];
	
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

on_start()
{	
	level waittill("round_started");
	
	ambientPlay("on_the_run");
	
	players = getEntArray("player", "classname");
	
	for(i = 0; i < players.size; i++)
	{
		players[i].isTeleporting = false;		// is teleporting
		players[i].isDead = false;				// is dead
		players[i].hasJumpGun = false;			// has gun in jump room
		players[i].hasFinished = false;			// has finished the map
		players[i].hasAmmo = false;				// has finished the map
	}
	
	level.playerEndroom = undefined;
	level.playerLastAlive = undefined;
	level.isFirework = false;
	
	// MISC
	
	thread do_moving_platforms("moving_platform_1", "moving_platform_2");
	thread do_teleport("trigger_teleport", "teleport_start", "teleport_end");
		
	thread do_trigger_death("trigger_death");
	
	// ENDROOMS
	
	thread on_endrooms();
	
	thread do_trigger_death_endroom("trigger_death_sniper", level.sniper_end_j_origin);
	thread do_trigger_death_endroom("trigger_death_jump", level.jump_end_j_origin);
	
	playFx(level.fx_sun, (-18232, -456, -136));
	
	thread on_finish("trigger_finish", "finish_fx_01", "finish_fx_02");
	
	thread on_vendor("trigger_vendor");
	on_startdoor("startdoor");
	
	for(;;)
	{
		if(getTeamPlayersAlive("allies") == 1)
		{
			players = getEntArray("player", "classname");
			
			for(i = 0; i < players.size; i++)
			{
				if(isAlive(players[i]) && players[i].pers["team"] == "allies")
				{
					iPrintLnBold("^6" + players[i].name + " ^7is the ^6final ^7jumper!");
					players[i] braxi\_rank::giveRankXp("trap_activation");
					level.playerLastAlive = players[i];
				}
			}
		}
		
		while(isDefined(level.playerLastAlive) && isAlive(level.playerLastAlive))
			wait 1;
		
		wait 1;
	}
}

on_startdoor(object_entity)
{
	startdoor = getEnt(object_entity, "targetname");
	
	iPrintLn("> Map by ^6Icomar");
	wait 3;
	
	iPrintLn("> Big thanks to ^6Arfy");
	
	startdoor moveZ(-120, 6, 4, 2);
	wait 6;
	
	startdoor delete();
}

on_vendor(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(level.trapsDisabled) && !level.trapsDisabled && !player.hasAmmo)
		{
			player iPrintLnBold("Here's some ^6ammo^7!");
			thread give_special_small_bullets(player);
			player.hasAmmo = true;
		}
		else
			player iPrintLnBold("^1OUT OF STOCK!");
		
		wait .1;
	}
}

on_finish(trigger_entity, fx_entity_1, fx_entity_2)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	spawn_1 = getEnt(fx_entity_1, "targetname");
	spawn_2 = getEnt(fx_entity_2, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(!player.hasFinished)
		{
			player.hasFinished = true;
			player braxi\_rank::giveRankXp("trap_activation");
			
			playFx(level.fx_air, spawn_1.origin, anglesToForward(spawn_1.angles));
			playFx(level.fx_air, spawn_2.origin, anglesToForward(spawn_2.angles));
			
			if(!level.isFirework)
				thread on_firework();
		}
		
		wait .05;
	}
}

on_firework()
{
	fw_1 = getEnt("fw_origin_01", "targetname");
	fw_2 = getEnt("fw_origin_02", "targetname");
	fw_3 = getEnt("fw_origin_03", "targetname");
	fw_4 = getEnt("fw_origin_04", "targetname");
	fw_5 = getEnt("fw_origin_05", "targetname");
	fw_6 = getEnt("fw_origin_06", "targetname");
	fw_7 = getEnt("fw_origin_07", "targetname");
	fw_8 = getEnt("fw_origin_08", "targetname");
	fw_9 = getEnt("fw_origin_09", "targetname");
	
	for(;;)
	{
		x = 1 + RandomInt(8);
		height = 7 + RandomInt(8);
		
		thread do_firework("fw_origin_0" + x, height, get_random_firework());
		wait x / 5;
	}
}

get_random_firework()
{
	x = RandomInt(4);
		
	if(x == 0)
		return level.fx_fw_pink;
	if(x == 1)
		return level.fx_fw_red;
	if(x == 2)
		return level.fx_fw_yellow;
	if(x == 3)
		return level.fx_fw_blue;
}

do_firework(spawn, height, fx)
{
	spawn = getEnt(spawn, "targetname");
	
	rocket = Spawn("script_model", spawn.origin);
	rocket setModel("tag_origin");
	rocket.angles = spawn.angles;
	
	for(i = 0; i < height; i++)
	{
		playFxOnTag(level.fx_trace_small, rocket, "tag_origin");
		rocket moveZ(200, .05);
		wait .05;
	}
	
	playFx(fx, rocket.origin);
	on_sound("firework_explosion", rocket.origin);
	rocket delete();
}

on_endrooms()
{
	// SNIPER
	level.sniper_start_j_origin = getEnt("endroom_sniper_j_spawn_start", "targetname");
	level.sniper_end_j_origin = getEnt("endroom_sniper_j_spawn_end", "targetname");
	level.sniper_a_origin = getEnt("endroom_sniper_a_spawn", "targetname");
	level.sniper_enter_trigger = getEnt("endroom_sniper_enter_trigger", "targetname");

	// JUMP
	level.jump_start_j_origin = getEnt("endroom_jump_j_spawn_start", "targetname");
	level.jump_end_j_origin = getEnt("endroom_jump_j_spawn_end", "targetname");
	level.jump_a_origin = getEnt("endroom_jump_a_spawn", "targetname");
	level.jump_enter_trigger = getEnt("endroom_jump_enter_trigger", "targetname");
	level.jump_get_gun_trigger = getEnt("trigger_jump_get_gun", "targetname");
	
	// SPECIAL
	level.special_start_j_origin = getEnt("endroom_special_j_spawn_start", "targetname");
	level.special_end_j_origin = getEnt("endroom_special_j_spawn_end", "targetname");
	level.special_a_origin = getEnt("endroom_special_a_spawn", "targetname");
	level.special_enter_trigger = getEnt("endroom_special_enter_trigger", "targetname");
	level.walls = getEnt("endroom_special_walls", "targetname");
	
	// OLD
	level.old_trigger = getEnt("trigger_endroom_old", "targetname");
	level.old_door = getEnt("endroom_old_door", "targetname");
	
	level.walls hide();
	level.walls moveZ(-1800, 1);
	wait 1;
	
	level.isSniper = false;
	level.isJump = false;
	level.isSpecial = false;
	
	thread on_old();
	thread on_sniper();
	thread on_jump();
	thread on_special();
	thread jump_get_gun();
}

jump_get_gun()
{
	for(;;)
	{
		level.jump_get_gun_trigger waittill("trigger", player);
		
		if(isDefined(player) && isAlive(player) && !player.hasJumpGun)
		{
			player GiveWeapon( "remington700_mp");
			player GiveMaxAmmo( "remington700_mp");
			player switchToWeapon( "remington700_mp");
			player.hasJumpGun = true;
		}
		
		wait .5;
	}
}

on_old()
{
	for(;;)
	{
		level.old_trigger waittill("trigger", player);
		
		if(!player.hasFinished)
		{
			player iPrintLnBold("^1Are you sure, you finished the map?");
			continue;
		}
		
		iPrintLnBold("^6" + player.name + " ^7has chosen ^6Classic");
		level.old_door moveZ(-144, 3, 2, 1);
		wait 3;
	
		if(isDefined(level.activ))
			level.activ.health = 187;
	
		level.sniper_enter_trigger delete();
		level.jump_enter_trigger delete();
		level.special_enter_trigger delete();
		level.old_trigger delete();
		break;
	}
}

on_sniper()
{
	level.sniper_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Sniper");
	playFx(level.fx_teleport_small, level.sniper_start_j_origin.origin);
	
	for(;;)
	{
		level.sniper_enter_trigger waittill("trigger", player);
		
		if(!player.hasFinished)
		{
			player iPrintLnBold("^1Are you sure, you finished the map?");
			continue;
		}
		
		if(level.isSniper)
			continue;
		
		if(level.isJump)
			continue;
		
		if(level.isSpecial)
			continue;
		
		level.playerEndroom = player;
		level.isSniper = true;
		level.sniper_enter_trigger setHintstring("^1Waiting...");
		level.jump_enter_trigger setHintstring("^1Waiting...");
		level.special_enter_trigger setHintstring("^1Waiting...");
		
		iPrintLnBold("^6" + player.name + " ^7has chosen ^6Sniper");
		wait .5;
		
		player takeallweapons();
		player GiveWeapon( "remington700_mp");
		player GiveMaxAmmo( "remington700_mp");
		player switchToWeapon( "remington700_mp");
		
		if(isDefined(level.activ))
		{
			level.activ takeallweapons();
			level.activ GiveWeapon("remington700_mp");
			level.activ GiveMaxAmmo("remington700_mp");
			level.activ switchToWeapon("remington700_mp");
		}

		on_teleport_endroom(player, level.sniper_start_j_origin, level.sniper_end_j_origin, level.sniper_a_origin);
		
		player common_scripts\utility::waittill_any("death", "disconnect");
		iPrintLnBold("^6" + player.name + " ^7died");
		wait 1;
		
		level.isSniper = false;
		level.sniper_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Sniper");
		level.jump_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Jump ^1(no respawn!)");
		
		if(isDefined(level.playerLastAlive))
			level.special_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^3" + level.playerLastAlive.name + "'s ^7Final Endgame");
	}
}

on_jump()
{
	level.jump_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Jump ^1(no respawn!)");
	playFx(level.fx_teleport_small, level.jump_start_j_origin.origin);
	
	for(;;)
	{
		level.jump_enter_trigger waittill("trigger", player);
		
		if(!player.hasFinished)
		{
			player iPrintLnBold("^1Are you sure, you finished the map?");
			continue;
		}
		
		if(level.isSniper)
			continue;
		
		if(level.isJump)
			continue;
		
		if(level.isSpecial)
			continue;
		
		level.playerEndroom = player;
		level.isJump = true;
		level.sniper_enter_trigger setHintstring("^1Waiting...");
		level.jump_enter_trigger setHintstring("^1Waiting...");
		level.special_enter_trigger setHintstring("^1Waiting...");
		
		iPrintLnBold("^6" + player.name + " ^7has chosen ^6Jump");
		wait .5;
		
		player takeallweapons();
		player GiveWeapon( "knife_mp" );
		player GiveMaxAmmo( "knife_mp" );
		player switchToWeapon( "knife_mp" );
		
		if(isDefined(level.activ))
		{
			level.activ takeallweapons();
			level.activ GiveWeapon( "knife_mp" );
			level.activ GiveMaxAmmo( "knife_mp" );
			level.activ switchToWeapon( "knife_mp" );
		}
		
		on_teleport_endroom(player, level.jump_start_j_origin, level.jump_end_j_origin, level.jump_a_origin);
		
		player common_scripts\utility::waittill_any("death", "disconnect");
		iPrintLnBold("^6" + player.name + " ^7died");
		wait 1;
		
		level.isJump = false;
		level.sniper_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Sniper");
		level.jump_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Jump ^1(no respawn!)");
		
		if(isDefined(level.playerLastAlive))
			level.special_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^3" + level.playerLastAlive.name + "'s ^7Final Endgame");
	}
}

on_special()
{
	for(;;)
	{
		if(isDefined(level.playerLastAlive))
			break;
		
		wait 1;
	}
	
	level.special_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^3" + level.playerLastAlive.name + "'s ^7Final Endgame");
	playFx(level.fx_teleport_small, level.special_start_j_origin.origin);
	
	for(;;)
	{
		level.special_enter_trigger waittill("trigger", player);
		
		if(player != level.playerLastAlive)
		{
			player iPrintLnBold("^1You are not ^3" + level.playerLastAlive.name + "^1!");
			continue;
		}
		
		if(!player.hasFinished)
		{
			player iPrintLnBold("^1Are you sure, you finished the map?");
			continue;
		}
		
		walls_moved = false;
		thread walls_move(walls_moved);
		
		if(level.isSniper)
			continue;
		
		if(level.isJump)
			continue;
		
		if(level.isSpecial)
			continue;
		
		level.playerEndroom = player;
		level.isSpecial = true;
		level.sniper_enter_trigger setHintstring("^1Waiting...");
		level.jump_enter_trigger setHintstring("^1Waiting...");
		level.special_enter_trigger setHintstring("^1Waiting...");
		
		iPrintLnBold("^6" + player.name + " ^7has chosen ^6Final Endgame");
		wait .5;
		
		player takeallweapons();
		player GiveWeapon("winchester1200_mp");
		player GiveMaxAmmo("winchester1200_mp");
		player switchToWeapon("winchester1200_mp");
		
		player setMoveSpeedScale(2.3);
		thread give_jump_power(player);
		thread give_special_bullets(player);
		player.health = 500;
		
		if(isDefined(level.activ))
		{
			level.activ takeallweapons();
			level.activ GiveWeapon("winchester1200_mp");
			level.activ GiveMaxAmmo("winchester1200_mp");
			level.activ switchToWeapon("winchester1200_mp");
			
			level.activ setMoveSpeedScale(2.3);
			thread give_jump_power(level.activ);
			thread give_special_bullets(level.activ);
			level.activ.health = 500;
		}
		
		on_teleport_endroom(player, level.special_start_j_origin, level.special_end_j_origin, level.special_a_origin);
		
		player common_scripts\utility::waittill_any("death", "disconnect");
		iPrintLnBold("^6" + player.name + " ^7died");
		wait 1;
		
		level.isSpecial = false;
		level.sniper_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Sniper");
		level.jump_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Jump ^1(no respawn!)");
		
		if(isDefined(level.playerLastAlive))
			level.special_enter_trigger setHintstring("^6Press ^7&&1 ^6to enter ^3" + level.playerLastAlive.name + "'s ^7Final Endgame");
	}
}

walls_move(walls_moved)
{
	if(isDefined(walls_moved) || walls_moved == false)
	{
		level.walls show();
		level.walls moveZ(1800, 10, 3, 7);
		walls_moved = true;
		wait 10;
	}
}

give_jump_power(player)
{
	player endon("disconnect");
	player endon("death");
	
	in_air = false;
	
	for(;;)
	{
		if(isDefined(player) && isAlive(player) && !player isOnGround() && !in_air)
		{
			if(in_air)
				continue;
				
			for(i = 0; i < 3; i++)
			{
				player.health += 500;
				player finishPlayerDamage(player, level.jumpattacker, 500, 0, "MOD_FALLING", "shock_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0);
			}
			
			in_air = true;
		}	
		else if(player isOnGround() && in_air)
			in_air = false;
			
		wait .05;
	}
}

give_special_bullets(player)
{	
	player endon("disconnect");
	player endon("death");

	for(;;)
	{		
		player waittill("weapon_fired");
		
		if(isDefined(player) && isAlive(player))
			thread trace_bullet(player);
	}
}

give_special_small_bullets(player)
{	
	player endon("disconnect");
	player endon("death");

	for(;;)
	{		
		player waittill("weapon_fired");
		
		if(isDefined(player) && isAlive(player))
			thread trace_bullet_small(player);
	}
}

trace_bullet(player)
{	
	bullet = Spawn("script_model", player GetEye() + anglesToForward(player GetPlayerAngles()) * 180);
	bullet setModel("tag_origin");
	bullet.angles = player getPlayerAngles();
	
	for(;;)
	{
		playFxOnTag(level.fx_trace, bullet, "tag_origin");
		target = bullet.origin + AnglesToForward(bullet.angles) * 300;
		bullet moveTo(target, 0.05);
				
		if(!bulletTracePassed(bullet.origin, target, true, player))
			break;
				
		wait 0.05;
	}
	
	thread on_sound("boom", bullet.origin);
	playFx(level.fx_explosion, bullet.origin);
	radiusDamage(bullet.origin, 300, 200, 50, player);
	earthQuake(.3, 1, bullet.origin, 800);
	bullet delete();
}

trace_bullet_small(player)
{
	bullet = Spawn("script_model", player GetEye() + anglesToForward(player GetPlayerAngles()) * 120);
	bullet setModel("tag_origin");
	bullet.angles = player getPlayerAngles();
	
	for(;;)
	{
		playFxOnTag(level.fx_trace_small, bullet, "tag_origin");
		target = bullet.origin + AnglesToForward(bullet.angles) * 70;
		bullet moveTo(target, 0.05);
				
		if(!bulletTracePassed(bullet.origin, target, true, player))
			break;
				
		wait 0.05;
	}
	
	playFx(level.fx_trace_small_impact, bullet.origin);
	bullet delete();
}

move_walls(walls_entity)
{
	walls = getEnt(walls_entity, "targetname");
}

init_trap_1(object_1_entity, object_2_entity)
{
	object_1 = getEnt(object_1_entity, "targetname");
	object_2 = getEnt(object_2_entity, "targetname");
	
	level.trapTriggers[0] setHintstring("Press ^6&&1 ^7to activate");
	
	level.trapTriggers[0] waittill("trigger", player);
	
	level.trapTriggers[0] setHintstring("^1Activated");
	
	object_1 delete();
	
	for(;;)
	{
		object_2 moveY(832, 6, 3, 3);
		object_2 waittill("movedone");
		
		object_2 moveY(-832, 6, 3, 3);
		object_2 waittill("movedone");
	}
}

init_trap_2(object_1_entity, object_2_entity, object_1_hurt, object_2_hurt)
{
	spikes_1 = getEnt(object_1_entity, "targetname");
	spikes_2 = getEnt(object_2_entity, "targetname");
	hurt_1 = getEnt(object_1_hurt, "targetname");
	hurt_2 = getEnt(object_2_hurt, "targetname");
	
	hurt_1 enableLinkTo();
	hurt_2 enableLinkTo();
	
	hurt_1 linkTo(spikes_1);
	hurt_2 linkTo(spikes_2);
	
	spikes_1 notSolid();
	spikes_2 notSolid();
	
	spikes_1 moveZ(-136, .05);
	spikes_2 moveZ(-136, .05);
	
	level.trapTriggers[1] setHintstring("Press ^6&&1 ^7to activate");
	
	level.trapTriggers[1] waittill("trigger", player);
	
	level.trapTriggers[1] setHintstring("^1Activated");
	
	thread trap_2_hurt(hurt_1);
	thread trap_2_hurt(hurt_2);
	
	for(;;)
	{
		spikes_1 moveZ(136, .1);
		spikes_1 waittill("movedone");
		wait 1;
		
		spikes_1 moveZ(-136, 3, 1.5, 1.5);
		spikes_1 waittill("movedone");
		
		spikes_2 moveZ(136, .1);
		spikes_2 waittill("movedone");
		wait 1;
		
		spikes_2 moveZ(-136, 3, 1.5, 1.5);
		spikes_2 waittill("movedone");
	}
}

trap_2_hurt(trigger)
{
	for(;;)
	{
		trigger waittill("trigger", player);
	
		if(isAlive(player))
		{
			playFx(level.fx_blood, player.origin);
			player suicide();
		}
		
		wait .05;
	}
}

init_trap_3(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[2] setHintstring("Press ^6&&1 ^7to activate");
	
	level.trapTriggers[2] waittill("trigger", player);
	
	level.trapTriggers[2] setHintstring("^1Activated");

	object moveZ(128, 2, 1, 1);
	object waittill("movedone");
	wait 1;
	
	object moveZ(-128, 4, 2, 2);
	object waittill("movedone");
}

init_trap_4(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[3] setHintstring("Press ^6&&1 ^7to activate");
	
	level.trapTriggers[3] waittill("trigger", player);
	
	level.trapTriggers[3] setHintstring("^1Activated");
	
	for(;;)
	{
		object rotateYaw(-180, 3);
		wait 3;
	}
}

init_trap_5(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[4] setHintstring("Press ^6&&1 ^7to activate");
	
	level.trapTriggers[4] waittill("trigger", player);
	
	level.trapTriggers[4] setHintstring("^1Activated");
	
	object moveZ(-512, 4, 3, 1);
	object waittill("movedone");
	object delete();
}

init_trap_6(object_1_entity, object_2_entity)
{
	object_1 = getEnt(object_1_entity, "targetname");
	object_2 = getEnt(object_2_entity, "targetname");
	
	level.trapTriggers[5] setHintstring("Press ^6&&1 ^7to activate");
	
	level.trapTriggers[5] waittill("trigger", player);
	
	level.trapTriggers[5] setHintstring("^1Activated");
	
	object_1 delete();
	
	for(;;)
	{
		object_2 moveY(-576, 4, 2, 2);
		object_2 waittill("movedone");
		
		object_2 moveY(576, 4, 2, 2);
		object_2 waittill("movedone");
	}
}

init_trap_7(object_1_entity, object_2_entity)
{
	object_1 = getEnt(object_1_entity, "targetname");
	object_2 = getEnt(object_2_entity, "targetname");
	
	level.trapTriggers[6] setHintstring("Press ^6&&1 ^7to activate");
	
	level.trapTriggers[6] waittill("trigger", player);
	
	level.trapTriggers[6] setHintstring("^1Activated");
	
	for(;;)
	{
		object_1 rotateRoll(-60, 3, 1.5, 1.5);
		object_2 rotateRoll(60, 3, 1.5, 1.5);
		wait 3;
		
		object_1 rotateRoll(60, 3, 1.5, 1.5);
		object_2 rotateRoll(-60, 3, 1.5, 1.5);
		wait 3;
	}
}

do_moving_platforms(object_1_entity, object_2_entity)
{
	platform_1 = getEnt(object_1_entity, "targetname");
	platform_2 = getEnt(object_2_entity, "targetname");
	
	for(;;)
	{
		platform_1 moveX(1216, 5, 2.5, 2.5);
		platform_2 moveX(-1216, 5, 2.5, 2.5);
		platform_2 waittill("movedone");
		
		platform_1 moveX(-1216, 5, 2.5, 2.5);
		platform_2 moveX(1216, 5, 2.5, 2.5);
		platform_2 waittill("movedone");
	}
}

do_teleport(trigger_entity, start_entity, end_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	start = getEnt(start_entity, "targetname");
	end = getEnt(end_entity, "targetname");
	
	playFx(level.fx_teleport, start.origin);
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(!player.isTeleporting)
		{
			player.isTeleporting = true;
			thread on_teleport(player, start, end);
		}
	}
}

on_teleport(player, start, end)
{
	thread on_sound("swoosh", start.origin);
	player disableWeapons();
	player hide();
	wait .05;
	
	player setOrigin(start.origin);
	player setPlayerAngles(start.angles);
	playFx(level.fx_teleport_act, start.origin);
	
	src_model = spawn ( "script_model", (5, 7, 1));
	src_model.origin = start.origin;
	src_model.angles = start.angles;
	player LinkTo(src_model);
	
	src_model moveTo(end.origin, .2);
	src_model waittill("movedone");
	
	player UnLink();
	src_model delete();
	wait .05;
	
	playFx(level.fx_teleport_act, end.origin);
	player enableWeapons();
	player show();
	player.isTeleporting = false;
}

on_teleport_endroom(player, start, end, acti)
{
	thread on_sound("swoosh", start.origin);
	player disableWeapons();
	player hide();
	
	player freezeControls(1);
	
	if(isDefined(level.activ))
		level.activ freezeControls(1);
	
	wait .05;
	
	player setOrigin(start.origin);
	player setPlayerAngles(start.angles);
	playFx(level.fx_teleport_act, start.origin);
	
	src_model = spawn ( "script_model", (5, 7, 1));
	src_model.origin = start.origin;
	src_model.angles = start.angles;
	player LinkTo(src_model);
	
	src_model moveTo(end.origin, .3);
	src_model waittill("movedone");
	
	player UnLink();
	src_model delete();
	wait .05;
	
	playFx(level.fx_teleport_act, end.origin);
	player enableWeapons();
	player show();
	
	if(isDefined(level.activ))
	{
		level.activ setOrigin(acti.origin);
		level.activ setPlayerangles(acti.angles);
	}
	
	player iPrintLnBold("^63");
	wait 1.3;
	player iPrintLnBold("^62");
	wait 1.3;
	player iPrintLnBold("^61");
	wait 1.3;

	player freezeControls(0);
	
	if(isDefined(level.activ))
		level.activ freezeControls(0);
}

do_trigger_death_endroom(trigger_entity, port)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		while(isDefined(player) && isAlive(player))
		{
			wait .05;
				
			if(player IsOnGround())
				break;
		}
		
		if(!isDefined(level.playerEndroom) || !isDefined(level.activ))
			player setOrigin(port.origin);
		
		if(isAlive(level.playerEndroom) && isAlive(level.activ))
		{
			if(player == level.activ)
				on_dmg(player, level.playerEndroom, level.playerEndroom.health);
		
			if(player != level.activ)
				on_dmg(player, level.activ, level.activ.health);
		}
		
		wait .05;
	}
}

do_trigger_death(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(player) && isAlive(player) && !player.isDead)
		{
			player.isDead = true;
			thread on_death(player);
		}
	}
}

on_death(player)
{
	while(isDefined(player) && isAlive(player))
	{
		wait .05;
		
		if(player IsOnGround())
			break;
	}
	
	player.isDead = false;
	playFx(level.fx_death, player.origin);
	
	if(isDefined(level.activ) && player == level.activ)
	{
		player setOrigin((-1216, 704, -64));
		player freezeControls(1);
		
		wait 1.5;
		player iPrintLnBold("^63");
		wait 1.3;
		player iPrintLnBold("^62");
		wait 1.3;
		player iPrintLnBold("^61");
		wait 1.3;
		player freezeControls(0);
		return;
	}
	
	if(isAlive(player))
		player suicide();
}

on_dmg(player, attacker, dmg)
{
	playFx(level.fx_death, player.origin);
	player finishPlayerDamage(player, attacker, dmg, 0, "MOD_PROJECTILE", "m40a3_mp", player.origin, attacker.angles, "none", 0);
	
	wait .05;
}

on_sound(sound, location)
{
    origin = spawn("script_model", location);
    origin playSound(sound);
    origin delete();
	
    return;
}

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