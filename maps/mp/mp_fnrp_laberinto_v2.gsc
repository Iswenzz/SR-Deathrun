main()
{
  	maps\mp\_load::main();
	maps\mp\mp_fnrp_laberinto_fx::main();
	maps\createfx\mp_fnrp_laberinto_fx::main();
	maps\mp\mp_fnrp_laberinto_block::main();
	maps\mp\mp_fnrp_laberinto_rotate::main();
	maps\mp\_compass::setupMiniMap ("compass_map_mp_fnrp_laberinto");
	
	ambientPlay("ambient_mp_fnrp_laberinto");
	

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

	iprintln("^1The game starts in ^7");
	
	for(i=15;i>=0;i--)
	{
		iprintln("^1" + i + " ");
		wait 1;
	}

	abrir_puertas = getEnt("puertas", "targetname");
	abrir_puertas movez (-200,1,0,0.6);
	abrir_puertas waittill ("movedone");


	

	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
		players[i] TakeAllWeapons();
		players[i] GiveWeapon("dragunov_mp");
		players[i] giveMaxAmmo("dragunov_mp");
		players[i] SwitchToWeapon("dragunov_mp");
		}

		if( players[i].pers["team"] == "allies" && isAlive(players[i]) )
		{
		players[i] TakeAllWeapons();
		}
	wait 0.5;
	}
	thread Controlfinal();

	wait 100;
	iprintlnbold("^1Free!!!");
	
	move1_obj = getentarray("block1","targetname");
	if(isdefined(move1_obj))
	{
 		for(i=0;i<move1_obj.size;i++)
 		{
   		move1_obj[i] thread ra_move1();
		}
	}
	thread activacion();

} 

ra_move1()
{

		self movez (-200,1,0,0.6);
}

Controlfinal()
{	
	endtrig = getEnt("finaldoor", "targetname");
	endtrig thread WatchEndTrigger();


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
	
	level.trapTriggers[0] thread trapN1();
	

}

trapN1()
{
	
	
	while(1)
	{
		self waittill("trigger", who );
		
		thread activacion();
		//self delete();
		break;
	}
}

activacion()
{
	luce_obj1 = getent("ctrl_trampa","targetname");	
	luce_obj2 = getent("luce_su","targetname");
		
		luce_obj1 movez (-30,1,0,0.6);
		luce_obj2 movez (-30,1,0,0.6);
		//luce_obj2 waittill ("movedone");
	

	trab_obj1 = getent("plataformas","targetname");
		trab_obj1 movez (-250,3,0,0.6);
		//trab_obj1 waittill ("movedone");


	trab_obj2 = getent("trap_panel_1","targetname");
	trab_obj3 = getent("trap_panel_2","targetname");
	self.nun = RandomInt(2);
		
	if (self.nun != 1)
	{
		trab_obj2 movez (-30,3,0,0.6);
		trab_obj2 waittill ("movedone");
 	}else{
		trab_obj3 movez (-30,3,0,0.6);
		trab_obj3 waittill ("movedone");
		} 


	trab_obj4 = getent("trap2_sube","targetname");
	trab_obj5 = getent("trap2_baja","targetname");
	
while(1)
	{
	
		trab_obj4 movez (20,1,0,0.6);
		trab_obj5 movez (-100,1,0,0.6);
		
		trab_obj5 waittill ("movedone");
		
		wait (1);
		
		trab_obj4 movez (-20,2,0,0.6);
		trab_obj5 movez (100,2,0,0.6);
		
		trab_obj5 waittill ("movedone");
		wait(RandomInt(2));
		
	} 

	

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
			//AmbientStop(1);
			break;
		}
		wait 0.2;
	}
}

WatchEndTrigger()
{
	level.acti_enemy = undefined;
	level.turn = 1;
	level.jumper_turn = [];
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
			self.control = 0;
			for(clturn=1;clturn<level.turn;clturn++)
			{
				if( level.jumper_turn[clturn] ==  who )
				{	self.control = 1;
				}
			}
			
			if( self.control != 1)
			{
				level.turn = level.turn + 1;
				who iprintlnbold("^1wait your turn" + level.turn );
				level.jumper_turn[level.turn] = who;
				wait 3;
			}
			else
			{
				who iprintlnbold("^4wait your turn :)");
				wait 3;
			}
			
				
		}
		if( !isDefined(level.acti_enemy))
		{
			level.jumper_turn[level.turn] = who;
			level.acti_enemy = level.jumper_turn[1];
			iprintlnbold( who.name + " ^1reached as first the end hall!");
			iprintlnbold("^11 VS 1 Fight!");
			thread StartFinalFight();
			thread controljumper();	
		}
	}
}
controljumper()
{
	
	while(1)
	{
		
		if(isAlive(level.acti_enemy))
		{
			for(turn=1;turn<level.turn;turn++)
			{
				iprintln( turn + "^2 >" + level.jumper_turn[turn]);
				wait 2;
	   		}
			
		}
		else
		{
			for(turn=1;turn<level.turn;turn++)
			{	
				if( isAlive(level.jumper_turn[turn]))
				{
					level.acti_enemy = level.jumper_turn[turn];
					thread StartFinalFight();
				}
			}	
		     }
	wait 3;
	}
}

StartFinalFight()
{
	

	acti = undefined;
	jumper = level.acti_enemy;
	self.armo = "knife_mp";

	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	
	if( getDvarInt("scr_activator_freerun") != 1 ) 
		{
			self.armo = "colt45_mp";
		}



	start1 = getent("ffight_activator", "targetname");
	start2 = getent("ffight_jumper", "targetname");
	
	acti SetPlayerAngles( start1.angles );
	acti SetOrigin( start1.origin );
	acti TakeAllWeapons();
	acti GiveWeapon(self.armo);
	acti SetSpawnWeapon(self.armo);
	
	jumper SetPlayerAngles( start2.angles );
	jumper SetOrigin( start2.origin );
	jumper TakeAllWeapons();
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
 



