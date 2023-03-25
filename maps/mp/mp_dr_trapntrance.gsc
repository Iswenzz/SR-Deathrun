/* 
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||                 
||| |||| ||| |||   |||       || |||   |||||||||||   ||| |||||||  |||| ||||| |||
||| |||| ||| || ||| ||||| ||||| || ||| ||||||||| ||| || |||||| || |||   ||| |||
||| |||| ||| || ||||||||| ||||| || ||||||||||||| |||||| ||||| |||| || || || |||
||| |||| ||| |||   |||||| ||||| || ||||||    ||| |||||| ||||| |||| || || || |||
||| |||| ||| |||||| ||||| ||||| || ||||||||||||| |||||| |||||      || ||  | |||
|||| || |||| |||||| ||||| ||||| || ||| ||||||||| ||| || ||||| |||| || ||| | |||
|||||  ||||| ||    |||||| ||||| |||   |||||||||||   |||    || |||| || ||||  |||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

------------- Map       :	mp_dr_trapntrance - 
------------- Mapper  	:	VC' Blade (bladetk17)
------------- Server  	:	VC' Deathrun: 62.75.222.118:28960
------------- xFire   	: 	bladetk17
------------- Homepage	:  	visticdeathrun.x10.mx [Update Soon]
*/
main()
{
	maps\mp\_load::main();
	maps\mp\_traprooms::main();
	maps\mp\_trancerooms::main();

	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

  	setdvar( "r_specularcolorscale", "1" );
  	setdvar("r_glowbloomintensity0",".25");
  	setdvar("r_glowbloomintensity1",".25");
  	setdvar("r_glowskybleedintensity0",".3");

  	level._effect["bluefire"] = LoadFX("fire/fire_blue2");
  	level._effect["glowing"] = LoadFx("shiet/tel");
  	level.explosion = LoadFX ( "explosions/tanker_explosion" );
  	level.fire = LoadFX("fire/firelp_large_pm");

  	thread fx(); 
  	thread waitTillGameStart();
  	thread trapjump();
  	thread trancejump();
  	thread trapport();
  	thread tranceport();
  	thread trap_trap1();
  	thread trap_trap2();
  	thread trap_trap3();
  	thread trap_trap4();
  	thread trap_trap5();
  	thread movetoend();
  	thread movetoend2();
  	thread trance_trap1();
  	thread trance_trap2();
  	thread trance_trap3();
  	thread welcomecucc();
  	thread mover_1();

  	addTriggerToList( "trap_trap1_trig" );
	addTriggerToList( "trap_trap2_trig" );
	addTriggerToList( "trap_trap3_trig" );
	addTriggerToList( "trap_trap4_trig" );
	addTriggerToList( "trap_trap5_trig" );
	addTriggerToList( "trance_trap1_trig" );
	addTriggerToList( "trance_trap2_trig" );
	addTriggerToList( "trance_trap3_trig" );

}

waitTillGameStart()
{
	for(;;)
	{
		level waittill( "connected" );
		wait 4;
		thread randomRoute();
		break;
	}
}

randomRoute()
{
	for(;;)
	{
		activator = undefined;
		players = getentarray( "player", "classname" );
		
		for( i = 0; i < players.size; i++ )
		{
			if( players[i].pers["team"] == "axis" )
			{
				activator = players[i];
				break;
			}
		}
		
		if( isDefined(activator) )
			break;
			
		wait(0.1);
	}
	
	door = [];
	door[0] = getEnt( "trapdoor", "targetname" );
	door[1] = getEnt( "trancedoor", "targetname" );
	
	origin = [];
	origin[0] = (584, 64, 520);
	origin[1] = (-3472, 16, 528);
	
	route = randomInt( 2 );
	
	door[route] moveZ( -260, 5 );
	
	activator setOrigin( origin[route] );

	iprintlnbold( "Door "+(route+1)+" opened" );
	
}

trapjump()
{
	trig = getEnt("trapjumptrig", "targetname");
	explode = getEnt("trapjumpexplode", "targetname");
	startdoor = getEnt("trapjumperdoor", "targetname");

	trig setHintString("Press [^1USE^7] to detonate");
	trig waittill("trigger");
	trig delete();
	playFx ( level.explosion, explode.origin );
	wait 0.1;
	earthquake ( 1, 1, explode.origin, 500 );
	wait 0.1;
	startdoor delete();
	ambientPlay("trap");
}

trapport()
{
  trigger = getEnt("sendtotrap", "targetname");
  target = getEnt("trap_origin", "targetname");
  
  while(1)
  {
	 trigger waittill ("trigger", player);
		
	  {
	    player SetOrigin(target.origin);
	    player SetPlayerAngles( target.angles );
	  }
    }
}

trancejump()
{
	trig = getEnt("trancejumptrig", "targetname");
	explode = getEnt("trancejumpexplode", "targetname");
	startdoor = getEnt("trancejumperdoor", "targetname");

	trig setHintString("Press [^1USE^7] to detonate");
	trig waittill("trigger");
	trig delete();
	playFx ( level.explosion, explode.origin );
	wait 0.1;
	earthquake ( 1, 1, explode.origin, 500 );
	wait 0.1;
	startdoor delete();
	ambientPlay("trance");
}

tranceport()
{
  trigger = getEnt("sendtotrance", "targetname");
  target = getEnt("trance_origin", "targetname");
  
  while(1)
  {
	 trigger waittill ("trigger", player);
		
	  {
	    player SetOrigin(target.origin);
	    player SetPlayerAngles( target.angles );
	  }
    }
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

fx() 
{ 
	{ 
		flame = getentarray("bluefire", "targetname"); 
		for(i=0;i<flame.size;i++) 
		{ 
			spawn_fire[i] = maps\mp\_utility::createOneshotEffect( "bluefire" ); 
			spawn_fire[i].v[ "origin" ] = flame[i].origin; 
			spawn_fire[i].v[ "angles" ] = ( 270, 0, 0 ); 
			spawn_fire[i].v[ "fxid" ] = "bluefire"; 
			spawn_fire[i].v[ "delay" ] = -13; 
			spawn_fire[i].v[ "soundalias" ] = "fire_metal_large"; 
		} 
	} 

	{ 
		glow = getentarray("glowforme", "targetname"); 
		for(i=0;i<glow.size;i++) 
		{ 
			spawn_glow[i] = maps\mp\_utility::createOneshotEffect( "glowing" ); 
			spawn_glow[i].v[ "origin" ] = glow[i].origin; 
			spawn_glow[i].v[ "angles" ] = ( 270, 0, 0 ); 
			spawn_glow[i].v[ "fxid" ] = "glowing"; 
			spawn_glow[i].v[ "delay" ] = -8; 
		} 
	} 
}

trap_trap1()
{
	trig = getEnt("trap_trap1_trig", "targetname");
	trap = getEnt("trap_trap1", "targetname");

	trig setHintString("Press [^1USE^7] to activate");
	trig waittill("trigger");

	trig delete();

	while(1)
	{
		trap rotatePitch(-360, 14);
		wait 1;
	}
}

trap_trap2()
{
	trig = getEnt("trap_trap2_trig", "targetname");
	trap = getEnt("trap_trap2", "targetname");
	trap2 = getEnt("trap_trap2a", "targetname");
	trap3 = getEnt("trap_trap2b", "targetname");

	trig setHintString("Press [^1USE^7] to activate");
	trig waittill("trigger");

	trig delete();
	trap2 moveX(-160, 1);
	trap3 delete();

	while(1)
	{
		trap moveX(50, 1.5);
		wait 2;
		trap moveX(-50,1.5);
		wait 2;
		trap moveX(-50, 1.5);
		wait 2;
		trap moveX(50, 1.5);
		wait 2;
	}
}

trap_trap3()
{
	trig = getEnt("trap_trap3_trig", "targetname");
	trap = getEnt("trap_trap3", "targetname");

	trig setHintString("Press [^1USE^7] to activate");
	trig waittill("trigger");

	trig delete();

	while(1)
	{
		trap rotateYaw(360, 1);
		wait 0.1;
	}
}

trap_trap4()
{
  	trigger = getEnt("trap_trap4_trig", "targetname");
  	trap = getEnt("trap_trap4", "targetname");
 	 trap2 = getEnt("trap_trap4a", "targetname");
  
  	trigger setHintString("Press [^1USE^7] to activate");
  	trigger waittill("trigger");
  	trigger delete();
  
  	wait 0.1;
  	while(1)
  	{
    	trap rotatePitch(360,1.5);
		trap2 rotatePitch(-360,1.5);
    	wait 0.1;
  	}
}

trap_trap5()
{
	fire = getEnt("trap_5fx", "targetname");
	trig = getEnt("trap_trap5_trig", "targetname");

	trig setHintString("Press [^1USE^7] to activate");
  	trig waittill("trigger");
  	trig delete();

	playFx ( level.fire, fire.origin );
	wait 10;
	iPrintLnBold("Hahaha, scared? It's just fake.");
}

movetoend()
{
	trig = getent ("jump","targetname");
	air1 = getent ("glow","targetname");
	air2 = getent ("air2","targetname");

	trig setHintString("Press [^1USE^7]");

	time = 1;
	for(;;)
	{
		trig waittill ("trigger",user);
		if (user istouching(trig))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, time);
			wait 5;
			air moveto (air2.origin, time);
			wait 3;
			user unlink();
			wait 1;
		}
	}
}

movetoend2()
{
	trig = getent ("jump2","targetname");
	air1 = getent ("glow2","targetname");
	air2 = getent ("air22","targetname");

	trig setHintString("Press [^1USE^7]");

	time = 1;
	for(;;)
	{
		trig waittill ("trigger",user);
		if (user istouching(trig))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, time);
			wait 5;
			air moveto (air2.origin, time);
			wait 3;
			user unlink();
			wait 1;
		}
	}
}

trance_trap1()
{
	trig = getEnt("trance_trap1_trig", "targetname");
	trap1 = getEnt("trance_trap1", "targetname");
	trap2 = getEnt("trance_trap1a", "targetname");

	trig setHintString("Press [^1USE^7] to activate");
	trig waittill("trigger");
	trig delete();

	while(1)
	{
		trap1 moveZ(-150, 0.5);
		trap2 moveZ(150, 0.5);
		wait 1;
		trap1 moveZ(150, 0.5);
		trap2 moveZ(-150, 0.5);
		wait 1;
	}
}

trance_trap2()
{
	trig = getEnt("trance_trap2_trig", "targetname");
	trap1 = getEnt("trance_trap2", "targetname");
	trap2 = getEnt("trance_trap2a", "targetname");
	trap3 = getEnt("trance_trap2b", "targetname");

	trig setHintString("Press [^1USE^7] to activate");
	trig waittill("trigger");
	trig delete();

	trap2 rotateYaw(90, 1);
	trap3 rotateRoll(-30, 1);

	while(1)
	{
		trap1 moveZ(-200, 2);
		wait 2;
		trap1 moveZ(200, 2);
		wait 2;
	}
}

trance_trap3()
{
	trig = getEnt("trance_trap3_trig", "targetname");
	trap1 = getEnt("trance_trap3", "targetname");
	explode = getEnt("shakeme", "targetname");


	trig setHintString("Press [^1USE^7] to activate");
	trig waittill("trigger");
	trig delete();


	while(1)
	{
		trap1 moveZ(-450, 0.2);
		wait 0.1;
		earthquake ( 1, 1, explode.origin, 500 );
		wait 3;
		trap1 moveZ(450, 1);
		wait 3;
	}
}

welcomecucc()
{
wait 15;
thread welcomecuc("Trapntrance" );
wait 6;
thread welcomecuc("By VC' Blade" );
}

welcomecuc(text)
{
	welcomehud = new_hud( "center", 0.1, 1000, 100 );
	welcomehud setText( text );
	welcomehud moveOverTime( 2 );
	welcomehud.x = 0;
	wait( 4 );
	welcomehud moveOverTime( 2 );
	welcomehud.x = 1000 * -1;
	wait 1;
	welcomehud destroy();
}
new_hud( align, fade_in_time, x_off, y_off )
{
	welcomehud2 = newHudElem();
    welcomehud2.foreground = true;
	welcomehud2.x = x_off;
	welcomehud2.y = y_off;
	welcomehud2.alignX = align;
	welcomehud2.alignY = "middle";
	welcomehud2.horzAlign = align;
	welcomehud2.vertAlign = "middle";
 	welcomehud2.fontScale = 3;
	welcomehud2.color = (1, 1, 1);
	welcomehud2.font = "objective";
	welcomehud2.glowColor = (0, 0.5, 1);
	welcomehud2.glowAlpha = 1;
	welcomehud2.alpha = 0;
	welcomehud2 fadeovertime( fade_in_time );
	welcomehud2.alpha = 1;
	welcomehud2.hidewheninmenu = true;
	welcomehud2.sort = 10;
	return welcomehud2;
}

mover_1()
{
	mover = getEnt("mover_1", "targetname");

	while(1)
	{
		mover moveY(-1400, 4, 2, 1);
		mover waittill("movedone");
		mover moveY(1400, 4, 2, 1);
		mover waittill("movedone");
	}
}