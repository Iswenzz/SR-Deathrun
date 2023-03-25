/*
##########################################################
#\ \####/ /#| |#| |#\ \####/ /#|_|#| \####| |#|_|#|  _  |#
##\ \##/ /##| |#| |##\ \##/ /##   #|  \###| |#   #| |#| |#
###\ \/ /###| |#| |###\ \/ /###| |#| \ \##| |#| |#| |#| |#
####\  /####| |#| |####\  /####| |#| |\ \#| |#| |#| |#| |#
####/  \####| |#| |####/  \####| |#| |#\ \| |#| |#| |#| |#
###/ /\ \###| |#| |###/ /\ \###| |#| |##\ | |#| |#| |#| |#
##/ /##\ \##| |_| |##/ /##\ \##| |#| |###\  |#| |#| |_| |#
#/ /####\ \#|_____|#/ /####\ \#|_|#|_|####\_|#| |#|_____|#
##########################################################

	thks Rycoon! :)
|*************************************|
	Xfire: xuxinio
*/


main()
{
  	maps\mp\_load::main();
	maps\mp\mp_dr_mario_land_rotate::main();
	maps\mp\mp_dr_mario_land_fx::main();
	maps\createfx\mp_dr_mario_land_fx::main();
	
	maps\mp\_compass::setupMiniMap ("compass_map_mp_dr_mario_land");
	
	ambientPlay("ambient_mp_dr_mario_land");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("compassmaxrange","1400");
	
	thread MakeTriggers();
	thread onConnected();
	thread WatchGame();
	thread AddTestClients();

	level.acti_enemy = undefined;
	level.playerturn = [];
	level.turn = 0;
	level.jumper_turn = [];
	level.match=[];
	level.type = undefined;

	endtrig1 = getEnt("finaldoor1", "targetname");
	endtrig1 thread WatchEndTrigger1();
	endtrig2 = getEnt("finaldoor2", "targetname");
	endtrig2 thread WatchEndTrigger2();
}

onConnected()
{
	while(1)
	{
		level waittill("connected", player );
		player.isSliding = false;
		player.glitching = false;
	}
}
MakeTriggers()
{
	wait 0.5;
	level.trapTriggers[0] = getent("trigger1", "targetname");
	level.trapTriggers[1] = getent("trigger2", "targetname");
	level.trapTriggers[2] = getent("trigger3", "targetname");
	level.trapTriggers[3] = getent("trigger4", "targetname");
	level.trapTriggers[4] = getent("trigger5", "targetname");
	level.trapTriggers[5] = getent("trigger6", "targetname");
	level.trapTriggers[6] = getent("trigger7", "targetname");
	level.trapTriggers[7] = getent("trigger8", "targetname");
	level.trapTriggers[8] = getent("trigger9", "targetname");
	level.trapTriggers[9] = getent("trigger10", "targetname");
	
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


}

trapN1()
{
	while(1)
	{
		self waittill("trigger", who );

		thread gotrap1();
		self delete();
		break;
	}
	
}
trapN2()
{
	while(1)
	{
		self waittill("trigger", who );

		thread gotrap2();
		self delete();
		break;
	}	
}
trapN3()
{
	while(1)
	{
		self waittill("trigger", who );

		thread gotrap3();
		self delete();
		break;
	}
}

trapN4()
{
	while(1)
	{
		self waittill("trigger", who );

		thread gotrap4();
		self delete();
		break;
	}
}

trapN5()
{
	while(1)
	{
		self waittill("trigger", who );

		thread gotrap5();
		self delete();
		break;
	}	
}

trapN6()
{
	while(1)
	{
		self waittill("trigger", who );

		thread gotrap6();
		self delete();
		break;
	}
}
trapN7()
{
	while(1)
	{
		self waittill("trigger", who );

		thread gotrap7();
		self delete();
		break;
	}
}
trapN8()
{
	while(1)
	{
		self waittill("trigger", who );

		thread gotrap8();
		self delete();
		break;
	}
}
trapN9()
{
	while(1)
	{
		self waittill("trigger", who );

		thread gotrap9();
		self delete();
		break;
	}
}
trapN10()
{
	while(1)
	{
		self waittill("trigger", who );

		thread gotrap10();
		self delete();
		break;
	}
}


gotrap1()
{
	trab_n1a= getent("trap_1a","targetname"); //busca el bush trap_1a
	trab_n1b= getent("trap_1b","targetname"); //busca el bush trap_1b

	hurt_n1a = getent("trap_1a_hurt","targetname");//busca el bush hurt_1a
	hurt_n1b = getent("trap_1b_hurt","targetname");//busca el bush hurt_1b


	hurt_n1a enablelinkto();
    	hurt_n1a linkto (trab_n1a);//une al bush hurt al scriptbush model

	hurt_n1b enablelinkto();
    	hurt_n1b linkto (trab_n1b);


	
		trab_n1a movez (-200,1,0,0.1);	//mueve trap_1a z-200
		trab_n1b movez (-200,1,0,0.1);
		trab_n1b waittill ("movedone");	//espera termine el movimiento
		wait(RandomInt(7));		// espera de 0 a 7 segundos
		trab_n1a movez (200,1,0,0.1);
		trab_n1b movez (200,1,0,0.1);	//mueve trap_1a z+200

}

gotrap2()
{
	trab_n2a = getent("trap_2a","targetname");
	trab_n2b = getent("trap_2b","targetname");
	trab_n2c = getent("trap_2c","targetname");
	
	hurt_n2a = getent("trap_2a_hurt","targetname");
	hurt_n2b = getent("trap_2b_hurt","targetname");
	hurt_n2c = getent("trap_2c_hurt","targetname");
	

	hurt_n2a enablelinkto();
    	hurt_n2a linkto (trab_n2a);

	hurt_n2b enablelinkto();
    	hurt_n2b linkto (trab_n2b);

	hurt_n2c enablelinkto();
    	hurt_n2c linkto (trab_n2c);



		while(1)
		{
		
			trab_n2a movez (-50,1,0,0.1);
			trab_n2a waittill ("movedone");	//espera termine el movimiento
			wait(RandomInt(2));		// espera de 0 a 3 segundos
			trab_n2a movez (50,1,0,0.1);
			
			trab_n2b movez (-50,1,0,0.1);
			trab_n2b waittill ("movedone");
			wait(RandomInt(2));
			trab_n2b movez (50,1,0,0.1);
			
			trab_n2c movez (-50,1,0,0.1);
			trab_n2c waittill ("movedone");
			wait(RandomInt(2));
			trab_n2c movez (50,1,0,0.1);
		}
}

gotrap3()
{
	trab_n3a= getent("trap_3a","targetname"); 	//busca el bush trap_3a
	
	hurt_n3a = getent("trap_3a_hurt","targetname");
	hurt_n3b = getent("trap_3b_hurt","targetname");
	
	hurt_n3a enablelinkto();
    	hurt_n3a linkto (trab_n3a);

	hurt_n3b enablelinkto();
    	hurt_n3b linkto (trab_n3a);

	while(1)
	{
		trab_n3a rotateYaw(360,15);		// rota il asse Y 
		trab_n3a waittill ("rotatedone");	//espera termine el movimiento
		//wait(RandomInt(4));			// espera de 0 a 4 segundos
	}		
}

gotrap4()
{
	trab_n4a = getent("trap_4a","targetname");
	trab_n4b = getent("trap_4b","targetname");
	

	trab_n4a delete();

	while(1)
	{
		trab_n4b rotatePitch(360,8);		// rota il asse Z 
		trab_n4b waittill ("rotatedone");	//espera termine el movimiento
		//wait(RandomInt(4));			// espera de 0 a 4 segundos
	}	


}
gotrap5()
{
	trab_n5 = [];

	trab_n5a = getent("trap_5a","targetname");
	trab_n5[0] = getent("trap_5b","targetname");
	trab_n5[1] = getent("trap_5c","targetname");	
	trab_n5[2] = getent("trap_5d","targetname");
	trab_n5[3] = getent("trap_5e","targetname");
	
	self.nun = RandomInt(4);
	trab_n5[self.nun] notsolid();	
	
		trab_n5a movez (140,1,0,0.1);
		trab_n5a waittill ("movedone");
		
		wait (4);
		
		trab_n5a movez (-140,2,0,0.6);
		trab_n5a waittill ("movedone");

}


gotrap6()
{
	tigg_n6a = getent("tigg_6a","targetname");//busca el bush tigg_6a
	tigg_n6b = getent("tigg_6b","targetname");//busca el bush tigg_6b

	tigg_n6a thread movetrap6a();
	tigg_n6b thread movetrap6b();
}



movetrap6a()
{
	trab_n6a = getent("trap_6a","targetname"); //busca el bush trap_6a
	hurt_n6a = getent("trap_6a_hurt","targetname");

	hurt_n6a enablelinkto();
    	hurt_n6a linkto (trab_n6a);

	while (1)
	{
	self waittill ("trigger",user);
		if (user istouching(self))
		{
		trab_n6a movey (230,1,0,0.1);
		trab_n6a waittill ("movedone");
		
		trab_n6a movey (-230,1,0,0.1);
		trab_n6a waittill ("movedone");
		}
	}
}

movetrap6b()
{
	trab_n6b = getent("trap_6b","targetname"); //busca el bush trap_6b
	hurt_n6b = getent("trap_6b_hurt","targetname");
	

	hurt_n6b enablelinkto();
    	hurt_n6b linkto (trab_n6b);

	
	while (1)
	{
	self waittill ("trigger",user);
		if (user istouching(self))
		{
		trab_n6b movey (-230,1,0,0.1);
		trab_n6b waittill ("movedone");
		
		trab_n6b movey (230,1,0,0.1);
		trab_n6b waittill ("movedone");
		}
	}
}
gotrap7()
{
	trab_n7a = getent("trap_7a","targetname"); //busca los bush trap_7a
	trab_n7b = getent("trap_7b","targetname");
	trab_n7c = getent("trap_7c","targetname");
	trab_n7d = getent("trap_7d","targetname");
	trab_n7e = getent("trap_7e","targetname");

	hurt_n7b = getent("trap_7b_hurt","targetname");
	hurt_n7c = getent("trap_7c_hurt","targetname");
	hurt_n7d = getent("trap_7d_hurt","targetname");	
	hurt_n7e = getent("trap_7e_hurt","targetname");
	
	hurt_n7b enablelinkto();
    	hurt_n7b linkto (trab_n7b);

	hurt_n7c enablelinkto();
    	hurt_n7c linkto (trab_n7c);
	
	hurt_n7d enablelinkto();
    	hurt_n7d linkto (trab_n7d);

	hurt_n7e enablelinkto();
    	hurt_n7e linkto (trab_n7e);	

	trab_n7a notsolid();

	while(1)
	{
		trab_n7b rotateYaw(180,1);		// rota il asse Z 
		trab_n7d rotateYaw(180,1);
		trab_n7d waittill ("rotatedone");	//espera termine el movimiento
		wait(RandomInt(4));			// rota il asse Z 

		trab_n7b rotateYaw(-180,1);		 
		trab_n7d rotateYaw(-180,1);
		trab_n7d waittill ("rotatedone");
		
		trab_n7c rotateYaw(180,1);		// rota il asse Z 
		trab_n7e rotateYaw(180,1);
		trab_n7e waittill ("rotatedone");	//espera termine el movimiento
		wait(RandomInt(4));			// rota il asse Z 
		
		trab_n7c rotateYaw(-180,1);		// rota il asse Z  
		trab_n7e rotateYaw(-180,1);
		trab_n7e waittill ("rotatedone");
	}	


	
}

gotrap8()
{
	trab_n8a = getent("trap_8a","targetname");
	
	while(1)
	{	
		trab_n8a movez (-100,1,0);
		trab_n8a rotateYaw(360,10);
		trab_n8a waittill ("rotatedone");
		
		trab_n8a movez (100,1,0);
		trab_n8a rotateYaw(-360,10);
		trab_n8a waittill ("rotatedone");
	}
		
}
gotrap9()
{
	trab_n9a= getent("trap_9a","targetname"); //busca el bush trap_9a
	trab_n9b= getent("trap_9b","targetname"); //busca el bush trap_9b
	
	while(1)
	{	
		trab_n9a movex (-40,1,0);
		trab_n9b movex (40,1,0);
		trab_n9b waittill ("movedone");
		wait (0.5);
		trab_n9a movex (40,1,0);
		trab_n9b movex (-40,1,0);
		trab_n9b waittill ("movedone");
		wait (0.5);
	}
		
}
gotrap10()
{
	trab_n10a= getentarray("trap_10a","targetname"); //busca los bush trap_7a
	if(isdefined(trab_n10a))
	{
		for(i=0;i<trab_n10a.size;i++)
 		{	
		trab_n10a[i] thread movetrap10();	
		}	
	}
}

movetrap10()
{
		self rotatePitch(-360,5);		// rota il asse Z 		
}

WatchGame()
{
	level.finalfight = false;
	
	while(1)
	{
		level waittill("activator", who );
		thread GetGlitchTriggers();
		who thread AntiFreeTraps();
	}
}

AntiFreeTraps()
{
	if( getDvarInt("scr_activator_freerun") != 1 )
		return;
	
	self FreezeControls(1);
	wait getDvarInt("scr_activator_freerun_wait");
	self FreezeControls(0);
}

GetGlitchTriggers()
{
	triggers = getentarray("glitch_trigger", "targetname");
	for(i=0;i<triggers.size;i++)
		triggers[i] thread WatchGlitchTrigger();
}

WatchGlitchTrigger()
{
	while(1)
	{
		self waittill("trigger", who );
		if( !level.freeRun && !who.glitching )
			who thread DoAntiGlitcher();
	}
}

DoAntiGlitcher()
{
	self.glitching = true;
	self FreezeControls(1);
	self iprintlnbold("^1HAHAHAHA! CAUGHT YOU GLITCHER! >:)");
	self PlayLocalSound("laughing");
	wait 4;
	self iprintlnbold("^3Wanna see something cool, hmm? >:)");
	self SetClientDvar("cg_thirdperson", 1 );
	wait 4;
	self iprintlnbold("^1BUUUUUUUUUUUUUUUUURN! HAHAHA!!!");
	wait 2;
	iprintlnbold("^1LOOK! ^7" + self.name + " ^1is BURNING due to glitching!");
	iprintlnbold("^1HUAHAHAHA!");
	self SetClientDvar("cg_thirdperson", 0 );
	wait 8;
	self.glitching = false;
}

WatchIfAllDead()
{
	while(1)
	{
		if( getTeamPlayersAlive("allies") < 1 || getTeamPlayersAlive("axis") < 1 )
		{
			AmbientStop(1);
			break;
		}
		wait 0.2;
	}
}

WatchEndTrigger1()
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
			armo = "knife";
			thread usercontrol(who,armo);		
		}
		if( !isDefined(level.acti_enemy))
		{
			armo = "knife";
			thread usercontrol(who,armo);
			thread Start_user();
			thread controljumper();		
		}
		wait 4;
	}
}

WatchEndTrigger2()
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
			armo = "gun";
			thread usercontrol(who,armo);			
		}
		if( !isDefined(level.acti_enemy))
		{
			armo = "gun";
			thread usercontrol(who,armo);
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
			//iprintlnbold("^1next ^2 Jumper ??");
			thread Start_user();
			wait 2;
		}
	wait 1;		
	}
}

usercontrol(user,armo)
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
		level.match[level.turn] = armo ;
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
				level.type = level.match[turn];
					
				if (turn == 1)
				{ 
					iprintlnbold( level.jumper_turn[turn] + " ^1reached as first the end hall!");
					iprintlnbold("^11 VS 1 Fight!");
				}
				
				thread StartFinalFight();
					break;
			}
		}
		
		if( !isDefined(level.acti_enemy)) iprintlnbold("^4 waiting for a new ^3jumper" );
		
		
	
}

StartFinalFight()
{
	

	acti = undefined;
	jumper = level.acti_enemy;
	
	players = getentarray("player", "classname");
	
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	
	if (level.type == "knife")
	{
		self.armo = "knife_mp";
		start1 = getent("activator_p1", "targetname");
		start2 = getent("jumper_p1", "targetname");
	}
	else
	{
		self.armo = "colt45_mp";
		start1 = getent("activator_p2", "targetname");
		start2 = getent("jumper_p2", "targetname");
	}
	acti SetPlayerAngles( start1.angles );
	acti SetOrigin( start1.origin );
	//acti TakeAllWeapons();
	acti GiveWeapon(self.armo);
	acti SetSpawnWeapon(self.armo);
	
	jumper SetPlayerAngles( start2.angles );
	jumper SetOrigin( start2.origin );
	//jumper TakeAllWeapons();
	jumper GiveWeapon(self.armo);
	jumper SetSpawnWeapon(self.armo);


	acti FreezeControls(1);
	jumper FreezeControls(1);
	
	VisionSetNaked( "finalfight_intro_mp", 2 );
	wait 2;

	noti = SpawnStruct();
	noti.titleText = "=|FINAL FIGHT|=";
	noti.notifyText = "1 VS 1 " + self.armo ;
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
	
	VisionSetNaked( "finalfight_mp", 2 );
	jumper FreezeControls(0);
	acti FreezeControls(0);
	
	iprintlnbold("^1F  I  G  H  T !");
}

addTestClients()
{
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
 