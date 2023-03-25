/*
###############################
                       _  __ ##
 ____           ____  | |/ / ##
|  _ \   / \   |  _ \ | ' /  ##
| | | | / _ \  | |_) ||  <   ##
| |_| |/ ___ \ |  _ <|| . \  ##
|____//_/   \_\|_| \_\|_|\_\ ##
###############################
*/
main()
{
	maps\mp\_load::main();
	maps\mp\dr_ctrldoors::main();
	maps\mp\mp_dr_tutorial_fx::main();
	maps\createfx\mp_dr_bro_fx::main();
	maps\mp\_compass::setupMiniMap("compass_map_dr_tutorial");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("compassmaxrange","1400");
	
	level.acti_enemy = undefined;
	level.activator = undefined;
	level.dr_gametype = undefined;
	level.playerturn = [];
	level.turn = 0;
	level.jumper_turn = [];
	
	precacheitem ("m40a3_mp");
	
	thread AddTestClients();
	thread who_activator();
	thread MakeTriggers();
	thread getsniper();


}


MakeTriggers()
{
	level.trapTriggers[0] = getent("trigger1", "targetname");
	level.trapTriggers[1] = getent("trigger2", "targetname");
	level.trapTriggers[2] = getent("trigger3", "targetname");
	level.trapTriggers[3] = getent("trigger4", "targetname");
	level.trapTriggers[4] = getent("trigger6", "targetname");
	level.trapTriggers[5] = getent("trigger7", "targetname");
	level.trapTriggers[6] = getent("trigger8", "targetname");
	level.trapTriggers[7] = getent("trigger9", "targetname");
	level.trapTriggers[8] = getent("trigger10", "targetname");
	level.trapTriggers[9] = getent("trigger11", "targetname");
	level.trapTriggers[10] = getent("trigger_trap_a", "targetname");
	level.trapTriggers[11] = getent("trigger_trap_b", "targetname");
	level.trapTriggers[12] = getent("trigger_trap_c", "targetname");
	level.trapTriggers[13] = getent("trigger_trap_d", "targetname");
	level.trapTriggers[14] = getent("trigger_trap_f", "targetname");
	level.trapTriggers[15] = getent("trigger_trap_g", "targetname");	
	level.trapTriggers[16] = getent("trigger_fast1", "targetname");
	level.trapTriggers[17] = getent("trigger_fast2", "targetname");	
	
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "bottom";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "bottom";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = -150;
	hud_clock.font = "objective";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 1.5;
	hud_clock.glowcolor = (30/255,144/255,1);
	hud_clock.label = &"Map by: D4rK";
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	
	hud_clock destroy();
	
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "bottom";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "bottom";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = -150;
	hud_clock.font = "objective";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 1.5;
	hud_clock.glowcolor = (30/255,144/255,1);
	hud_clock.label = &"Designed By: iMPUL6VGFX";
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 6;
	
	hud_clock destroy();
	
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "bottom";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "bottom";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = -150;
	hud_clock.font = "objective";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 1.5;
	hud_clock.glowcolor = (30/255,144/255,1);
	hud_clock.label = &"Map for Br0 Servers";
	hud_clock SetPulseFX( 40, 5400, 200 );
	
	hud_clock destroy();

	dr_classicroom = getEnt("dr_classic", "targetname");
	dr_classicroom thread classicroom();

	dr_trainingroom = getEnt("dr_training", "targetname");
	dr_trainingroom thread trainingroom();

	dr_fastroom = getEnt("dr_fast", "targetname");
	dr_fastroom thread fastroom();

	dr_longroom = getEnt("dr_long", "targetname");
	dr_longroom thread longroom();
		
}
	
classicroom()
{
	while(1)
	{
		self waittill ("trigger");		
			level.dr_gametype = 1;
			thread selectgame(0);		
	}
}
trainingroom()
{	
	while(1)
	{
		self waittill ("trigger");			
			level.dr_gametype = 1;
			thread selectgame(1);
	}	
}
fastroom()
{
	while(1)
	{
		self waittill ("trigger");
			level.dr_gametype = 1;
			thread selectgame(2);
	}
}		
longroom()
{
	while(1)
	{
		self waittill ("trigger");		
			level.dr_gametype = 1;
			thread selectgame(3);
	}
}		
selectgame(nro)
{	
	
	switch(nro)
	{
	case 0:
	//****************Classic***************
		iprintlnbold("^5Classic Mode");
		
	 	ambientPlay("glass_ambient");
		
		start2 = getEnt("classic_activator", "targetname");
		level.activator SetPlayerAngles( start2.angles );
		level.activator SetOrigin( start2.origin );		
		
		endtrig = getEnt("finaldoor2", "targetname");
		endtrig thread WatchEndTrigger();

		thread clear_ent("start_door");
		thread clear_ent("fast");
		thread clear_ent("entrata_dx");
		thread clear_ent("fine_dx");
		thread clear_ent("final_door_2");
		thread clear_ent("long_pass");
		thread clear_ent("doors");
		
		level.trapTriggers[0] thread trapN1();
		level.trapTriggers[1] thread trapN2();
		level.trapTriggers[2] thread trapN3();
		level.trapTriggers[3] thread trapN4();
		level.trapTriggers[4] thread trapN5();
		level.trapTriggers[5] thread trapN6();
		level.trapTriggers[6] thread trapN7();
		level.trapTriggers[7] thread trapN8();
		level.trapTriggers[8] thread trapN9();
		level.trapTriggers[9] thread trapN10();
		wait 6;
		
		hud_clock = NewHudElem();
	    hud_clock.alignX = "center";
	    hud_clock.alignY = "bottom";
	    hud_clock.horzalign = "center";
	    hud_clock.vertalign = "bottom";
	    hud_clock.alpha = 1;
	    hud_clock.x = 0;
	    hud_clock.y = -150;
	    hud_clock.font = "objective";
	    hud_clock.fontscale = 2;
	    hud_clock.glowalpha = 1.5;
	    hud_clock.glowcolor = (30/255,144/255,1);
	    hud_clock.label = &"Playing Now : The Rattle Hands up";
	    hud_clock SetPulseFX( 40, 5400, 200 );
	    wait 4;
	
	    hud_clock destroy();
		
		break;
		
	case 1:
	//****************Training**************
		iprintlnbold("^5Training Mode");
		
        ambientPlay("train_ambient");		
		
		start4 = getEnt("training_activator", "targetname");
		level.activator SetPlayerAngles( start4.angles );
		level.activator SetOrigin( start4.origin );
	
		endtrig = getEnt("finaldoor2", "targetname");
		endtrig thread WatchEndTrigger();
		
		thread clear_ent("start_door");
		thread clear_ent("fast");
		thread clear_ent("entrata_sx");
		thread clear_ent("fine_sx");
		thread clear_ent("final_door_2");
		thread clear_ent("long_pass");
		thread clear_ent("doors");
		level.trapTriggers[10] thread trapN11();
		level.trapTriggers[11] thread trapN12();
		level.trapTriggers[12] thread trapN13();
		level.trapTriggers[13] thread trapN14();
		level.trapTriggers[14] thread trapN15();
		level.trapTriggers[15] thread trapN16();
		maps\mp\dr_training_5::main();
		wait 6;
		
		hud_clock = NewHudElem();
	    hud_clock.alignX = "center";
	    hud_clock.alignY = "bottom";
	    hud_clock.horzalign = "center";
	    hud_clock.vertalign = "bottom";
	    hud_clock.alpha = 1;
	    hud_clock.x = 0;
	    hud_clock.y = -150;
	    hud_clock.font = "objective";
	    hud_clock.fontscale = 2;
	    hud_clock.glowalpha = 1.5;
	    hud_clock.glowcolor = (30/255,144/255,1);
	    hud_clock.label = &"Playing Now : Love Me Again";
	    hud_clock SetPulseFX( 40, 5400, 200 );
	    wait 4;

        hud_clock destroy();
		
		break;
		
	case 2:
	//****************Fast******************
		iprintlnbold("^5Fast mode??");
		
		ambientPlay("fast_ambient");
	
		start1 = getEnt("fast_activator", "targetname");
		level.activator SetPlayerAngles( start1.angles );
		level.activator SetOrigin( start1.origin );

		endtrig = getEnt("finaldoor2", "targetname");
		endtrig thread WatchEndTrigger();

		thread clear_ent("start_door");		
		thread clear_ent("free");
		thread clear_ent("entrata_sx");
		thread clear_ent("entrata_dx");
		thread clear_ent("fine_dx");
		thread clear_ent("trap_sx");
		thread clear_ent("trap_dx");
		thread clear_ent("fine_sx");
		thread clear_ent("fast_area");
		thread clear_ent("long_pass");
		thread clear_ent("final_door_2");
		level.trapTriggers[16] thread trapN17();
		level.trapTriggers[17] thread trapN18();
		wait 6;
		
		hud_clock = NewHudElem();
	    hud_clock.alignX = "center";
	    hud_clock.alignY = "bottom";
	    hud_clock.horzalign = "center";
	    hud_clock.vertalign = "bottom";
	    hud_clock.alpha = 1;
	    hud_clock.x = 0;
	    hud_clock.y = -150;
	    hud_clock.font = "objective";
	    hud_clock.fontscale = 2;
	    hud_clock.glowalpha = 1.5;
	    hud_clock.glowcolor = (30/255,144/255,1);
	    hud_clock.label = &"Playing Now : For EveryBody Juyci J";
	    hud_clock SetPulseFX( 40, 5400, 200 );
	    wait 4;
		
		hud_clock destroy();
		
		break;
	case 3:
	//****************Long******************
		iprintlnbold("^5long Mode??");
		
		ambientPlay("long_ambient");
		
		start3 = getEnt("training_activator", "targetname");
	 	level.activator SetPlayerAngles( start3.angles );
		level.activator SetOrigin( start3.origin );
		
		endtrig = getEnt("finaldoor1", "targetname");
		endtrig thread WatchEndTrigger();
		
		thread clear_ent("start_door");
		thread clear_ent("doors");
		thread clear_ent("fast");
		thread clear_ent("entrata_sx");
		thread clear_ent("entrata_dx");
		thread clear_ent("fine_dx");
		thread clear_ent("fine_sx");
		thread clear_ent("final_door_1");
		thread clear_ent("teleport_door1");
		thread clear_ent("teleport_door2");
		thread teleporters();
		maps\mp\dr_training_5::main();
		maps\mp\dr_trap_4::main();
		maps\mp\dr_trap_5::runtrap5(-360);
		wait 6;
		
		hud_clock = NewHudElem();
	    hud_clock.alignX = "center";
	    hud_clock.alignY = "bottom";
	    hud_clock.horzalign = "center";
	    hud_clock.vertalign = "bottom";
	    hud_clock.alpha = 1;
	    hud_clock.x = 0;
	    hud_clock.y = -150;
	    hud_clock.font = "objective";
	    hud_clock.fontscale = 2;
	    hud_clock.glowalpha = 1.5;
	    hud_clock.glowcolor = (30/255,144/255,1);
	    hud_clock.label = &"Playing Now : Wizard";
	    hud_clock SetPulseFX( 40, 5400, 200 );
	    wait 4;
		
		hud_clock destroy();
		
		break;
	}
}
teleporters()
{
	porters = getentarray("teleport", "targetname");
	for(i=0;i<porters.size;i++)
	{
		porters[i] thread watchteleporter();
	}
}

watchteleporter()
{
	target = getent( self.target, "targetname");
	
	while(1)
	{
		self waittill("trigger", who );
		if( isPlayer( who ) && isAlive(who) )
		who SetPlayerAngles( target.angles );
		who SetOrigin( target.origin );
		who iprintln("You got teleported!");
	}
}
clear_ent(target)
{

clear_all = getent(target,"targetname");

	if(isdefined(clear_all))
		{
 			clear_all delete();
		}

}

trapN1()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_trap_1::main();
		self delete();
		break;
	}
	
}
trapN2()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_trap_2::main();
		self delete();
		break;
	}	
}
trapN3()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_trap_3::main();
		self delete();
		break;
	}
}

trapN4()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_trap_5::main();
		self delete();
		break;
	}
}

trapN5()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_trap_6::main();
		self delete();
		break;
	}	
}

trapN6()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_trap_7::main();
		self delete();
		break;
	}
}
trapN7()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_trap_8::main();
		self delete();
		break;
	}
}
trapN8()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_trap_9::main();
		self delete();
		break;
	}
}
trapN9()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_trap_10::main();
		self delete();
		break;
	}
}
trapN10()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_trap_11::main();
		self delete();
		break;
	}
}
trapN11()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_training_1::main();
		self delete();
		break;
	}
}
trapN12()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_training_2::main();
		self delete();
		break;
	}
}
trapN13()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_training_3::main();
		self delete();
		break;
	}
}
trapN14()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_training_4::main();
		self delete();
		break;
	}
}
trapN15()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_training_6::main();
		self delete();
		break;
	}
}
trapN16()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_training_7::main();
		self delete();
		break;
	}
}
trapN17()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_fast_1::main();
		self delete();
		break;
	}
}
trapN18()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_fast_2::main();
		self delete();
		break;
	}
}
WatchEndTrigger()
{

	while(1)
	{
		self waittill("trigger", who );

		if( getTeamPlayersAlive("axis") < 1 )
		{
			who iprintlnbold("^1wait! ^2what's Activator??");
			return;
		}
		if( isDefined( level.acti_enemy ) && level.acti_enemy != who )
		{
			thread usercontrol(who);		
		}
		if( !isDefined(level.acti_enemy))
		{
			thread usercontrol(who);
			thread Start_user();
			thread controljumper();		
		}
		wait 4;
	}
}

controljumper()
{
	while(1)
	{

		if( isDefined(level.acti_enemy))
		{
			level.acti_enemy waittill( "death" );
			level.acti_enemy = undefined;
			thread Start_user();
			wait 2;
		}
	wait 1;		
	}
}

usercontrol(user)
{
	self.control= 0;
	
	for(clturn=1;clturn<36;clturn++)
	{
		if( isDefined(level.jumper_turn[clturn]))
		{		
			if ( level.jumper_turn[clturn] ==  user  && isAlive(level.jumper_turn[clturn]))
			{
				user iprintln("^1wait your turn" + clturn );
				self.control= 1;
				wait 3;
				break;
			}
		}
	}
	if (self.control != 1)
	{
		level.turn = level.turn + 1;
		user iprintln("^4wait your turn :)"+ level.turn );
		level.jumper_turn[level.turn] = user;
		wait 3;
	}

}
Start_user()
{

		for(turn=1;turn<36;turn++)	
		{
			if (isDefined(level.jumper_turn[turn]) &&  isAlive(level.jumper_turn[turn]))
			{
				level.acti_enemy = level.jumper_turn[turn];
					
				if (turn == 1)
				{ 
					iprintlnbold( level.jumper_turn[turn] + " ^1reached as first the end hall!");
					iprintlnbold("^11 VS 1 Fight!");
				}
				thread stargametype();
				break;
			}
		}
		
		if( !isDefined(level.acti_enemy)) iprintlnbold("^4 waiting for a new ^3jumper" );
		VisionSetNaked( "default", 0.2 );
		setDvar("r_brightness",0);
		
	
}
who_activator()
{	
	while( !isDefined(level.activator)) 
	{
		players = getentarray("player", "classname");
		
		for(i=0;i<players.size;i++)
		{
			if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
			{
				level.activator = players[i];
				//iprintln( players[i] );
				break;
			}
		}
		wait 2;
	}
}	
	
stargametype()      
{
	
	acti = level.activator;
	jumper = level.acti_enemy;
	selector1 = getEnt("selector_door_1", "targetname");
	selector2 = getEnt("selector_door_2", "targetname");
	
	
	if(getDvarInt("scr_activator_freerun") != 1 )
	{ 
		acti SetPlayerAngles( selector1.angles );
		acti SetOrigin( selector1.origin );
		jumper SetPlayerAngles( selector2.angles );
		jumper SetOrigin( selector2.origin );
	}else{ 
		acti SetPlayerAngles( selector2.angles );
		acti SetOrigin( selector2.origin );
		jumper SetPlayerAngles( selector1.angles );
		jumper SetOrigin( selector1.origin );
	}

	finaltype1 = getEnt("door_type_1", "targetname");
	finaltype1 thread finalknife();
	
	finaltype2 = getEnt("door_type_2", "targetname");
	finaltype2 thread finaldesert();	

	finaltype3 = getEnt("door_type_3", "targetname");
	finaltype3 thread finalsniper();
	
	finaltype4 = getEnt("door_type_4", "targetname");
	finaltype4 thread finalvipgun();
	
    finaltype5 = getEnt("door_type_5", "targetname");
	finaltype5 thread finalweapon();
	
	finaltype6 = getEnt("door_type_6", "targetname");
	finaltype6 thread finaljump();
	
}

finalknife()
{
	while(1)
	{
		self waittill ("trigger",user);		
			thread StartFinalFight(0); 
			ambientPlay("knife_ambient");
	}
}
finaldesert()
{
	while(1)
	{
		self waittill ("trigger",user);	 	
			thread StartFinalFight(1);
			ambientPlay("desert_ambient");
	}
}
finalsniper()
{
	while(1)
	{
		self waittill ("trigger",user);		
			thread StartFinalFight(2);
            ambientPlay("snip_ambient");			
	}
}
finalvipgun()
{
	while(1)
	{
		self waittill ("trigger",user);		
			thread StartFinalFight(3);
			ambientPlay("vipgun_ambient");
	}
}
finalweapon()
{
	while(1)
	{
		self waittill ("trigger",user);		
			thread StartFinalFight(4); 
	}
}
finaljump()
{
	while(1)
	{
		self waittill ("trigger",user);		
			thread StartFinalFight(5); 
	}
}
StartFinalFight(type)
{
	acti = level.activator;
	jumper = level.acti_enemy;
	start1 = undefined;
	start2 = undefined;
	
	switch(type)
	{
	case 0:
		self.armo = "knife_mp";
		start1 = getEnt("ffight_activator_1", "targetname");
		start2 = getEnt("ffight_jumper_1", "targetname");
		VisionSetNaked( "cheat_contrast", 2 );
		setDvar("r_brightness", -0.25);
		break;
	case 1:
		self.armo = "deserteaglegold_mp";
		start1 = getEnt("ffight_activator_2", "targetname");
		start2 = getEnt("ffight_jumper_2", "targetname");
		VisionSetNaked( "finalfight_intro_mp", 2 );
		setDvar("r_brightness", -0.35);
		break;
	case 2:
		self.armo = "m40a3_mp";
		start1 = getEnt("ffight_activator_3", "targetname");
		start2 = getEnt("ffight_jumper_3", "targetname");
		VisionSetNaked( "cheat_bw_contrast", 0.2 );
		setDvar("r_brightness", -0.25);
		break;
	case 3:
		self.armo = "vipgun_mp";
		start1 = getEnt("ffight_activator_4", "targetname");
		start2 = getEnt("ffight_jumper_4", "targetname");
		VisionSetNaked( "cheat_bw", 0.2 );
		setDvar("r_brightness", -0.25);
		break;
	case 4:
		self.armo = "ak47_mp";
		start1 = getEnt("ffight_activator_5", "targetname");
		start2 = getEnt("ffight_jumper_5", "targetname");
		VisionSetNaked( "cheat_bw", 0.2 );
		setDvar("r_brightness", -0.25);
		break;
	case 5:
		self.armo = "knife_mp";
		start1 = getEnt("ffight_activator_6", "targetname");
		start2 = getEnt("ffight_jumper_6", "targetname");
		VisionSetNaked( "cheat_bw", 0.2 );
		setDvar("r_brightness", -0.25);
		break;
	}
	
	
	acti SetPlayerAngles( start1.angles );
	acti SetOrigin( start1.origin );
	acti takeallweapons();
	acti SetSpawnWeapon(self.armo);
	acti GiveWeapon(self.armo);
	acti switchtoweapon(self.armo);
	
	
	jumper SetPlayerAngles( start2.angles );
	jumper SetOrigin( start2.origin );
	jumper takeallweapons();
	jumper SetSpawnWeapon(self.armo);
	jumper GiveWeapon(self.armo);
	jumper switchtoweapon(self.armo);
	


	acti FreezeControls(1);
	jumper FreezeControls(1);
	
	//VisionSetNaked( "finalfight_intro_mp", 2 );
	wait 2;

	noti = SpawnStruct();
	noti.titleText = "=|FINAL FIGHT|=";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	wait 2;
	
	noti = SpawnStruct();
	noti.titleText = acti.name + " ^1VS ^7" + jumper.name;
	noti.notifyText = "GET READY!";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	wait 2;
	
	//VisionSetNaked( "finalfight_intro_mp", 2 );
	jumper FreezeControls(0);
	acti FreezeControls(0);
	
	iprintlnbold("^1F  I  G  H  T !");
}



addTestClients()
{
	players = getentarray("player", "classname");
	
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			level.activator = players[i];
			break;
		}
	}


	setDvar("scr_testclients", "");
	wait 1;
	for(;;)
	{
		if(getdvarInt("scr_testclients") > 0)
			break;
		wait 1;
	}
	testclients = getdvarInt("scr_testclients");
	setDvar( "scr_testclients", 0 );
	for(i=0;i<testclients;i++)
	{
		ent[i] = addtestclient();

		if (!isdefined(ent[i]))
		{
			println("Could not add test client");
			wait 1;
			continue;
		}
		ent[i].pers["isBot"] = true;
		ent[i] thread TestClient("autoassign");
	}
	thread addTestClients();
}

TestClient(team)
{
	self endon( "disconnect" );

	while(!isdefined(self.pers["team"]))
		wait .05;
		
	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;
}

sound()

{

trig = getent("sound_activate","targetname"); //calls the trigger

sound1 = getent("sound1","targetname"); //a script origin or an actor

trig waittill ("trigger"); //waittill touched

sound1 playsound("amb_tutorial"); //tell the origin or actor to play the sound

//beware as the actor will not play the sound through his on voice! Only whatever sound is from the sound file.

}
 