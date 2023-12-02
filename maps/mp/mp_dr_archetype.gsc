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
	
	setdvar("r_specularcolorscale", "1");
    setdvar("r_glowbloomintensity0", ".25");
    setdvar("r_glowbloomintensity1", ".25");
    setdvar("r_glowskybleedintensity0", ".3");
	
    setdvar("compassmaxrange", "1800");
	
	setDvar("bg_falldamagemaxheight", 15000);
	setDvar("bg_falldamageminheight", 10000);
	
	level.fx_electric_line = LoadFX("custom/archetype/electric_line");
	level.fx_electric_shock = LoadFX("custom/archetype/electric_shock");
	level.fx_rain = LoadFX("custom/archetype/rain");
	level.fx_clouds = LoadFX("custom/archetype/clouds");
	level.fx_water_dust = LoadFX("custom/archetype/water_dust");
	level.fx_lightning_field = LoadFX("custom/archetype/lightning_field");
	level.fx_lightning_strike = LoadFX("custom/archetype/lightning_strike");
	level.fx_lightning_strike_field = LoadFX("custom/archetype/lightning_strike_field");
	level.fx_death = LoadFX("custom/archetype/death");
	level.fx_vodka = LoadFX("custom/archetype/vodka");
	
	level.fx_water_544x320 = LoadFX("custom/archetype/water_impact_544x320");
	level.fx_water_544x224 = LoadFX("custom/archetype/water_impact_544x224");
	level.fx_water_544x160 = LoadFX("custom/archetype/water_impact_544x160");
	level.fx_water_160x160 = LoadFX("custom/archetype/water_impact_160x160");
	level.fx_water_544x32 = LoadFX("custom/archetype/water_impact_544x32");
	level.fx_water_32x432 = LoadFX("custom/archetype/water_impact_32x432");
	level.fx_water_480x32 = LoadFX("custom/archetype/water_impact_480x32");
	level.fx_water_32x368 = LoadFX("custom/archetype/water_impact_32x368");
	level.fx_water_416x352 = LoadFX("custom/archetype/water_impact_416x352");
	level.fx_water_160x416 = LoadFX("custom/archetype/water_impact_160x416");
	level.fx_water_416x416 = LoadFX("custom/archetype/water_impact_416x416");
	level.fx_water_416x256 = LoadFX("custom/archetype/water_impact_416x256");
	level.fx_water_384x160 = LoadFX("custom/archetype/water_impact_384x160");
	level.fx_water_384x512 = LoadFX("custom/archetype/water_impact_384x512");
	level.fx_water_544x448 = LoadFX("custom/archetype/water_impact_544x448");
	level.fx_water_480x480 = LoadFX("custom/archetype/water_impact_480x480");
	level.fx_water_96x208 = LoadFX("custom/archetype/water_impact_96x208");
	level.fx_water_0x192 = LoadFX("custom/archetype/water_impact_0x192");
	
	thread addTriggerToList("trap_1_trigger");
	thread addTriggerToList("trap_2_trigger");
	thread addTriggerToList("trap_3_trigger");
	thread addTriggerToList("trap_4_trigger");
	thread addTriggerToList("trap_5_trigger");
	thread addTriggerToList("trap_6_trigger");
	thread addTriggerToList("trap_7_trigger");
	thread addTriggerToList("trap_8_trigger");
	thread addTriggerToList("trap_9_trigger");
	
	thread on_start();
	
	thread addTestClients();
}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];
	
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
	level.trapTriggers[level.trapTriggers.size - 1] setHintstring("Press ^6&&1 ^7to activate");
}

on_start()
{
	level waittill("round_started");
	
	ambientPlay("return_to_you");
	
	players = getEntArray("player", "classname");
	
	for(i = 0; i < players.size; i++)
	{
		players[i].isBounced = false;
		players[i].isDead = false;
		players[i].hasFinished = false;
		players[i].hasReceivedGift = false;
	}
	
	level.isSniper = false;
	level.isKnife = false;
	level.isClassic = false;
	
	playFx(level.fx_clouds, (1728, -864, 961), anglesToForward((90, 180, 0))); // clouds
		
	thread startdoor("startdoor_object", "finish_trigger");
	thread death("ground_trigger_1");
	thread vending_machine("vending_trigger", "vodka_spawn");
	thread toilet("toilet_trigger");
	
	thread trap_1("trap_1_fx_spawn_1", "trap_1_fx_spawn_2", "trap_1_sound_origin_1", "trap_1_sound_origin_2");
	thread trap_2("trap_2_object");
	thread trap_3("trap_3_object");
	thread trap_4("trap_4_object");
	thread trap_5("trap_5_object_1", "trap_5_object_2");
	thread trap_6("trap_6_object_1", "trap_6_object_2");
	thread trap_7("trap_7_object", "trap_7_bounce_trigger", "trap_7_sound");
	thread trap_8();
	thread trap_9();
	
	thread setup_bounce_1("bounce_1_trigger", "bounce_1_object");
	thread setup_bounce_2("bounce_2_trigger", "bounce_2_object");
	
	thread setup_endrooms();
	
	thread environment_fx_1("environment_trigger_1");
	thread environment_fx_2("environment_trigger_2");
	thread environment_fx_3("environment_trigger_3");
	thread environment_fx_4("environment_trigger_4");
	thread environment_fx_5("environment_trigger_5");
	thread environment_fx_6("environment_trigger_6");
	thread environment_fx_7("environment_trigger_7");
	thread environment_fx_8("environment_trigger_8");
	
	wait 11;
	thread load_water_impact();
	thread setup_lightning("lightning_object");
}

startdoor(object_entity, finish_entity)
{
	wait 10;
	startdoor = getEnt(object_entity, "targetname");
	finish = getEnt(finish_entity, "targetname");
	
	startdoor moveZ(-112, 6, 3, 3);
	startdoor waittill("movedone");
	
	for(;;)
	{
		finish waittill("trigger", player);
		
		if(isDefined(player) && isAlive(player) && !player.hasFinished)
		{
			player.hasFinished = true;
			player playSound("finish");
		}
		
		wait .05;
	}
}

setup_endrooms()
{
	level.sniper_trigger = getEnt("endroom_sniper_trigger", "targetname");
	level.knife_trigger = getEnt("endroom_knife_trigger", "targetname");
	level.classic_trigger = getEnt("endroom_classic_trigger", "targetname");
	
	level.endroom_jumper_spawn = getEnt("jumper_spawn", "targetname");
	level.endroom_acti_spawn = getEnt("acti_spawn", "targetname");
	
	level.classic_door = getEnt("classic_door", "targetname");
	
	thread on_classic();
	thread on_knife();
	thread on_sniper();
}

on_classic()
{
	level.classic_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Classic");
	
	level.classic_trigger waittill("trigger", player);
	
	level.classic_trigger delete();
	level.sniper_trigger delete();
	level.knife_trigger delete();
	
	iPrintLnBold("^6" + player.name + " ^7opened the end door!");
	level.classic_door moveZ(-128, 1, .8, .2);
	wait 2;
}

on_knife()
{
	level.knife_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Knife");
	
	for(;;)
	{
		level.knife_trigger waittill("trigger", player);
		
		if(isDefined(level.freerun) && level.freerun)
		{
			player setOrigin(level.endroom_jumper_spawn.origin);
			player setPlayerAngles(level.endroom_jumper_spawn.angles);	
		}
		
		if(!isDefined(level.activ))
			continue;
		
		if(level.isSniper)
			continue;
		
		if(level.isKnife)
			continue;
		
		if(isDefined(level.classic_trigger))
			level.classic_trigger delete();
		
		level.isKnife = true;
		
		level.knife_trigger setHintstring("^5Waiting...");
		level.sniper_trigger setHintstring("^5Waiting...");
		
		iPrintLnBold("^6" + player.name + " ^7has chosen ^5Knife");
		wait .5;
		
		player takeAllWeapons();
		
		player setOrigin(level.endroom_jumper_spawn.origin);
		player setPlayerAngles(level.endroom_jumper_spawn.angles);		
		player linkTo(level.endroom_jumper_spawn);
		player freezeControls(1);
		
		player giveWeapon("knife_mp");
		player switchToWeapon("knife_mp");
		
		if(isDefined(level.activ))
		{
			level.activ takeallweapons();
			level.activ setOrigin(level.endroom_acti_spawn.origin);
			level.activ setPlayerAngles(level.endroom_acti_spawn.angles);		
			level.activ linkTo(level.endroom_acti_spawn);
			level.activ freezeControls(1);
			
			level.activ giveWeapon("knife_mp");
			level.activ switchToWeapon("knife_mp");
		}
		
		wait 1;
		
		iPrintLnBold("- ^63 ^7-");
		wait 1;
		
		iPrintLnBold("- ^62 ^7-");
		wait 1;
		
		iPrintLnBold("- ^61 ^7-");
		wait 1;
		
		iPrintLnBold("- ^6GO ^7-");
		wait .1;
		
		player freezeControls(0);
		player unLink();
		
		if(isDefined(level.activ))
		{
			level.activ freezeControls(0);
			level.activ unLink();
		}
		
		player common_scripts\utility::waittill_any("death", "disconnect");
		iPrintLnBold("^6" + player.name + " ^7died");
		wait 1;
		
		level.isKnife = false;
		level.sniper_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Sniper");
		level.knife_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Knife");
	}
}

on_sniper()
{
	level.sniper_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Sniper");
	
	for(;;)
	{
		level.sniper_trigger waittill("trigger", player);
		
		if(isDefined(level.freerun) && level.freerun)
		{
			player setOrigin(level.endroom_jumper_spawn.origin);
			player setPlayerAngles(level.endroom_jumper_spawn.angles);	
		}
		
		if(!isDefined(level.activ))
			continue;
		
		if(level.isSniper)
			continue;
		
		if(level.isKnife)
			continue;
		
		if(isDefined(level.classic_trigger))
			level.classic_trigger delete();
		
		level.isSniper = true;
		
		level.knife_trigger setHintstring("^5Waiting...");
		level.sniper_trigger setHintstring("^5Waiting...");
		
		iPrintLnBold("^6" + player.name + " ^7has chosen ^5Sniper");
		wait .5;
		
		player takeAllWeapons();
		
		player setOrigin(level.endroom_jumper_spawn.origin);
		player setPlayerAngles(level.endroom_jumper_spawn.angles);		
		player linkTo(level.endroom_jumper_spawn);
		player freezeControls(1);
		
		player giveWeapon("knife_mp");
		player giveWeapon("m40a3_mp");
		player giveMaxAmmo("m40a3_mp");
		player switchToWeapon("m40a3_mp");
		
		if(isDefined(level.activ))
		{
			level.activ takeallweapons();
			level.activ setOrigin(level.endroom_acti_spawn.origin);
			level.activ setPlayerAngles(level.endroom_acti_spawn.angles);		
			level.activ linkTo(level.endroom_acti_spawn);
			level.activ freezeControls(1);
			
			level.activ giveWeapon("knife_mp");
			level.activ giveWeapon("m40a3_mp");
			level.activ giveMaxAmmo("m40a3_mp");
			level.activ switchToWeapon("m40a3_mp");
		}
		
		wait 1;
		
		iPrintLnBold("- ^63 ^7-");
		wait 1;
		
		iPrintLnBold("- ^62 ^7-");
		wait 1;
		
		iPrintLnBold("- ^61 ^7-");
		wait 1;
		
		iPrintLnBold("- ^6GO ^7-");
		wait .1;
		
		player freezeControls(0);
		player unLink();
		
		if(isDefined(level.activ))
		{
			level.activ freezeControls(0);
			level.activ unLink();
		}
		
		player common_scripts\utility::waittill_any("death", "disconnect");
		iPrintLnBold("^6" + player.name + " ^7died");
		wait 1;
		
		level.isSniper = false;
		level.sniper_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Sniper");
		level.knife_trigger setHintstring("^6Press ^7&&1 ^6to enter ^7Knife");
	}
}

trap_1(fx_entity_1, fx_entity_2, sound_entity_1, sound_entity_2)
{
	fx_1 = getEnt(fx_entity_1, "targetname");
	fx_2 = getEnt(fx_entity_2, "targetname");
	sound_1 = getEnt(sound_entity_1, "targetname");
	sound_2 = getEnt(sound_entity_2, "targetname");
	
	level.trapTriggers[0] waittill("trigger", player);
	level.trapTriggers[0] setHintstring("^6Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	wait .05;
	
	level.object_1_is_electric = false;
	level.object_2_is_electric = false;
	
	thread trap_1_hurt_1("trap_1_hurt_1");
	thread trap_1_hurt_2("trap_1_hurt_2");
	
	for(;;)
	{
		sound_1 playSound("electricity");
		playFx(level.fx_electric_line, fx_1.origin, anglesToForward((0, 270, 0)));
		wait .01;
		
		if(isDefined(level.object_1_is_electric))
			level.object_1_is_electric = true;
		
		wait 0.9;
		
		if(isDefined(level.object_1_is_electric))
			level.object_1_is_electric = false;
		
		wait 3;
		
		sound_2 playSound("electricity");
		playFx(level.fx_electric_line, fx_2.origin, anglesToForward((0, 270, 0)));
		if(isDefined(level.object_2_is_electric))
			level.object_2_is_electric = true;
		
		wait 0.9;
		
		if(isDefined(level.object_2_is_electric))
			level.object_2_is_electric = false;
		
		wait .5;
	}
}

trap_1_hurt_1(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		wait .05;
		
		if(isDefined(player) && isAlive(player))
		{					
			if(player isTouching(trigger) && level.object_1_is_electric)
				thread trap_1_dmg(player);
			
			wait .05;
		}
	}
}

trap_1_hurt_2(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		wait .05;
		
		if(isDefined(player) && isAlive(player))
		{					
			if(player isTouching(trigger) && level.object_2_is_electric)
				thread trap_1_dmg(player);
			
			wait .05;
		}
	}
}

trap_1_dmg(player)
{
	player playSound("electric_shock");
	playFx(level.fx_electric_shock, player.origin);	
	wait .05;
	
	player suicide();
	wait .1;
}

trap_2(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[1] waittill("trigger", player);
	level.trapTriggers[1] setHintstring("^6Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	wait .05;
	
	for(;;)
	{
		object rotateYaw(90, 1.5);
		wait 1.5;
	}
}

trap_3(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[2] waittill("trigger", player);
	level.trapTriggers[2] setHintstring("^6Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	wait .05;
	
	for(;;)
	{
		object rotateYaw(90, 1.5);
		wait 1.5;
	}
}

trap_4(object_entity)
{
	object = getEnt(object_entity, "targetname");
	
	level.trapTriggers[3] waittill("trigger", player);
	level.trapTriggers[3] setHintstring("^6Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	wait .05;
	
	object moveZ(-128, 3, 1.5, 1.5);
	object waittill("movedone");
}

trap_5(object_entity_1, object_entity_2)
{
	object_1 = getEnt(object_entity_1, "targetname");
	object_2 = getEnt(object_entity_2, "targetname");
	
	level.trapTriggers[4] waittill("trigger", player);
	level.trapTriggers[4] setHintstring("^1Wait...");
	player braxi\_rank::giveRankXp("trap_activation");
	wait .05;
	
	object_1 rotateRoll(-20, 2, 1, 1);
	object_2 rotateRoll(20, 2, 1, 1);
	wait 2.1;
	
	level.trapTriggers[4] setHintstring("Press ^6&&1 ^7to activate again");
	
	level.trapTriggers[4] waittill("trigger", player);
	level.trapTriggers[4] setHintstring("^6Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	
	object_1 moveX(160, 3, 1.5, 1.5);
	object_2 moveX(-160, 3, 1.5, 1.5);
	object_2 waittill("movedone");
	
	for(;;)
	{
		object_1 moveX(-320, 6, 3, 3);
		object_2 moveX(320, 6, 3, 3);
		object_2 waittill("movedone");
		
		object_1 moveX(320, 6, 3, 3);
		object_2 moveX(-320, 6, 3, 3);
		object_2 waittill("movedone");
	}
}

trap_6(object_entity_1, object_entity_2)
{
	object_1 = getEnt(object_entity_1, "targetname");
	object_2 = getEnt(object_entity_2, "targetname");
	
	level.trapTriggers[5] waittill("trigger", player);
	level.trapTriggers[5] setHintstring("^6Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	wait .05;
	
	object_1 rotateRoll(25, 2, 1, 1);
	object_2 rotateRoll(-25, 2, 1, 1);
	wait 2.1;
	
	for(;;)
	{
		object_1 rotateRoll(-50, 4, 2, 2);
		object_2 rotateRoll(50, 4, 2, 2);
		wait 4.1;
		
		object_1 rotateRoll(50, 4, 2, 2);
		object_2 rotateRoll(-50, 4, 2, 2);
		wait 4.1;
	}
}

trap_7(object_entity, bounce_trigger_entity, sound_entity)
{
	object = getEnt(object_entity, "targetname");
	bouncer = getEnt(bounce_trigger_entity, "targetname");
	sound = getEnt(sound_entity, "targetname");
	
	bouncer enableLinkTo();
	bouncer linkTo(object);
	
	object notSolid();
	object moveY(576, .1);
	object waittill("movedone");
	
	thread trap_7_kill("trap_7_killtrigger");
	
	level.trapTriggers[6] waittill("trigger", player);
	level.trapTriggers[6] setHintstring("^6Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	thread trap_7_bouncer(bouncer);
	wait .05;
	
	sound playSound("launch_trap");
	
	object moveZ(24, .1);
	object waittill("movedone");
	wait .2;
	
	object moveZ(-24, 2, 1, 1);
	object waittill("movedone");
}

trap_7_bouncer(trigger)
{
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(!player.isBounced && player GetStance() != "prone")
		{			
			player.isBounced = true;
			thread trap_7_execute(player);
		}
		else
		{
			player setOrigin(player.origin + (0, 0, 90));
			player.health = 1;
			wait .3;
			
			if(isDefined(player) && isAlive(player) && isDefined(level.activ) && isAlive(level.activ))
				player finishPlayerDamage(player, level.activ, player.health, 0, "MOD_PROJECTILE", "m40a3_mp", player.origin, level.activ.angles, "none", 0);
			else
				player suicide();
		}
		
		wait .05;
	}
}

trap_7_execute(player)
{	
	for(i = 0; i < 4; i++)
	{
		player.health += 600;
		player finishPlayerDamage(player, level.jumpattacker, 600, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-50, 90, 0)), "none", 0);
	}
	
	wait .8;
	player.isBounced = false;
}

trap_7_kill(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(isDefined(player) && isAlive(player) && isDefined(level.activ) && isAlive(level.activ))
			player finishPlayerDamage(player, level.activ, player.health, 0, "MOD_PROJECTILE", "m40a3_mp", player.origin, level.activ.angles, "none", 0);
		else
			player suicide();
		
		wait .1;
	}
}

trap_8()
{
	level.trapTriggers[7] waittill("trigger", player);
	level.trapTriggers[7] setHintstring("^6Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	wait .05;
	
	level.bounce_1 moveY(128, 2, 1, 1);
	level.bounce_1 waittill("movedone");
	
	for(;;)
	{
		level.bounce_1 moveY(-256, 4, 2, 2);
		level.bounce_1 waittill("movedone");
		
		level.bounce_1 moveY(256, 4, 2, 2);
		level.bounce_1 waittill("movedone");
	}
}

trap_9()
{
	level.trapTriggers[8] waittill("trigger", player);
	level.trapTriggers[8] setHintstring("^6Activated");
	player braxi\_rank::giveRankXp("trap_activation");
	wait .05;
	
	level.bounce_2 moveY(128, 2, 1, 1);
	level.bounce_2 waittill("movedone");
	
	for(;;)
	{
		level.bounce_2 moveY(-256, 4, 2, 2);
		level.bounce_2 waittill("movedone");
		
		level.bounce_2 moveY(256, 4, 2, 2);
		level.bounce_2 waittill("movedone");
	}
}

setup_bounce_1(trigger_entity, object_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	level.bounce_1 = getEnt(object_entity, "targetname");
	
	trigger enableLinkTo();
	trigger linkTo(level.bounce_1);
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(!player.isBounced)
		{
			player.isBounced = true;
			thread do_bounce(player, 500, 3, (-65, 180, 0), "none");
		}
		
		wait .05;
	}
}

setup_bounce_2(trigger_entity, object_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	level.bounce_2 = getEnt(object_entity, "targetname");
	
	trigger enableLinkTo();
	trigger linkTo(level.bounce_2);
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		if(!player.isBounced)
		{
			player.isBounced = true;
			thread do_bounce(player, 545, 3, (-80, 180, 0), "none");
		}
		
		wait .05;
	}
}

do_bounce(player, strength, multiplyer, angle, pos)
{
	while(isDefined(player) && isAlive(player))
	{	
		if(player isOnGround())
		{		
			if(player GetStance() == "crouch" || player GetStance() == "prone") // to avoid sound spamming
			{
				player iPrintLnBold("^1Please stand up...");
				player setOrigin((2304, -1664, -120));
				
				player.isBounced = false;
				break;
			}
	
			for(i = 0; i < multiplyer; i++)
			{
				player.health += strength;
				player finishPlayerDamage(player, level.jumpattacker, strength, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward(angle), pos, 0);
			}
			
			player playSound("launch");
			
			wait .1;
			player.isBounced = false;
			break;
		}

		wait .05;
	}
}

load_water_impact()
{	
	playFx(level.fx_rain, (192, -864, 0)); // simple rain fx
	playFx(level.fx_rain, (3200, -864, 0)); // simple rain fx
	playFx(level.fx_rain, (-3072, -1024, 0)); // simple rain fx

	playFx(level.fx_water_544x320, (112, -272, -126)); // spawn
	playFx(level.fx_water_544x224, (560, -272, -126)); // platform after startdoor
	playFx(level.fx_water_544x160, (1072, -272, -126)); // platform after 1st trap
	playFx(level.fx_water_160x160, (1456, -240, -126)); // platform 1 on 2nd trap
	playFx(level.fx_water_160x160, (1840, 80, -126)); // platform 2 on 3rd trap
	playFx(level.fx_water_544x160, (2224, -272, -126)); // platform after 3rd trap
	playFx(level.fx_water_544x160, (2992, -272, -126)); // platform after 4th trap
	
	playFx(level.fx_water_544x32, (3280, -272, -62)); // pyramide left down
	playFx(level.fx_water_32x432, (3728, -272, -62)); // pyramide down
	playFx(level.fx_water_480x32, (3344, -208, 18)); // pyramide left center
	playFx(level.fx_water_32x368, (3728, -208, 18)); // pyramide center
	playFx(level.fx_water_416x352, (3728, -144, 98)); // pyramide top
	
	playFx(level.fx_water_160x416, (3728, -688, -126)); // platform after pyramide
	playFx(level.fx_water_416x416, (3728, -1872, -126)); // platform after 5th trap
	playFx(level.fx_water_416x256, (2384, -1872, -126)); // platform at 7th trap
	playFx(level.fx_water_384x160, (624, -1872, -150)); // platform after bouncers
	playFx(level.fx_water_384x512, (240, -1872, -126)); // platform befor bridge
	playFx(level.fx_water_0x192, (-16, -1344, -103)); // on bridge
	
	playFx(level.fx_water_544x448, (112, -1200, -126)); // end center
	playFx(level.fx_water_96x208, (352, -912, -126)); // end to old
	playFx(level.fx_water_96x208, (-368, -1104, -126)); // end left room
	playFx(level.fx_water_96x208, (-368, -848, -126)); // end right room

	playFx(level.fx_water_480x480, (-2072, -2024, -342)); // endroom
	playFx(level.fx_water_480x480, (-2584, -2024, -342)); // endroom
	playFx(level.fx_water_480x480, (-3096, -2024, -342)); // endroom
	playFx(level.fx_water_480x480, (-3608, -2024, -342)); // endroom
	playFx(level.fx_water_480x480, (-2072, -1512, -342)); // endroom
	playFx(level.fx_water_480x480, (-2584, -1512, -342)); // endroom
	playFx(level.fx_water_480x480, (-3096, -1512, -342)); // endroom
	playFx(level.fx_water_480x480, (-3608, -1512, -342)); // endroom
	playFx(level.fx_water_480x480, (-2072, -1000, -342)); // endroom
	playFx(level.fx_water_480x480, (-2584, -1000, -342)); // endroom
	playFx(level.fx_water_480x480, (-3096, -1000, -342)); // endroom
	playFx(level.fx_water_480x480, (-3608, -1000, -342)); // endroom
	playFx(level.fx_water_480x480, (-2072, -488, -342)); // endroom
	playFx(level.fx_water_480x480, (-2584, -488, -342)); // endroom
	playFx(level.fx_water_480x480, (-3096, -488, -342)); // endroom
	playFx(level.fx_water_480x480, (-3608, -488, -342)); // endroom
}

environment_fx_1(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	pos = [];
	pos[0] = (680, -336, 136);
	pos[1] = (792, -336, 136);
	pos[2] = (792, 336, 136);
	pos[3] = (680, 336, 144);
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		playFx(level.fx_water_dust, pos[randomIntRange(0, 4)]);
		wait 5;
	}
}

environment_fx_2(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	pos = [];
	pos[0] = (1376, -24, -8);
	pos[1] = (1760, 24, -8);
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		playFx(level.fx_water_dust, pos[randomIntRange(0, 2)]);
		wait 5;
	}
}

environment_fx_3(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		playFx(level.fx_water_dust, (2344, 184, 56));
		wait 5;
	}
}

environment_fx_4(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	pos = [];
	pos[0] = (3016, -568, 24);
	pos[1] = (3240, -280, -72);
	pos[2] = (3304, -216, 8);
	pos[3] = (3368, -152, 88);
	pos[4] = (3304, -520, -136);

	for(;;)
	{
		trigger waittill("trigger", player);
		
		playFx(level.fx_water_dust, pos[randomIntRange(0, 5)]);
		wait 3;
	}
}

environment_fx_5(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	pos = [];
	pos[0] = (3304, -1448, -136);
	pos[1] = (3016, -1160, 24);
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		playFx(level.fx_water_dust, pos[randomIntRange(0, 2)]);
		wait 5;
	}
}

environment_fx_6(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	pos = [];
	pos[0] = (2392, -1448, -136);
	pos[1] = (2392, -1880, -136);
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		playFx(level.fx_water_dust, pos[randomIntRange(0, 2)]);
		wait 5;
	}
}

environment_fx_7(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	pos = [];
	pos[0] = (632, -1480, -160);
	pos[1] = (376, -1160, 24);
	pos[2] = (248, -1480, -136);
	pos[3] = (248, -1800, -136);
	pos[4] = (120, -1208, -136);

	for(;;)
	{
		trigger waittill("trigger", player);
		
		playFx(level.fx_water_dust, pos[randomIntRange(0, 5)]);
		wait 3;
	}
}

environment_fx_8(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	pos = [];
	pos[0] = (-336, -744, 8);
	pos[1] = (112, -744, 8);
	pos[2] = (-600, -856, -136);
	pos[3] = (-344, -1208, -136);
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		playFx(level.fx_water_dust, pos[randomIntRange(0, 4)]);
		wait 5;
	}
}

vending_machine(trigger_entity, spawn_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	spawn = getEnt(spawn_entity, "targetname");
	
	trigger setHintstring("^6Press ^7&&1 ^6to receive a gift!");
	
	while(isDefined(level.freerun) && !level.freerun)
	{
		trigger waittill("trigger", player);
		
		if(!player.hasReceivedGift)
		{
			player.hasReceivedGift = true;
			
			playFx(level.fx_vodka, spawn.origin, anglesToForward(spawn.angles));
			player braxi\_rank::giveRankXp("trap_activation");
			
			player iPrintLnBold("^3+XP");
		}
		
		wait .5;
	}
}

toilet(trigger_entity)
{
	trigger = getEnt(trigger_entity, "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", player);
		
		player setOrigin((3520, -1664, -126));
		wait .5;
	}
}

setup_lightning(lightning_entity)
{
	lightning = getEnt(lightning_entity, "targetname");
	
	thread load_lightning_field(lightning);
	thread change_lightning_pos(lightning);
	thread do_lightning_trace(lightning);
}

change_lightning_pos(spawn)
{
	for(;;)
	{
		x = randomIntRange(-712, 3880);
		y = randomIntRange(-2040, 440);
		
		spawn moveTo((x, y, 952), 3);
		spawn waittill("movedone");
	}
}

do_lightning_trace(spawn)
{	
	for(;;)
	{		
		wait randomIntRange(5, 31);
		trace = bulletTrace(spawn.origin, anglesToForward(spawn.angles) * 100000, true, undefined)["position"];
		playFx(level.fx_lightning_strike_field, spawn.origin, anglesToForward((90, 180, 0)));
		
		sound_origin = spawn("script_model", trace);
		sound_origin playSound("lightning_strike");
		wait .1;
		
		playFx(level.fx_lightning_strike, trace);
		
		if(isDefined(level.activ) && isAlive(level.activ))
			radiusDamage(sound_origin.origin + (0, 0, 12), 220, 150, 10, level.activ); // +12 to avoid damage getting stuck in the ground
		else
			radiusDamage(sound_origin.origin + (0, 0, 12), 220, 150, 10, undefined);
		
		earthQuake(.9, .5, trace, 800);
		wait .1;
		
		sound_origin delete();
	}
}

load_lightning_field(spawn)
{	
	for(;;)
	{
		playFx(level.fx_lightning_field, (1728, -864, 961), anglesToForward((90, 180, 0)));
		spawn playSound("thunder");
		wait randomIntRange(10, 31);
	}
}

death(trigger_entity)
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
		
		wait .05;
	}
}

on_death(player)
{	
	while(isDefined(player) && isAlive(player))
	{
		wait .05;
		
		if(player isOnGround())
			break;
	}

	player.isBounced = false;
	player.isDead = false;
	
	playFx(level.fx_death, player.origin);
	player playSound("bone_crack");
	
	if(isDefined(player) && isAlive(player))
		player suicide();
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